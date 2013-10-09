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

    $query = db_select('genre', 'g')->fields('g', array('name'));

    $this->source = new MigrateSourceSQL($query);

    $this->destination = new MigrateDestinationTerm('genre');

    $this->addFieldMapping('name', 'name');

  }
}

/**
 */
class PoemUserMigration extends PoemMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Migrates users from legacy database.');
    $this->map = new MigrateSQLMap($this->machineName,
        array(
          'id' => array(
            'type' => 'int',
            'not null' => TRUE,
            'description' => 'user id.'
          ),
        ),
        MigrateDestinationUser::getKeySchema()
    );
    $query = db_select('users', 'u')->fields('u', array('name', 'photo'));
    $this->source = new MigrateSourceSQL($query);
    $this->destination = new MigrateDestinationUser();

    $this->addSimpleMappings(array('name'));

  }
}

/**
 */
class PoemNodeMigration extends PoemMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Creates Poem articles from legacy poems database.');

    $this->dependencies = array('PoemTaxonomy', 'PoemUser');

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

    $query = db_select('poems', 'p')
             ->fields('p', array('genre_id', 'user_id', 'title', 'poem', 'photo'));


    $this->destination = new MigrateDestinationNode('article');

    // Mapped fields
    $this->addFieldMapping('title', 'title');
    #$this->addFieldMapping('', 'genre_id')->sourceMigration('PoemTaxonomy');
    $this->addFieldMapping('uid', 'user_id')->sourceMigration('PoemUser');
    $this->addFieldMapping('body', 'poem');

    $this->addFieldMapping('field_image', 'image');
  }
}
