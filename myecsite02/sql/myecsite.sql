set names utf8;
set foreign_key_checks = 0;
drop database if exists myecsite;

create database if not exists myecsite;
use myecsite;

create table item_category(
id int primary key not null comment "ID",
category_id int not null unique comment "カテゴリID",
category_name varchar(20) not null unique comment "カテゴリ名",
category_description varchar(100) comment "カテゴリ詳細",
insert_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)
default charset=utf8
comment="カテゴリマスタテーブル"
;
insert into item_category values
(1,1,"全てのカテゴリー","煎茶、抹茶、玉露、その他全てのカテゴリーが対象となります",now(), null),
(2,2,"煎茶","煎茶・深蒸し煎茶に関するカテゴリーが対象となります",now(),null),
(3,3,"抹茶","抹茶に関するカテゴリーが対象となります",now(),null),
(4,4,"玉露","玉露・かぶせ茶に関するカテゴリーが対象となります",now(),null),
(5,5,"その他の茶","玄米茶・ほうじ茶・昆布茶などに関するカテゴリーが対象となります",now(),null);

drop table if exists user_info;
create table user_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint not null default 0 comment "姓別",
email varchar(32) not null comment "メールアドレス",
status tinyint not null default 0 comment "ステータス",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime not null comment "登録日",
update_date datetime not null comment "更新日"
)
default charset=utf8
comment="会員情報テーブル"
;
insert into user_info values
(1,"guest01","guest01","ゲスト用","ゲストユーザー01","げすとよう","げすとゆーざー01",0,"guest01@gmail.com",0,0,now(),now()),
(2,"guest02","guest02","ゲスト用","ゲストユーザー02","げすとよう","げすとゆーざー02",0,"guest02@gmail.com",0,0,now(),now()),
(3,"admin01","admin01","管理用","管理者ユーザー01","かんりよう","かんりしゃゆーざー01",0,"admin01@gmail.com",1,0,now(),now()),
(4,"admin02","admin02","管理用","管理者ユーザー02","かんりよう","かんりしゃゆーざー02",0,"admin02@gmail.com",1,0,now(),now());

drop table if exists item_info;
create table item_info(
id int primary key not null auto_increment comment "ID",
item_id int unique not null comment "商品ID",
item_name varchar(100) unique not null comment "商品名",
item_name_kana varchar(100) not null comment "商品名かな",
item_description varchar(255) not null comment "商品詳細",
category_id int not null not null comment "カテゴリID",
gram int comment "g(グラム)",
price int comment "価格",
image_file_path varchar(100) comment "画像ファイルパス",
image_file_name varchar(50) comment "画像ファイル名",
release_date datetime not null comment "発売年月",
release_company varchar(50) comment "発売会社",
producing_area varchar(50) comment "生産地",
status tinyint not null default 0 comment "ステータス",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日",
foreign key(category_id) references item_category(category_id)
)
default charset=utf8
comment="商品情報テーブル"
;
insert into item_info values
( 1, 1,"煎茶１","せんちゃ１","煎茶１の商品詳細",2,50,400,"./images","sample.jpg","2000/1/1","御茶乃株式会社","静岡県",0,now(),now()),
( 2, 2,"煎茶２","せんちゃ２","煎茶２の商品詳細",2,50,300,"./images","sample.jpg","2000/1/1","御茶乃株式会社","京都府",0,now(),now()),
( 3, 3,"深蒸し煎茶１","ふかむしせんちゃ１","深蒸し煎茶１の商品詳細",2,50,450,"./images","sample.jpg","2000/1/1","御茶乃株式会社","静岡県",0,now(),now()),
( 4, 4,"深蒸し煎茶２","ふかむしせんちゃ２","深蒸し煎茶２の商品詳細",2,50,350,"./images","sample.jpg","2000/1/1","御茶乃株式会社","京都府",0,now(),now()),
( 5, 5,"抹茶１","まっちゃ１","抹茶１の商品詳細",3,50,2000,"./images","sample.jpg","2000/1/1","御茶乃株式会社","静岡県",0,now(),now()),
( 6, 6,"抹茶２","まっちゃ２","抹茶２の商品詳細",3,50,1500,"./images","sample.jpg","2000/1/1","御茶乃株式会社","京都府",0,now(),now()),
( 7, 7,"てん茶１","てんちゃ１","てん茶１の商品詳細",3,50,1000,"./images","sample.jpg","2000/1/1","御茶乃株式会社","静岡県",0,now(),now()),
( 8, 8,"てん茶２","てんちゃ２","てん茶１の商品詳細",3,50,800,"./images","sample.jpg","2000/1/1","御茶乃株式会社","京都府",0,now(),now()),
( 9, 9,"玉露１","ぎょくろ１","玉露１の商品詳細",4,50,1500,"./images","sample.jpg","2000/1/1","御茶乃株式会社","静岡県",0,now(),now()),
( 10, 10,"玉露２","ぎょくろ２","玉露２の商品詳細",4,50,1300,"./images","sample.jpg","2000/1/1","御茶乃株式会社","京都府",0,now(),now()),
( 11, 11,"かぶせ茶１","かぶせちゃ１","かぶせ茶１の商品詳細",4,50,1400,"./images","sample.jpg","2000/1/1","御茶乃株式会社","静岡県",0,now(),now()),
( 12, 12,"かぶせ茶２","かぶせちゃ２","かぶせ茶２の商品詳細",4,50,1200,"./images","sample.jpg","2000/1/1","御茶乃株式会社","京都府",0,now(),now()),
( 13, 13,"ほうじ茶１","ほうじちゃ１","ほうじ茶１の商品詳細",5,50,1000,"./images","sample.jpg","2000/1/1","御茶乃株式会社","石川県",0,now(),now()),
( 14, 14,"ほうじ茶２","ほうじちゃ２","ほうじ茶２の商品詳細",5,50,800,"./images","sample.jpg","2000/1/1","御茶乃株式会社","京都府",0,now(),now()),
( 15, 15,"昆布茶１","こぶちゃ１","昆布茶１の商品詳細",5,50,300,"./images","sample.jpg","2000/1/1","御茶乃株式会社","北海道",0,now(),now()),
( 16, 16,"梅昆布茶１","うめこぶちゃ２","梅昆布茶１の商品詳細",5,50,400,"./images","sample.jpg","2000/1/1","御茶乃株式会社","北海道",0,now(),now()),
( 17, 17,"玄米茶１","げんまいちゃ１","げんまい茶１の商品詳細",5,50,200,"./images","sample.jpg","2000/1/1","御茶乃株式会社","静岡県",0,now(),now()),
( 18, 18,"玄米茶２","げんまいちゃ２","げんまい茶２の商品詳細",5,50,300,"./images","sample.jpg","2000/1/1","御茶乃株式会社","鹿児島県",0,now(),now()),
( 19, 19,"ごぼう茶１","ごぼうちゃ１","ごぼう茶１の商品詳細",5,50,1000,"./images","sample.jpg","2000/1/1","御茶乃株式会社","青森県",0,now(),now()),
( 20, 20,"そば茶１","そばちゃ１","そば茶１の商品詳細",5,50,800,"./images","sample.jpg","2000/1/1","御茶乃株式会社","長野県",0,now(),now());


drop table if exists cart_info;
create table cart_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
temp_user_id varchar(16) comment "仮ユーザーID",
item_id int not null comment "商品ID",
item_count int not null comment "個数",
price int not null comment "金額",
regist_date datetime not null comment "登録日",
update_date datetime comment "更新日"
)
default charset=utf8
comment="カート情報テーブル"
;

create table purchase_history_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
item_id int not null comment "商品ID",
item_count int not null comment "個数",
price int not null comment "金額",
destination_id int not null comment "宛先情報ID",
regist_date datetime not null comment "登録日",
update_date datetime not null comment "更新日",
foreign key(user_id) references user_info(user_id),
foreign key(item_id) references item_info(item_id)
)
default charset=utf8
comment="購入履歴情報テーブル"
;

create table destination_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
email varchar(32) not null comment "メールアドレス",
tel_number varchar(13) not null comment "電話番号",
user_address varchar(50) not null comment "住所",
regist_date datetime not null comment "登録日",
update_date datetime not null comment "更新日"
)
default charset=utf8
comment="宛先情報テーブル"
;
insert into destination_info values
(1,"guest","テスト用","テストユーザー","てすとよう","てすとゆーざー","guest@gmail.co.jp","080-1234-5678","東京都千代田区三番町１ー１　ＫＹ三番町ビル１Ｆ",now(),"0000-00-00 00:00:00");
