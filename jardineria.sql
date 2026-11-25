use jardineria;

select curdate();

/*sumar 31 dias*/
select date_add(curdate(), interval 31 day);

/*hoy*/
select dayname(curdate());

select @@lc_time_names;

-- cambiiar a español
set @@lc_time_names = 'en_US';


/*pedidos de los ultimos 5 dias*/
select * from pedido where  fecha_pedido > date_sub(last_day(fecha_pedido), interval 1 month);
select * from pedido where  fecha_pedido between date_sub(last_day(fecha_pedido), interval 2 day) and last_day(fecha_pedido);

SELECT *,  TO_DAYS(fecha_pedido) AS fecha_en_dias FROM pedido;
table pedido;

SELECT *
FROM pedido
WHERE TO_DAYS(fecha_pedido) BETWEEN
      TO_DAYS(DATE_SUB(LAST_DAY(fecha_pedido), INTERVAL 2 DAY))
      AND TO_DAYS(LAST_DAY(fecha_pedido));


