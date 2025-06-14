
  create or replace   view MOVIELENS.dev.src_links
  
   as (
    with raw_links as (
    select * from MOVIELENS.raw.raw_links
)

select 
    movieId as movie_id,
    imdbId as imdb_id,
    tmdbid as tmdb_id
from raw_links
  );

