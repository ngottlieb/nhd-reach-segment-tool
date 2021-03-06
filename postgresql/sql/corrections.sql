CREATE VIEW corrections AS
  SELECT
    reach_id,
    river,
    section,
    huc4,
    fdate,
    candidates,
    distance,
    geom,
    type
  FROM (
    SELECT
      reach_id,
      huc4,
      fdate,
      candidates,
      distance,
      link geom,
      'put-in' AS type
    FROM
      snapped_putins
    UNION ALL
    SELECT
      reach_id,
      huc4,
      fdate,
      candidates,
      distance,
      link geom,
      'take-out' as type
    FROM
      snapped_takeouts
  ) AS _
  JOIN reaches ON id = reach_id
  WHERE is_final;