
### PostgreSQL
```
postgresql://[<user>[:<password>]@][<host>[:<port>]]/[<database>]
postgresql://[<user>[:<password>]@][<%2Fsocket%2Fpath>]/[<database>]
postgresql:[<database>]
```

### MySQL
```
mysql://[<user>[:<password>]@][<host>[:<port>]]/[database]
mysql://[<user>[:<password>]@][<%2Fsocket%2Fpath>]/[<database>]
mysql:[<database>]
```

### Redis
```
redis:[<database-number>]
redis://[:<password>@][<host>[:port]]/[<database-number>]
redis://[<user>[:<password>]@][<host>[:port]]/[<database-number>]
rediss://[<user>[:<password>]@][<host>[:port]]/[<database-number>]
```

### SQLite
```
sqlite:relative/path
sqlite:/absolute/path
sqlite:C:/windows/path
sqlite:///relative/or/absolute/path
```

### MongoDB
```
mongodb://[<user>[:<password>]@][<host>[:<port>]]/[<database>]
mongodb:[<database>]
```

### ClickHouse
```
clickhouse://[<host>[:port]]/[<database>]
clickhouse:[database]
```

### DuckDB
```
duckdb:relative/path
duckdb:/absolute/path
duckdb:C:/windows/path
```

### bigquery
хз что это (какой-то файловый сервер)
надо попробовать
```
bigquery:[<project_id>[:<dataset_id>]][?...]
bigquery:?project_id=<project_id>&dataset_id=<dataset_id>[&...]
```

### dbext
хз что это
надо попробовать
```
dbext:type=<type>[:<attr>=<value>][...]
dbext:profile=<profile>[...]
```

## Использование

1. Добавить файл `.nvim.lua`

2. Добавить конфигурацию нужной БД:
```
vim.g.dbs = {
    { name = "some db title", url = "postgres://postgres:postgres@localhost:5432/db-name" },
    { name = "", url = "" },
}
```
