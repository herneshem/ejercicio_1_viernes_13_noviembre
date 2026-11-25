use jardineria;

select curdate();

/*sumar 31 dias*/
select date_add(curdate(), interval 31 day);

/*hoy*/
select dayname(curdate());

select @@lc_time_names;

-- cambiiar a español
set @@lc_time_names = 'es_ES';