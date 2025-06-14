
  
    

        create or replace transient table MOVIELENS.fact.fact_ratings
         as
        (


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


        );
      
  