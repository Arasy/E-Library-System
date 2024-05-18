drop table if exists libraries;
create table libraries (
    library_id serial primary key,
    name varchar(255) not null,
    address varchar(255) not null,
    phone_number varchar(100),
    email varchar(100),
    status varchar(20)
);

drop table if exists categories;
create table categories (
    category_id serial primary key,
    name varchar(50) not null,
    description varchar(255)
);


drop table if exists books;
create table books (
    book_id serial primary key,
    title varchar(255) not null,
    author varchar(255) not null,
    category int,
    foreign key (category) references categories(category_id)
);

drop table if exists librarybooks;
create table librarybooks (
    library_id int not null,
    book_id int not null,
    quantity int not null default 0,
    primary key (library_id, book_id),
    foreign key (library_id) references libraries(library_id),
    foreign key (book_id) references books(book_id),
    constraint quantity_nonnegative check (quantity >= 0)
);

drop table if exists users;
create table users (
    user_id serial primary key,
    customer_name varchar(50) not null,
    gender bool,
    date_of_birth date,
    home_address varchar(255),
    zip_code int,
    phone_number varchar(100),
    email varchar(100),
    fav_genres int references categories(category_id),
    register_at int references libraries(library_id)
);

drop table if exists loans;
create table loans (
    loan_id serial primary key,
    user_id int not null,
    book_id int not null,
    library_id int not null,
    loan_date date not null,
    due_date date not null generated always as (loan_date + interval '14 days') stored,
    return_date date,
    foreign key (user_id) references users(user_id),
    foreign key (book_id) references books(book_id),
    foreign key (library_id) references libraries(library_id)
);

drop table if exists holds;
create table holds (
    hold_id serial primary key,
    user_id int not null,
    library_id int not null,
    book_id int not null,
    hold_date date not null,
    queue int,
    foreign key (user_id) references users(user_id),
    foreign key (book_id) references books(book_id),
    foreign key (library_id) references libraries(library_id)
);
