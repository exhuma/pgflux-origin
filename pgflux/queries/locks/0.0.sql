SELECT
    db.datname as "tag:database",
    LOWER(mode) AS "tag:mode",
    locktype AS "tag:locktype",
    granted AS "tag:granted",
    COUNT(mode),
    EXTRACT(EPOCH FROM NOW()) * 1E9 AS "timestamp"
FROM pg_database db
FULL OUTER JOIN pg_locks lck ON (db.oid=lck.database)
GROUP BY db.datname, mode, locktype, granted;
