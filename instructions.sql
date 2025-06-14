use role accountadmin;

create role if not exists transform;
grant role transform to role accountadmin;

CREATE WAREHOUSE IF NOT EXISTS COMPUTE_WH;
GRANT OPERATE ON WAREHOUSE COMPUTE_WH TO ROLE TRANSFORM;

CREATE USER IF NOT EXISTS dbt
  PASSWORD='dbtPassword123'
  LOGIN_NAME='dbt'
  MUST_CHANGE_PASSWORD=FALSE
  DEFAULT_WAREHOUSE='COMPUTE_WH'
  DEFAULT_ROLE=TRANSFORM
  DEFAULT_NAMESPACE='MOVIELENS.RAW'
  COMMENT='DBT user used for data transformation';
ALTER USER dbt SET TYPE = LEGACY_SERVICE;
GRANT ROLE TRANSFORM TO USER dbt;

create database if not exists movielens;
create schema if not exists movielens.raw;


GRANT ALL ON WAREHOUSE COMPUTE_WH TO ROLE TRANSFORM;
GRANT ALL ON DATABASE MOVIELENS TO ROLE TRANSFORM;
GRANT ALL ON ALL SCHEMAS IN DATABASE MOVIELENS TO ROLE TRANSFORM;
GRANT ALL ON FUTURE SCHEMAS IN DATABASE MOVIELENS TO ROLE TRANSFORM;
GRANT ALL ON ALL TABLES IN SCHEMA MOVIELENS.RAW TO ROLE TRANSFORM;
GRANT ALL ON FUTURE TABLES IN SCHEMA MOVIELENS.RAW TO ROLE TRANSFORM;

/*
CREATE STORAGE INTEGRATION my_s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::123456789012:role/snowflakeS3Access'
  STORAGE_ALLOWED_LOCATIONS = ('s3://netflixmoviedata/');
*/


create stage netflixstage
url='s3://netflix-dbt-harsh'
credentials=(AWS_KEY_ID=' ' AWS_SECRET_KEY=' ')


SHOW WAREHOUSES;

ALTER WAREHOUSE compute_wh SET AUTO_SUSPEND = 200;

CREATE OR REPLACE FILE FORMAT csv_gz_format
  TYPE = 'CSV'
  COMPRESSION = 'GZIP'
  FIELD_OPTIONALLY_ENCLOSED_BY = '"'
  SKIP_HEADER = 1;

  
create or replace table raw_movies(
    movieId INTEGER,
    title string,
    genres string
)


copy into raw_movies
from '@netflixstage/movies.csv'
file_format = csv_gz_format;


select * from raw_movies limit 5;


create or replace table raw_ratings(
    userId INTEGER,
    movieId integer,
    rating float,
    timestamp bigint
);


copy into raw_ratings
from '@netflixstage/ratings.csv'
file_format = csv_gz_format;

select * from raw_ratings limit 2;


create or replace table raw_tags(
useId INTEGER,
movieId integer,
tag string,
timestamp bigint
);

copy into raw_tags
from '@netflixstage/tags.csv'
file_format = csv_gz_format
ON_ERROR = 'CONTINUE';


COPY INTO raw_tags
FROM @netflixstage/tags.csv.gz
FILE_FORMAT = CREATE OR REPLACE TABLE raw_genome_scores (
 
  movieId INTEGER,
  tagId INTEGER,
  relevance FLOAT
);

COPY INTO raw_genome_scores
FROM '@netflixstage/genome-scores.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');csv_gz_format
VALIDATION_MODE = 'RETURN_ALL_ERRORS';


CREATE OR REPLACE TABLE raw_genome_scores (
  movieId INTEGER,
  tagId INTEGER,
  relevance FLOAT
);

COPY INTO raw_genome_scores
FROM '@netflixstage/genome-scores.csv'
FILE_FORMAT = csv_gz_format;

CREATE OR REPLACE TABLE raw_genome_tags (
  tagId INTEGER,
  tag STRING
);

COPY INTO raw_genome_tags
FROM '@netflixstage/genome-tags.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');

CREATE OR REPLACE TABLE raw_links (
  movieId INTEGER,
  imdbId INTEGER,
  tmdbId INTEGER
);

COPY INTO raw_links
FROM '@netflixstage/links.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');


