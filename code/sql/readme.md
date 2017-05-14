# sqml

Simple layering CRUD for qml

## Layering CRUD

## Sql query builder

```
builder.select(['name', 'sum(a.id)'])
        .from('user a')
        .where()
        .gt('a.age', 10)
        .orderBy(['name', 'age']);
console.log('sql: ', builder.dumpSql());
console.log('bind: ', builder.dumpBind());
```

```
sql: SELECT num, sum(a.id) FROM user a
WHERE a.age > 10
ORDER BY name, age

bind: [10]
```
