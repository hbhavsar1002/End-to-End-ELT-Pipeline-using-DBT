with tag_score as (
    select 
        t.tag_id,
        t.tag_name,
        round(avg(s.relevance_score), 4) as avg_relevance
    from MOVIELENS.fact.fact_genome_scores s
    join MOVIELENS.dev.dim_genome_tags t on s.tag_id = t.tag_id
    group by t.tag_id, t.tag_name
    order by avg_relevance desc
    limit 20
),

movie_scores as (
    select 
        m.movie_id,
        m.movie_title,
        s.tag_id,
        s.relevance_score
    from MOVIELENS.dev.dim_movies m
    join MOVIELENS.fact.fact_genome_scores s on m.movie_id = s.movie_id
    where s.tag_id in (select tag_id from tag_score)
),


select 
    distinct(ms.movie_title)
from movie_scores ms
join tag_score ts on rt.tag_id = ts.tag_id