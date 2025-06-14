
  
    

        create or replace transient table MOVIELENS.dev.dim_genome_tags
         as
        (with src_tags as (
    select *
    from MOVIELENS.dev.src_genome_tags
)

select 
    tag_id,
    initcap(trim(tag)) as tag_name
from src_tags
        );
      
  