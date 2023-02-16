create database food_delivery;
use food_delivery;

create table user(
	id int auto_increment,
    email varchar(255),
    password varchar(255),
    fullname varchar(100),
    phone_number varchar(12),
    verify_code varchar(12),
    verify_code_expired timestamp,
    
    
    primary key(id)
);

create table user_detail(
	id_user int,
    address varchar(255),
    mobile_phone varchar(12),
    city varchar(255),
    street varchar(255),
    
    primary key(id_user),
    foreign key(id_user) references user(id)
);

create table category(
	id int auto_increment,
    image text,
    name varchar(50),
    
    primary key(id)
);

create table restaurant(
	id int auto_increment,
    image text,
    name varchar(100),
    
    primary key(id)
);

create table restaurant_review(
	id int auto_increment,
    id_restaurant int,
    content text,
    rate float,
    
    primary key(id),
    foreign key(id_restaurant) references restaurant(id)
);

create table food(
	id int auto_increment,
    name varchar(255),
    image text,
    price int,
    id_category int,
    id_restaurant int,
    
    primary key(id),
    foreign key(id_category) references category(id),
    foreign key(id_restaurant) references restaurant(id)
);

create table food_detail(
	id_food int auto_increment,
    description text,
    create_date timestamp,
    rating float,
    
    primary key(id_food),
    foreign key(id_food) references food(id)
);

create table food_review(
	id int auto_increment,
    id_food int,
    id_user int,
    content text,
    create_date timestamp default now(),
    rate float,
    
    primary key(id),
    foreign key(id_food) references food(id),
    foreign key(id_user) references user(id)
);

create table food_addon(
	id int auto_increment,
    name varchar(100),
    image text,
    price int,
    id_food int,
    
    primary key(id),
    foreign key(id_food) references food(id)
);

create table material(
	id int auto_increment,
    name varchar(100),
    
    primary key(id)
);

create table food_material(
	id_food int,
    id_material int,
    
    primary key(id_food,id_material),
    foreign key(id_food) references food(id),
    foreign key(id_material) references material(id)
);

create table t_order(
	id int auto_increment,
	id_user int,
    estimate_ship timestamp,
    deliver_address text,
    
    primary key(id),
    foreign key(id_user) references user(id)
);

create table status(
	id int auto_increment,
	name varchar(50),
    
    primary key(id)
);

create table order_status(
	id_order int,
    id_status int,
    
    primary key(id_order,id_status),
    foreign key(id_order) references t_order(id),
    foreign key(id_status) references status(id)
);

create table food_order(
	id_order int,
    id_food int,
    price float,
    quality int,
    
    
    primary key(id_order,id_food),
    foreign key(id_order) references t_order(id),
    foreign key(id_food) references food(id)
)


