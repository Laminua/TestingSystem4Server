create table user_profile
(
    id       bigserial    not null primary key,
    username varchar(30) unique,
    role     varchar,
    name     varchar(100) not null,
    email    varchar(100) unique,
    password varchar      not null
);

insert into user_profile (username, role, name, email, password)
values ('admin', 'ROLE_ADMIN', 'Kirill', 'Kirill@email.com', 'admin'),
       ('user', 'ROLE_USER', 'Vasya', 'vasya@mail.ru', 'user');

create table tests
(
    id               bigserial not null primary key,
    test_description varchar,
    user_id          int       references user_profile (id) on delete set null
);

create table questions
(
    id bigserial not null primary key,
    question varchar,
    question_type varchar,
    test_id int references questions(id) on delete set null,
    answers jsonb
)