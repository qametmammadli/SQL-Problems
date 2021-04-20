
-- problem: https://www.hackerrank.com/challenges/weather-observation-station-19/problem

select round(sqrt(power(max(nvl(lat_n, 0)) - min(nvl(lat_n, 0)), 2) + power(max(nvl(long_w, 0)) - min(nvl(long_w, 0)), 2)), 4) from station;