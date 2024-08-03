postgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root123 -d postgres

createdb:
	docker exec -it postgres createdb --username=root --owner=root simple_bank

migrateup:
	migrate -path db/migrations -database "postgres://root:root123@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migrations -database "postgres://root:root123@localhost:5432/simple_bank?sslmode=disable" -verbose down

dropdb:
	docker exec -it postgres dropdb simple_bank

.PHONY: postgres createdb dropdb migrateup migratedown

