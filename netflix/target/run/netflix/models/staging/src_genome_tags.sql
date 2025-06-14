
  create or replace   view MOVIELENS.dev.src_genome_tags
  
   as (
    with raw_genome_tags as (
    select * from MOVIELENS.raw.raw_genome_tags
)

select 
    tagId as tag_id,
    tag
from raw_genome_tags
  );

