{{ config(
    materialized='table',
    schema='dev'
) }}

with src_movies as (
    select *
    from {{ ref('src_movies') }}
)

select movie_id,
    regexp_replace(title, '\\s\\(\\d{4}\\)$', '') as movie_title,
    cast(regexp_substr(title, '\\((\\d{4})\\)', 1, 1, 'e', 1) as int) as release_year,
    split(genres, '|') as genre_array,
    genres
from src_movies 