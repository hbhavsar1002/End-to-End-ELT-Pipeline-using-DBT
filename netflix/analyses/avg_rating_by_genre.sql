{{ config(materialized='table') }}

with ratings as (
    select 
        user_id,
        movie_id,
        rating
    from {{ ref('fact_ratings') }}
    where rating is not null
),

movie_genres as (
    select 
        movie_id,
        genre_name
    from {{ ref('dim_movie_genres') }}
)

select
    mg.genre_name,
    avg(r.rating) as avg_rating,
    count(distinct r.user_id) as unique_user_count,
    count(*) as rating_count
from ratings r
join movie_genres mg on r.movie_id = mg.movie_id
group by mg.genre_name
order by avg_rating desc
