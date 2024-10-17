-- sql script that ranks country origins by bands
-- ordered by th enumber of non-unique fans
SELECT origin, SUM(fans) AS  nb_fans FROM metal_bands GROUP BY origin ORDER BY nb_fans DESC;
