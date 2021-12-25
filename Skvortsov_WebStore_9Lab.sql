--Delete table and data
--  DROP TABLE Skvortsov_Ordered_Product;
--  DROP TABLE Skvortsov_Product;
--  DROP TABLE Skvortsov_Order;
--  DROP TABLE Skvortsov_Client;
--  DROP TABLE Skvortsov_Product_Type;
--  DROP TABLE Skvortsov_Order_Status;
--  DROP TABLE Skvortsov_Payment_Type;


DROP TABLE Skvortsov_Ordered_Product;
DROP TABLE Skvortsov_Product;
DROP TABLE Skvortsov_Order;
DROP TABLE Skvortsov_Client;
DROP TABLE Skvortsov_Product_Type;

DROP SEQUENCE Skvortsov_Order_Uid_Seq;
DROP SEQUENCE Skvortsov_Product_Uid_Seq;

-- DROP TRIGGER Skvortsov_Tr_OrderUid;
-- DROP TRIGGER Skvortsov_Tr_ProductUid;
-- DROP TRIGGER Skvortsov_Tr_Insert_Client;
-- DROP TRIGGER Skvortsov_Tr_Insert_Product;
-- DROP TRIGGER Skvortsov_Tr_Insert_Order;
-- DROP TRIGGER Skvortsov_Tr_Drop_Empty_Order;
-- DROP TRIGGER Skvortsov_Tr_Prod_To_Stock;
-- DROP TRIGGER Skvortsov_Tr_Insert_Ord_Prod;
-- DROP TRIGGER Skvortsov_Tr_Delete_Ord_Prod;
-- DROP TRIGGER Skvortsov_Tr_Give_Discount;

--------------------------------------------------------
--  DDL for Table Skvortsov_Client
--------------------------------------------------------
CREATE TABLE Skvortsov_Client (
    login VARCHAR2(25 BYTE),
    name VARCHAR2(50 BYTE),
    sex VARCHAR2(2 BYTE),
    birthday DATE,
    address VARCHAR2(200),
    phone VARCHAR2(16 BYTE)
);

--------------------------------------------------------
--  DDL for Table Skvortsov_Order
--------------------------------------------------------
CREATE TABLE Skvortsov_Order (
    order_uid NUMBER,
    created_date DATE,
    complited_date DATE,
    client_uid VARCHAR2(20),
    payment VARCHAR2(25),
    delivery_price NUMBER(6,2),
    discount NUMBER(3),
    status VARCHAR2(100) DEFAULT 'Подготовка'
);

--------------------------------------------------------
--  DDL for Table Skvortsov_Product
--------------------------------------------------------
CREATE TABLE Skvortsov_Product (
    product_uid NUMBER,
    name VARCHAR2(100),
    weight NUMBER(9,3),
    height NUMBER(6,2),
    width NUMBER(6,2),
    length NUMBER(6,2),
    price NUMBER(9,2),
    product_type VARCHAR2(100 BYTE),
    stock NUMBER(5)
);

--------------------------------------------------------
--  DDL for Table Skvortsov_Product_Type
--------------------------------------------------------
CREATE TABLE Skvortsov_Product_Type (
    product_type VARCHAR2(100),
    name VARCHAR2(100)
);


--------------------------------------------------------
--  DDL for Table Skvortsov_Ordered_Product
--------------------------------------------------------
CREATE TABLE Skvortsov_Ordered_Product (
    order_uid NUMBER,
    product_uid NUMBER,
    product_price NUMBER(9,2),
    quantity NUMBER(5)
);

CREATE SEQUENCE Skvortsov_Order_Uid_Seq
    START WITH 1 INCREMENT BY 1
    NOCACHE NOCYCLE;

CREATE SEQUENCE Skvortsov_Product_Uid_Seq
    START WITH 1 INCREMENT BY 1
    NOCACHE NOCYCLE;

/
CREATE OR REPLACE TRIGGER Skvortsov_Tr_ProductUid
  BEFORE INSERT ON Skvortsov_Product
  FOR EACH ROW
BEGIN
  SELECT Skvortsov_Product_Uid_Seq.nextval
    INTO :new.product_uid
    FROM dual;
END;
/
CREATE OR REPLACE TRIGGER Skvortsov_Tr_OrderUid
  BEFORE INSERT ON Skvortsov_Order
  FOR EACH ROW
BEGIN
  SELECT Skvortsov_Order_Uid_Seq.nextval
    INTO :new.order_uid
    FROM dual;
END;
/

--------------------------------------------------------
--  Create Data
-------------------------------------------------------- 
-- Inserting into Skvortsov_Client
SET DEFINE OFF
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('klavdiya26021987','Селидова Клавдия','Ж',TO_DATE('26.02.1987','DD.MM.YYYY'),'Россия, г. Электросталь, Молодежный пер., д. 18 кв.145','+7(964)258-80-98');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('afanasiy7796','Пищиков Афанасий','М',TO_DATE('22.11.1989','DD.MM.YYYY'),'Россия, г. Орехово-Зуево, Светлая ул., д. 1 кв.60','+7(974)698-39-88');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('georgiy13011970','Мальцев Георгий','М',TO_DATE('13.1.1970','DD.MM.YYYY'),'Россия, г. Железногорск, Колхозный пер., д. 17кв.80','+7(997)823-32-40');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('marianna1964','Серых Марианна','Ж',TO_DATE('26.08.1964','DD.MM.YYYY'),'Россия, г. Подольск, Мичурина ул., д. 5 кв.159','+7(922)980-18-97');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('georgiy.bebnev','Бебнев Георгий','М',TO_DATE('24.01.1970','DD.MM.YYYY'),'Россия, г. Пушкино, Озерная ул., д. 10 кв.31','+7(920)873-85-43');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('yakov.eskin','Еськин Яков','М',TO_DATE('01.08.1969','DD.MM.YYYY'),'Россия, г. Абакан, 3 Марта ул., д. 14 кв.199','+7(912)702-47-63');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('afanasiy02091966','Котяш Афанасий','М',TO_DATE('02.09.1966','DD.MM.YYYY'),'Россия, г. Батайск, Западная ул., д. 5 кв.78','+7(913)165-24-84');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('evgeniy.zabirov','Забиров Евгений','М',TO_DATE('01.07.1971','DD.MM.YYYY'),'Россия, г. Пятигорск, Солнечная ул., д. 19 кв.9','+7(948)162-32-69');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('arkadiy06081995','Кутиков Аркадий','М',TO_DATE('06.08.1995','DD.MM.YYYY'),'Россия, г. Петрозаводск, Лесная ул., д. 16 кв.185','+7(941)340-97-49');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('konstantin11061978','Яснов Константин','М',TO_DATE('11.06.1978','DD.MM.YYYY'),'Россия, г. Шахты, Белорусская ул., д. 14 кв.121','+7(905)371-19-85');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('mihail1995','Ярцев Михаил','М',TO_DATE('09.05.1995','DD.MM.YYYY'),'Россия, г. Калуга, 17Сентября ул., д. 2 кв.134','+7(952)110-29-52');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('valeriy.kutuzov','Кутузов Валерий','М',TO_DATE('22.08.1982','DD.MM.YYYY'),'Россия, г. Майкоп, Садовая ул., д. 3 кв.70','+7(980)593-14-94');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('yakov65','Новожилов Яков','М',TO_DATE('06.05.1973','DD.MM.YYYY'),'Россия, г. Новороссийск, Луговой пер., д. 21 кв.52','+7(917)575-79-56');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('yaroslava.aleksandrina','Александрина Ярослава','Ж',TO_DATE('02.09.1993','DD.MM.YYYY'),'Россия, г. Люберцы, Советская ул., д. 5 кв.154','+7(909)560-59-87');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('nikita28091995','Сурнин Никита','М',TO_DATE('28.09.1995','DD.MM.YYYY'),'Россия, г. Елец, Молодежная ул., д. 3 кв.178','+7(935)921-52-35');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('zoya12051971','Сияносова Зоя','Ж',TO_DATE('12.05.1971','DD.MM.YYYY'),'Россия, г. Петропавловск-Камчатский, Советская ул., д. 20 кв.70','+7(914)385-73-74');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('makar.ulev','Шулёв Макар','М',TO_DATE('15.02.1973','DD.MM.YYYY'),'Россия, г. Южно-Сахалинск, 3 Марта ул., д. 16 кв.180','+7(958)454-66-55');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('irina.veselkova','Веселкова Ирина','Ж',TO_DATE('24.11.1992','DD.MM.YYYY'),'Россия, г. Долгопрудный, Белорусская ул., д. 2 кв.130','+7(972)908-72-25');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('syuzanna.cuckova','Цуцкова Сюзанна','Ж',TO_DATE('09.07.1967','DD.MM.YYYY'),'Россия, г. Сочи, Зеленый пер., д. 9 кв.27','+7(942)937-11-61');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('fedor07101975','Лисов Федор','М',TO_DATE('07.10.1975','DD.MM.YYYY'),'Россия, г. Ульяновск, Озерный пер., д. 16 кв.111','+7(947)991-69-85');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('makar1988','Ишутин Макар','М',TO_DATE('02.06.1988','DD.MM.YYYY'),'Россия, г. Иркутск, Гагарина ул., д. 16 кв.135','+7(955)899-34-16');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('apollinariya19031964','Дуболадова Аполлинария','Ж',TO_DATE('19.03.1964','DD.MM.YYYY'),'Россия, г. Тольятти, Луговая ул., д. 16 кв.47','+7(933)541-58-10');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('nika03021978','Ильина Ника','Ж',TO_DATE('03.02.1978','DD.MM.YYYY'),'Россия, г. Невинномысск, Севернаяул., д. 20 кв.62','+7(922)508-13-56');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('egor1993','Щекочихин Егор','М',TO_DATE('06.07.1993','DD.MM.YYYY'),'Россия, г. Псков, Железнодорожная ул., д. 9 кв.43','+7(964)508-95-99');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('tamara5132','Машлыкина Тамара','Ж',TO_DATE('15.07.1979','DD.MM.YYYY'),'Россия, г. Ярославль, Трудовая ул., д. 22 кв.98','+7(982)758-71-77');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('yakov.edemskiy','Едемский Яков','М',TO_DATE('16.02.1986','DD.MM.YYYY'),'Россия, г. Магнитогорск, Ленина В.И.ул., д. 14 кв.89','+7(934)814-27-84');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('semen87','Вицин Семен','М',TO_DATE('26.01.1972','DD.MM.YYYY'),'Россия, г. Чебоксары, Октябрьская ул., д. 2 кв.168','+7(963)440-80-75');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('viktoriya66','Турчанинова Виктория','Ж',TO_DATE('11.07.1974','DD.MM.YYYY'),'Россия, г. Нижневартовск, Восточная ул., д. 16 кв.92','+7(976)879-57-93');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('lyubov80','Юсупова Любовь','Ж',TO_DATE('07.09.1995','DD.MM.YYYY'),'Россия, г. Новый Уренгой, ЯнкиКупалы ул., д. 22 кв.158','+7(939)153-35-83');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('arkadiy19111968','Андронов Аркадий','М',TO_DATE('19.11.1968','DD.MM.YYYY'),'Россия, г. Уфа, Красноармейская ул., д. 22 кв.144','+7(964)187-57-54');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('trofim1965','Шуличенко Трофим','М',TO_DATE('05.11.1965','DD.MM.YYYY'),'Россия, г. Керчь, Солнечная ул., д. 6 кв.79','+7(937)820-38-84');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('taisiya05101973','Пьяныха Таисия','Ж',TO_DATE('05.10.1973','DD.MM.YYYY'),'Россия, г. Артем, Набережная ул., д. 17кв.36','+7(923)777-33-57');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('inna30','Язвецова Инна','Ж',TO_DATE('19.05.1996','DD.MM.YYYY'),'Россия, г. Волгодонск, Коммунистическая ул., д. 9 кв.30','+7(961)557-87-71');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('viktor1987','Грузов Виктор','М',TO_DATE('02.03.1987','DD.MM.YYYY'),'Россия, г. Ковров, Октябрьская ул., д. 20 кв.176','+7(921)954-52-93');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('venedikt15091992','Рождественский Венедикт','М',TO_DATE('15.09.1992','DD.MM.YYYY'),'Россия, г. Димитровград, Заречный пер., д. 1 кв.127','+7(961)782-97-25');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('varvara1968','Ковалевская Варвара','Ж',TO_DATE('20.08.1968','DD.MM.YYYY'),'Россия, г. Майкоп, Песчаная ул., д. 24 кв.150','+7(942)988-16-19');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('klara1996','Моргунова Клара','Ж',TO_DATE('06.01.1996','DD.MM.YYYY'),'Россия, г. Оренбург, Центральная ул., д. 4 кв.32','+7(932)420-51-60');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('rimma14081962','Пыхтина Римма','Ж',TO_DATE('14.08.1962','DD.MM.YYYY'),'Россия, г. Грозный, Центральный пер., д. 19 кв.189','+7(965)506-44-86');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('polina11021996','Бакрылова Полина','Ж',TO_DATE('11.02.1996','DD.MM.YYYY'),'Россия, г. Реутов, Полевой пер., д. 24 кв.204','+7(944)623-81-92');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('yakov.kotik','Котик Яков','М',TO_DATE('23.04.1991','DD.MM.YYYY'),'Россия, г. Якутск, Колхозный пер., д. 8 кв.171','+7(997)249-69-25');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('zahar.kuksilin','Куксилин Захар','М',TO_DATE('10.09.1961','DD.MM.YYYY'),'Россия, г. Ангарск, Интернациональная ул., д. 10 кв.108','+7(987)455-44-21');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('aleksandra1971','Дьяконова Александра','Ж',TO_DATE('08.12.1971','DD.MM.YYYY'),'Россия, г. Уфа, Садовый пер., д. 18 кв.87','+7(950)441-39-57');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('efim3420','Шулепин Ефим','М',TO_DATE('14.04.1995','DD.MM.YYYY'),'Россия, г. Химки, Западная ул., д. 16 кв.174','+7(947)955-97-10');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('anton15031984','Чижов Антон','М',TO_DATE('15.03.1984','DD.MM.YYYY'),'Россия, г. Мурманск, Дружная ул., д. 7кв.29','+7(998)291-41-95');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('albina76','Гущина Альбина','Ж',TO_DATE('15.12.1964','DD.MM.YYYY'),'Россия, г. Армавир, Трудовая ул., д. 21 кв.86','+7(985)618-67-91');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('alina8583','Апраксина Алина','Ж',TO_DATE('26.09.1987','DD.MM.YYYY'),'Россия, г. Владикавказ, Кирова ул., д. 4 кв.102','+7(936)960-19-80');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('zoya26111975','Ярема Зоя','Ж',TO_DATE('26.11.1975','DD.MM.YYYY'),'Россия, г. Сергиев Посад, Пушкина ул., д. 12 кв.100','+7(999)706-44-25');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('larisa83','Норина Лариса','Ж',TO_DATE('27.08.1985','DD.MM.YYYY'),'Россия, г. Курск, Полевой пер., д. 21 кв.177','+7(979)596-23-28');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('valeriya3176','Андропова Валерия','Ж',TO_DATE('28.03.1962','DD.MM.YYYY'),'Россия, г. Таганрог, Приозерная ул., д. 5 кв.12','+7(953)588-71-71');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('vasiliy11','Килин Василий','М',TO_DATE('01.02.1973','DD.MM.YYYY'),'Россия, г. Саратов, Первомайская ул., д. 17кв.115','+7(969)597-69-21');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('galina96','Ямбаева Галина','Ж',TO_DATE('01.01.1984','DD.MM.YYYY'),'Россия, г. Липецк, Колхозный пер., д. 4 кв.25','+7(970)626-55-25');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('egor.esaulov','Эсаулов Егор','М',TO_DATE('08.03.1967','DD.MM.YYYY'),'Россия, г. Невинномысск, Октябрьский пер., д. 1 кв.112','+7(965)195-80-68');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('alla1994','Малюгина Алла','Ж',TO_DATE('22.07.1994','DD.MM.YYYY'),'Россия, г. Бердск, Мирная ул., д. 24 кв.157','+7(911)567-20-39');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('petr6941','Дудченко Петр','М',TO_DATE('02.04.1974','DD.MM.YYYY'),'Россия, г. Альметьевск, Чкалова ул., д. 8 кв.50','+7(976)314-29-45');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('nikolay7233','Ярлыков Николай','М',TO_DATE('27.03.1994','DD.MM.YYYY'),'Россия, г. Казань, Белорусская ул., д. 9 кв.153','+7(928)611-20-83');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('lana.blokova','Блокова Лана','Ж',TO_DATE('20.07.1976','DD.MM.YYYY'),'Россия, г. Самара, Луговая ул., д. 20 кв.64','+7(998)225-10-31');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('yakov.chendev','Чендев Яков','М',TO_DATE('07.07.1990','DD.MM.YYYY'),'Россия, г. Элиста, Приозерная ул., д. 21 кв.63','+7(919)255-84-86');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('klara36','Рюмова Клара','Ж',TO_DATE('08.05.1987','DD.MM.YYYY'),'Россия, г. Иваново, Приозерная ул., д. 12 кв.131','+7(926)842-93-69');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('arseniy1984','Жванец Арсений','М',TO_DATE('19.12.1984','DD.MM.YYYY'),'Россия, г. Нижний Новгород, Песчаная ул., д. 24 кв.170','+7(924)745-46-36');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('anna1978','Фонвизина Анна','Ж',TO_DATE('05.05.1978','DD.MM.YYYY'),'Россия, г. Жуковский, Шоссейная ул., д. 17кв.134','+7(909)418-18-55');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('marfa.mamina','Мамина Марфа','Ж',TO_DATE('02.12.1983','DD.MM.YYYY'),'Россия, г. Комсомольск-на-Амуре, Радужная ул., д. 8 кв.154','+7(932)900-76-76');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('ulyana9844','Яницкая Ульяна','Ж',TO_DATE('06.06.1980','DD.MM.YYYY'),'Россия, г. Пятигорск, Речной пер., д. 11 кв.84','+7(944)120-59-22');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('antonina1976','Половцева Антонина','Ж',TO_DATE('17.04.1976','DD.MM.YYYY'),'Россия, г. Тамбов, Центральная ул., д. 3 кв.125','+7(971)399-85-70');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('german3591','Аникеев Герман','М',TO_DATE('10.02.1993','DD.MM.YYYY'),'Россия, г. Прокопьевск, Новая ул., д. 9 кв.1','+7(906)548-28-18');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('adam.erbakov','Щербаков Адам','М',TO_DATE('28.01.1973','DD.MM.YYYY'),'Россия, г. Златоуст, Молодежная ул., д. 7кв.86','+7(950)171-39-56');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('maksim3779','Углов Максим','М',TO_DATE('04.08.1972','DD.MM.YYYY'),'Россия, г. Волжский, Березовая ул., д. 19 кв.171','+7(939)655-85-10');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('tatyana6418','Кубланова Татьяна','Ж',TO_DATE('01.08.1983','DD.MM.YYYY'),'Россия, г. Волгоград, Сельская ул., д. 15 кв.110','+7(942)689-10-32');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('mihail1860','Коржаков Михаил','М',TO_DATE('07.06.1971','DD.MM.YYYY'),'Россия, г. Калуга, Чкалова ул., д. 21 кв.126','+7(929)516-59-91');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('rostislav60','Никитаев Ростислав','М',TO_DATE('01.04.1994','DD.MM.YYYY'),'Россия, г. Вологда, Зеленая ул., д. 16 кв.18','+7(988)291-69-76');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('vitaliy13','Яскунов Виталий','М',TO_DATE('12.07.1985','DD.MM.YYYY'),'Россия, г. Сергиев Посад, Строителей ул., д. 25 кв.80','+7(972)998-56-79');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('maksim20101967','Рябинин Максим','М',TO_DATE('20.10.1967','DD.MM.YYYY'),'Россия, г. Красногорск, Севернаяул., д. 7кв.59','+7(938)690-26-73');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('filipp.emelin','Емелин Филипп','М',TO_DATE('01.04.1964','DD.MM.YYYY'),'Россия, г. Кострома, Садовый пер., д. 16 кв.131','+7(927)579-31-74');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('ilya.venediktov','Венедиктов Илья','М',TO_DATE('04.04.1972','DD.MM.YYYY'),'Россия, г. Ноябрьск, Чкалова ул., д. 4 кв.136','+7(993)112-53-18');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('pelageya22051984','Косарева Пелагея','Ж',TO_DATE('22.05.1984','DD.MM.YYYY'),'Россия, г. Новомосковск, Дорожная ул., д. 9 кв.66','+7(984)142-50-71');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('eva.nemova','Немова Ева','Ж',TO_DATE('22.05.1999','DD.MM.YYYY'),'Россия, г. Екатеринбург, Солнечный пер., д. 23 кв.118','+7(956)999-80-32');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('nadejda.haritonova','Харитонова Надежда','Ж',TO_DATE('13.04.1966','DD.MM.YYYY'),'Россия, г. Электросталь, Песчаная ул., д. 16 кв.197','+7(934)164-21-97');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('albina19061971','Янишевская Альбина','Ж',TO_DATE('19.06.1971','DD.MM.YYYY'),'Россия, г. Чита, Лесная ул., д. 5 кв.56','+7(920)142-47-74');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('sevastyan.ryazancev','Рязанцев Севастьян','М',TO_DATE('23.12.1972','DD.MM.YYYY'),'Россия, г. Иркутск, Трудовая ул., д. 19 кв.24','+7(977)887-92-63');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('trofim1966','Ясевич Трофим','М',TO_DATE('13.10.1966','DD.MM.YYYY'),'Россия, г. Магнитогорск, Восточная ул., д. 16 кв.109','+7(948)720-87-76');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('elena.klyueva','Клюева Елена','Ж',TO_DATE('20.12.1963','DD.MM.YYYY'),'Россия, г. Майкоп, Колхозная ул., д. 24 кв.206','+7(976)746-41-94');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('grigoriy7355','Лебединский Григорий','М',TO_DATE('03.04.1965','DD.MM.YYYY'),'Россия, г. Пенза, 3 Марта ул., д. 6 кв.16','+7(964)893-16-34');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('larisa2303','Ковальчук Лариса','Ж',TO_DATE('26.07.1990','DD.MM.YYYY'),'Россия, г. Новомосковск, Сельская ул., д. 19 кв.11','+7(992)661-44-26');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('leontiy14121974','Аристархов Леонтий','М',TO_DATE('14.12.1974','DD.MM.YYYY'),'Россия, г. Нефтеюганск, Садовый пер., д. 17кв.91','+7(906)918-91-83');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('apollinariya06031975','Свечникова Аполлинария','Ж',TO_DATE('06.03.1975','DD.MM.YYYY'),'Россия, г. Элиста, Октябрьский пер., д. 1 кв.201','+7(944)774-29-26');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('tatyana6087','Хабибуллина Татьяна','Ж',TO_DATE('24.06.1974','DD.MM.YYYY'),'Россия, г. Бердск, Мирная ул., д. 1 кв.71','+7(937)605-44-11');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('arkadiy43','Толкачев Аркадий','М',TO_DATE('06.10.1981','DD.MM.YYYY'),'Россия, г. Сочи, Цветочная ул., д. 3 кв.83','+7(970)363-80-47');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('oksana.drokova','Дрокова Оксана','Ж',TO_DATE('12.09.1988','DD.MM.YYYY'),'Россия, г. Батайск, Советский пер., д. 8 кв.67','+7(919)207-17-92');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('anna17111973','Грязнова Анна','Ж',TO_DATE('17.11.1973','DD.MM.YYYY'),'Россия, г. Курск, Парковая ул., д. 25 кв.140','+7(985)782-77-31');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('valentina.kurnevicha','Курневича Валентина','Ж',TO_DATE('23.02.1962','DD.MM.YYYY'),'Россия, г. Благовещенск, Совхозная ул., д. 25 кв.114','+7(988)262-43-50');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('yaroslava53','Яйцева Ярослава','Ж',TO_DATE('18.10.1983','DD.MM.YYYY'),'Россия, г. Новочебоксарск, Сосновая ул., д. 23 кв.86','+7(913)994-33-47');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('mila.ubeysobakina','Убейсобакина Мила','Ж',TO_DATE('11.09.1983','DD.MM.YYYY'),'Россия, г. Элиста, Трудовая ул., д. 9 кв.20','+7(960)811-75-17');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('petr1962','Подшивалов Петр','М',TO_DATE('13.05.1962','DD.MM.YYYY'),'Россия, г. Рязань, Дзержинского ул., д. 13 кв.132','+7(969)453-78-90');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('arina48','Бебнева Арина','Ж',TO_DATE('12.11.1987','DD.MM.YYYY'),'Россия, г. Пенза, Сельская ул., д. 23 кв.33','+7(925)554-99-53');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('milana1962','Якуничева Милана','Ж',TO_DATE('23.04.1962','DD.MM.YYYY'),'Россия, г. Владимир, Советский пер., д. 7кв.119','+7(981)992-15-77');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('grigoriy98','Хвостовский Григорий','М',TO_DATE('18.10.1983','DD.MM.YYYY'),'Россия, г. Пермь, Трудовая ул., д. 6 кв.102','+7(958)629-36-83');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('lidiya.skotareva','Скотарева Лидия','Ж',TO_DATE('21.04.1996','DD.MM.YYYY'),'Россия, г. Орск, Хуторская ул., д. 13 кв.144','+7(990)308-90-88');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('leonid01031992','Овсянников Леонид','М',TO_DATE('01.03.1992','DD.MM.YYYY'),'Россия, г. Мурманск, Совхозная ул., д. 21 кв.63','+7(920)495-90-89');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('albina07041977','Карева Альбина','Ж',TO_DATE('07.04.1977','DD.MM.YYYY'),'Россия, г. Муром, Спортивная ул., д. 25 кв.210','+7(968)610-10-16');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('zoya23','Балдагуева Зоя','Ж',TO_DATE('06.07.1967','DD.MM.YYYY'),'Россия, г. Хасавюрт, Набережная ул., д. 3 кв.157','+7(951)821-29-55');
INSERT INTO Skvortsov_Client (login,name,sex,birthday,address,phone) VALUES ('arina10121978','Зуба Арина','Ж',TO_DATE('10.12.1978','DD.MM.YYYY'),'Россия, г. Королёв, Светлая ул., д. 13 кв.27','+7(912)604-45-82');
-- Inserting into Skvortsov_Product_Type
SET DEFINE OFF
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('Electronics','Электроника');
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('Cloth','Одежда');
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('Shoes','Обувь');
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('House','Дом');
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('Pets','Товары для животных');

-- Inserting into Skvortsov_Product
SET DEFINE OFF
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Смартфон',0.2,NULL,NULL,NULL,20000,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Наушники',0.02,NULL,NULL,NULL,5000,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Компьютер',3,NULL,NULL,NULL,70000,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Ноутбук',1,NULL,NULL,NULL,100000,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Холодильник',20.5,NULL,NULL,NULL,42990,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Фитнес-браслет',0.05,NULL,NULL,NULL,3990,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Умная-колонка',0.2,NULL,NULL,NULL,5990,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Телевизор',3,NULL,NULL,NULL,126990,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Монитор',1.5,NULL,NULL,NULL,29990,'Electronics',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Куртка',1,NULL,NULL,NULL,5690,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Пальто',1,NULL,NULL,NULL,14590,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Блузка',0.1,NULL,NULL,NULL,2990,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Платье',0.1,NULL,NULL,NULL,5790,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Рубашка',0.1,NULL,NULL,NULL,1389,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Штаны',0.5,NULL,NULL,NULL,2000,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Юбка',0.1,NULL,NULL,NULL,1900,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Шорты',0.1,NULL,NULL,NULL,590,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Футболка',0.1,NULL,NULL,NULL,600,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Носки',0.1,NULL,NULL,NULL,99,'Cloth',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Туфли',0.5,NULL,NULL,NULL,3400,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Ботинки',0.5,NULL,NULL,NULL,3500,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Кросовки',0.5,NULL,NULL,NULL,3000,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Кеды',0.5,NULL,NULL,NULL,2678,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Сапоги',0.5,NULL,NULL,NULL,4000,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Балетки',0.5,NULL,NULL,NULL,2000,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Босоножки',0.5,NULL,NULL,NULL,2000,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Сандали',0.5,NULL,NULL,NULL,1000,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Тапки',0.5,NULL,NULL,NULL,250,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Валенки',0.5,NULL,NULL,NULL,1000,'Shoes',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Тарелка',0.2,NULL,NULL,NULL,199,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Кружка',0.1,NULL,NULL,NULL,99,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Рюмка',0.1,NULL,NULL,NULL,29,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Чайник',0.5,NULL,NULL,NULL,990,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Френчпресс',0.3,NULL,NULL,NULL,690,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Нож',0.1,NULL,NULL,NULL,299,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Ваза',0.5,NULL,NULL,NULL,599,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Зеркало',1,NULL,NULL,NULL,1290,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Подушка',0.5,NULL,NULL,NULL,990,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Корзина',0.5,NULL,NULL,NULL,990,'House',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Корм для собак',5,NULL,NULL,NULL,890,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Корм для кошек',5,NULL,NULL,NULL,890,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Корм для рыб',0.02,NULL,NULL,NULL,190,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Корм для птиц',1,NULL,NULL,NULL,390,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Игрушка1',0.2,NULL,NULL,NULL,200,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Игрушка2',0.3,NULL,NULL,NULL,250,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Наполнитель',5,NULL,NULL,NULL,690,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Лежанка1',1,NULL,NULL,NULL,1590,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Лежанка2',1,NULL,NULL,NULL,2590,'Pets',100);
INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock) VALUES ('Поводок',0.5,NULL,NULL,NULL,590,'Pets',100);

--------------------------------------------------------
--  Constraints for Table Skvortsov_Client
-------------------------------------------------------- 
ALTER TABLE Skvortsov_Client ADD CONSTRAINT Check_Client_sex CHECK(sex IN('М', 'Ж')) ENABLE;

ALTER TABLE Skvortsov_Client ADD CONSTRAINT PK_Client PRIMARY KEY (login) ENABLE;

ALTER TABLE Skvortsov_Client MODIFY (login NOT NULL ENABLE);
ALTER TABLE Skvortsov_Client MODIFY (name NOT NULL ENABLE);
ALTER TABLE Skvortsov_Client MODIFY (birthday NOT NULL ENABLE);
ALTER TABLE Skvortsov_Client MODIFY (address NOT NULL ENABLE);
ALTER TABLE Skvortsov_Client MODIFY (phone NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table Skvortsov_Order
-------------------------------------------------------- 
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_complited_date CHECK(complited_date >= created_date);
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_payment  CHECK(payment IN ('Предоплата', 'При получении'));
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_delivery_price CHECK(delivery_price < 1000.00 AND delivery_price >= 0);
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_discount CHECK (discount <= 100 AND discount >=0);
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_status CHECK(status IN ('Подготовка', 'создан', 'Оплачен', 'Комплектация', 'Отправлен', 'Получен', 'Отменён'));

ALTER TABLE Skvortsov_Order ADD CONSTRAINT PK_Order PRIMARY KEY (order_uid) ENABLE;

ALTER TABLE Skvortsov_Order ADD CONSTRAINT FK_Order_Client FOREIGN KEY (client_uid)
	REFERENCES Skvortsov_Client (login) ON DELETE CASCADE ENABLE;

ALTER TABLE Skvortsov_Order MODIFY (order_uid NOT NULL ENABLE);
ALTER TABLE Skvortsov_Order MODIFY (client_uid NOT NULL ENABLE);
ALTER TABLE Skvortsov_Order MODIFY (payment NOT NULL DISABLE);
ALTER TABLE Skvortsov_Order MODIFY (delivery_price NOT NULL DISABLE);
ALTER TABLE Skvortsov_Order MODIFY (status NOT NULL ENABLE);

--------------------------------------------------------
--  DDL for Table Skvortsov_Product_Type
--------------------------------------------------------
ALTER TABLE Skvortsov_Product_Type ADD CONSTRAINT PK_Product_Type PRIMARY KEY (product_type) ENABLE;

ALTER TABLE Skvortsov_Product_Type MODIFY (product_type NOT NULL ENABLE);
ALTER TABLE Skvortsov_Product_Type MODIFY (name NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table Skvortsov_Product
-------------------------------------------------------- 
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_weight CHECK(weight <= 100000.000 AND weight > 0);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_height CHECK(height <= 1000.0 AND height > 0);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_width CHECK(width <= 1000.0 AND width > 0);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_length CHECK(length <= 1000.0 AND length > 0);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_price CHECK(price > 0 AND price < 1000000.00);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_stock CHECK(stock <= 10000 AND stock >= 0);

ALTER TABLE Skvortsov_Product ADD CONSTRAINT PK_Product PRIMARY KEY (product_uid) ENABLE;

ALTER TABLE Skvortsov_Product ADD CONSTRAINT FK_Product_Peoduct_Type FOREIGN KEY (product_type)
	REFERENCES Skvortsov_Product_Type (product_type) ON DELETE SET NULL ENABLE;

ALTER TABLE Skvortsov_Product MODIFY (product_uid NOT NULL ENABLE);
ALTER TABLE Skvortsov_Product MODIFY (name NOT NULL ENABLE);
ALTER TABLE Skvortsov_Product MODIFY (weight NOT NULL ENABLE);
ALTER TABLE Skvortsov_Product MODIFY (price NOT NULL ENABLE);
ALTER TABLE Skvortsov_Product MODIFY (product_type NOT NULL ENABLE);
ALTER TABLE Skvortsov_Product MODIFY (stock NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table Skvortsov_Ordered_Product
--------------------------------------------------------
ALTER TABLE Skvortsov_Ordered_Product ADD CONSTRAINT Check_Ord_Prod_Product_Price CHECK(product_price > 0 AND product_price < 1000000.00);
ALTER TABLE Skvortsov_Ordered_Product ADD CONSTRAINT Check_Ord_Prod_Quantity CHECK(quantity >= 0 AND quantity <= 10000);

ALTER TABLE Skvortsov_Ordered_Product ADD CONSTRAINT PK_Ord_Prod PRIMARY KEY (order_uid, product_uid) ENABLE;

ALTER TABLE Skvortsov_Ordered_Product ADD CONSTRAINT FK_Ord_Prod_Product FOREIGN KEY (product_uid)
	REFERENCES Skvortsov_Product (product_uid) ON DELETE CASCADE ENABLE;
ALTER TABLE Skvortsov_Ordered_Product ADD CONSTRAINT FK_Ord_Prod_Order FOREIGN KEY (order_uid)
	REFERENCES Skvortsov_Order (order_uid) ON DELETE CASCADE ENABLE;

ALTER TABLE Skvortsov_Ordered_Product MODIFY (product_uid NOT NULL ENABLE);
ALTER TABLE Skvortsov_Ordered_Product MODIFY (order_uid NOT NULL ENABLE);
ALTER TABLE Skvortsov_Ordered_Product MODIFY (product_price NOT NULL ENABLE);
ALTER TABLE Skvortsov_Ordered_Product MODIFY (quantity NOT NULL ENABLE);




set serveroutput on

set serveroutput on

create or replace PACKAGE Skvortsov_Store_Package AS
    E_WRONG_AGE EXCEPTION;
    E_NO_CLIENT EXCEPTION;
    E_CLIENT_IS_EXIST EXCEPTION;
    E_WRONG_PRODUCT_TYPE_CODE EXCEPTION;
    E_NO_EMPTY_ORDERS EXCEPTION;
    E_PRODUCT_NOT_EXIST EXCEPTION;
    E_INVALID_QUANTITY_OF_PRODUCTS EXCEPTION;
    E_INVALID_DISCOUNT_FOR_ORDER EXCEPTION;
    E_ORDER_NOT_EXIST EXCEPTION;
    E_WRONG_ORDER_STATUS EXCEPTION;
    E_NO_PREPARE_ORDERS EXCEPTION;
    E_ORDER_IS_CANCELED EXCEPTION;
    E_ORDER_IS_RECEIVED EXCEPTION;

    PROCEDURE Add_Client (login VARCHAR2,name VARCHAR2,sex VARCHAR2,birthday VARCHAR2,address VARCHAR2,phone VARCHAR2);

    PROCEDURE Add_Product (name VARCHAR2,weight NUMBER,height NUMBER,width NUMBER,length NUMBER,price NUMBER,product_type VARCHAR2,stock NUMBER);

    PROCEDURE Create_Order (client_login VARCHAR2, payment_type VARCHAR2);

    PROCEDURE Add_Product_In_Order(order_uid NUMBER, product_uid NUMBER, quantity NUMBER);

    PROCEDURE Order_Move(c_order_uid NUMBER);

    PROCEDURE Delete_Product_From_Order(order_uid NUMBER, product_uid NUMBER);

    PROCEDURE Reduce_Product_In_Order(order_uid NUMBER, product_uid NUMBER, quantity NUMBER);

    PROCEDURE Delete_Empty_Orders;

    PROCEDURE Delivery_Product_To_Stock (с_product_uid NUMBER, quantity NUMBER);

    PROCEDURE Give_Discount(с_order_uid NUMBER, c_discount NUMBER);
END;
/

create or replace PACKAGE BODY Skvortsov_Store_Package AS
    FUNCTION Is_Client_Exist (client_login VARCHAR2) RETURN BOOLEAN 
    IS
        client_count INTEGER;
    BEGIN
       SELECT COUNT(login) INTO client_count FROM Skvortsov_Client
          WHERE login = client_login;
       RETURN client_count > 0;
    END Is_Client_Exist;

    FUNCTION Is_Product_Type_Exist (c_product_type VARCHAR2) RETURN BOOLEAN 
    IS
        ptype_count INTEGER;
    BEGIN
       SELECT COUNT(*) INTO ptype_count FROM Skvortsov_Product_Type
          WHERE product_type = c_product_type;
       RETURN ptype_count > 0;
    END Is_Product_Type_Exist;

    FUNCTION Is_Product_Exist (c_product_uid NUMBER) RETURN BOOLEAN 
    IS
        p_count INTEGER;
    BEGIN
       SELECT COUNT(*) INTO p_count FROM Skvortsov_Product
          WHERE product_uid = c_product_uid;
       RETURN p_count > 0;
    END Is_Product_Exist;

    FUNCTION Is_Order_Exist (c_order_uid NUMBER) RETURN BOOLEAN 
    IS
        o_count INTEGER;
    BEGIN
       SELECT COUNT(*) INTO o_count FROM Skvortsov_Order
          WHERE order_uid = c_order_uid;
       RETURN o_count > 0;
    END Is_Order_Exist;

    FUNCTION Is_Ordered_Product_Item_Exist(c_order_uid NUMBER, c_product_uid NUMBER) RETURN BOOLEAN
    IS
        ord_pro_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO ord_pro_count FROM skvortsov_ordered_product
            WHERE order_uid = c_order_uid AND product_uid = c_product_uid;
        RETURN ord_pro_count > 0;
    END Is_Ordered_Product_Item_Exist;

    FUNCTION Is_Product_In_Order_Exist(c_order_uid NUMBER) RETURN BOOLEAN
    IS
        products_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO products_count FROM Skvortsov_Ordered_Product
            WHERE order_uid = c_order_uid;
        RETURN products_count > 0;
    END Is_Product_In_Order_Exist;

    PROCEDURE Add_Client (login VARCHAR2,name VARCHAR2,sex VARCHAR2,birthday VARCHAR2,address VARCHAR2,phone VARCHAR2) 
    IS
    BEGIN
        IF Is_Client_Exist(login) THEN
            RAISE E_NO_CLIENT;
        END IF;

        INSERT INTO Skvortsov_Client (login, name, sex, birthday, address, phone)
        VALUES (login, name, sex, TO_DATE(birthday,'DD.MM.RR'), address, phone);

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Клиент "'||name||'" добавлен в таблицу Skvortsov_Client');

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Вы пытались добавить клиента,значения которого нарушит ограничение уникальности поля login.');
            WHEN E_WRONG_AGE THEN
                DBMS_OUTPUT.PUT_LINE('Недопустимый возраст. Вы слишком молоды, чтобы пользоваться услугами нашего магазина.');
            WHEN E_CLIENT_IS_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Клиента "'||login||'" уже есть базе.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка при добавлении клиента.');
    END Add_Client;

    PROCEDURE Add_Product(name VARCHAR2,weight NUMBER,height NUMBER,width NUMBER,length NUMBER,price NUMBER,product_type VARCHAR2,stock NUMBER)
    IS
    BEGIN
        IF NOT Is_Product_Type_Exist(product_type) THEN
            RAISE E_WRONG_PRODUCT_TYPE_CODE;
        END IF;

        INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock)
        VALUES (name,weight,height,width,length,price,product_type,stock);

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Продукт "'||name||'" типа "'||product_type||'"добавлен в таблицу Skvortsov_Product');

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Вы пытались добавить продукт, значения которого нарушит ограничение уникальности поля product_uid.');
            WHEN E_WRONG_PRODUCT_TYPE_CODE THEN
                DBMS_OUTPUT.PUT_LINE('Тип продукта "'||product_type||'" отсутсвует в таблице Skvortsov_Product_Type.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка при добовлении продукта.');
    END Add_Product;

    PROCEDURE Create_Order(client_login VARCHAR2, payment_type VARCHAR2)
    IS
    BEGIN
        IF NOT Is_Client_Exist(client_login) THEN
            RAISE E_NO_CLIENT;
        END IF;

        INSERT INTO Skvortsov_Order (client_uid, payment)
        VALUES (client_login, payment_type);

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Заказ N"'||SKVORTSOV_ORDER_UID_SEQ.currval||'" клиента "'||client_login||'" добавлен в таблицу Skvortsov_Order');

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Вы пытались добавить продукт, значения которого нарушит ограничение уникальности поля order_uid.');
            WHEN E_NO_CLIENT THEN
                DBMS_OUTPUT.PUT_LINE('Клиента "'||client_login||'" нет в базе.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка при добовлении продукта.');
    END Create_Order;

    PROCEDURE Add_Product_In_Order(order_uid NUMBER, product_uid NUMBER, quantity NUMBER)
    IS
    BEGIN
        IF NOT Is_Order_Exist(order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSIF NOT Is_Product_Exist(product_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        ELSE
            IF Is_Ordered_Product_Item_Exist(order_uid, product_uid) THEN
                UPDATE Skvortsov_Ordered_Product 
                SET quantity = quantity
                WHERE order_uid = order_uid AND product_uid = product_uid;
            ELSE
                INSERT INTO Skvortsov_Ordered_Product (order_uid, product_uid, quantity)
                VALUES (order_uid, product_uid, quantity);
            END IF;
        END IF;

        EXCEPTION
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Продукта с N'||product_uid||' нет в базе.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с N'||order_uid||' нет в базе.');
            WHEN E_INVALID_QUANTITY_OF_PRODUCTS THEN
                DBMS_OUTPUT.PUT_LINE('Недопустимое количество товара.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка при добовлении продукта.');
    END Add_Product_In_Order;

    PROCEDURE Order_Move(c_order_uid NUMBER)
    IS
        status_order VARCHAR2(100);
        payment_order VARCHAR2(25);
        stock_product NUMBER;
        result_stock NUMBER;
        CURSOR products (ord NUMBER) IS
            SELECT product_uid, quantity FROM Skvortsov_Ordered_Product
            WHERE order_uid = ord;
    BEGIN
        IF NOT Is_Order_Exist(c_order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSIF NOT Is_Product_In_Order_Exist(c_order_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        END IF;

        SELECT status INTO status_order FROM Skvortsov_Order
        WHERE order_uid = c_order_uid;

        SELECT payment INTO payment_order FROM Skvortsov_Order
        WHERE order_uid = c_order_uid;

        IF status_order = 'Отменён' THEN
            RAISE E_ORDER_IS_CANCELED;
        ELSIF status_order = 'Получен' THEN
            RAISE E_ORDER_IS_RECEIVED;
        ELSIF status_order = 'Подготовка' THEN
            UPDATE skvortsov_order
            SET status = 'создан'
            WHERE order_uid = c_order_uid;
        ELSIF status_order = 'создан' THEN
            IF payment_order = 'Предоплата' THEN
                UPDATE skvortsov_order
                SET status = 'Оплачен'
                WHERE order_uid = c_order_uid;
            ELSE
                UPDATE skvortsov_order
                SET status = 'Комплектация'
                WHERE order_uid = c_order_uid;
            END IF;
            
            FOR product IN products(c_order_uid)
            LOOP
                UPDATE Skvortsov_Product
                SET stock = -product.quantity
                WHERE product_uid = product.product_uid;
            END LOOP;
        ELSIF status_order = 'Оплачен' THEN
             IF payment_order = 'При получении' THEN
                UPDATE skvortsov_order
                SET status = 'Получен'
                WHERE order_uid = c_order_uid;
            ELSE
                UPDATE skvortsov_order
                SET status = 'Комплектация'
                WHERE order_uid = c_order_uid;
            END IF;
        ELSIF status_order = 'Комплектация' THEN
            UPDATE skvortsov_order
            SET status = 'Отправлен'
            WHERE order_uid = c_order_uid;
        ELSIF status_order = 'Отправлен' THEN
             IF payment_order = 'При получении' THEN
                UPDATE skvortsov_order
                SET status = 'Оплачен'
                WHERE order_uid = c_order_uid;
            ELSE
                UPDATE skvortsov_order
                SET status = 'Получен'
                WHERE order_uid = c_order_uid;
            END IF;
        END IF;

        EXCEPTION
            WHEN E_ORDER_IS_RECEIVED THEN
                DBMS_OUTPUT.PUT_LINE('Данный заказ уже получен.');
            WHEN E_ORDER_IS_CANCELED THEN
                DBMS_OUTPUT.PUT_LINE('Данный заказ отменён.');
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('В заказе №'||c_order_uid||' нет добавленых продуктов. Переход к следущему статусу не осуществим.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с N'||c_order_uid||' нет в базе.');
    END Order_Move;

    PROCEDURE Delete_Product_From_Order(order_uid NUMBER, product_uid NUMBER)
    IS
    BEGIN
        IF NOT Is_Product_Exist(product_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        ELSIF NOT Is_Order_Exist(order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSE
            DELETE FROM skvortsov_ordered_product
            WHERE order_uid = order_uid AND product_uid = product_uid;
        END IF;

        EXCEPTION
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Продукта с №'||product_uid||' нет в базе.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с N'||order_uid||' нет в базе.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка при добовлении продукта.');
    END Delete_Product_From_Order;

    PROCEDURE Reduce_Product_In_Order(order_uid NUMBER, product_uid NUMBER, quantity NUMBER)
    IS
        negative_quantity NUMBER := -quantity;
    BEGIN
        IF NOT Is_Product_Exist(product_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        ELSIF NOT Is_Order_Exist(product_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSE
            UPDATE skvortsov_ordered_product
            SET quantity = negative_quantity
            WHERE order_uid = order_uid AND product_uid = product_uid;

            DELETE skvortsov_ordered_product
            WHERE order_uid = order_uid AND product_uid = product_uid AND quantity = 0;
        END IF;

        EXCEPTION
            WHEN E_INVALID_QUANTITY_OF_PRODUCTS THEN
                DBMS_OUTPUT.PUT_LINE('IQНедопустимое количество товара.');
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('PEПродукта с №'||product_uid||' нет в базе.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('OEЗаказа с N'||order_uid||' нет в базе.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('OПроизошла ошибка при добовлении продукта.');
    END Reduce_Product_In_Order;

    PROCEDURE Delivery_Product_To_Stock (с_product_uid NUMBER, quantity NUMBER)
    IS
    BEGIN
        IF NOT Is_Product_Exist(с_product_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        ELSIF quantity <= 0 THEN
            RAISE E_INVALID_QUANTITY_OF_PRODUCTS;
        ELSE
            UPDATE Skvortsov_Product
            SET stock = quantity
            WHERE product_uid = с_product_uid;

            DBMS_OUTPUT.PUT_LINE('Количество продукции с №'||с_product_uid||' увеличено на '||quantity||' пунктов.');
        END IF;

        EXCEPTION
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Продукта с №'||с_product_uid||' нет в базе.');
            WHEN E_INVALID_QUANTITY_OF_PRODUCTS THEN
                 DBMS_OUTPUT.PUT_LINE('Недопустимое значение количесва продукции: '||quantity||'.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка при добовлении продукта.');
    END Delivery_Product_To_Stock;

     PROCEDURE Delete_Empty_Orders
     IS
     BEGIN
         DELETE FROM Skvortsov_Order
            WHERE status = 'Подготовка' 
            AND (SELECT COUNT(*) FROM Skvortsov_Ordered_Product
                    WHERE order_uid = Skvortsov_Order.order_uid) = 0;

         COMMIT;

         DBMS_OUTPUT.PUT_LINE('Empty orders is deleted.');

         EXCEPTION
             WHEN E_NO_EMPTY_ORDERS THEN
                 DBMS_OUTPUT.PUT_LINE('Нет пустых заказов.');
             WHEN E_NO_PREPARE_ORDERS THEN
                 DBMS_OUTPUT.PUT_LINE('Нет заказов со статусом "Подготовка".');
             WHEN OTHERS THEN
                 DBMS_OUTPUT.PUT_LINE('Произошла ошибка при удалении пустых заказов.');
     END Delete_Empty_Orders;

    PROCEDURE Give_Discount(с_order_uid NUMBER, c_discount NUMBER)
    IS
    BEGIN
        IF Is_Order_Exist(с_order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSE
            UPDATE Skvortsov_Order
            SET discount = c_discount
            WHERE order_uid = с_order_uid AND status = 'Создан';

        END IF;
        EXCEPTION
            WHEN E_INVALID_DISCOUNT_FOR_ORDER THEN
                DBMS_OUTPUT.PUT_LINE('Значение скидки "'||c_discount||'" недействительно.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с N'||с_order_uid||' нет в базе.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Произошла ошибка при добовлении продукта.');
    END Give_Discount;
END Skvortsov_Store_Package;
/
CREATE OR REPLACE TRIGGER Skvortsov_Tr_Insert_Client
BEFORE INSERT ON Skvortsov_Client
    FOR EACH ROW
DECLARE
    LittleAge CONSTANT NUMBER := 168;
BEGIN
    IF MONTHS_BETWEEN(SYSDATE, :new.birthday) < LittleAge THEN
        RAISE Skvortsov_Store_Package.E_WRONG_AGE;
    END IF;
END;
/
-- CREATE OR REPLACE TRIGGER Skvortsov_Tr_Insert_Product
-- BEFORE INSERT ON Skvortsov_Product
--     FOR EACH ROW
-- BEGIN

-- END;
-- /
-- CREATE OR REPLACE TRIGGER Skvortsov_Tr_Insert_Order
-- BEFORE INSERT ON Skvortsov_Order
--     FOR EACH ROW
-- BEGIN

-- END;
-- /
CREATE OR REPLACE TRIGGER Skvortsov_Tr_Drop_Empty_Order
BEFORE DELETE ON Skvortsov_Order
    FOR EACH ROW
DECLARE
    prepere_order NUMBER;
    empty_order NUMBER;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    SELECT COUNT(*) INTO prepere_order FROM Skvortsov_Order
        WHERE status = 'Подготовка';

    IF prepere_order = 0 THEN
        RAISE Skvortsov_Store_Package.E_NO_PREPARE_ORDERS;
    ELSE
        SELECT COUNT(*) INTO empty_order FROM Skvortsov_Order
            WHERE status = 'Подготовка' 
            AND (SELECT COUNT(*) FROM Skvortsov_Ordered_Product
                 WHERE order_uid = Skvortsov_Order.order_uid) = 0;

        IF empty_order = 0 THEN
            RAISE Skvortsov_Store_Package.E_NO_EMPTY_ORDERS;
        END IF;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER Skvortsov_Tr_Prod_To_Stock
BEFORE UPDATE OF stock ON Skvortsov_Product
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    :new.stock := :old.stock + :new.stock;
END;
/
CREATE OR REPLACE TRIGGER Skvortsov_Tr_Give_Discount
BEFORE UPDATE OF discount ON Skvortsov_Order
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF :new.discount < 0 THEN
        RAISE Skvortsov_Store_Package.E_INVALID_DISCOUNT_FOR_ORDER;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER Skvortsov_Tr_Insert_Ord_Prod
BEFORE INSERT OR UPDATE OF product_price, quantity ON Skvortsov_Ordered_Product
    FOR EACH ROW
DECLARE
    quantity_in_stock NUMBER;
    product_price NUMBER;
    order_status NUMBER;
BEGIN
    SELECT stock INTO quantity_in_stock FROM Skvortsov_Product
    WHERE product_uid = :new.product_uid;
    
    SELECT COUNT(*) INTO order_status FROM skvortsov_order
    WHERE order_uid = :new.order_uid AND status = 'Подготовка';
    
    IF order_status = 1 THEN
        IF INSERTING THEN
            IF :new.quantity > quantity_in_stock OR :new.quantity <= 0 THEN
                RAISE Skvortsov_Store_Package.E_INVALID_QUANTITY_OF_PRODUCTS;
            END IF;
            SELECT price INTO product_price FROM Skvortsov_Product
            WHERE product_uid = :new.product_uid;
            
            :new.product_price := product_price;
        ELSIF UPDATING THEN
            :new.quantity := :old.quantity + :new.quantity;
            
            IF :new.quantity > quantity_in_stock OR :new.quantity < 0 THEN
                RAISE Skvortsov_Store_Package.E_INVALID_QUANTITY_OF_PRODUCTS;
            END IF;
        END IF;
    ELSE
        RAISE Skvortsov_Store_Package.E_WRONG_ORDER_STATUS;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER Skvortsov_Tr_Delete_Ord_Prod
BEFORE DELETE ON Skvortsov_Ordered_Product
    FOR EACH ROW
DECLARE
    order_status NUMBER;
BEGIN
    SELECT COUNT(status) INTO order_status FROM skvortsov_order
    WHERE order_uid = :old.order_uid AND status = 'Подготовка';
    
    IF order_status = 0 THEN
        RAISE Skvortsov_Store_Package.E_WRONG_ORDER_STATUS;
    END IF;
END;
/
CREATE OR REPLACE TRIGGER Skvortsov_Tr_Move_Order
BEFORE UPDATE ON Skvortsov_Order
    FOR EACH ROW
DECLARE
    birthday_from DATE;
    birthday_to DATE;
    birthday DATE;
    birthday_discount NUMBER := 5;
BEGIN
    IF :old.status = 'создан' THEN
        :new.created_date := CURRENT_DATE;
        
        SELECT birthday INTO birthday FROM skvortsov_client
        WHERE login = :old.client_uid;
        
        birthday_from := birthday - 7;
        birthday_to := birthday + 7;
        
        IF :new.created_date >= birthday_from 
        AND :new.created_date <= birthday_to
        AND :old.discount < birthday_discount THEN
            :new.discount := birthday_discount;
        END IF;
    END IF;
END;
/
