ALTER TABLE `payment` add column `balance_amount` int(11) NOT NULL;

ALTER TABLE `payment` add column `penal` int(11) NOT NULL;

ALTER TABLE `payment` add column `payment_no` varchar(100) NOT NULL;

ALTER TABLE `rate` DROP `from_area`, DROP `to_area`;

ALTER TABLE `rate` ADD `extra` INT(11) NOT NULL AFTER `flag`;


new

alter table payment add column tax int(11) not null;

alter table payment add column lease_rent int(11) not null;

create table order_rate ( order_rate_id int PRIMARY KEY AUTO_INCREMENT, start_date date, end_date date, amount1 int, amount2 int, flag tinyint, order_id int, CONSTRAINT order_rate_fk FOREIGN KEY (order_id) REFERENCES orders(order_id) )

create table debit(
debit_id int(11) not null PRIMARY key AUTO_INCREMENT,
penal int not null,
invoice_id int,
FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);




alter table debit add payment_id int;

alter table debit add CONSTRAINT fk1 FOREIGN KEY (payment_id) REFERENCES payment(payment_id);

alter table debit add order_id int;

alter table debit add CONSTRAINT fk_debit_order FOREIGN KEY (order_id) REFERENCES orders(order_id);

alter table payment add status tinyint;


alter table payment add tds_file text;

alter table payment add transaction_no varchar(50);

alter table payment add transaction_details text;

alter table invoice add email_status tinyint;

alter table invoice add lease_current_start date;

alter table invoice add lease_prev_start date;

----------------------------------------------------

alter table orders add document text;

alter table orders add remark text;


----------------------------------------------------

alter table invoice drop column current_total_dues;

alter table invoice drop column grand_total;

alter table invoice drop column total_amount;

alter table invoice add column total_amount int(11) not null;

ALTER TABLE Orders DROP FOREIGN KEY invoice_rate_id;

alter table invoice drop column rate_id

ALTER TABLE `invoice` ADD `flag` TINYINT NOT NULL DEFAULT '1' AFTER `total_amount`;

alter table invoice drop COLUMN current_interest;

alter table invoice drop column invoice_code;

alter table invoice add invoice_code varchar(100) not null;

drop table rate;

=======
alter table orders add status tinyint default 1;

alter table orders add next_order_id int;

alter table orders add CONSTRAINT orders_fk1 FOREIGN KEY (next_order_id) REFERENCES orders(order_id);

alter table orders add transfer_url text;

alter table users add mobile varchar(11) not null;

========

ALTER TABLE `area` ADD `rate` INT(11) NOT NULL AFTER `total_area`;

ALTER TABLE `area` ADD `flag` TINYINT NOT NULL AFTER `rate`;

========

ALTER TABLE `debit` ADD `flag` INT NOT NULL DEFAULT '1' AFTER `order_id`;

========

ALTER TABLE `debit` ADD `start_date` DATE NULL AFTER `flag`;

========

ALTER TABLE `orders` ADD `due_date` DATE NOT NULL AFTER `email_status`;

ALTER TABLE `orders` ADD `tansfer_date` DATE NOT NULL AFTER `due_date`;

ALTER TABLE `orders` ADD `folio1` TEXT NULL AFTER `tansfer_date`;

ALTER TABLE `orders` ADD `folio2` TEXT NULL AFTER `filio1`;

ALTER TABLE orders MODIFY total_area int(11) NULL;

ALTER TABLE orders MODIFY email_status tinyint(4) NULL;
