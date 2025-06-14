
    
    

select
    tag_id as unique_field,
    count(*) as n_records

from MOVIELENS.dev.dim_genome_tags
where tag_id is not null
group by tag_id
having count(*) > 1


