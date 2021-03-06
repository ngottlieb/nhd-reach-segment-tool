CREATE TABLE snapped_putins (
  reach_id integer NOT NULL,
  revision integer NOT NULL,
  huc4 text,
  nhdplusid bigint,
  fdate timestamp WITH time zone,
  candidates integer,
  distance double precision,
  geom geometry (Point, 4326),
  flowline_point geometry (Point, 4326),
  original_point geometry (Point, 4326),
  link geometry (LineString, 4326),
  PRIMARY KEY (reach_id)
);

CREATE INDEX snapped_putins_geom_gist ON snapped_putins
USING gist (geom);

CREATE INDEX snapped_putins_flowline_point_gist ON snapped_putins
USING gist (flowline_point);