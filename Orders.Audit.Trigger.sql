CREATE TABLE [dbo].[ORDERS_Audit](
	[ORDER_NUM] [char](5) NOT NULL primary key,
	[ORDER_DATE] [date] NULL,
	[CUSTOMER_NUM] [char](3) NULL,
	[audit_date] date,
	[audit_type] char(1),
	[audit_terminal] varchar(30),
	[audit_user] varchar(30))

	create trigger ordersaudit
	on orders
	after insert
	as
	declare @ordernum char(5)
	declare @customernum char(3)

	set @ordernum = (select order_num from inserted)
	select @customernum = (select customer_num from inserted)

	insert into ORDERS_Audit (audit_date, audit_type, audit_terminal, audit_user, ORDER_NUM, CUSTOMER_NUM)
	values (getdate(), 'I', host_name(), suser_name(), @ordernum, @customernum)

	select * from ORDERS_audit
	select * from orders

	insert into orders values(59999, '4/10/2019', '586')
