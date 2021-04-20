
-- link: https://www.hackerrank.com/challenges/full-score/problem 

select hacker_id, name from (
    select s.hacker_id, h.name, count(s.challenge_id) as chs from submissions s
    inner join challenges ch on s.challenge_id = ch.challenge_id
    inner join difficulty df on df.score = s.score and ch.difficulty_level = df.difficulty_level
    inner join hackers h on h.hacker_id = s.hacker_id
    group by s.hacker_id, h.name
    having count(s.challenge_id)>1
) order by chs desc, hacker_id asc;