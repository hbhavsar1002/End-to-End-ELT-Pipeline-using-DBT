
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
select *
from MOVIELENS.fact.fact_ratings
where rating < 0

  
  
      
    ) dbt_internal_test