# README

This demo app expects Sphinx to be compiled with libstemmer support.

The database is currently using PostgreSQL. If you want to use a different database, you should modify `config/database.yml` before running any commands.

To set everything up and run the tests:

```
bundle
# Creates the database, runs migrations, starts Sphinx:
./bin/rake morphology:setup
# Run morphology tests:
./bin/rake morphology:test
# Stops Sphinx, drops the database:
./bin/rake morphology:packdown
```
