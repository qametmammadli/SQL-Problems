
 -- problem:  https://www.hackerrank.com/challenges/contest-leaderboard/problem

select h.hacker_id, h.name, sum(maxs.score) as total_score
	from (
	    select hacker_id,  max(score) as score
	    from submissions
	    group by hacker_id, challenge_id) maxs
	inner join hackers h on h.hacker_id = maxs.hacker_id
	group by h.hacker_id, h.name
	having sum(maxs.score) > 0
order by 3  desc, h.hacker_id asc;