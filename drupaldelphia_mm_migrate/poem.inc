<?php

/**
 * @file
 */

/**
 */
abstract class PoemMigration extends DynamicMigration {
  public function __construct() {
    // Always call the parent constructor first for basic setup
    parent::__construct();
  }
}

/**
 */
class PoemTaxonomyMigration extends PoemMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Creates taxonomy terms from legacy genres table.');

    // And, pass schema definitions for the primary keys of the source and
    // destination - we need to be explicit for our source, but the destination
    // class knows its schema already.
    $this->map = new MigrateSQLMap($this->machineName,
        array(
          'id' => array(
            'type' => 'int',
            'not null' => TRUE,
            'description' => 'genre id',
          ),
        ),
        MigrateDestinationTerm::getKeySchema()
      );

    $query = Database::getConnection('default', 'legacy')->select('genres', 'g')->fields('g', array('id', 'name'));

    $this->source = new MigrateSourceSQL($query);

    $this->destination = new MigrateDestinationTerm('genre');

    $this->addFieldMapping('name', 'name');

  }
}

class PoemFileMigration extends PoemMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Migrates files from legacy database.');
    $this->map = new MigrateSQLMap($this->machineName,
        array(
          'id' => array(
            'type' => 'int',
            'not null' => TRUE,
            'description' => 'user id.',
          ),
        ),
        MigrateDestinationFile::getKeySchema()
    );
    $query = Database::getConnection('default', 'legacy')->select('users', 'u')->fields('u', array('id', 'photo'));
    $this->source = new MigrateSourceSQL($query);
    $this->destination = new MigrateDestinationFile(array(
      'copy_file' => false,
      'preserve_files' => true,
    ));


    $this->addFieldMapping('value', 'photo')->callbacks(array($this, 'getPhotoURL'));
    $this->addFieldMapping('destination_dir', 'picture_dir');
  }

  protected function getPhotoURL($filename) {
    print_r('https://raw.github.com/lliss/drupaldelphia-migration-demo/master/drupaldelphia_mm_migrate/data/' . $filename);
    return 'https://raw.github.com/lliss/drupaldelphia-migration-demo/master/drupaldelphia_mm_migrate/data/' . $filename;
  }
  public function prepareRow($row) {
    $row->picture_dir = 'pictures';
  }
}

/**
 */
class PoemUserMigration extends PoemMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Migrates users from legacy database.');
    $this->dependencies = array('PoemFile');
    $this->map = new MigrateSQLMap($this->machineName,
        array(
          'id' => array(
            'type' => 'int',
            'not null' => TRUE,
            'description' => 'user id.',
          ),
        ),
        MigrateDestinationUser::getKeySchema()
    );
    $query = Database::getConnection('default', 'legacy')->select('users', 'u')->fields('u', array('id', 'name', 'photo'));
    $this->source = new MigrateSourceSQL($query);
    $this->destination = new MigrateDestinationUser();

    $this->addSimpleMappings(array('name'));
    $this->addFieldMapping('picture', 'id')->sourceMigration('PoemFile');
  }
}

/**
 */
class PoemNodeMigration extends PoemMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Creates Poem articles from legacy poems database.');

    $this->dependencies = array('PoemTaxonomy', 'PoemUser', 'PoemFile');

    $this->map = new MigrateSQLMap($this->machineName,
      array(
        'id' => array(
          'type' => 'int',
          'not null' => TRUE,
          'description' => 'Poem id.',
        ),
      ),
      MigrateDestinationNode::getKeySchema()
    );

    $query = Database::getConnection('default', 'legacy')->select('poems', 'p')
             ->fields('p', array('id', 'genre_id', 'user_id', 'title', 'poem', 'photo'));


    $this->source = new MigrateSourceSQL($query);
    $this->destination = new MigrateDestinationNode('article');

    // Mapped fields
    $this->addFieldMapping('title', 'title');
    $this->addFieldMapping('field_genre', 'genre_id')->sourceMigration('PoemTaxonomy')->arguments(array('source_type' => 'tid'));
    $this->addFieldMapping('uid', 'user_id')->sourceMigration('PoemUser');
    $this->addFieldMapping('body', 'poem');

    $this->addFieldMapping('field_image', 'photo');
    $this->addFieldMapping('field_image:source_dir')->defaultValue(drupal_get_path('module', 'drupaldelphia_mm_migrate') . '/data');
  }
}
