use performance_test

-- total records
select count(*) as number_of_records
from data_interview


-- total player
select [version], COUNT(Distinct[user]) as total_player_per_version
from data_interview
where event_name = 'game_end'
group by [version]

-- total play time
select [version], SUM(quantity) as total_play_time
from data_interview
where event_name = 'game_end'
group by [version]

-- check player play tutorial
select * from data_interview
where event_name = 'game_end'
and [user] in(
select distinct [USER] from data_interview
where level = '1'
and quantity != 0)


--sort distinct daydiff
SELECT DISTINCT [user], day_diff,version
FROM data_interview
order by [user] asc


--min level to need help
select MIN(level) as minlvtousehelp from data_interview
where reason_to_die like '%plus'

-- user with number days play in 7 days
select [user], COUNT(distinct day_diff) as daydiffcount
from data_interview
group by [user];

-- check for user play both 2 version
select [user]
from data_interview
where version in ('1.5.2','1.6.0')
group by [user]
having COUNT(distinct [version]) = 2;



-- total record of game_end
select COUNT(*) from data_interview
where event_name = 'game_end'
and level <= 10




