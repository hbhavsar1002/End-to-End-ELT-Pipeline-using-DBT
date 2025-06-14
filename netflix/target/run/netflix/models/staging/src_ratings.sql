
  create or replace   view MOVIELENS.dev.src_ratings
  
   as (
    with raw_ratings as (
    select * from MOVIELENS.raw.raw_ratings
)

select 
    userId as user_id,
    movieId as movie_id,
    rating,
    to_timestamp_ltz(timestamp) as rating_timestamp
from raw_ratings
  );

