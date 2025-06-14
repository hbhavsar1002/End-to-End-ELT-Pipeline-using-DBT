
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



with __dbt__cte__dim_movies_with_tags as (



with movies as (
    select * from MOVIELENS.dev.dim_movies
),
tags as (
    select * from MOVIELENS.dev.dim_genome_tags
),
scores as (
    select * from MOVIELENS.fact.fact_genome_scores
)


select m.movie_id,
    m.movie_title,
    t.tag_name,
    s.relevance_score   
from movies m
join scores s on m.movie_id = s.movie_id
join tags t on t.tag_id = s.tag_id
) select relevance_score
from __dbt__cte__dim_movies_with_tags
where relevance_score is null



  
  
      
    ) dbt_internal_test