### Get top 10 most time consuming query
```shell
SELECT * FROM
performance_schema.events_statements_summary_by_digest
ORDER BY SUM_TIMER_WAIT DESC LIMIT 10\G;
```

