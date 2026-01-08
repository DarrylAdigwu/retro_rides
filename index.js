import { PGlite } from '@electric-sql/pglite';
import fs from 'fs';

(async () => {
  const db = new PGlite();

  // Set up the DB files
  const createTables = fs.readFileSync('create-tables.sql', 'utf8');
  const insertCarsData = fs.readFileSync('insert-cars-data.sql', 'utf8');
  await db.exec(createTables);
  await db.exec(insertCarsData);

  // Run the changes made in DM section
  const crudOperations = fs.readFileSync('crud-operations.sql', 'utf8');
  await db.exec(crudOperations);

  // Load the SQL query file
  const query = fs.readFileSync('query.sql', 'utf8');

  // Populate our new Tables
  const populateTables = fs.readFileSync('populate-tables.sql', 'utf8')
  await db.exec(populateTables)

  // Alter existing tables
  const alterTables = fs.readFileSync('alter-table.sql', 'utf8');
  await db.exec(alterTables);

  // Insert new data to the tables
  const insertNewData = fs.readFileSync('insert-new-data.sql', 'utf-8');
  await db.exec(insertNewData);

  // Alter constraints dropping NOT NULL
  const alterConstraints = fs.readFileSync('alter-constraints.sql', 'utf-8');
  await db.exec(alterConstraints);

  // Run the query from the query file
  const response = await db.query(query);

  console.clear();
  console.table(response.rows);
})();
