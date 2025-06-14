
  
    

        create or replace transient table MOVIELENS.dev.dim_users
         as
        (with ratings as (
    select distinct user_id from 
    MOVIELENS.dev.src_ratings
),

tags as (
    select distinct user_id from 
    MOVIELENS.dev.src_tags
)


select distinct user_id 
from (
    select * from ratings
    union
    select * from tags
) as data
        );
      
  