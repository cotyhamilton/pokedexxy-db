#!/usr/bin/env sh

set -eux

rm -rf db
mkdir -p db

sqlite3 db/pokemon.db <<EOF
.read schema.sql
.import --csv --skip 1 csv/generations.csv generations
.import --csv --skip 1 csv/pokemon.csv pokemon
.import --csv --skip 1 csv/pokemon-stats.csv pokemon_stats
.import --csv --skip 1 csv/types.csv types
.import --csv --skip 1 csv/pokemon-types.csv pokemon_types
UPDATE pokemon_types SET secondary_type_id = NULL WHERE secondary_type_id = '';
EOF