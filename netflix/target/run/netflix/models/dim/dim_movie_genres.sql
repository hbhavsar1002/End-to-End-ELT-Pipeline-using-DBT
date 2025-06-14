
  
    

        create or replace transient table MOVIELENS.dev.dim_movie_genres
         as
        (with exploded_genres as (
    select
        m.movie_id,
        genre_flat.value::string as genre_name
    from MOVIELENS.dev.dim_movies m,
    lateral flatten(input => split(m.genres, '|')) genre_flat
)

select
    eg.movie_id,
    g.genre_name
from exploded_genres eg
left join MOVIELENS.None.genres g
    on g.genre_name = eg.genre_name
        );
      
  