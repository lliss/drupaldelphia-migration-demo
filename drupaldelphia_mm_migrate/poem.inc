<?php

/**
 * @file
 * Migration classes related to poems.
 */

/**
 * Base poem migration class that we can extend.
 */
abstract class PoemMigration extends DynamicMigration {
  public function __construct() {
    // Always call the parent constructor first for basic setup
    parent::__construct();
  }
}

/**
 * Migration class for Taxonomy terms.
 */
class PoemTaxonomyMigration extends PoemMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Creates taxonomy terms from legacy genres table.');

    // Alert migrate that the "id" field is the primary key for the legacy data.
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

    // Create a dataset that migrate will then make available for mapping.
    $query = Database::getConnection('default', 'legacy')->select('genres', 'g')->fields('g', array('id', 'name'));

    $this->source = new MigrateSourceSQL($query);

    // Alert migrate that we are migrating taxonomy terms for the vocabulary
    // "genre".
    $this->destination = new MigrateDestinationTerm('genre');

    // Map the name field from the destination against the name field of the
    // source.
    $this->addFieldMapping('name', 'name');

  }
}

/**
 * Migration class to migrate users to the new system.
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
            'description' => 'user id.',
          ),
        ),
        MigrateDestinationUser::getKeySchema()
    );
    $query = Database::getConnection('default', 'legacy')->select('users', 'u')->fields('u', array('id', 'name', 'photo'));
    $this->source = new MigrateSourceSQL($query);
    $this->destination = new MigrateDestinationUser();

    $this->addSimpleMappings(array('name'));

    // For images we can pull from a directory in Drupal.
    $this->addFieldMapping('field_image', 'photo');
    $this->addFieldMapping('field_image:source_dir')->defaultValue(drupal_get_path('module', 'drupaldelphia_mm_migrate') . '/data');
  }
}

/**
 * Imports poems from the poems table into article nodes.
 */
class PoemNodeMigration extends PoemMigration {
  public function __construct() {
    parent::__construct();
    $this->description = t('Creates Poem articles from legacy poems database.');

    // Don't allow this migration to run without user and term data since it is
    // used on each poem.
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

    $query = Database::getConnection('default', 'legacy')->select('poems', 'p')
             ->fields('p', array('id', 'genre_id', 'user_id', 'title', 'poem', 'photo'));


    $this->source = new MigrateSourceSQL($query);
    $this->destination = new MigrateDestinationNode('article');

    // Mapped fields
    $this->addFieldMapping('title', 'title');
    // Specify that this data needs to be translated to the proper imported
    // Drupal data. Also, tell migrate that we are giving it a term id and not
    // human readable term names.
    $this->addFieldMapping('field_genre', 'genre_id')->sourceMigration('PoemTaxonomy')->arguments(array('source_type' => 'tid'));

    $this->addFieldMapping('uid', 'user_id')->sourceMigration('PoemUser');

    // Map the body from the poem data.
    $this->addFieldMapping('body', 'poem');

    $this->addFieldMapping('field_image', 'photo');
    $this->addFieldMapping('field_image:source_dir')->defaultValue(drupal_get_path('module', 'drupaldelphia_mm_migrate') . '/data');
  }
}
