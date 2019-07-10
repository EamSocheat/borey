CREATE TABLE tbl_menu (
		menu_id	int NOT NULL AUTO_INCREMENT,
		menu_nm	varchar(30),
		menu_nm_kh	varchar(30),
		regDt	datetime,
		PRIMARY KEY (menu_id)
);
alter table `tbl_menu` add column menu_icon_nm varchar(30);
alter table `tbl_menu` add column menu_level int;
alter table `tbl_menu` add column menu_order int;
alter table `tbl_menu` add column menu_group int;

CREATE TABLE tbl_company (
		com_id	int NOT NULL AUTO_INCREMENT, 
		com_nm	varchar(30) not null,
		com_phone	varchar(15) not null,
		com_email	varchar(50),
		com_addr	text,
		com_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		PRIMARY KEY(com_id)
);


CREATE TABLE tbl_branch_type (
		bra_type_id	int NOT NULL AUTO_INCREMENT, 
		bra_nm	varchar(30),
		bra_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1),
		regUsr	int,
		upUsr	int,
		com_id	int,
		PRIMARY KEY(bra_type_id) 

);
alter table `tbl_branch_type` add column bra_nm_kh varchar(30);

CREATE TABLE tbl_branch (
		bra_id	int NOT NULL AUTO_INCREMENT, 
		bra_nm	varchar(30) not null,
		bra_phone1	varchar(15),
		bra_phone2	varchar(15),
		bra_email	varchar(50),
		bra_addr	text,
		bra_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null,
		upUsr	int not null,
		bra_type_id	int not null, 
		com_id	int not null,
		PRIMARY KEY(bra_id) 
);

alter table tbl_branch
add column bra_nm_kh varchar(50);

CREATE TABLE tbl_position (
		pos_id	int NOT NULL AUTO_INCREMENT, 
		pos_nm	varchar(30) not null,
		pos_nm_kh	varchar(30),
		pos_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1),
		regUsr	int not null,
		upUsr	int not null,
		com_id	int not null,
		PRIMARY KEY(pos_id) 
);


CREATE TABLE tbl_staff (
		sta_id	int NOT NULL AUTO_INCREMENT, 
		sta_nm	varchar(30) not null,
		sta_nm_kh	varchar(30),
		sta_gender	varchar(1) not null,
		sta_dob	date,
		sta_photo	text,
		sta_phone1	varchar(15),
		sta_phone2	varchar(15),
		sta_email	varchar(50),
		sta_addr	text,
		sta_des	text,
		sta_start_dt	date,
		sta_end_dt	date,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null,
		upUsr	int not null,
		pos_id	int not null, 
		bra_id	int, 
		com_id	int not null, 
		PRIMARY KEY(sta_id) 
);

CREATE TABLE tbl_user (
		usr_id	int NOT NULL AUTO_INCREMENT, 
		usr_nm	varchar(30) not null,
		usr_pwd	text not null,
		usr_wri_yn	varchar(1) not null,
		usr_menu	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null, 
		upUsr	int not null,
		sta_id	int not null,
		com_id	int not null,
		PRIMARY KEY(usr_id) 
);

alter table tbl_user 
add column usr_str varchar(1);

CREATE TABLE tbl_supplier (
		sup_id	int NOT NULL AUTO_INCREMENT, 
		sup_nm	varchar(30) not null,
		sup_phone	varchar(50),
		sup_email	varchar(50),
		sup_addr	text,
		sup_des	text,
		sup_cont	varchar(30),
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null,
		upUsr	int not null,
		com_id	int not null,
		PRIMARY KEY(sup_id) 

);

CREATE TABLE tbl_category (
		cat_id	int NOT NULL AUTO_INCREMENT, 
		cat_nm	varchar(30) not null,
		cat_nm_kh	varchar(50),
		cat_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		upUsr	int not null,
		regUsr	int not null, 
		com_id	int not null, 
		PRIMARY KEY(cat_id) 
);


CREATE TABLE tbl_product (
		pro_id	int NOT NULL AUTO_INCREMENT, 
		pro_nm	varchar(30) not null,
		pro_nm_kh	varchar(50),
		pro_vol	varchar(10),
		pro_price	double,
		pro_sale_price	double,
		pro_qty	int,
		pro_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null, 
		upUsr	int not null,
		cat_id	int not null,
		com_id	int not null, 
		PRIMARY KEY(pro_id)
);


CREATE TABLE tbl_stock (
		sto_id	int NOT NULL AUTO_INCREMENT, 
		sto_nm	varchar(30) not null,
		sto_nm_kh	varchar(50),
		sto_addr	text,
		sto_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1),
		regUsr	int not null, 
		upUsr	int not null,
		bra_id	int not null, 
		com_id	int not null,
		PRIMARY KEY(sto_id)
);


CREATE TABLE tbl_import (
		imp_id	int NOT NULL AUTO_INCREMENT, 
		imp_total_qty	int, 
		imp_total_price	double,
		imp_date	date not null,
		imp_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null, 
		upUsr	int not null,
		sup_id	int not null, 
		com_id	int not null,
		PRIMARY KEY(imp_id)

);


CREATE TABLE tbl_import_detail (
		imp_id	int not null, 
		pro_id	int not null, 
		pro_unit_price	double,
		pro_sale_price	double,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null, 
		upUsr	int not null,
		com_id	int not null, 
		PRIMARY KEY(imp_id,pro_id)
);

CREATE TABLE tbl_stock_product (
		sto_id	int not null, 
		pro_id	int not null, 
		imp_mov_id	int not null, 
		imp_mov_status	int not null, 
		pro_qty	int, 
		pro_unit_price	double,
		pro_sale_price	double,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1),
		regUsr	int not null, 
		upUsr	int not null,
		com_id	int not null,
		PRIMARY KEY(sto_id,pro_id)
);



CREATE TABLE tbl_move (
		mov_id	int NOT NULL AUTO_INCREMENT, 
		mov_total_qty	int not null, 
		mov_date	date not null,
		mov_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1),
		sto_out_id	int not null, 
		sto_in_id	int not null, 
		sta_id	int not null, 
		regUsr	int not null, 
		upUsr	int not null,
		com_id	int not null, 
		PRIMARY KEY(mov_id)
);



CREATE TABLE tbl_move_detail (
		mov_id	int not null, 
		pro_id	int not null, 
		pro_qty	int not null,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null, 
		upUsr	int not null,
		com_id	int not null, 
		PRIMARY KEY(mov_id,pro_id)
);


CREATE TABLE tbl_use (
		use_id	int NOT NULL AUTO_INCREMENT, 
		use_total_qty	int not null, 	
		use_date	date not null,
		use_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1),
		sto_id	int not null, 
		sta_id	int not null, 
		regUsr	int not null,
		upUsr	int not null, 
		com_id	int not null, 
		PRIMARY KEY(use_id)
);


CREATE TABLE tbl_use_detail (
		use_id	int not null, 
		pro_id	int not null, 
		pro_qty	int, 
		use_status	varchar(1),
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1),
		regUsr	int not null, 
		upUsr	int not null,
		com_id	int not null, 
		PRIMARY KEY(use_id,pro_id)

);



CREATE TABLE tbl_use_detail_status (
		use_stat_id int NOT NULL AUTO_INCREMENT, 
		use_id	int not null, 
		pro_id	int not null, 
		use_stat_des	text,
		regDt	datetime,
		upDt	datetime,
		useYn	varchar(1) not null,
		regUsr	int not null, 
		upUsr	int not null,
		com_id	int not null,
        PRIMARY KEY(use_stat_id)
);		


CREATE TABLE tbl_menu_company (
		menu_id	int not null, 
		com_id	int not null, 
		upDt	datetime,
		regDt	datetime,
		useYn	varchar(1),
		PRIMARY KEY(menu_id,com_id)
);

create table tbl_menu_user(
menu_id	int not null, 
usr_id	int not null, 
upDt	datetime,
regDt	datetime,
useYn	varchar(1) not null,
PRIMARY KEY(menu_id,usr_id)
);