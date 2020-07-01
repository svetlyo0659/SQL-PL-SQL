SELECT * FROM tbl_customers
order by first_name, last_name, age;

SELECT /* + parallel (c,2) */* FROM tbl_customers c
order by first_name, last_name, age;

SELECT /* + parallel (c,4) */* FROM tbl_customers c
order by first_name, last_name, age;

SELECT /* + parallel (c,2) */last_name, COUNT (*) from tbl_customers c
group by last_name
order by 2 asc;

COMMIT;

SELECT * FROM V$PX_PROCESS_SYSSTAT WHERE STATISTIC LIKE 'Buffers%';



