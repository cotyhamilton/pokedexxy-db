# pokedexxy-db

a real pokémon database

## download

download the sqlite database from releases to use in your project

## update

the initial data has been sourced from OSS projects https://pokeapi.co and https://pokemonshowdown.com

each csv file that includes foreign keys provides a `meta` column to make it easier to read and update the raw data. The `meta` column isn't included in the final sqlite database.

## build

run the `build.sh` script to build the database from the csv files.
