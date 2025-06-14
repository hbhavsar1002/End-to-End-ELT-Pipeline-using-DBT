{{
config(
    materialized = 'ephemeral'
)

}}


with movies as (
    select * from {{ref('dim_movies')}}
),
tags as (
    select * from {{ref('dim_genome_tags')}}
),
scores as (
    select * from {{ref('fact_genome_scores')}}
)


select m.movie_id,
    m.movie_title,
    t.tag_name,
    s.relevance_score   
from movies m
join scores s on m.movie_id = s.movie_id
join tags t on t.tag_id = s.tag_id