


with src_ratings as (
    select *
    from MOVIELENS.dev.src_ratings
)

select  
    user_id,
    movie_id,
    rating,
    rating_timestamp
from src_ratings
where rating is not null


    and rating_timestamp > 
        (select max(rating_timestamp)) from MOVIELENS.fact.fact_ratings
 
