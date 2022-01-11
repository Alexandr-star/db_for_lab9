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
    delivery_price NUMBER(6,2) DEFAULT 0,
    discount NUMBER(3) DEFAULT 0,
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
--------------------------------------------------------
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

--------------------------------------------------------
-- Inserting into Skvortsov_Product_Type
--------------------------------------------------------
SET DEFINE OFF
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('Electronics','Электроника');
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('Cloth','Одежда');
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('Shoes','Обувь');
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('House','Дом');
INSERT INTO Skvortsov_Product_Type (product_type,name) VALUES ('Pets','Товары для животных');

--------------------------------------------------------
-- Inserting into Skvortsov_Product
--------------------------------------------------------
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
-- Inserting into Skvortsov_Order
--------------------------------------------------------
SET DEFINE OFF
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'zoya23','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'zoya23','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'zoya23','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'zoya23','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'grigoriy98','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'grigoriy98','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'grigoriy98','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'grigoriy98','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'arina48','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'milana1962','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'albina19061971','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'albina19061971','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'albina19061971','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'albina19061971','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'mihail1860','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'tatyana6418','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'maksim3779','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'maksim3779','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'german3591','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'german3591','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'german3591','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'antonina1976','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'antonina1976','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'antonina1976','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'ulyana9844','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'ulyana9844','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'ulyana9844','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'ulyana9844','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'anna1978','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'anna1978','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'anna1978','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'klara36','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'klara36','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'klara36','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'arseniy1984','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'arseniy1984','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'arseniy1984','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'nikolay7233','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'nikolay7233','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'nikolay7233','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'petr6941','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'petr6941','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'petr6941','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'petr6941','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'petr6941','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'alla1994','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'alla1994','Предоплата',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'alla1994','При получении',NULL,NULL,'Подготовка');
INSERT INTO Skvortsov_Order (created_date,complited_date,client_uid,payment,delivery_price,discount,status) VALUES (NULL,NULL,'alla1994','Предоплата',NULL,NULL,'Подготовка');

--------------------------------------------------------
-- Inserting into Skvortsov_Order
--------------------------------------------------------
SET DEFINE OFF
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (1,28,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (1,27,NULL,8);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (1,7,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (2,47,NULL,10);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (2,10,NULL,9);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (3,11,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (4,1,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (4,3,NULL,10);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (4,48,NULL,9);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (5,22,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (5,45,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (6,34,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (6,26,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (6,31,NULL,5);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (6,9,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (8,9,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (8,38,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (8,48,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (9,13,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (11,47,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (13,7,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (13,29,NULL,8);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (13,28,NULL,9);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (13,23,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (13,35,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (14,25,NULL,7);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (14,21,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (16,19,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (16,14,NULL,9);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (16,34,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (17,13,NULL,10);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (17,31,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (18,2,NULL,5);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (18,20,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (18,9,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (21,11,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (21,5,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (24,10,NULL,10);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (24,43,NULL,7);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (24,22,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (25,13,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (25,44,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (26,17,NULL,8);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (27,25,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (27,23,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (27,7,NULL,7);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (30,9,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (30,31,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (30,10,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (30,24,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (32,12,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (32,39,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (33,18,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (33,15,NULL,7);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (34,17,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (34,26,NULL,5);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (34,30,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (34,32,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (35,3,NULL,8);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (35,9,NULL,5);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (35,33,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (38,12,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (38,19,NULL,7);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (39,33,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (39,49,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (42,27,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (44,33,NULL,2);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (44,28,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (45,20,NULL,5);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (45,29,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (45,30,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (46,37,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (46,44,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (46,17,NULL,1);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (46,3,NULL,5);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (47,29,NULL,6);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (47,47,NULL,7);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (47,12,NULL,4);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (48,9,NULL,3);
INSERT INTO Skvortsov_Ordered_Product (order_uid,product_uid,product_price,quantity) VALUES  (48,46,NULL,2);

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
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_payment CHECK(payment IN ('Предоплата', 'При получении'));
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_delivery_price CHECK(delivery_price < 1000.00 AND delivery_price >= 0);
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_discount CHECK (discount < 100 AND discount >=0);
ALTER TABLE Skvortsov_Order ADD CONSTRAINT Check_Order_status CHECK(status IN ('Подготовка', 'Создан', 'Оплачен', 'Комплектация', 'Отправлен', 'Получен', 'Отменён'));

ALTER TABLE Skvortsov_Order ADD CONSTRAINT PK_Order PRIMARY KEY (order_uid) ENABLE;

ALTER TABLE Skvortsov_Order ADD CONSTRAINT FK_Order_Client FOREIGN KEY (client_uid)
	REFERENCES Skvortsov_Client (login) ON DELETE CASCADE ENABLE;

ALTER TABLE Skvortsov_Order MODIFY (order_uid NOT NULL ENABLE);
ALTER TABLE Skvortsov_Order MODIFY (client_uid NOT NULL ENABLE);
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
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_weight CHECK(weight <= 100000.000 AND weight > 0.00);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_height CHECK(height <= 1000.00 AND height > 0.00);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_width CHECK(width <= 1000.00 AND width > 0);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_length CHECK(length <= 1000.00 AND length > 0.00);
ALTER TABLE Skvortsov_Product ADD CONSTRAINT Check_Order_price CHECK(price > 0.00 AND price < 1000000.00);
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
ALTER TABLE Skvortsov_Ordered_Product MODIFY (quantity NOT NULL ENABLE);

set serveroutput on

create or replace PACKAGE Skvortsov_Store_Package AS
    E_WRONG_AGE EXCEPTION; -- Исключение о неверном возрасте
    E_NO_CLIENT EXCEPTION; -- Исключение об отсутствии клиента в базе
    E_CLIENT_IS_EXIST EXCEPTION; -- Исключение о существовании клиента в базу
    E_WRONG_PRODUCT_TYPE_CODE EXCEPTION; -- Исключение о неверной категории продукта
    E_NO_EMPTY_ORDERS EXCEPTION; -- Исключение об отсутствии пустых заказов
    E_PRODUCT_NOT_EXIST EXCEPTION; -- Исключение об отсутствии продукта в базе
    E_INVALID_QUANTITY_OF_PRODUCTS EXCEPTION; -- Исключение об неверном количестве продуктов в заказе
    E_INVALID_DISCOUNT_FOR_ORDER EXCEPTION; -- Исключение о неверном значении скидки
    E_INVALID_STATUS_FOR_DISCOUNT EXCEPTION; -- Исключение о неверном статусе заказа для предоставления скидки
    E_ORDER_NOT_EXIST EXCEPTION; -- Исключение об отсутствии заказа в баезе
    E_WRONG_ORDER_STATUS EXCEPTION; -- Исключение о неверном статусе заказа
    E_NO_PREPARE_ORDERS EXCEPTION; -- Исключение об отсутсвии заказов со статусом Подготовка
    E_ORDER_IS_CANCELED EXCEPTION; -- Исключение о том, что заказ в статусе Отменен
    E_ORDER_IS_RECEIVED EXCEPTION; -- Исключение о том, что заказ в статусе Получен
    E_DONT_CANCEL_ORDER EXCEPTION; -- Исключение о том, что заказ не может быть отменен
    E_WRONG_PHONE EXCEPTION; -- Исключение о неверном номере телефона
    
    E_WRONG_VALUE_FROM_LIST EXCEPTION; -- Исключение об неверном поле клиента
    PRAGMA EXCEPTION_INIT(E_WRONG_VALUE_FROM_LIST, -02290);
    
    E_NULL_INPUT_FIELD EXCEPTION; -- Исключение о пустом значении вводимого поля пользователем
    PRAGMA EXCEPTION_INIT(E_NULL_INPUT_FIELD, -01400);

    /*
    Процедура добавления клиента
    вход: логин, имя, пол, день рождения, адресс, номер телефона
    */
    PROCEDURE Add_Client(login VARCHAR2,name VARCHAR2,sex VARCHAR2,birthday VARCHAR2,address VARCHAR2,phone VARCHAR2);
    
    /*
    Процедура добавления товара в базу
    вход: наименование, вес, высота, ширина, длинна, цена, категория, количество на складе
    */
    PROCEDURE Add_Product(c_name VARCHAR2,c_weight NUMBER,c_height NUMBER,c_width NUMBER,c_length NUMBER,c_price NUMBER,c_product_type VARCHAR2,c_stock NUMBER);

    /*
    Процедура создания заказа
    вход: логин клиента, тип оплаты
    */
    PROCEDURE Create_Order(client_login VARCHAR2, payment_type VARCHAR2);

    /*
    Процедура добавления продукта в заказ
    вход: номер заказа, номер товара, количество
    */
    PROCEDURE Add_Product_In_Order(c_order_uid NUMBER, c_product_uid NUMBER, c_quantity NUMBER);

    /*
    Процедура движения заказа
    вход: номер заказа
    */
    PROCEDURE Order_Move(c_order_uid NUMBER);
    
    /*
    Процедура отмены заказа
    вход: номер заказа
    */
    PROCEDURE Cancel_Order(c_order_uid NUMBER);

    /*
    Процедура удаление продукта из заказа
    вход: номер продукта, номер заказа
    */
    PROCEDURE Delete_Product_From_Order(c_order_uid NUMBER, c_product_uid NUMBER);

    /*
    Уменьшение количества продукта в заказе, если количество продукта уменьшается до 0, то этот продукт удаляется из заказа
    вход: номер заказа, номер продукта, количество товара
    */
    PROCEDURE Reduce_Product_In_Order(с_order_uid NUMBER, с_product_uid NUMBER, с_quantity NUMBER);

    /*
    Процедура удаления всех пустых заказов (нет товаров в заказе, статус Подготовка)
    */
    PROCEDURE Delete_Empty_Orders;

    /*
    Процедура добавления товара на склад
    вход: номер товара, количество
    */
    PROCEDURE Delivery_Product_To_Stock(с_product_uid NUMBER, c_quantity NUMBER);

    /*
    Процедура добавления скидки в заказ
    вход: номер заказа, значение скидки
    */
    PROCEDURE Give_Discount(с_order_uid NUMBER, c_discount NUMBER);
    
    /*
    Процедура выводит список заказов
    */
    PROCEDURE Get_Order_List;
    
    /*
    Процедура выводит список клиентов
    */
    PROCEDURE Get_Client_List;    
END;
/
create or replace PACKAGE BODY Skvortsov_Store_Package AS
    /*
    Функция проверки существования клиента
    вход: логин клиента
    выход: да/нет
    */
    FUNCTION Is_Client_Exist (client_login VARCHAR2) RETURN BOOLEAN 
    IS
        client_count INTEGER;
    BEGIN
       SELECT COUNT(login) INTO client_count FROM Skvortsov_Client
          WHERE login = client_login;
       RETURN client_count > 0;
    END Is_Client_Exist;
    
    /*
    Функция проверки существования продукта
    вход: номер продукта
    выход: да/нет
    */
    FUNCTION Is_Product_Exist (c_product_uid NUMBER) RETURN BOOLEAN 
    IS
        p_count INTEGER;
    BEGIN
       SELECT COUNT(*) INTO p_count FROM Skvortsov_Product
          WHERE product_uid = c_product_uid;
       RETURN p_count > 0;
    END Is_Product_Exist;

    /*
    Функция проверки существования заказа
    вход: номер заказа
    выход: да/нет
    */
    FUNCTION Is_Order_Exist (c_order_uid NUMBER) RETURN BOOLEAN 
    IS
        o_count INTEGER;
    BEGIN
       SELECT COUNT(*) INTO o_count FROM Skvortsov_Order
          WHERE order_uid = c_order_uid;
       RETURN o_count > 0;
    END Is_Order_Exist;

    /*
    Функция проверки существования связи заказ-товар
    вход: номер заказа, номер товара
    выход: да/нет
    */
    FUNCTION Is_Ordered_Product_Item_Exist(c_order_uid NUMBER, c_product_uid NUMBER) RETURN BOOLEAN
    IS
        ord_pro_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO ord_pro_count FROM skvortsov_ordered_product
            WHERE order_uid = c_order_uid AND product_uid = c_product_uid;
        RETURN ord_pro_count > 0;
    END Is_Ordered_Product_Item_Exist;
 
    /*
    Функция проверки существования товаров в заказе
    вход: номер заказа
    выход: да/нет
    */
    FUNCTION Is_Product_In_Order_Exist(c_order_uid NUMBER) RETURN BOOLEAN
    IS
        products_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO products_count FROM Skvortsov_Ordered_Product
            WHERE order_uid = c_order_uid;
        RETURN products_count > 0;
    END Is_Product_In_Order_Exist;

    /*
    Функция возвращает стоимость заказа
    */
    FUNCTION Get_Order_Price(c_order_uid NUMBER) RETURN NUMBER
    IS
        order_price NUMBER := 0;
        order_discount NUMBER;
        order_delivery NUMBER;            
    BEGIN
        -- считаем общую суму продуктов
        SELECT SUM(product_price) INTO order_price FROM Skvortsov_Ordered_Product
            WHERE order_uid = c_order_uid;

        -- получаем скидку и доставку
        SELECT discount INTO order_discount FROM Skvortsov_Order
        WHERE order_uid = c_order_uid;

        SELECT delivery_price INTO order_delivery FROM Skvortsov_Order
        WHERE order_uid = c_order_uid;

        -- вычисляем общую сумму заказ
        order_price := order_price * (1 - NVL(order_discount, 0) / 100) + order_delivery;

        RETURN order_price;
    END Get_Order_Price;

    FUNCTION Get_Product_Quantity_In_Order(c_order_uid NUMBER, c_product_uid NUMBER) RETURN NUMBER
    IS
        current_quantity NUMBER;
    BEGIN
        SELECT quantity INTO current_quantity FROM Skvortsov_Ordered_Product
        WHERE order_uid = c_order_uid AND product_uid = c_product_uid;
        
        RETURN current_quantity;
    END Get_Product_Quantity_In_Order;

    /*
    Процедура добавления клиента
    вход: логин, имя, пол, день рождения, адресс, номер телефона
    */
    PROCEDURE Add_Client (login VARCHAR2,name VARCHAR2,sex VARCHAR2,birthday VARCHAR2,address VARCHAR2,phone VARCHAR2) 
    IS
    BEGIN
        INSERT INTO Skvortsov_Client (login, name, sex, birthday, address, phone)
        VALUES (login, name, sex, TO_DATE(birthday,'DD.MM.RR'), address, phone);

        DBMS_OUTPUT.PUT_LINE('Клиент "'||name||'" добавлен в таблицу Skvortsov_Client');

        COMMIT;

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Вы пытались добавить клиента, значения которого нарушит ограничение уникальности поля login. Клиент "'||login||'" уже есть базе.');
            WHEN E_WRONG_AGE THEN
                DBMS_OUTPUT.PUT_LINE('Недопустимый возраст. Вы слишком молоды, чтобы пользоваться услугами нашего магазина.');
            WHEN E_WRONG_VALUE_FROM_LIST THEN
                DBMS_OUTPUT.PUT_LINE('Неверное значение поля "Пол" '||sex||'" введите, пожалуйста "М" или "Ж" русского алфавита.');                
            WHEN E_WRONG_PHONE THEN
                DBMS_OUTPUT.PUT_LINE('Неверное значение поля "Телефон" '||phone||'. Формат телефона должен быть +7(***)***-**-**.');
            WHEN E_NULL_INPUT_FIELD THEN
                DBMS_OUTPUT.PUT_LINE('Значения полей должны существовать.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Длинна одного или нескольких вводимых значений превышает допустимый диапазон.');
    END Add_Client;

    /*
    Процедура добавления продукта
    вход: наименование, вес, высота, ширина, длинна, цена, тип, количество на складе
    */
    PROCEDURE Add_Product(c_name VARCHAR2,c_weight NUMBER,c_height NUMBER,c_width NUMBER,c_length NUMBER,c_price NUMBER,c_product_type VARCHAR2,c_stock NUMBER)
    IS
    BEGIN
        INSERT INTO Skvortsov_Product (name,weight,height,width,length,price,product_type,stock)
        VALUES (c_name,c_weight,c_height,c_width,c_length,c_price,c_product_type,c_stock);

        DBMS_OUTPUT.PUT_LINE('Продукт "'||c_name||'" типа "'||c_product_type||'"добавлен в таблицу Skvortsov_Product');

        COMMIT;

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Вы пытались добавить продукт, значения которого нарушит ограничение уникальности поля product_uid.');
            WHEN E_WRONG_PRODUCT_TYPE_CODE THEN
                DBMS_OUTPUT.PUT_LINE('Тип продукта "'||c_product_type||'" отсутсвует в таблице Skvortsov_Product_Type.');
            WHEN E_NULL_INPUT_FIELD THEN
                DBMS_OUTPUT.PUT_LINE('Значения полей должны существовать.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Длинна одного или нескольких вводимых значений превышает допустимый диапазон.');
    END Add_Product;

    /*
    Процедура создания заказа
    вход: логин клиента, тип оплаты
    */
    PROCEDURE Create_Order(client_login VARCHAR2, payment_type VARCHAR2)
    IS
    BEGIN
        IF NOT Is_Client_Exist(client_login) THEN
            RAISE E_NO_CLIENT;
        END IF;
    
        INSERT INTO Skvortsov_Order (client_uid, payment)
        VALUES (client_login, payment_type);
        
        DBMS_OUTPUT.PUT_LINE('Заказ №"'||SKVORTSOV_ORDER_UID_SEQ.currval||'" клиента "'||client_login||'" добавлен в таблицу Skvortsov_Order');
        
        COMMIT;

        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                DBMS_OUTPUT.PUT_LINE('Вы пытались добавить продукт, значения которого нарушит ограничение уникальности поля order_uid.');
            WHEN E_WRONG_VALUE_FROM_LIST THEN
                DBMS_OUTPUT.PUT_LINE('Неверный тип оплаты: "'||payment_type||'" .');
            WHEN E_NO_CLIENT THEN
                DBMS_OUTPUT.PUT_LINE('Клиента "'||client_login||'" нет в базе.');
            WHEN E_NULL_INPUT_FIELD THEN
                DBMS_OUTPUT.PUT_LINE('Значения полей должны существовать.');
    END Create_Order;

    /*
    Процедура добавления продукта в заказ
    вход: номер заказа, номер товара, количество
    */
    PROCEDURE Add_Product_In_Order(c_order_uid NUMBER, c_product_uid NUMBER, c_quantity NUMBER)
    IS
        -- Новое значение количества продукта в заказе
        current_quantity NUMBER;
        new_quantity NUMBER; 
    BEGIN
        IF NOT Is_Order_Exist(c_order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSIF NOT Is_Product_Exist(c_product_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        ELSE
            -- Если данный продукт уже есть в заказе, то мы добавляем указанное количество продукта
            IF Is_Ordered_Product_Item_Exist(c_order_uid, c_product_uid) THEN
                -- Получем уже существующее количество продукта
                current_quantity := Get_Product_Quantity_In_Order(c_order_uid, c_product_uid);
        
                -- Вычисляем новое значение количества
                new_quantity := current_quantity + c_quantity;
                
                UPDATE Skvortsov_Ordered_Product 
                SET quantity = new_quantity
                WHERE order_uid = c_order_uid AND product_uid = c_product_uid;
                
                DBMS_OUTPUT.PUT_LINE('В заказе №'||c_order_uid||' увеличен продукт №'||c_product_uid||' на '||c_quantity||' шт.');
            -- Иначе создаем связь заказ-продукт
            ELSE
                INSERT INTO Skvortsov_Ordered_Product (order_uid, product_uid, quantity)
                VALUES (c_order_uid, c_product_uid, c_quantity);
                
                DBMS_OUTPUT.PUT_LINE('В заказ №'||c_order_uid||' добавлен продукт №'||c_product_uid||' в количестве '||c_quantity||' шт.');
            END IF;
            
            COMMIT;
        END IF;

        EXCEPTION
            WHEN E_WRONG_ORDER_STATUS THEN
                DBMS_OUTPUT.PUT_LINE('Неверный статус заказа.');
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Продукта с №'||c_product_uid||' нет в базе.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с №'||c_order_uid||' нет в базе.');
            WHEN E_INVALID_QUANTITY_OF_PRODUCTS THEN
                DBMS_OUTPUT.PUT_LINE('Недопустимое количество товара.');
    END Add_Product_In_Order;

    /*
    Процедура движения заказа
    вход: номер заказа
    */
    PROCEDURE Order_Move(c_order_uid NUMBER)
    IS
        -- локальные переменные
        status_order VARCHAR2(100); -- статус заказа
        payment_order VARCHAR2(25); -- типо оплаты заказа
        current_stock NUMBER; -- текущее количество продукта на складе
        stock_product NUMBER; -- количество продукта на складе
        p_price NUMBER; -- цена продукта
        -- курсор, который возвращает продукты заказа
        CURSOR products (ord NUMBER) IS
            SELECT product_uid, quantity FROM Skvortsov_Ordered_Product
            WHERE order_uid = ord;
    BEGIN
        -- проверки, существует ли заказ и существуют ли в заказе товары
        IF NOT Is_Order_Exist(c_order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSIF NOT Is_Product_In_Order_Exist(c_order_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        END IF;

        -- получаем статус заказа
        SELECT status INTO status_order FROM Skvortsov_Order
        WHERE order_uid = c_order_uid;

        -- получаем тип оплаты заказа
        SELECT payment INTO payment_order FROM Skvortsov_Order
        WHERE order_uid = c_order_uid;

        -- если заказ отменет, то мы не можем совершать движение
        IF status_order = 'Отменён' THEN 
            RAISE E_ORDER_IS_CANCELED;
        -- если заказ получен, то мы не можем совершать движение
        ELSIF status_order = 'Получен' THEN
            RAISE E_ORDER_IS_RECEIVED;
        -- если заказ в статусе "Подготовка", то он переходит в "Создан"
        ELSIF status_order = 'Подготовка' THEN
            FOR product IN products(c_order_uid)
            LOOP
            -- Фиксируем стоимость суммарную стоимость для каждого из товаров
                SELECT price INTO p_price FROM Skvortsov_Product
                WHERE product_uid = product.product_uid;
        
                UPDATE Skvortsov_Ordered_Product
                SET product_price = p_price * product.quantity
                WHERE order_uid = c_order_uid AND product_uid = product.product_uid;
                
            END LOOP;
            
            UPDATE skvortsov_order
            SET status = 'Создан'
            WHERE order_uid = c_order_uid;
            
            DBMS_OUTPUT.PUT_LINE('Заказ перешел в статус "Создан".');
        -- если заказ в статусе "Создан", то в зависимости от типа оплаты
        ELSIF status_order = 'Создан' THEN
            IF payment_order = 'Предоплата' THEN
            -- заказ переходит в "Оплачен"
                UPDATE skvortsov_order
                SET status = 'Оплачен'
                WHERE order_uid = c_order_uid;
                
                DBMS_OUTPUT.PUT_LINE('Заказ перешел в статус "Оплачен".');
            ELSE
            -- или  в "Комплектация"
                UPDATE skvortsov_order
                SET status = 'Комплектация'
                WHERE order_uid = c_order_uid;
                
                DBMS_OUTPUT.PUT_LINE('Заказ перешел в статус "Оплачен".');
            END IF;
            
            -- уменьшаем количество товаров на складе
            FOR product IN products(c_order_uid)
            LOOP
                SELECT stock INTO current_stock FROM Skvortsov_Product
                WHERE product_uid = product.product_uid;
            
                stock_product := current_stock - product.quantity;
                
                UPDATE Skvortsov_Product
                SET stock = stock_product
                WHERE product_uid = product.product_uid;
            END LOOP;
        -- если заказ в статусе "Оплачен", то в зависимости от типа оплаты
        ELSIF status_order = 'Оплачен' THEN
            IF payment_order = 'При получении' THEN
                -- заказ переходит в "Получен"
                UPDATE skvortsov_order
                SET status = 'Получен', complited_date = CURRENT_DATE
                WHERE order_uid = c_order_uid;
                
                DBMS_OUTPUT.PUT_LINE('Заказ перешел в статус "Получен".');
            ELSE
                -- или в "Комплектация"
                UPDATE skvortsov_order
                SET status = 'Комплектация'
                WHERE order_uid = c_order_uid;
                
                DBMS_OUTPUT.PUT_LINE('Заказ перешел в статус "Комплектация".');
            END IF;
        -- после комплектации заказ отправляют
        ELSIF status_order = 'Комплектация' THEN
            UPDATE skvortsov_order
            SET status = 'Отправлен'
            WHERE order_uid = c_order_uid;
            
            DBMS_OUTPUT.PUT_LINE('Заказ перешел в статус "Отправлен".');
        -- если заказ в статусе "Оплачен", то в зависимости от типа оплаты
        ELSIF status_order = 'Отправлен' THEN
            IF payment_order = 'При получении' THEN
                -- заказ оплачивают при получении
                UPDATE skvortsov_order
                SET status = 'Оплачен'
                WHERE order_uid = c_order_uid;
                
                DBMS_OUTPUT.PUT_LINE('Заказ перешел в статус "Оплачен".');
            ELSE
                -- или уже выдают если была совершена предоплата
                UPDATE skvortsov_order
                SET status = 'Получен', complited_date = CURRENT_DATE
                WHERE order_uid = c_order_uid;
                
                DBMS_OUTPUT.PUT_LINE('Заказ перешел в статус "Получен".');
            END IF;
        END IF;
        
        COMMIT;

        EXCEPTION
            WHEN E_WRONG_ORDER_STATUS THEN
                DBMS_OUTPUT.PUT_LINE('E_WRONG_ORDER_STATUS.');
            WHEN E_INVALID_QUANTITY_OF_PRODUCTS THEN
                DBMS_OUTPUT.PUT_LINE('Недопустимое количество товара.');
            WHEN E_INVALID_STATUS_FOR_DISCOUNT THEN
                DBMS_OUTPUT.PUT_LINE('E_INVALID_STATUS_FOR_DISCOUNT');
            WHEN E_ORDER_IS_RECEIVED THEN
                DBMS_OUTPUT.PUT_LINE('Данный заказ уже получен.');
            WHEN E_ORDER_IS_CANCELED THEN
                DBMS_OUTPUT.PUT_LINE('Данный заказ отменён.');
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('В заказе №'||c_order_uid||' нет добавленых продуктов. Переход к следущему статусу не осуществим.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с №'||c_order_uid||' нет в базе.');
    END Order_Move;
    
    /*Процедура отмены заказа
    вход: номер заказа (order_uid)
    */
    PROCEDURE Cancel_Order(c_order_uid NUMBER)
    IS
    BEGIN
        IF NOT Is_Order_Exist(c_order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        END IF;
        
        UPDATE skvortsov_order
        SET status = 'Отменён', complited_date = CURRENT_DATE
        WHERE order_uid = c_order_uid;
        
        DBMS_OUTPUT.PUT_LINE('Заказа с №'||c_order_uid||' отменен.');
        
        COMMIT;
        
        EXCEPTION
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с №'||c_order_uid||' нет в базе.');
            WHEN E_DONT_CANCEL_ORDER THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с №'||c_order_uid||' невозможно отменить.');
    END Cancel_Order;

    /*
    Процедура удаление продукта из заказа
    вход: номер продукта, номер заказа
    */
    PROCEDURE Delete_Product_From_Order(c_order_uid NUMBER, c_product_uid NUMBER)
    IS
    BEGIN
       -- проверка, существет ли заказ и продукт
        IF NOT Is_Product_Exist(c_product_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        ELSIF NOT Is_Order_Exist(c_order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSE
            DELETE FROM skvortsov_ordered_product
            WHERE order_uid = c_order_uid AND product_uid = c_product_uid;
        
            DBMS_OUTPUT.PUT_LINE('Продукт №'||c_product_uid||' дален из заказа №'||c_order_uid);
            
            COMMIT;
        END IF;

        EXCEPTION
            WHEN E_WRONG_ORDER_STATUS THEN
                DBMS_OUTPUT.PUT_LINE('Неверный статус заказа.');
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Продукта с №'||c_product_uid||' нет в базе.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с №'||c_order_uid||' нет в базе.');
    END Delete_Product_From_Order;

    /*
    Уменьшение количества продукта в заказе, если количество продукта уменьшается до 0, то этот продукт удаляется из заказа
    вход: номер заказа, номер продукта, количество товара
    */
    PROCEDURE Reduce_Product_In_Order(с_order_uid NUMBER, с_product_uid NUMBER, с_quantity NUMBER)
    IS
        current_quantity NUMBER;
        new_quantity NUMBER;
    BEGIN
        -- проверка, существет ли заказ и продукт
        IF NOT Is_Product_Exist(с_product_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        ELSIF NOT Is_Order_Exist(с_order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSE
            -- Получем уже существующее количество продукта
            current_quantity := Get_Product_Quantity_In_Order(с_order_uid, с_product_uid);
            -- Вычисляем новое значение количества
            new_quantity := current_quantity - с_quantity;
        
            -- обновляем количество товаров
            UPDATE skvortsov_ordered_product
            SET quantity = new_quantity
            WHERE order_uid = с_order_uid AND product_uid = с_product_uid;

            -- если после обновления количество стало 0, то удаляем товар из заказа
            DELETE skvortsov_ordered_product
            WHERE order_uid = order_uid AND product_uid = с_product_uid AND quantity = 0;

            COMMIT;
        END IF;

        EXCEPTION
            WHEN E_INVALID_QUANTITY_OF_PRODUCTS THEN
                DBMS_OUTPUT.PUT_LINE('Недопустимое количество товара.');
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Продукта с №'||с_product_uid||' нет в базе.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с №'||с_order_uid||' нет в базе.');
            WHEN E_WRONG_ORDER_STATUS THEN
                DBMS_OUTPUT.PUT_LINE('Неверный статус заказа.');
    END Reduce_Product_In_Order;

    /*
    Процедура добавления товара на склад
    вход: номер товара, количество
    */
    PROCEDURE Delivery_Product_To_Stock (с_product_uid NUMBER, c_quantity NUMBER)
    IS
        current_quantity_in_stock NUMBER;
        new_quantity_in_stock NUMBER;
    BEGIN
        IF NOT Is_Product_Exist(с_product_uid) THEN
            RAISE E_PRODUCT_NOT_EXIST;
        ELSIF c_quantity <= 0 THEN
            RAISE E_INVALID_QUANTITY_OF_PRODUCTS;
        ELSE
            -- Получем уже существующее количество продукта
            SELECT stock INTO current_quantity_in_stock FROM Skvortsov_Product
            WHERE product_uid = с_product_uid;
            -- Вычисляем новое значение количества
            new_quantity_in_stock := current_quantity_in_stock  + c_quantity;

            UPDATE Skvortsov_Product
            SET stock = new_quantity_in_stock
            WHERE product_uid = с_product_uid;


            DBMS_OUTPUT.PUT_LINE('Количество продукции с №'||с_product_uid||' увеличено на '||c_quantity||' пунктов.');
            
            COMMIT;
        END IF;

        EXCEPTION
            WHEN E_PRODUCT_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Продукта с №'||с_product_uid||' нет в базе.');
            WHEN E_INVALID_QUANTITY_OF_PRODUCTS THEN
                 DBMS_OUTPUT.PUT_LINE('Недопустимое значение количесва продукции: '||c_quantity||'.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Недопустимое значение количесва продукции: '||c_quantity||'.');
    END Delivery_Product_To_Stock;

    /*
    Процедура удаления всех пустых заказов (нет товаров в заказе, статус Подготовка)
    */
     PROCEDURE Delete_Empty_Orders
     IS
        empty_order_count NUMBER;
     BEGIN
        -- удаляем все заказы со статусом "Подготовка" и без заказов
        DELETE FROM Skvortsov_Order
        WHERE status = 'Подготовка' 
        AND (SELECT COUNT(*) FROM Skvortsov_Ordered_Product
                    WHERE order_uid = Skvortsov_Order.order_uid) = 0;

        DBMS_OUTPUT.PUT_LINE('Пустые заказы удалены.');

        COMMIT;

        EXCEPTION
            WHEN E_NO_EMPTY_ORDERS THEN
                DBMS_OUTPUT.PUT_LINE('Нет пустых заказов.');
     END Delete_Empty_Orders;

    /*
    Процедура добавления скидки в заказ
    вход: номер заказа, значение скидки
    */
    PROCEDURE Give_Discount(с_order_uid NUMBER, c_discount NUMBER)
    IS
    BEGIN
        IF NOT Is_Order_Exist(с_order_uid) THEN
            RAISE E_ORDER_NOT_EXIST;
        ELSE
        -- выделяем скидку для заказа, если заказ создан
            UPDATE Skvortsov_Order
            SET discount = c_discount
            WHERE order_uid = с_order_uid;
            
            DBMS_OUTPUT.PUT_LINE('Заказу №'||с_order_uid||' предоставлена скидка в размере '||c_discount||'%.');
            
            COMMIT;
        
        END IF;

        EXCEPTION
            WHEN E_INVALID_DISCOUNT_FOR_ORDER THEN
                DBMS_OUTPUT.PUT_LINE('Значение скидки "'||c_discount||'" недействительно.');
            WHEN E_ORDER_NOT_EXIST THEN
                DBMS_OUTPUT.PUT_LINE('Заказа с №'||с_order_uid||' нет в базе.');
            WHEN E_INVALID_STATUS_FOR_DISCOUNT THEN
                DBMS_OUTPUT.PUT_LINE('Операция невозможна.');
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Неверное значение скидки '||c_discount||'.');
    END Give_Discount;

    /*
    Процедура выводящая список заказов с указанием клиента и списка заказанных товаров.
    Список сортируется по статусам и по убыванию даты создания.
    Для заказа указывается стоимость.
    */
    PROCEDURE Get_Order_List
    IS
        order_price NUMBER;
        product_name VARCHAR2(100);
        
        -- курсор возвращающий заказы, упорядоченные по статусу и дате создания
        CURSOR orders IS 
            SELECT order_uid, client_uid, created_date, complited_date, status FROM Skvortsov_Order
            ORDER BY status, created_date DESC;
        
        -- курсор возвращающий продукты в заказе, упорядоченные по номеру продукта
        CURSOR products (ord NUMBER) IS
            SELECT product_uid, quantity FROM Skvortsov_Ordered_Product
            WHERE order_uid = ord
            ORDER BY product_uid DESC;
    BEGIN
        FOR client_order IN orders
        LOOP
            -- выводим информацию о заказе и указываем клиента
            DBMS_OUTPUT.PUT_LINE('Client: '||client_order.client_uid);
            DBMS_OUTPUT.PUT_LINE('       Order: '||client_order.order_uid||' Status: '||client_order.status||' Create order: '||client_order.created_date||' Complite order: '||client_order.complited_date);

            -- если стоимости заказа нет, то выводим сообщение об этом
            order_price := Get_Order_Price(client_order.order_uid);
            IF order_price = 0 OR order_price IS NULL THEN
                DBMS_OUTPUT.PUT_LINE('       Price Order: значение отсутсвует');
            ELSE
                DBMS_OUTPUT.PUT_LINE('       Price Order: '||order_price);
            END IF;
        
            -- выводм список продуктов, принадлежащих заказу
            DBMS_OUTPUT.PUT_LINE('       Products: ');
            FOR order_product IN products(client_order.order_uid)
            LOOP
                SELECT name INTO product_name FROM skvortsov_product
                WHERE product_uid = order_product.product_uid;
                
                DBMS_OUTPUT.PUT_LINE('              '||product_name||' '||order_product.quantity||' шт.');
            END LOOP;

        DBMS_OUTPUT.PUT_LINE('______________________________________________________________________________');
        END LOOP;
    END Get_Order_List;
    
    /*
    Процедура выводящая список клиентов с указанием количества полученных заказов, суммарной и средней
    стоимости заказа, а также процента отменённых заказов.
    Список сортируется по убыванию каждого из параметров в указанном порядке их следования.
    */
    PROCEDURE Get_Client_List
    IS
        -- курсор возвращающих список клиентов
        CURSOR clients IS 
            SELECT 
                -- данные клиента (имя, телефон, адрес)
                Skvortsov_Client.name,
                Skvortsov_Client.phone, 
                Skvortsov_Client.address,
                
                /*
                count_order_finish
                Количество полученных заказов.
                */
                (SELECT COUNT(status) from skvortsov_order
                WHERE client_uid = Skvortsov_Client.login AND status = 'Получен') as count_order_finish,
                
                /* 
                sum_order
                Суммарная стоимость заказов.
                Вычисляем сумму, получая значения из подзапроса.
                В подзапросе мы используем еще один подзапрос, в котором вычисляется стоимость заказа.
                */
                (SELECT NVL(SUM(sump), 0) FROM
                (SELECT client_uid, status, (SELECT SUM(product_price)  FROM skvortsov_ordered_product WHERE order_uid = skvortsov_order.order_uid) 
                * (1 - NVL(skvortsov_order.discount, 0) / 100) + skvortsov_order.delivery_price as sump FROM skvortsov_order )
                WHERE client_uid = Skvortsov_Client.login AND status = 'Получен')
                as sum_order,
                
                /*
                avg_order
                Средняя стоимость заказов.
                Вычисляем среднее значение стоимости, получая значения из подзапроса.
                В подзапросе мы используем еще один подзапрос, в котором вычисляется стоимость заказа.
                */
                (SELECT NVL(AVG(sump), 0) FROM
                (SELECT client_uid, status, (SELECT SUM(product_price)  FROM skvortsov_ordered_product WHERE order_uid = skvortsov_order.order_uid) 
                * (1 - NVL(skvortsov_order.discount, 0) / 100) + skvortsov_order.delivery_price as sump FROM skvortsov_order )
                WHERE client_uid = Skvortsov_Client.login AND status = 'Получен')
                as avg_order,
                
                /*
                proc_cencels
                Вычисление процента отменненых заказов.
                В подзапросе получаем все отмененные заказы у клиента и вычисляем процент.
                */
                (SELECT NVL((SELECT COUNT(*) FROM skvortsov_order WHERE status = 'Отменён' AND client_uid = Skvortsov_Client.login) / COUNT(*) *100, 0) FROM skvortsov_order WHERE client_uid = Skvortsov_Client.login GROUP BY skvortsov_order.client_uid)
                as proc_cencels
                
                FROM Skvortsov_Client
                ORDER BY count_order_finish, sum_order, avg_order, proc_cencels;
    BEGIN
        -- вывод данных
        FOR cli IN clients
        LOOP
            DBMS_OUTPUT.PUT_LINE(' Клиент: '||cli.name);
            DBMS_OUTPUT.PUT_LINE('     Тел.: '||cli.phone);
            DBMS_OUTPUT.PUT_LINE('     Адресс: '||cli.address);
            DBMS_OUTPUT.PUT_LINE('     Количество полученных заказов: '||cli.count_order_finish);
            DBMS_OUTPUT.PUT_LINE('     Суммарная стоимость полученных заказов: '||cli.sum_order);
            DBMS_OUTPUT.PUT_LINE('     Средняя стоимость полученных заказов: '||cli.avg_order);
            DBMS_OUTPUT.PUT_LINE('     Отмененные заказы: '||NVL(cli.proc_cencels,0)||'%');
            DBMS_OUTPUT.PUT_LINE('______________________________________________________________________________');
        END LOOP;
    END Get_Client_List;

END Skvortsov_Store_Package;
/

-- Триггер проверяет и обрабатывает ошибки при создании клиента
create or replace TRIGGER Skvortsov_Tr_Insert_Client
BEFORE INSERT ON Skvortsov_Client
    FOR EACH ROW
DECLARE
    little_age CONSTANT NUMBER := 168; -- количество месяцев равные 14 годам
    error_exist BOOLEAN := false; -- индикатор наличия ошибки
BEGIN
    IF :new.login IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Поле login не может быть пустым.');
        error_exist := true;
    END IF;
    
    IF :new.name IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Поле name не может быть пустым.');
        error_exist := true;
    END IF;
    
    IF :new.birthday IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Поле birthday не может быть пустым.');
        error_exist := true;
    -- проверка, что клиент не молодже 14 лет
    ELSIF MONTHS_BETWEEN(CURRENT_DATE, :new.birthday) < little_age THEN
        RAISE Skvortsov_Store_Package.E_WRONG_AGE;
    END IF;
    
    IF :new.address IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Поле address не может быть пустым.');
        error_exist := true;
    END IF;
    
    IF :new.phone IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Поле phone не может быть пустым.');
        error_exist := true;
    -- проверка правильности номера телефона
    ELSIF NOT REGEXP_LIKE(:new.phone, '\+7\(\d{3}\)\d{3}-\d{2}-\d{2}') THEN
         RAISE Skvortsov_Store_Package.E_WRONG_PHONE;
    END IF;
    
    IF error_exist THEN
        RAISE Skvortsov_Store_Package.E_NULL_INPUT_FIELD;
    END IF;
END;
/
-- Триггер проверяет и обрабатывает ошибки при создании и обновлении продукта
create or replace TRIGGER Skvortsov_Tr_Insert_Prod
BEFORE INSERT OR UPDATE ON Skvortsov_Product
    FOR EACH ROW
DECLARE
    error_exist BOOLEAN := false; -- индикатор наличия ошибки
    ptype_count NUMBER;
BEGIN
    IF INSERTING THEN
        IF :new.name IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Поле name не может быть пустым.');
            error_exist := true;
        END IF;
    
        IF :new.weight IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Поле weight не может быть пустым.');
            error_exist := true;
        END IF;
    
        IF :new.price IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Поле price не может быть пустым.');
            error_exist := true;
        END IF;
    
        IF :new.product_type IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Поле product_type не может быть пустым.');
            error_exist := true;
        ELSE
            SELECT COUNT(*) INTO ptype_count FROM Skvortsov_Product_Type
              WHERE product_type = :new.product_type;
            
            IF ptype_count = 0 THEN
                RAISE Skvortsov_Store_Package.E_WRONG_PRODUCT_TYPE_CODE;
            END IF;
        END IF;
    
        IF :new.stock IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Поле stock не может быть пустым.');
            error_exist := true;
        END IF;
    
        IF error_exist THEN
            RAISE Skvortsov_Store_Package.E_NULL_INPUT_FIELD;
        END IF;
    ELSIF UPDATING('stock') THEN
        IF :new.stock < 0 THEN
            DBMS_OUTPUT.PUT_LINE('Количество продукта №'||:new.product_uid||' на складе может стать '||:new.stock);
            RAISE Skvortsov_Store_Package.E_INVALID_QUANTITY_OF_PRODUCTS;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Количество продукта №'||:new.product_uid||' на складе стало '||:new.stock);
        END IF;
    END IF;
END;
/
-- Триггер выполняет некоторые проверки при добавлении и обновлении таблицы Заказ - Продукт
-- если заказ в статусе "Подготовка" 
create or replace TRIGGER Skvortsov_Tr_Insert_Ord_Prod
BEFORE INSERT OR UPDATE OF product_price, quantity ON Skvortsov_Ordered_Product
    FOR EACH ROW
DECLARE
    -- локальные переменные
    quantity_in_stock NUMBER; -- количество товаров на складе
    product_price NUMBER; -- цена продукта
    order_status NUMBER; -- статус заказа
    o_count NUMBER; -- счетчик количества заказов
    p_count NUMBER; -- счетчик количества продуктов
BEGIN
    -- получаем статус заказа
    SELECT COUNT(*) INTO order_status FROM skvortsov_order
    WHERE order_uid = :new.order_uid AND status = 'Подготовка';

    -- если заказ в статусе "Подготовка"
    IF order_status > 0 THEN
        -- получаем количество товара на складе
        SELECT stock INTO quantity_in_stock FROM Skvortsov_Product
        WHERE product_uid = :new.product_uid;

        -- если мы добавляем в заказ товар (если товара в заказе еще есть), то проверяем,
        -- что количество товара в заказе не превышает количество на складе
        IF INSERTING THEN
            IF :new.quantity > quantity_in_stock OR :new.quantity <= 0 THEN
                RAISE Skvortsov_Store_Package.E_INVALID_QUANTITY_OF_PRODUCTS;
            END IF;
        -- если обновляем таблицу (если товар в заказе уже есть)
        ELSIF UPDATING('quantity') THEN
            -- проверяем, что количество товара в заказе не превышает количество на складе
            IF :new.quantity > quantity_in_stock OR :new.quantity < 0 THEN
                RAISE Skvortsov_Store_Package.E_INVALID_QUANTITY_OF_PRODUCTS;
            ELSE
                DBMS_OUTPUT.PUT_LINE('Количество продуктов с №'||:new.product_uid||' в заказе №'||:new.order_uid||' стало '||:new.quantity);
            END IF;
        END IF;
    ELSE
        RAISE Skvortsov_Store_Package.E_WRONG_ORDER_STATUS;
    END IF;
END;
/
-- Триггер обрабатывает процедуру удаления товара из заказа (Удалять можно в статусе "Подготовка")
create or replace TRIGGER Skvortsov_Tr_Delete_Ord_Prod
BEFORE DELETE ON Skvortsov_Ordered_Product
    FOR EACH ROW
DECLARE
    order_status NUMBER;
BEGIN
    -- проверка статуса заказа
    SELECT COUNT(*) INTO order_status FROM skvortsov_order
    WHERE order_uid = :old.order_uid AND status = 'Подготовка';

    IF order_status = 0 THEN
        RAISE Skvortsov_Store_Package.E_WRONG_ORDER_STATUS;
    END IF;
END;
/
-- Триггер проверяет статус заказа и наличие товара, при удалении 
-- пустых заказов, и вызывает соответсвующие исключения
create or replace TRIGGER Skvortsov_Tr_Drop_Emp_Order
AFTER DELETE ON Skvortsov_Order
    FOR EACH ROW
DECLARE
    prepere_order NUMBER;
    empty_order NUMBER;
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    SELECT COUNT(*) INTO empty_order FROM Skvortsov_Order
        WHERE status = 'Подготовка' 
        AND (SELECT COUNT(*) FROM Skvortsov_Ordered_Product
             WHERE order_uid = Skvortsov_Order.order_uid) = 0;

    IF empty_order = 0 THEN
        RAISE Skvortsov_Store_Package.E_NO_EMPTY_ORDERS;
    END IF;
END;
/
-- Триггер обрабатывающий обновление статуса заказа
create or replace TRIGGER Skvortsov_Tr_Status_Order
BEFORE UPDATE OF status ON Skvortsov_Order
    FOR EACH ROW
DECLARE
    o_count NUMBER; -- счетчик количества заказов
    birthday_from DATE; -- вспомогательные переменные, для получения диапазона дня рождения клиента
    birthday_to DATE;
    client_birthday DATE; -- дата рождения клиента
    dif_year NUMBER; -- разница между текущим годом и годом рождения клиента
    birthday_discount NUMBER := 5; -- скидка на день рождения
    in_stock NUMBER; -- количество товара на складе
    product_weight NUMBER; -- вес товара
    sum_weight NUMBER := 0; -- суммарный вес товара
    delivery_const NUMBER := 50; -- цена доставки по умолчанию
    delivery_factor NUMBER := 10; -- множитель 1 кг
    factor_kg NUMBER := 5;
    order_price NUMBER := 0; -- цена заказа
    discount_p NUMBER; -- скидка
    CURSOR products (ord NUMBER) IS
        SELECT product_uid, quantity, product_price FROM Skvortsov_Ordered_Product
        WHERE order_uid = ord;
BEGIN        
    -- выполняем действия, если обновляется поле status
    IF UPDATING('status') THEN
        -- если заказ переходит в статус "Создан"
        IF :old.status = 'Подготовка' AND :new.status = 'Создан' THEN
            -- Расчитываем суммарный вес заказа
            FOR product IN products(:old.order_uid)
            LOOP
                SELECT weight INTO product_weight FROM Skvortsov_Product
                WHERE product_uid = product.product_uid;

                sum_weight := sum_weight + product_weight * product.quantity;
            END LOOP;

            -- вычисляем стоимость доставки
            :new.delivery_price := delivery_const + delivery_factor * (FLOOR(sum_weight / factor_kg));
        -- если заказ переходит из статуса "Создан"
        ELSIF :old.status = 'Создан' THEN
            :new.created_date := CURRENT_DATE; -- устанавливаем дату создания при переходе из статуса "Создан"
            
            -- вычисляем неделю до неделю после дня рождения
            -- получаем дату рождения клиента
            SELECT birthday INTO client_birthday FROM skvortsov_client
            WHERE login = :old.client_uid;
            
            -- вычисляем разницу между текущим годом и годом рождения клиента
            -- в результате получаем количество месяцев
            dif_year := (EXTRACT(YEAR FROM :new.created_date) - EXTRACT(YEAR FROM client_birthday)) * 12;
            
            -- прибаляем полученные месяца к дате рождения клиента
            -- теперь у даты рождения клиента год тот же, что и теущий
            -- это упростит проверку диапазона
            client_birthday := ADD_MONTHS(client_birthday, dif_year);

            -- вычисляем неделю до и неделю после, относительно дня рождения
            birthday_from := client_birthday - 7;
            birthday_to := client_birthday + 7;

            -- если у клиента день рождение и старая скидка меньше праздничной,
            -- то устанавливаем праздничную скидку
            IF (client_birthday BETWEEN birthday_from AND birthday_to)
            AND :old.discount < birthday_discount THEN
                :new.discount := birthday_discount;
            END IF;

            -- Вычисляем стоимость заказа, чтобы изменить стоимость доставки,
            -- если заказ дороже 3000.
            FOR product IN products(:old.order_uid)
            LOOP
                order_price := order_price + product.product_price;
            END LOOP;

            -- вычисляем стоимость заказа
            discount_p := (1 - NVL(:old.discount, 0) / 100);

            order_price := order_price * discount_p + :new.delivery_price;

            IF order_price > 3000 THEN
                :new.delivery_price := 0;
            END IF;
        -- если заказ отменяют, то проверяем статус заказа
        ELSIF :new.status = 'Отменён' THEN
            IF :old.status IN ('Подготовка', 'Получен') THEN
                DBMS_OUTPUT.PUT_LINE('Заказа в статусе "'||:old.status||' ".');
                RAISE Skvortsov_Store_Package.E_DONT_CANCEL_ORDER;
            END IF;
        END IF;
    END IF;
END;
/

-- Триггер проверяет условия при создании заказа и установке скидки
CREATE OR REPLACE TRIGGER Skvortsov_Tr_Order
BEFORE INSERT OR UPDATE OF discount ON Skvortsov_Order
    FOR EACH ROW
DECLARE
    error_exist BOOLEAN := FALSE;
    client_count NUMBER;
BEGIN
    IF UPDATING('discount') THEN
        IF :new.status != 'Создан' THEN
            DBMS_OUTPUT.PUT_LINE('Невозможно предоставить скидку для заказа со статусом "'||:new.status||'".');
            RAISE Skvortsov_Store_Package.E_INVALID_STATUS_FOR_DISCOUNT;
        END IF;
    ELSIF INSERTING THEN
        IF :new.client_uid IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Поле client_uid не может быть пустым.');
            error_exist := true;
        END IF;
    
        IF :new.payment IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Поле payment не может быть пустым.');
             error_exist := true;
        END IF;
        
        IF error_exist THEN
            RAISE Skvortsov_Store_Package.E_NULL_INPUT_FIELD;
        END IF;
    END IF;
END;
/
