/***********************************************************************************************************************************
Create TEST1 database and connect to it
***********************************************************************************************************************************/
create database test1;
\c test1;

begin;

/***********************************************************************************************************************************
WIDGET Table
***********************************************************************************************************************************/
create table widget
(
    id int not null,
    name text not null,
    constraint widget_pk primary key (id)
);

-- Sample data
insert into widget (id, name) values (1, 'thingamabob');
insert into widget (id, name) values (2, 'whatsawhosit');

/***********************************************************************************************************************************
WIDGET_DETAIL Table
***********************************************************************************************************************************/
create table widget_detail
(
    id int,
    widget_id int not null
        constraint widgetdetail_widgetid_fk references widget (id),
    key text not null,
    value text not null,
    constraint widgetdetail_pk primary key (id),
    constraint widgetdetail_key_id_unq unique (key, id)
);

-- Sample data
insert into widget_detail (id, widget_id, key, value) values (100, 1, 'color', 'yellowish');
insert into widget_detail (id, widget_id, key, value) values (101, 1, 'shape', 'squarish');
insert into widget_detail (id, widget_id, key, value) values (200, 2, 'color', 'redish');
insert into widget_detail (id, widget_id, key, value) values (201, 2, 'shape', 'blobish');

commit;
