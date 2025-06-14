
  
    

        create or replace transient table MOVIELENS.dev.dim_genres
         as
        (with genres as (
    select * from MOVIELENS.None.genres
)

select 
    genre_id,
    genre_name
from genres
        );
      
  