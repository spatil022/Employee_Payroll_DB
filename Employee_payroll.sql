UC1:

mysql> create database payroll_services;
Query OK, 1 row affected (0.17 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| employee_payroll   |
| information_schema |
| mysql              |
| payroll_services   |
| performance_schema |
| sakila             |
| store              |
| sys                |
| world              |
+--------------------+
10 rows in set (0.04 sec)

mysql> USE payroll_services;
Database changed


UC2:
mysql> CREATE TABLE employee
    -> (
    ->  id   INT unsigned NOT NULL AUTO_INCREMENT,
    -> name  VARCHAR(150) NOT NULL,
    -> salary Double NOT NULL,
    -> start  DATE NOT NULL,
    -> PRIMARY KEY (id)
    -> );
Query OK, 0 rows affected (2.20 sec)

mysql> DESCRIBE employee;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int unsigned | NO   | PRI | NULL    | auto_increment |
| name   | varchar(150) | NO   |     | NULL    |                |
| salary | double       | NO   |     | NULL    |                |
| start  | date         | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+
4 rows in set (0.07 sec)


UC3:
mysql> INSERT INTO employee ( name , salary, start) VALUES
    -> ('CHARLIE', 200000.00, '2021-03-19'),
    -> ('JACK', 300000.00, '2020-06-26'),
    -> ('RIYA', 300000.00, '2019-07-26');
Query OK, 3 rows affected (0.25 sec)
Records: 3  Duplicates: 0  Warnings: 0


UC4:
mysql> select * from employee;
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | CHARLIE  | 200000 | 2021-03-19 |
|  2 | JACK     | 300000 | 2020-06-26 |
|  3 | RIYA     | 300000 | 2019-07-26 |
+----+----------+--------+------------+
3 rows in set (0.00 sec)


UC5:
mysql> select salary from employee where name = 'CHARLIE';
+--------+
| salary |
+--------+
| 200000 |
+--------+
1 row in set (0.00 sec)

mysql> where start BETWEEN CAST('2020-06-26' AS DATE) AND DATE(NOW());

mysql> select * from employee;
+----+----------+--------+------------+
| id | name     | salary | start      |
+----+----------+--------+------------+
|  1 | CHARLIE  | 200000 | 2021-03-19 |
|  2 | JACK     | 300000 | 2020-06-26 |
|  3 | RIYA     | 300000 | 2019-07-26 |
+----+----------+--------+------------+
3 rows in set (0.00 sec)

mysql> select * from employee
    -> where start BETWEEN CAST('2020-06-26' AS DATE) AND DATE(NOW());
+----+--------+--------+------------+
| id | name   | salary | start      |
+----+--------+--------+------------+
|  2 | JACK   | 300000 | 2020-06-26 |
+----+--------+--------+------------+
1 row in set (0.00 sec)


UC6:
mysql> alter table employee add gender CHAR(1) after name;
Query OK, 0 rows affected (3.33 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update employee set gender = 'M' where name = 'CHARLIE';
Query OK, 1 row affected (0.24 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set gender = 'M' where name = 'JACK';
Query OK, 1 row affected (0.27 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee set gender = 'F' where name = 'RIYA';
Query OK, 1 row affected (0.25 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee;
+----+----------+--------+--------+------------+
| id | name     | gender | salary | start      |
+----+----------+--------+--------+------------+
|  1 | CHARLIE  | M      | 200000 | 2021-03-19 |
|  2 | JACK     | M      | 300000 | 2020-06-26 |
|  3 | RIYA     | F      | 300000 | 2019-07-26 |
+----+----------+--------+--------+------------+
3 rows in set (0.00 sec)


UC7:
mysql> select AVG(salary) from employee where gender = 'M' group by gender;
+-------------+
| AVG(salary) |
+-------------+
|      250000 |
+-------------+
1 row in set (0.13 sec)

mysql> select gender,AVG(salary) from employee group by gender;
+--------+-------------+
| gender | AVG(salary) |
+--------+-------------+
| M      |      250000 |
| F      |      300000 |
+--------+-------------+
2 rows in set (0.10 sec)

mysql> select AVG(salary) from employee;
+-------------------+
| AVG(salary)       |
+-------------------+
| 266666.6666666667 |
+-------------------+
1 row in set (0.00 sec)

mysql> select gender,COUNT(salary) from employee group by gender;
+--------+---------------+
| gender | COUNT(salary) |
+--------+---------------+
| M      |             2 |
| F      |             1 |
+--------+---------------+
2 rows in set (0.00 sec)

mysql> select gender,SUM(salary) from employee group by gender;
+--------+-------------+
| gender | SUM(salary) |
+--------+-------------+
| M      |      500000 |
| F      |      300000 |
+--------+-------------+
2 rows in set (0.00 sec)

mysql> select gender,MIN(salary) from employee group by gender;
+--------+-------------+
| gender | MIN(salary) |
+--------+-------------+
| M      |      200000 |
| F      |      300000 |
+--------+-------------+
2 rows in set (0.19 sec)

mysql> select gender,MAX(salary) from employee group by gender;
+--------+-------------+
| gender | MAX(salary) |
+--------+-------------+
| M      |      300000 |
| F      |      300000 |
+--------+-------------+
2 rows in set (0.00 sec)


UC8:
mysql> alter table employee add phone_number VARCHAR(250) AFTER name;
Query OK, 0 rows affected (2.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee add address VARCHAR(250) AFTER phone_number;
Query OK, 0 rows affected (3.31 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee add department VARCHAR(250) NOT NULL AFTER address;
Query OK, 0 rows affected (2.47 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee alter address SET DEFAULT 'TBD';
Query OK, 0 rows affected (0.17 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employee;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int unsigned | NO   | PRI | NULL    | auto_increment |
| name         | varchar(150) | NO   |     | NULL    |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| address      | varchar(250) | YES  |     | TBD     |                |
| department   | varchar(250) | NO   |     | NULL    |                |
| gender       | char(1)      | YES  |     | NULL    |                |
| salary       | double       | NO   |     | NULL    |                |
| start        | date         | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
8 rows in set (0.09 sec)

mysql> select * from employee;
+----+----------+--------------+---------+------------+--------+--------+------------+
| id | name     | phone_number | address | department | gender | salary | start      |
+----+----------+--------------+---------+------------+--------+--------+------------+
|  1 | CHARLIE  | NULL         | NULL    |            | M      | 200000 | 2021-03-19 |
|  2 | JACK     | NULL         | NULL    |            | M      | 300000 | 2020-06-26 |
|  3 | RIYA     | NULL         | NULL    |            | F      | 300000 | 2019-07-26 |
+----+----------+--------------+---------+------------+--------+--------+------------+
3 rows in set (0.00 sec)


UC9:
mysql> alter table employee rename column salary to basic_pay;
Query OK, 0 rows affected (0.22 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee add deductions DOUBLE NOT NULL after basic_pay;
Query OK, 0 rows affected (2.48 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee add taxable_pay DOUBLE NOT NULL after deductions;
Query OK, 0 rows affected (2.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee add income_tax DOUBLE NOT NULL after taxable_pay;
Query OK, 0 rows affected (2.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table employee add net_pay DOUBLE NOT NULL after income_tax;
Query OK, 0 rows affected (3.24 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> describe employee;
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| id           | int unsigned | NO   | PRI | NULL    | auto_increment |
| name         | varchar(150) | NO   |     | NULL    |                |
| phone_number | varchar(250) | YES  |     | NULL    |                |
| address      | varchar(250) | YES  |     | TBD     |                |
| department   | varchar(250) | NO   |     | NULL    |                |
| gender       | char(1)      | YES  |     | NULL    |                |
| basic_pay    | double       | NO   |     | NULL    |                |
| deductions   | double       | NO   |     | NULL    |                |
| taxable_pay  | double       | NO   |     | NULL    |                |
| income_tax   | double       | NO   |     | NULL    |                |
| net_pay      | double       | NO   |     | NULL    |                |
| start        | date         | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+
12 rows in set (0.03 sec)

mysql> select * from employee;
+----+----------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
| id | name     | phone_number | address | department | gender | basic_pay | deductions | taxable_pay | income_tax | net_pay | start      |
+----+----------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
|  1 | CHARLIE  | NULL         | NULL    |            | M      |    200000 |          0 |           0 |          0 |       0 | 2021-03-19 |
|  2 | JACK     | NULL         | NULL    |            | M      |    300000 |          0 |           0 |          0 |       0 | 2020-06-26 |
|  3 | RIYA     | NULL         | NULL    |            | F      |    300000 |          0 |           0 |          0 |       0 | 2019-07-26 |
+----+----------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
3 rows in set (0.00 sec)


UC10:
mysql> INSERT INTO employee ( name ,department,gender,basic_pay,deductions,taxable_pay,income_tax,net_pay, start) VALUES
    -> ('JACK','Marketing','M', 400000,200000,2000000,50000,150000, '2020-06-26');
Query OK, 1 row affected (0.13 sec)

mysql> select * from employee;
+----+----------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
| id | name     | phone_number | address | department | gender | basic_pay | deductions | taxable_pay | income_tax | net_pay | start      |
+----+----------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
|  1 | CHARLIE  | NULL         | NULL    |            | M      |    200000 |          0 |           0 |          0 |       0 | 2021-03-19 |
|  2 | JACK     | NULL         | NULL    |            | M      |    300000 |          0 |           0 |          0 |       0 | 2020-06-26 |
|  3 | RIYA     | NULL         | NULL    |            | F      |    300000 |          0 |           0 |          0 |       0 | 2019-07-26 |
|  4 | JACK     | NULL         | TBD     | Marketing  | M      |    400000 |     200000 |     2000000 |      50000 |  150000 | 2020-06-26 |
+----+----------+--------------+---------+------------+--------+-----------+------------+-------------+------------+---------+------------+
4 rows in set (0.00 sec)
