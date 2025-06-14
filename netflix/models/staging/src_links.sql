with raw_links as (
    select * from {{ source('raw', 'raw_links') }}
)

select 
    movieId as movie_id,
    imdbId as imdb_id,
    tmdbid as tmdb_id
from raw_links