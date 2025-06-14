select 
    t.tag_name,
    round(avg(s.relevance_score), 4) as avg_relevance
from {{ ref('fact_genome_scores') }} s
join {{ ref('dim_genome_tags') }} t on s.tag_id = t.tag_id
group by t.tag_name
order by avg_relevance desc
limit 100;