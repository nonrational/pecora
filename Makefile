run: deps
	iex -S mix phx.server

dbsetup: deps
	psql -d postgres -c "select 'ready' as status;"
	psql -d postgres -c 'CREATE ROLE "pecora_dev"; CREATE ROLE "pecora_test";' || echo 'assuming roles exist'
	psql -d postgres -c 'ALTER ROLE "pecora_dev" WITH LOGIN; ALTER ROLE "pecora_test" WITH LOGIN; ALTER ROLE "pecora_dev" WITH CREATEDB; ALTER ROLE "pecora_test" WITH CREATEDB;'
	createdb --owner pecora_dev pecora_dev || echo 'assuming pecora_dev exists'
	createdb --owner pecora_test pecora_test || echo 'assuming pecora_test exists'

test: deps
	mix test

deps:
	mix deps.get

clean:
	git clean -d ./public -f -x

console:
	iex --erl "-kernel shell_history enabled" -S mix

.PHONY: run test deps clean console
