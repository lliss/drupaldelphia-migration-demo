<?php

/**
 * @file
 */

/*
 * Implements hook_migrate_api().
 */
function drupaldelphia_mm_migrate_migrate_api() {
  $api = array(
    'api' => 2,
    'migrations' => array(
      'PoemTaxonomy' => array('class_name' => 'PoemTaxonomyMigration'),
      'PoemUser' => array('class_name' => 'PoemUserMigration'),
      'PoemNode' => array('class_name' => 'PoemNodeMigration'),
    ),
  );
  return $api;
}
