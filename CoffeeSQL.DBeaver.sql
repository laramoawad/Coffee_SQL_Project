-- FIRST CREATE TABLES

-- Create employees table 
CREATE TABLE employees(
	employee_id int PRIMARY KEY, --make sure to add primary keys
	first_name varchar(50),
	last_name varchar (50),
	email varchar(50),
	hire_date date,
	gender varchar(1),
	salary int,
	coffeeshop_id int
);

--create shops table 
CREATE TABLE shops(
	coffeeshop_id int primary key,
	coffeeshop_name varchar(50),
	city_id int
);

--now lets include the foreign keys in the employees table after you created it

ALTER TABLE employees 
ADD foreign key (coffeeshop_id) 
References shops(coffeeshop_id)
On delete set null; --this is just a constraint

--create locations table and add foreign key to shops table

CREATE TABLE locations(
	city_id int primary key,
	city varchar(50),
	country varchar(50)
);

--create table suppliers
ALTER TABLE shops 
Add foreign key (city_id)
References locations(city_id)
On delete set null;

Create table suppliers (
	coffeeshop_id int,
	supplier_name varchar(50),
	coffee_type varchar(50),	
	primary key(coffeeshop_id, supplier_name),
	foreign key(coffeeshop_id) 
	References shops(coffeeshop_id)
	On delete cascade
); 

--After creating tables, now insert values into tables

-- INSERT INTO TABLES =====================================

-- Insert first two entries into employees table
-- Set the coffeeshop_id to NULL for now as we have not inserted the coffeeshop values into the shops table yet
INSERT INTO employees VALUES (501559, 'Carson', 'Mosconi', 'cmosconi0@census.gov', '2015/08/29', 'M', 32973, NULL);
INSERT INTO employees VALUES (144108, 'Khalil', 'Corr', 'kcorr1@github.io', '2014/04/23', 'M', 52802, NULL);

-- Insert the shop with coffeeshop_id = 1 into the shops table
-- Set to city_id to NULL for now as we have not inserted the city values into the locations table yet
INSERT INTO shops VALUES(1, 'Common Grounds', NULL);

-- Now set the coffeeshop_id for the first two employees we inserted to 1
UPDATE employees
SET coffeeshop_id = 1 
WHERE employee_id IN (501559, 144108);

-- Insert Los Angeles into the locations table
INSERT INTO locations VALUES(1, 'Los Angeles', 'United States');

-- Now you can update the city_id in the shops table for coffeeshop_id = 1 to 1
UPDATE shops
SET city_id = 1
WHERE coffeeshop_id = 1;

-- Insert the first two values where coffeeshop_id = 1 into the suppliers table
INSERT INTO suppliers VALUES(1, 'Beans and Barley', 'Arabica');
INSERT INTO suppliers VALUES(1, 'Cool Beans', 'Robusta');


-- Insert into the locations table
INSERT INTO locations VALUES(2, 'New York', 'United States');
INSERT INTO locations VALUES(3, 'London', 'United Kingdom');

-- Insert into the shops table
INSERT INTO shops VALUES(2, 'Early Rise', 2);
INSERT INTO shops VALUES(3, 'Ancient Bean', 3);
INSERT INTO shops VALUES(4, 'Urban Grind', 1);
INSERT INTO shops VALUES(5, 'Trembling Cup', 2);

-- Insert into the suppliers table
INSERT INTO suppliers VALUES(2, 'Vanilla Bean', 'Liberica');
INSERT INTO suppliers VALUES(2, 'Beans and Barley', 'Arabica');
INSERT INTO suppliers VALUES(2, 'Cool Beans', 'Robusta');
INSERT INTO suppliers VALUES(3, 'Bean Me Up', 'Excelsa');
INSERT INTO suppliers VALUES(3, 'Vanilla Bean', 'Liberica');
INSERT INTO suppliers VALUES(3, 'Cool Beans', 'Robusta');
INSERT INTO suppliers VALUES(3, 'Beans and Barley', 'Arabica');
INSERT INTO suppliers VALUES(4, 'Vanilla Bean', 'Liberica');
INSERT INTO suppliers VALUES(4, 'Bean Me Up', 'Excelsa');
INSERT INTO suppliers VALUES(5, 'Beans and Barley', 'Arabica');
INSERT INTO suppliers VALUES(5, 'Vanilla Bean', 'Liberica');
INSERT INTO suppliers VALUES(5, 'Bean Me Up', 'Excelsa');

-- And finally insert all the remaining values into the employees table
INSERT INTO employees VALUES (782284, 'Vilhelmina', 'Rayman', 'vrayman2@jigsy.com', '2015/08/17', 'F', 57855, 2);
INSERT INTO employees VALUES (225709, 'Eleen', 'Tarpey', 'etarpey3@devhub.com', '2016/09/14', 'F', 48048, 3);
INSERT INTO employees VALUES (614903, 'Hamel', 'Grocock', 'hgrocock4@nasa.gov', '2016/03/27', 'M', 66566, 3);
INSERT INTO employees VALUES (590293, 'Frazier', 'Balls', 'fballs5@nydailynews.com', '2021/12/22', 'M', 15235, 3);
INSERT INTO employees VALUES (243999, 'Jeremy', 'Whitlam', 'jwhitlam6@nydailynews.com', '2014/01/21', 'M', 41159, 4);
INSERT INTO employees VALUES (599230, 'Webb', 'Hevey', 'whevey7@wikia.com', '2010/04/27', 'M', 48477, 4);
INSERT INTO employees VALUES (758331, 'Katharine', 'Sexcey', 'ksexcey8@harvard.edu', '2014/07/03', 'F', 23772, 5);
INSERT INTO employees VALUES (561012, 'Barton', 'Lillow', 'blillow9@cam.ac.uk', '2015/08/17', 'M', 15083, 5);
INSERT INTO employees VALUES (938560, 'Samantha', 'Newall', 'snewalla@comsenz.com', '2013/08/10', 'F', 10223, 2);
INSERT INTO employees VALUES (746871, 'Joshua', 'Winscum', 'jwinscumb@sciencedirect.com', '2022/12/29', 'M', 28232, 2);
INSERT INTO employees VALUES (75097, 'Wally', 'Huebner', 'whuebnerc@dmoz.org', '2020/08/30', 'F', 57731, 4);
INSERT INTO employees VALUES (659627, 'Austen', 'Waterhouse', 'awaterhoused@infoseek.co.jp', '2011/06/25', 'M', 32946, 1);
INSERT INTO employees VALUES (755091, 'Clem', 'Kitchingman', 'ckitchingmane@pinterest.com', '2014/07/23', 'M', 46818, 4);
INSERT INTO employees VALUES (925779, 'Pavel', 'Butchard', 'pbutchardf@opera.com', '2016/09/21', 'M', 35003, 5);
INSERT INTO employees VALUES (510410, 'Tarra', 'Rolin', 'troling@omniture.com', '2019/03/21', 'F', 27191, 4);
INSERT INTO employees VALUES (353657, 'Brigham', 'Boucher', 'bboucherh@army.mil', '2016/03/09', 'M', 38899, 2);
INSERT INTO employees VALUES (877425, 'Horten', 'Byre', NULL, '2022/05/21', 'M', 40458, 5);
INSERT INTO employees VALUES (608868, 'Annabelle', 'Ottiwill', 'aottiwillj@wordpress.com', '2016/07/19', 'F', 54857, 5);
INSERT INTO employees VALUES (593979, 'Rockie', 'Meriot', 'rmeriotk@usda.gov', '2011/07/29', 'M', 45651, 4);
INSERT INTO employees VALUES (649417, 'Terese', 'Monshall', 'tmonshalll@miibeian.gov.cn', '2010/02/09', 'F', 13829, 1);
INSERT INTO employees VALUES (125157, 'Bartolomeo', 'Gossage', 'bgossagem@squarespace.com', '2019/03/31', 'M', 17474, 4);
INSERT INTO employees VALUES (891720, 'Amye', 'Dilger', 'adilgern@amazon.com', '2014/12/29', 'F', 63671, 3);
INSERT INTO employees VALUES (826977, 'Lucas', 'Cuphus', NULL, '2021/12/21', 'M', 58566, 5);
INSERT INTO employees VALUES (824952, 'Marja', 'Lacey', NULL, '2010/02/28', 'F', 28628, 5);
INSERT INTO employees VALUES (208729, 'Olenolin', 'Kincla', 'okinclaq@sogou.com', '2017/12/11', 'M', 19570, 2);
INSERT INTO employees VALUES (790257, 'Rab', 'Dafter', 'rdafterr@eventbrite.com', '2022/02/26', 'M', 49327, 1);
INSERT INTO employees VALUES (54960, 'Eachelle', 'Baniard', 'ebaniards@networksolutions.com', '2013/05/12', 'F', 29847, 4);
INSERT INTO employees VALUES (450160, 'Hilary', 'Reeman', 'hreemant@kickstarter.com', '2023/01/11', 'M', 14374, 1);
INSERT INTO employees VALUES (623414, 'Devi', 'Hasell', 'dhasellu@engadget.com', '2021/05/17', 'F', 53462, 5);
INSERT INTO employees VALUES (334855, 'Domingo', 'Mannooch', 'dmannoochv@mit.edu', '2013/04/08', 'M', 12530, 4);
INSERT INTO employees VALUES (185481, 'Kermie', 'Haswell', 'khaswellw@xrea.com', '2016/02/17', 'M', 21871, 2);
INSERT INTO employees VALUES (6027, 'Pattie', 'Piscotti', 'ppiscottix@dedecms.com', '2022/05/10', 'M', 24899, 3);
INSERT INTO employees VALUES (547028, 'Beilul', 'Plaxton', 'bplaxtony@newyorker.com', '2011/12/17', 'F', 63922, 4);
INSERT INTO employees VALUES (275024, 'Marius', 'Matisse', 'mmatissez@marriott.com', '2019/06/08', 'M', 29028, 3);
INSERT INTO employees VALUES (399449, 'Sax', 'Crank', 'scrank10@oakley.com', '2020/08/06', 'M', 16789, 5);
INSERT INTO employees VALUES (572629, 'Linnie', 'Welds', 'lwelds11@businesswire.com', '2011/05/29', 'F', 24491, 3);
INSERT INTO employees VALUES (922844, 'Carlen', 'Louis', 'clouis12@phpbb.com', '2017/01/04', 'F', 20130, 2);
INSERT INTO employees VALUES (126377, 'Terence', 'Braz', 'tbraz13@example.com', '2023/01/04', 'M', 52151, 4);
INSERT INTO employees VALUES (522236, 'Rosemarie', 'Tottman', 'rtottman14@drupal.org', '2015/04/07', 'F', 53672, 2);
INSERT INTO employees VALUES (793404, 'Aili', 'Stowe', NULL, '2014/08/09', 'F', 19337, 1);
INSERT INTO employees VALUES (854959, 'Gustavus', 'Kettlestringe', 'gkettlestringe16@sourceforge.net', '2018/04/11', 'M', 47048, 2);
INSERT INTO employees VALUES (916890, 'Joya', 'Bayldon', 'jbayldon17@google.com.au', '2012/04/07', 'F', 59867, 4);
INSERT INTO employees VALUES (993034, 'Cordell', 'Klyner', 'cklyner18@gravatar.com', '2016/06/14', 'M', 39090, 4);
INSERT INTO employees VALUES (821081, 'Bucky', 'Meus', 'bmeus19@devhub.com', '2021/01/12', 'M', 44966, 1);
INSERT INTO employees VALUES (713118, 'Dante', 'Kinsley', 'dkinsley1a@oaic.gov.au', '2014/03/01', 'M', 53438, 5);
INSERT INTO employees VALUES (232690, 'Pincas', 'Mariotte', 'pmariotte1b@reuters.com', '2018/12/08', 'M', 63860, 1);
INSERT INTO employees VALUES (848972, 'Maxy', 'Bruggeman', 'mbruggeman1c@home.pl', '2015/03/31', 'F', 56670, 3);
INSERT INTO employees VALUES (702218, 'Eliza', 'Gonzalo', NULL, '2022/12/11', 'F', 61276, 5);
INSERT INTO employees VALUES (193281, 'Auberta', 'Greves', 'agreves1e@wikispaces.com', '2012/07/06', 'F', 54698, 1);
INSERT INTO employees VALUES (820775, 'Keary', 'Buckham', 'kbuckham1f@newyorker.com', '2014/06/30', 'M', 13056, 1);
INSERT INTO employees VALUES (124550, 'Nichole', 'Shaves', 'nshaves1g@bbc.co.uk', '2017/10/04', 'M', 14098, 3);
INSERT INTO employees VALUES (906768, 'Midge', 'Selley', 'mselley1h@cdbaby.com', '2011/10/29', 'F', 49148, 3);
INSERT INTO employees VALUES (344711, 'Vyky', 'Brandin', 'vbrandin1i@drupal.org', '2015/08/19', 'F', 47615, 5);
INSERT INTO employees VALUES (254781, 'Mirilla', 'Madgin', 'mmadgin1j@senate.gov', '2014/12/21', 'F', 42029, 3);
INSERT INTO employees VALUES (979102, 'Linnell', 'McCorrie', 'lmccorrie1k@opensource.org', '2019/06/25', 'F', 54432, 3);
INSERT INTO employees VALUES (515315, 'Mair', 'Philpin', 'mphilpin1l@php.net', '2014/01/18', 'F', 21938, 1);
INSERT INTO employees VALUES (815230, 'Rockie', 'Simionato', NULL, '2016/01/23', 'M', 19016, 5);
INSERT INTO employees VALUES (577294, 'Estevan', 'Wornum', NULL, '2011/02/27', 'M', 64490, 1);
INSERT INTO employees VALUES (431537, 'Tiffi', 'Iceton', 'ticeton1o@weather.com', '2020/03/26', 'F', 26733, 4);
INSERT INTO employees VALUES (117778, 'Lorianna', 'Tomei', NULL, '2021/06/18', 'F', 52865, 3);
INSERT INTO employees VALUES (725760, 'Paxton', 'Nequest', NULL, '2019/09/02', 'M', 17484, 1);
INSERT INTO employees VALUES (141019, 'Willi', 'Croshaw', NULL, '2019/02/06', 'M', 39386, 2);
INSERT INTO employees VALUES (851333, 'Bayard', 'Draco', 'bdraco1s@goodreads.com', '2016/08/03', 'M', 53150, 3);
INSERT INTO employees VALUES (843152, 'Annamaria', 'Jaggli', 'ajaggli1t@icio.us', '2019/05/17', 'F', 63304, 5);
INSERT INTO employees VALUES (351573, 'Renee', 'Holywell', 'rholywell1u@sourceforge.net', '2020/10/03', 'F', 44446, 5);
INSERT INTO employees VALUES (416988, 'Kara-lynn', 'Handmore', 'khandmore1v@princeton.edu', '2012/09/05', 'F', 23141, 2);
INSERT INTO employees VALUES (561390, 'Constantine', 'Conibere', NULL, '2020/08/17', 'M', 33441, 1);
INSERT INTO employees VALUES (986129, 'Ned', 'Castellanos', 'ncastellanos1x@hostgator.com', '2016/05/28', 'M', 65317, 1);
INSERT INTO employees VALUES (570551, 'Debbi', 'Rubinowitsch', 'drubinowitsch1y@blinklist.com', '2015/06/02', 'F', 33923, 2);
INSERT INTO employees VALUES (425650, 'Gillian', 'Sallows', 'gsallows1z@bigcartel.com', '2016/02/01', 'F', 23942, 5);
INSERT INTO employees VALUES (826752, 'Sigismund', 'Gasquoine', 'sgasquoine20@barnesandnoble.com', '2014/07/29', 'M', 18307, 3);
INSERT INTO employees VALUES (829064, 'Gayle', 'Brotherhead', 'gbrotherhead21@addthis.com', '2014/03/26', 'F', 24779, 4);
INSERT INTO employees VALUES (574030, 'Bernardina', 'Moynihan', 'bmoynihan22@sakura.ne.jp', '2011/08/20', 'F', 51090, 5);
INSERT INTO employees VALUES (896725, 'Kalil', 'Lomansey', 'klomansey23@unblog.fr', '2020/07/24', 'M', 17137, 2);
INSERT INTO employees VALUES (291934, 'Giacopo', 'McGilmartin', 'gmcgilmartin24@goodreads.com', '2017/05/30', 'M', 32536, 3);
INSERT INTO employees VALUES (359412, 'Everett', 'Iowarch', 'eiowarch25@sun.com', '2018/10/10', 'M', 40608, 3);
INSERT INTO employees VALUES (846944, 'Gabrielle', 'Ornils', NULL, '2015/01/24', 'F', 47640, 2);
INSERT INTO employees VALUES (156210, 'Geralda', 'Harbard', 'gharbard27@1und1.de', '2013/02/28', 'F', 11879, 2);
INSERT INTO employees VALUES (858668, 'Wright', 'Jermy', NULL, '2021/12/30', 'M', 51818, 1);
INSERT INTO employees VALUES (67821, 'Freda', 'Garret', NULL, '2017/07/27', 'F', 48342, 3);
INSERT INTO employees VALUES (524027, 'Evania', 'Scudder', 'escudder2a@whitehouse.gov', '2020/12/22', 'F', 33070, 2);
INSERT INTO employees VALUES (692995, 'Mack', 'Manifould', 'mmanifould2b@oakley.com', '2016/04/19', 'M', 59980, 4);
INSERT INTO employees VALUES (56797, 'Kayla', 'Rannald', 'krannald2c@hud.gov', '2023/01/19', 'F', 61458, 3);
INSERT INTO employees VALUES (76970, 'Letta', 'Maben', NULL, '2013/09/14', 'F', 62430, 3);
INSERT INTO employees VALUES (203309, 'Anet', 'Barbour', 'abarbour2e@techcrunch.com', '2015/06/26', 'F', 36925, 2);
INSERT INTO employees VALUES (268488, 'Eddie', 'Tilbey', 'etilbey2f@histats.com', '2016/03/25', 'F', 20704, 2);
INSERT INTO employees VALUES (781695, 'Lester', 'Yvon', NULL, '2018/08/01', 'M', 29493, 3);
INSERT INTO employees VALUES (840378, 'Abner', 'Groger', 'agroger2h@cisco.com', '2019/02/21', 'M', 36486, 4);
INSERT INTO employees VALUES (774024, 'Brittaney', 'Danielut', 'bdanielut2i@google.nl', '2012/07/14', 'F', 56661, 5);
INSERT INTO employees VALUES (563056, 'Dionysus', 'MacKey', 'dmackey2j@zdnet.com', '2011/11/11', 'M', 19582, 5);
INSERT INTO employees VALUES (299859, 'Marcela', 'Pickance', 'mpickance2k@t.co', '2015/07/21', 'F', 27192, 4);
INSERT INTO employees VALUES (771294, 'Merl', 'Hurt', 'mhurt2l@t-online.de', '2020/07/15', 'F', 27769, 1);
INSERT INTO employees VALUES (439567, 'Kerwin', 'Lindgren', 'klindgren2m@arstechnica.com', '2014/04/20', 'M', 33729, 2);
INSERT INTO employees VALUES (534463, 'Cori', 'Keyme', 'ckeyme2n@pen.io', '2012/09/08', 'M', 34868, 5);
INSERT INTO employees VALUES (19375, 'Flem', 'Boultwood', 'fboultwood2o@howstuffworks.com', '2021/01/20', 'M', 65749, 5);
INSERT INTO employees VALUES (314377, 'Germain', 'Cookes', 'gcookes2p@gravatar.com', '2013/08/02', 'F', 35305, 5);
INSERT INTO employees VALUES (522478, 'Flo', 'Blackstone', 'fblackstone2q@earthlink.net', '2016/12/29', 'F', 28400, 4);
INSERT INTO employees VALUES (251626, 'Arty', 'Machent', 'amachent2r@pbs.org', '2010/08/23', 'M', 19703, 1);
INSERT INTO employees VALUES (406236, 'Cordey', 'Syms', NULL, '2018/02/15', 'F', 55827, 4);
INSERT INTO employees VALUES (181482, 'Jacenta', 'Bettinson', 'jbettinson2t@sourceforge.net', '2019/01/25', 'F', 57914, 1);
INSERT INTO employees VALUES (816384, 'Ozzie', 'Barles', 'obarles2u@a8.net', '2017/09/19', 'M', 42101, 4);
INSERT INTO employees VALUES (110412, 'Weber', 'Euston', 'weuston2v@cafepress.com', '2015/06/07', 'M', 50998, 2);
INSERT INTO employees VALUES (633934, 'Kimberley', 'Vautin', 'kvautin2w@prweb.com', '2014/08/31', 'F', 56669, 1);
INSERT INTO employees VALUES (355765, 'Barn', 'Trafford', 'btrafford2x@google.nl', '2017/10/15', 'M', 56133, 3);
INSERT INTO employees VALUES (309142, 'Ronny', 'Melby', 'rmelby2y@yelp.com', '2018/06/29', 'F', 28687, 4);
INSERT INTO employees VALUES (296806, 'Roxana', 'Lawrey', NULL, '2021/12/25', 'F', 62462, 5);
INSERT INTO employees VALUES (76929, 'Lynnea', 'OGlessane', 'loglessane30@delicious.com', '2022/01/26', 'F', 32713, 4);
INSERT INTO employees VALUES (303506, 'Abie', 'Farnfield', NULL, '2014/04/28', 'M', 40902, 3);
INSERT INTO employees VALUES (135610, 'Debora', 'Skudder', 'dskudder32@ft.com', '2014/04/02', 'F', 66803, 3);
INSERT INTO employees VALUES (11749, 'Bourke', 'Kiddy', 'bkiddy33@tripadvisor.com', '2022/03/26', 'M', 38039, 2);
INSERT INTO employees VALUES (735083, 'Ebony', 'Whelpton', NULL, '2013/08/13', 'F', 42693, 2);
INSERT INTO employees VALUES (146073, 'Morna', 'Lerway', 'mlerway35@rambler.ru', '2017/08/04', 'F', 36449, 2);
INSERT INTO employees VALUES (814743, 'Mathilde', 'Tesdale', 'mtesdale36@goo.gl', '2021/01/13', 'F', 31024, 4);
INSERT INTO employees VALUES (247341, 'Hayyim', 'Dimont', 'hdimont37@kickstarter.com', '2011/07/05', 'M', 57826, 4);
INSERT INTO employees VALUES (578451, 'Murvyn', 'Lanney', 'mlanney38@squarespace.com', '2018/02/09', 'M', 56011, 1);
INSERT INTO employees VALUES (627284, 'Haydon', 'McGaffey', 'hmcgaffey39@istockphoto.com', '2016/09/24', 'M', 42111, 5);
INSERT INTO employees VALUES (779083, 'Lucian', 'Whittleton', 'lwhittleton3a@jiathis.com', '2011/08/25', 'M', 27921, 3);
INSERT INTO employees VALUES (313438, 'Thurstan', 'Slisby', 'tslisby3b@fema.gov', '2018/04/03', 'M', 32878, 2);
INSERT INTO employees VALUES (82224, 'Perry', 'Bewshaw', NULL, '2021/06/13', 'M', 43545, 2);
INSERT INTO employees VALUES (264536, 'Zahara', 'Corser', 'zcorser3d@taobao.com', '2012/04/24', 'F', 55712, 2);
INSERT INTO employees VALUES (45644, 'Shaine', 'Franiak', 'sfraniak3e@xrea.com', '2017/05/22', 'M', 51179, 3);
INSERT INTO employees VALUES (954371, 'Jacki', 'Voff', 'jvoff3f@gmpg.org', '2011/10/18', 'F', 27217, 5);
INSERT INTO employees VALUES (141206, 'Finn', 'Rook', 'frook3g@plala.or.jp', '2019/01/31', 'M', 50667, 2);
INSERT INTO employees VALUES (267670, 'Krystalle', 'Tortoishell', 'ktortoishell3h@ocn.ne.jp', '2011/06/11', 'F', 16320, 5);
INSERT INTO employees VALUES (591441, 'Isidore', 'Grigoriev', NULL, '2014/11/14', 'M', 30644, 2);
INSERT INTO employees VALUES (59526, 'Flora', 'Phebey', 'fphebey3j@nationalgeographic.com', '2015/11/28', 'F', 44981, 4);
INSERT INTO employees VALUES (460366, 'Sibyl', 'Davidescu', 'sdavidescu3k@amazon.com', '2014/11/15', 'F', 47639, 3);
INSERT INTO employees VALUES (341009, 'Jacquelyn', 'State', 'jstate3l@umich.edu', '2013/08/12', 'F', 37021, 3);
INSERT INTO employees VALUES (503156, 'Julita', 'Gelly', 'jgelly3m@woothemes.com', '2016/09/11', 'F', 66837, 1);
INSERT INTO employees VALUES (891944, 'Garvin', 'Davidy', 'gdavidy3n@topsy.com', '2022/07/16', 'M', 55793, 1);
INSERT INTO employees VALUES (721059, 'Merci', 'Nussey', 'mnussey3o@imdb.com', '2012/06/07', 'F', 25991, 1);
INSERT INTO employees VALUES (298069, 'Wren', 'Kenrick', NULL, '2016/09/28', 'F', 14046, 4);
INSERT INTO employees VALUES (953770, 'Claudelle', 'Bynold', 'cbynold3q@symantec.com', '2012/03/03', 'F', 32550, 2);
INSERT INTO employees VALUES (164315, 'Homer', 'Sear', 'hsear3r@weibo.com', '2012/04/17', 'M', 26946, 5);
INSERT INTO employees VALUES (327894, 'Adelice', 'Nazareth', 'anazareth3s@yelp.com', '2011/04/24', 'F', 56877, 1);
INSERT INTO employees VALUES (5642, 'Margaux', 'Lembcke', 'mlembcke3t@theguardian.com', '2016/06/21', 'F', 11778, 5);
INSERT INTO employees VALUES (220691, 'Bernelle', 'Lacoste', 'blacoste3u@studiopress.com', '2015/01/01', 'F', 41560, 3);
INSERT INTO employees VALUES (498390, 'Vikky', 'Caswell', NULL, '2019/02/22', 'F', 22659, 1);
INSERT INTO employees VALUES (189665, 'Maddy', 'Janouch', 'mjanouch3w@icio.us', '2015/12/05', 'M', 50384, 4);
INSERT INTO employees VALUES (221890, 'Bliss', 'Whitecross', NULL, '2018/05/18', 'F', 24871, 4);
INSERT INTO employees VALUES (237255, 'Giorgi', 'Mignot', 'gmignot3y@lulu.com', '2022/07/11', 'M', 51983, 4);
INSERT INTO employees VALUES (92481, 'Sherrie', 'Titman', NULL, '2014/04/06', 'F', 18894, 5);
INSERT INTO employees VALUES (468001, 'Evvie', 'Cotterell', 'ecotterell40@google.co.uk', '2018/06/20', 'F', 16390, 2);
INSERT INTO employees VALUES (814214, 'Stephine', 'Cicccitti', 'scicccitti41@baidu.com', '2018/07/13', 'F', 35309, 3);
INSERT INTO employees VALUES (78629, 'Daniele', 'Pickthall', 'dpickthall42@ox.ac.uk', '2013/12/30', 'F', 60276, 5);
INSERT INTO employees VALUES (201598, 'Leigha', 'Cullin', NULL, '2017/05/10', 'F', 12094, 3);
INSERT INTO employees VALUES (473470, 'Baudoin', 'Ramsdale', 'bramsdale44@nbcnews.com', '2012/12/14', 'M', 56870, 2);
INSERT INTO employees VALUES (741578, 'Maxie', 'Bulled', 'mbulled45@redcross.org', '2020/01/03', 'M', 48422, 5);
INSERT INTO employees VALUES (712090, 'Georg', 'Sibbons', 'gsibbons46@blogger.com', '2012/03/21', 'M', 30415, 5);
INSERT INTO employees VALUES (668586, 'Collette', 'Schwandner', 'cschwandner47@bloomberg.com', '2017/02/06', 'F', 46366, 4);
INSERT INTO employees VALUES (297489, 'Travers', 'Baldung', 'tbaldung48@i2i.jp', '2011/12/04', 'M', 11880, 5);
INSERT INTO employees VALUES (542379, 'Bertha', 'Brocking', 'bbrocking49@taobao.com', '2013/03/07', 'F', 58477, 4);
INSERT INTO employees VALUES (241480, 'Boothe', 'Skule', NULL, '2021/12/23', 'M', 33355, 2);
INSERT INTO employees VALUES (855941, 'Gwenny', 'Thurby', 'gthurby4b@bbc.co.uk', '2016/03/02', 'F', 15971, 2);
INSERT INTO employees VALUES (786243, 'Ansley', 'ODonnell', 'aodonnell4c@loc.gov', '2014/01/20', 'F', 10466, 5);
INSERT INTO employees VALUES (512102, 'Katrine', 'Rochell', 'krochell4d@wikispaces.com', '2013/03/06', 'F', 24967, 4);
INSERT INTO employees VALUES (255742, 'Kelvin', 'Camelia', 'kcamelia4e@soundcloud.com', '2017/04/09', 'M', 40002, 5);
INSERT INTO employees VALUES (39561, 'Purcell', 'Dillintone', 'pdillintone4f@ft.com', '2022/04/10', 'M', 13372, 2);
INSERT INTO employees VALUES (136795, 'Danit', 'Pacht', 'dpacht4g@nymag.com', '2021/02/03', 'F', 21420, 3);
INSERT INTO employees VALUES (557343, 'Belle', 'Kem', 'bkem4h@hexun.com', '2021/02/13', 'F', 14360, 2);
INSERT INTO employees VALUES (480613, 'Orion', 'Cokly', 'ocokly4i@virginia.edu', '2012/03/21', 'M', 56785, 3);
INSERT INTO employees VALUES (373569, 'Louella', 'Edlin', 'ledlin4j@purevolume.com', '2018/01/04', 'F', 56112, 1);
INSERT INTO employees VALUES (744451, 'Sydney', 'Durward', 'sdurward4k@joomla.org', '2023/04/04', 'F', 41382, 4);
INSERT INTO employees VALUES (770630, 'Caria', 'Gerg', NULL, '2013/04/30', 'F', 19040, 5);
INSERT INTO employees VALUES (124076, 'Marcie', 'McKnockiter', 'mmcknockiter4m@independent.co.uk', '2019/01/14', 'F', 63476, 4);
INSERT INTO employees VALUES (517970, 'Calley', 'Seamon', 'cseamon4n@jugem.jp', '2019/11/16', 'F', 19608, 5);
INSERT INTO employees VALUES (879562, 'Fiann', 'Gubbins', 'fgubbins4o@dmoz.org', '2020/01/06', 'F', 62273, 3);
INSERT INTO employees VALUES (424028, 'Tam', 'Pinchbeck', 'tpinchbeck4p@shop-pro.jp', '2018/08/26', 'M', 34330, 2);
INSERT INTO employees VALUES (72729, 'Isabella', 'Izhak', 'iizhak4q@facebook.com', '2019/12/16', 'F', 11991, 3);
INSERT INTO employees VALUES (978201, 'Granger', 'Hully', 'ghully4r@nytimes.com', '2021/01/04', 'M', 32387, 1);
INSERT INTO employees VALUES (612781, 'Farrand', 'Tumpane', 'ftumpane4s@1und1.de', '2011/08/12', 'F', 11965, 4);
INSERT INTO employees VALUES (154744, 'Noel', 'Sapir', NULL, '2014/10/22', 'F', 18370, 4);
INSERT INTO employees VALUES (492531, 'Carmina', 'Grieswood', 'cgrieswood4u@diigo.com', '2022/04/24', 'F', 17007, 4);
INSERT INTO employees VALUES (776952, 'Alick', 'Sambrook', 'asambrook4v@xrea.com', '2021/03/27', 'M', 59638, 1);
INSERT INTO employees VALUES (89869, 'Julio', 'Clemerson', 'jclemerson4w@marketwatch.com', '2013/04/16', 'M', 38829, 4);
INSERT INTO employees VALUES (905729, 'Mellisent', 'Allot', 'mallot4x@nytimes.com', '2012/10/22', 'F', 16126, 5);
INSERT INTO employees VALUES (519735, 'Shari', 'Devonport', 'sdevonport4y@pcworld.com', '2014/06/27', 'F', 52879, 1);
INSERT INTO employees VALUES (287914, 'Hamel', 'Vineall', NULL, '2011/08/08', 'M', 58278, 1);
INSERT INTO employees VALUES (881778, 'Berny', 'Krzyzaniak', 'bkrzyzaniak50@netvibes.com', '2016/07/19', 'M', 59095, 2);
INSERT INTO employees VALUES (668303, 'Lettie', 'Christauffour', 'lchristauffour51@yelp.com', '2011/05/20', 'F', 53830, 1);
INSERT INTO employees VALUES (438933, 'Aubrey', 'Webburn', 'awebburn52@hostgator.com', '2012/12/02', 'F', 58367, 2);
INSERT INTO employees VALUES (182181, 'Arlin', 'Vernay', NULL, '2022/10/29', 'M', 17068, 2);
INSERT INTO employees VALUES (988100, 'Sibylla', 'Fordham', 'sfordham54@shinystat.com', '2021/07/13', 'F', 39946, 3);
INSERT INTO employees VALUES (511470, 'Pate', 'Denness', 'pdenness55@constantcontact.com', '2010/11/07', 'M', 37567, 2);
INSERT INTO employees VALUES (552104, 'Chickie', 'Attaway', 'cattaway56@bravesites.com', '2018/07/03', 'M', 34702, 5);
INSERT INTO employees VALUES (43663, 'Doug', 'Sogg', 'dsogg57@house.gov', '2017/12/10', 'M', 12586, 4);
INSERT INTO employees VALUES (923916, 'Butch', 'Bichard', 'bbichard58@plala.or.jp', '2023/02/10', 'M', 10875, 3);
INSERT INTO employees VALUES (263003, 'Maybelle', 'Twiggins', 'mtwiggins59@nymag.com', '2014/06/01', 'F', 13216, 3);
INSERT INTO employees VALUES (407248, 'Lionel', 'Po', 'lpo5a@ucoz.ru', '2022/12/03', 'M', 42997, 4);
INSERT INTO employees VALUES (996837, 'Norene', 'Bonnick', NULL, '2017/08/17', 'F', 63340, 2);
INSERT INTO employees VALUES (261401, 'Lizette', 'Dominetti', 'ldominetti5c@chron.com', '2016/01/19', 'F', 15416, 4);
INSERT INTO employees VALUES (515402, 'Natalee', 'Rohfsen', NULL, '2022/10/31', 'F', 61694, 2);
INSERT INTO employees VALUES (299527, 'Felice', 'Mooring', NULL, '2010/02/12', 'F', 19639, 5);
INSERT INTO employees VALUES (146381, 'Stinky', 'Tyt', NULL, '2018/09/06', 'M', 33835, 2);
INSERT INTO employees VALUES (323891, 'Ryon', 'Kislingbury', NULL, '2022/02/08', 'M', 33139, 3);
INSERT INTO employees VALUES (130514, 'Raddie', 'Lishmund', 'rlishmund5h@hud.gov', '2020/10/18', 'M', 59407, 1);
INSERT INTO employees VALUES (295409, 'Paco', 'Eick', 'peick5i@nasa.gov', '2020/04/17', 'M', 59607, 2);
INSERT INTO employees VALUES (500970, 'Rebbecca', 'Karpychev', 'rkarpychev5j@com.com', '2021/04/27', 'F', 16014, 4);
INSERT INTO employees VALUES (324955, 'Henryetta', 'Landrieu', 'hlandrieu5k@illinois.edu', '2013/02/04', 'F', 53993, 2);
INSERT INTO employees VALUES (334640, 'Lurette', 'Luthwood', 'lluthwood5l@istockphoto.com', '2016/08/04', 'F', 40792, 1);
INSERT INTO employees VALUES (811551, 'Cob', 'Lynes', 'clynes5m@nydailynews.com', '2019/12/05', 'M', 23383, 4);
INSERT INTO employees VALUES (82410, 'Fitz', 'Pigrome', 'fpigrome5n@1688.com', '2021/09/16', 'M', 12977, 4);
INSERT INTO employees VALUES (457051, 'Sasha', 'Peal', 'speal5o@phoca.cz', '2012/10/21', 'M', 62312, 2);
INSERT INTO employees VALUES (53481, 'Danice', 'Burlingame', 'dburlingame5p@csmonitor.com', '2011/03/20', 'F', 29087, 1);
INSERT INTO employees VALUES (305710, 'Aigneis', 'Rasper', NULL, '2022/09/18', 'F', 40737, 2);
INSERT INTO employees VALUES (285530, 'Domenic', 'Kemster', 'dkemster5r@4shared.com', '2015/02/20', 'M', 32815, 4);
INSERT INTO employees VALUES (606334, 'Olav', 'Mulqueen', 'omulqueen5s@eepurl.com', '2019/02/17', 'M', 13916, 4);
INSERT INTO employees VALUES (427804, 'Liesa', 'Nias', NULL, '2021/02/14', 'F', 34441, 1);
INSERT INTO employees VALUES (47063, 'Ugo', 'Landre', 'ulandre5u@hubpages.com', '2017/11/10', 'M', 18500, 3);
INSERT INTO employees VALUES (978808, 'Rudy', 'Skillman', NULL, '2019/10/25', 'M', 66460, 4);
INSERT INTO employees VALUES (307775, 'Lucky', 'Guite', 'lguite5w@aol.com', '2020/10/30', 'F', 64469, 3);
INSERT INTO employees VALUES (646872, 'Phillis', 'Keast', 'pkeast5x@ucoz.com', '2018/03/23', 'F', 65958, 2);
INSERT INTO employees VALUES (777255, 'Eb', 'Duesberry', 'eduesberry5y@hud.gov', '2016/08/17', 'M', 25788, 2);
INSERT INTO employees VALUES (161059, 'Silvano', 'Mowsley', 'smowsley5z@tmall.com', '2021/11/08', 'M', 29626, 4);
INSERT INTO employees VALUES (463845, 'Rupert', 'Walrond', NULL, '2011/07/04', 'M', 62608, 3);
INSERT INTO employees VALUES (846592, 'Seumas', 'Onge', 'songe61@clickbank.net', '2021/01/24', 'M', 22634, 1);
INSERT INTO employees VALUES (127093, 'Cassius', 'OHanlon', NULL, '2018/12/30', 'M', 37747, 3);
INSERT INTO employees VALUES (671789, 'Deirdre', 'McKillop', 'dmckillop63@goo.gl', '2014/10/28', 'F', 47324, 3);
INSERT INTO employees VALUES (512209, 'Alisha', 'Petheridge', 'apetheridge64@mediafire.com', '2022/08/23', 'F', 13227, 1);
INSERT INTO employees VALUES (555908, 'Jarrett', 'De Cruze', 'jdecruze65@fema.gov', '2017/06/29', 'M', 64244, 3);
INSERT INTO employees VALUES (738650, 'Noble', 'Vahey', 'nvahey66@google.co.jp', '2020/10/05', 'M', 43872, 2);
INSERT INTO employees VALUES (328255, 'Garrick', 'Endricci', 'gendricci67@unblog.fr', '2011/04/12', 'M', 44110, 5);
INSERT INTO employees VALUES (25915, 'Olivier', 'Everley', NULL, '2012/10/19', 'M', 25392, 5);
INSERT INTO employees VALUES (21582, 'Delmore', 'Thickin', 'dthickin69@imageshack.us', '2011/01/11', 'M', 22964, 3);
INSERT INTO employees VALUES (301543, 'Marcello', 'Work', NULL, '2011/10/03', 'M', 57992, 2);
INSERT INTO employees VALUES (214784, 'Buddy', 'Heisham', 'bheisham6b@engadget.com', '2015/06/18', 'M', 32356, 5);
INSERT INTO employees VALUES (169886, 'Rheba', 'Beckhouse', 'rbeckhouse6c@elegantthemes.com', '2015/05/25', 'F', 16661, 4);
INSERT INTO employees VALUES (237532, 'Adey', 'Ayshford', 'aayshford6d@illinois.edu', '2018/03/18', 'F', 19892, 2);
INSERT INTO employees VALUES (155858, 'Shaylynn', 'Yurkov', 'syurkov6e@reddit.com', '2019/08/28', 'F', 44547, 5);
INSERT INTO employees VALUES (333869, 'Oralie', 'Pennuzzi', 'opennuzzi6f@is.gd', '2010/03/29', 'F', 55722, 2);
INSERT INTO employees VALUES (193944, 'Nadiya', 'Vyel', 'nvyel6g@edublogs.org', '2017/12/12', 'F', 43953, 3);
INSERT INTO employees VALUES (747298, 'Giacinta', 'Spaice', 'gspaice6h@alibaba.com', '2018/07/29', 'F', 40236, 4);
INSERT INTO employees VALUES (755773, 'Melisande', 'Jennings', 'mjennings6i@dailymail.co.uk', '2018/05/29', 'F', 41795, 1);
INSERT INTO employees VALUES (63525, 'Keir', 'Tampin', 'ktampin6j@topsy.com', '2018/08/16', 'M', 56747, 1);
INSERT INTO employees VALUES (105269, 'Phaedra', 'Piwall', 'ppiwall6k@mlb.com', '2010/06/02', 'F', 44139, 3);
INSERT INTO employees VALUES (767596, 'Veronika', 'Lowle', 'vlowle6l@yahoo.com', '2018/05/26', 'F', 52613, 4);
INSERT INTO employees VALUES (564455, 'Arty', 'Widdicombe', 'awiddicombe6m@skyrock.com', '2015/04/11', 'M', 24869, 3);
INSERT INTO employees VALUES (27637, 'Culver', 'Yakubov', 'cyakubov6n@nydailynews.com', '2018/04/21', 'M', 21725, 2);
INSERT INTO employees VALUES (554094, 'Pandora', 'Royans', 'proyans6o@ezinearticles.com', '2021/03/10', 'F', 50345, 5);
INSERT INTO employees VALUES (257502, 'Celle', 'Chestnut', 'cchestnut6p@trellian.com', '2021/05/23', 'F', 26743, 2);
INSERT INTO employees VALUES (966678, 'Welch', 'Ovens', NULL, '2020/07/09', 'M', 38791, 4);
INSERT INTO employees VALUES (134320, 'Remy', 'Braven', 'rbraven6r@webmd.com', '2014/08/26', 'F', 50582, 5);
INSERT INTO employees VALUES (675833, 'Penny', 'Gelletly', 'pgelletly6s@usatoday.com', '2016/01/26', 'F', 47865, 3);
INSERT INTO employees VALUES (804988, 'Kylen', 'Dollin', 'kdollin6t@sitemeter.com', '2018/11/10', 'F', 12907, 3);
INSERT INTO employees VALUES (63555, 'Laurence', 'Helm', 'lhelm6u@instagram.com', '2022/11/12', 'M', 55780, 3);
INSERT INTO employees VALUES (641060, 'Goldi', 'Morgon', NULL, '2011/09/28', 'F', 23684, 3);
INSERT INTO employees VALUES (654104, 'Betsey', 'Phizackarley', NULL, '2015/06/06', 'F', 55266, 5);
INSERT INTO employees VALUES (684717, 'Evvie', 'Penlington', 'epenlington6x@eepurl.com', '2014/12/01', 'F', 10436, 5);
INSERT INTO employees VALUES (926646, 'Vickie', 'Beamond', 'vbeamond6y@yolasite.com', '2020/11/14', 'F', 34710, 3);
INSERT INTO employees VALUES (476082, 'Merilyn', 'Poure', 'mpoure6z@com.com', '2018/06/06', 'F', 11773, 1);
INSERT INTO employees VALUES (525043, 'Maggy', 'Shervil', 'mshervil70@elegantthemes.com', '2021/04/01', 'F', 59185, 2);
INSERT INTO employees VALUES (847257, 'Guthrey', 'Pennetta', 'gpennetta71@imageshack.us', '2010/04/21', 'M', 15383, 2);
INSERT INTO employees VALUES (743928, 'Nicolette', 'Ibbitt', NULL, '2016/11/26', 'F', 65896, 5);
INSERT INTO employees VALUES (660312, 'Knox', 'Gough', 'kgough73@toplist.cz', '2017/05/01', 'M', 42111, 4);
INSERT INTO employees VALUES (496869, 'Maurine', 'Chad', 'mchad74@go.com', '2010/02/06', 'F', 39072, 5);
INSERT INTO employees VALUES (315275, 'Dory', 'Beacham', 'dbeacham75@yelp.com', '2021/10/10', 'F', 26141, 3);
INSERT INTO employees VALUES (653933, 'Harris', 'Eisold', 'heisold76@google.de', '2012/10/26', 'M', 45340, 1);
INSERT INTO employees VALUES (54400, 'Ferdinande', 'Schanke', NULL, '2017/07/18', 'F', 66802, 1);
INSERT INTO employees VALUES (939898, 'Tremain', 'Broadberry', 'tbroadberry78@nba.com', '2021/08/18', 'M', 63248, 4);
INSERT INTO employees VALUES (522676, 'Dag', 'Spittall', 'dspittall79@narod.ru', '2012/04/15', 'M', 41725, 4);
INSERT INTO employees VALUES (867231, 'Sharity', 'Hefforde', 'shefforde7a@photobucket.com', '2013/01/18', 'F', 51244, 5);
INSERT INTO employees VALUES (972500, 'Tilly', 'Auger', 'tauger7b@youtube.com', '2018/11/28', 'F', 62115, 3);
INSERT INTO employees VALUES (273737, 'Antonie', 'Soaper', 'asoaper7c@ca.gov', '2015/10/02', 'F', 53558, 1);
INSERT INTO employees VALUES (272551, 'Neilla', 'Laurence', 'nlaurence7d@opera.com', '2010/10/29', 'F', 13444, 1);
INSERT INTO employees VALUES (229066, 'Udall', 'Noar', 'unoar7e@sciencedaily.com', '2013/01/20', 'M', 47632, 5);
INSERT INTO employees VALUES (452106, 'Rollin', 'Phillipp', NULL, '2022/05/08', 'M', 33623, 3);
INSERT INTO employees VALUES (624762, 'Ninnette', 'Ledwidge', 'nledwidge7g@t-online.de', '2011/01/21', 'F', 48387, 5);
INSERT INTO employees VALUES (871677, 'Dante', 'Ayris', 'dayris7h@rediff.com', '2015/12/27', 'M', 34333, 3);
INSERT INTO employees VALUES (142635, 'Bendick', 'Gomersall', NULL, '2017/09/27', 'M', 59289, 3);
INSERT INTO employees VALUES (741850, 'Siusan', 'Pottle', 'spottle7j@forbes.com', '2013/12/23', 'F', 26450, 2);
INSERT INTO employees VALUES (80044, 'Nanon', 'Isoldi', NULL, '2018/10/25', 'F', 40209, 2);
INSERT INTO employees VALUES (847100, 'Peadar', 'Sego', 'psego7l@wisc.edu', '2019/04/01', 'M', 31489, 3);
INSERT INTO employees VALUES (239797, 'Tess', 'dEscoffier', NULL, '2020/04/02', 'F', 40021, 3);
INSERT INTO employees VALUES (32034, 'Marie-ann', 'Peake', NULL, '2013/01/18', 'F', 40572, 2);
INSERT INTO employees VALUES (630723, 'Syman', 'Fannon', NULL, '2017/09/09', 'M', 16424, 5);
INSERT INTO employees VALUES (671875, 'Roana', 'Eddisford', 'reddisford7p@photobucket.com', '2013/05/18', 'F', 39741, 5);
INSERT INTO employees VALUES (556112, 'Brinna', 'Loxley', NULL, '2018/01/03', 'F', 25661, 5);
INSERT INTO employees VALUES (431832, 'Malinda', 'Delany', 'mdelany7r@topsy.com', '2017/05/17', 'F', 53793, 2);
INSERT INTO employees VALUES (458735, 'Hewitt', 'Ortner', 'hortner7s@nifty.com', '2015/06/26', 'M', 16745, 1);
INSERT INTO employees VALUES (354823, 'Dolly', 'Joust', 'djoust7t@xing.com', '2022/06/10', 'F', 11531, 5);
INSERT INTO employees VALUES (709027, 'Stern', 'Loyns', 'sloyns7u@webeden.co.uk', '2017/12/16', 'M', 30800, 2);
INSERT INTO employees VALUES (190564, 'Alexina', 'O Concannon', 'aoconcannon7v@people.com.cn', '2017/12/15', 'F', 37542, 2);
INSERT INTO employees VALUES (914376, 'Ivar', 'Tonkin', 'itonkin7w@biblegateway.com', '2018/10/03', 'M', 39774, 4);
INSERT INTO employees VALUES (729137, 'Lura', 'Stockman', NULL, '2010/04/13', 'F', 23985, 2);
INSERT INTO employees VALUES (282692, 'Toby', 'Ellison', 'tellison7y@adobe.com', '2023/01/23', 'M', 12917, 4);
INSERT INTO employees VALUES (537625, 'Orelie', 'Tiddy', 'otiddy7z@java.com', '2013/08/27', 'F', 49211, 5);
INSERT INTO employees VALUES (858765, 'Daria', 'Smitten', 'dsmitten80@google.com.hk', '2019/08/24', 'F', 12709, 3);
INSERT INTO employees VALUES (249536, 'Austine', 'Benge', 'abenge81@tiny.cc', '2017/07/01', 'F', 67539, 4);
INSERT INTO employees VALUES (543218, 'Sylvan', 'Thurnham', 'sthurnham82@jigsy.com', '2018/09/08', 'M', 59530, 1);
INSERT INTO employees VALUES (147158, 'Koren', 'Bassick', NULL, '2022/08/13', 'F', 27948, 2);
INSERT INTO employees VALUES (930160, 'Pauly', 'Stelli', 'pstelli84@businessinsider.com', '2012/05/06', 'F', 15047, 3);
INSERT INTO employees VALUES (822721, 'Jeri', 'Aldersey', NULL, '2023/01/06', 'F', 17328, 3);
INSERT INTO employees VALUES (685707, 'Claudio', 'Eaves', 'ceaves86@freewebs.com', '2020/11/25', 'M', 17730, 4);
INSERT INTO employees VALUES (227334, 'Tisha', 'Shellcross', 'tshellcross87@ameblo.jp', '2016/06/16', 'F', 41574, 2);
INSERT INTO employees VALUES (570832, 'Audy', 'Syme', 'asyme88@hao123.com', '2019/01/10', 'F', 47236, 4);
INSERT INTO employees VALUES (694039, 'Fernando', 'Gaymar', 'fgaymar89@webnode.com', '2012/10/19', 'M', 62121, 5);
INSERT INTO employees VALUES (628388, 'Mara', 'Blore', 'mblore8a@miitbeian.gov.cn', '2012/06/06', 'F', 39215, 3);
INSERT INTO employees VALUES (968587, 'Rhys', 'Menlove', 'rmenlove8b@cbc.ca', '2014/12/07', 'M', 32844, 2);
INSERT INTO employees VALUES (62610, 'Desmond', 'Brocking', 'dbrocking8c@nature.com', '2019/12/07', 'M', 31582, 5);
INSERT INTO employees VALUES (462755, 'Adelina', 'Hubbucks', 'ahubbucks8d@dot.gov', '2012/08/26', 'F', 40296, 4);
INSERT INTO employees VALUES (16027, 'Julianne', 'Eastbrook', 'jeastbrook8e@archive.org', '2010/08/07', 'F', 33049, 3);
INSERT INTO employees VALUES (563860, 'Gayel', 'Skilling', 'gskilling8f@japanpost.jp', '2017/12/16', 'F', 25218, 1);
INSERT INTO employees VALUES (886110, 'Loralie', 'Jehu', NULL, '2013/07/05', 'F', 55651, 3);
INSERT INTO employees VALUES (440381, 'Marielle', 'Lathleiffure', 'mlathleiffure8h@ask.com', '2019/07/02', 'F', 59029, 1);
INSERT INTO employees VALUES (872134, 'Janetta', 'Mauchline', NULL, '2019/01/28', 'F', 43720, 1);
INSERT INTO employees VALUES (104366, 'Merv', 'Klammt', 'mklammt8j@cocolog-nifty.com', '2014/12/08', 'M', 20361, 5);
INSERT INTO employees VALUES (473074, 'Phillis', 'ODoohaine', 'podoohaine8k@accuweather.com', '2013/06/19', 'F', 22526, 5);
INSERT INTO employees VALUES (499931, 'Michel', 'Bogaert', 'mbogaert8l@gov.uk', '2010/09/13', 'M', 59062, 2);
INSERT INTO employees VALUES (836666, 'Roberto', 'Spickett', 'rspickett8m@arizona.edu', '2020/12/29', 'M', 60826, 5);
INSERT INTO employees VALUES (479054, 'Austin', 'Durnin', 'adurnin8n@photobucket.com', '2023/01/30', 'M', 14580, 1);
INSERT INTO employees VALUES (240348, 'Raynor', 'Tue', 'rtue8o@dagondesign.com', '2016/10/21', 'M', 49201, 4);
INSERT INTO employees VALUES (888664, 'Hilde', 'Rodmell', 'hrodmell8p@yahoo.com', '2021/05/25', 'F', 12657, 5);
INSERT INTO employees VALUES (69428, 'Alane', 'Bingley', NULL, '2017/01/08', 'F', 22127, 1);
INSERT INTO employees VALUES (830692, 'Hortense', 'O Finan', 'hofinan8r@mail.ru', '2022/02/03', 'F', 55336, 3);
INSERT INTO employees VALUES (874881, 'Salomon', 'Stobbart', 'sstobbart8s@dropbox.com', '2015/02/07', 'M', 17793, 4);
INSERT INTO employees VALUES (549696, 'Lutero', 'Pulster', 'lpulster8t@squarespace.com', '2020/07/06', 'M', 59356, 4);
INSERT INTO employees VALUES (564381, 'Jenine', 'Balassa', 'jbalassa8u@gizmodo.com', '2016/08/15', 'F', 64085, 5);
INSERT INTO employees VALUES (886062, 'Kaleb', 'Noquet', 'knoquet8v@hatena.ne.jp', '2012/02/17', 'M', 38034, 1);
INSERT INTO employees VALUES (268652, 'Vincent', 'Elix', NULL, '2014/01/29', 'M', 19856, 1);
INSERT INTO employees VALUES (954153, 'Merwin', 'De Winton', 'mdewinton8x@arizona.edu', '2022/08/31', 'M', 53443, 2);
INSERT INTO employees VALUES (545287, 'Norbert', 'Scandrick', 'nscandrick8y@plala.or.jp', '2011/08/09', 'M', 41101, 2);
INSERT INTO employees VALUES (410278, 'Sheri', 'Tirone', 'stirone8z@ovh.net', '2016/11/23', 'F', 24745, 5);
INSERT INTO employees VALUES (1764, 'Verney', 'Gravenell', 'vgravenell90@oracle.com', '2021/12/23', 'M', 21392, 2);
INSERT INTO employees VALUES (424594, 'Elka', 'Lamartine', 'elamartine91@forbes.com', '2016/01/05', 'F', 53962, 2);
INSERT INTO employees VALUES (617101, 'Rance', 'Hamber', 'rhamber92@howstuffworks.com', '2020/10/07', 'M', 36306, 2);
INSERT INTO employees VALUES (853157, 'Lorianne', 'Marler', 'lmarler93@hp.com', '2018/05/04', 'F', 37865, 2);
INSERT INTO employees VALUES (145842, 'Dag', 'Finnimore', 'dfinnimore94@msu.edu', '2011/02/05', 'M', 59592, 1);
INSERT INTO employees VALUES (209151, 'Thadeus', 'Kingscote', 'tkingscote95@tinypic.com', '2020/03/21', 'M', 12799, 1);
INSERT INTO employees VALUES (369303, 'Gabbey', 'Moxstead', 'gmoxstead96@dailymail.co.uk', '2016/07/27', 'F', 57687, 3);
INSERT INTO employees VALUES (274333, 'Ruby', 'Quillinane', 'rquillinane97@marriott.com', '2013/07/07', 'M', 10955, 1);
INSERT INTO employees VALUES (140407, 'Melany', 'Nolleth', 'mnolleth98@mac.com', '2017/01/04', 'F', 51420, 1);
INSERT INTO employees VALUES (396613, 'Sharl', 'Mahady', 'smahady99@surveymonkey.com', '2017/08/18', 'F', 54493, 4);
INSERT INTO employees VALUES (599468, 'Betsey', 'Garrals', 'bgarrals9a@salon.com', '2018/06/07', 'F', 21675, 3);
INSERT INTO employees VALUES (907750, 'Hildy', 'Rooze', NULL, '2015/11/22', 'F', 17056, 3);
INSERT INTO employees VALUES (502533, 'Morry', 'McEneny', 'mmceneny9c@house.gov', '2015/07/13', 'M', 44971, 4);
INSERT INTO employees VALUES (830348, 'Jacenta', 'Fraschetti', 'jfraschetti9d@bravesites.com', '2020/10/23', 'F', 54027, 4);
INSERT INTO employees VALUES (396511, 'Doris', 'Bolderoe', NULL, '2012/10/26', 'F', 35458, 3);
INSERT INTO employees VALUES (510219, 'Kalinda', 'Duffield', 'kduffield9f@unicef.org', '2012/06/25', 'F', 42452, 1);
INSERT INTO employees VALUES (491284, 'Dominic', 'Tingley', 'dtingley9g@oakley.com', '2015/03/13', 'M', 13852, 5);
INSERT INTO employees VALUES (883911, 'Zita', 'Ditt', NULL, '2021/06/02', 'F', 27945, 3);
INSERT INTO employees VALUES (908059, 'Onofredo', 'Febvre', 'ofebvre9i@dedecms.com', '2013/03/18', 'M', 61870, 3);
INSERT INTO employees VALUES (971739, 'Hyacinth', 'Gorrie', 'hgorrie9j@ebay.co.uk', '2021/04/27', 'F', 38445, 5);
INSERT INTO employees VALUES (552543, 'Stoddard', 'Stowte', 'sstowte9k@slate.com', '2013/11/20', 'F', 31177, 2);
INSERT INTO employees VALUES (370214, 'Evan', 'Saye', NULL, '2010/01/13', 'M', 65993, 3);
INSERT INTO employees VALUES (10500, 'Bordy', 'Birden', 'bbirden9m@hatena.ne.jp', '2010/08/12', 'M', 19897, 5);
INSERT INTO employees VALUES (997743, 'Rab', 'Garlick', NULL, '2016/09/01', 'M', 44271, 4);
INSERT INTO employees VALUES (161780, 'Halie', 'Girone', 'hgirone9o@barnesandnoble.com', '2011/12/27', 'F', 15396, 2);
INSERT INTO employees VALUES (613658, 'Abbe', 'Bridgeman', 'abridgeman9p@youtube.com', '2020/01/17', 'M', 54684, 4);
INSERT INTO employees VALUES (166509, 'Der', 'Fitzhenry', 'dfitzhenry9q@gravatar.com', '2016/08/04', 'M', 42875, 1);
INSERT INTO employees VALUES (999614, 'Stavros', 'Jurewicz', 'sjurewicz9r@forbes.com', '2021/01/17', 'M', 59133, 5);
INSERT INTO employees VALUES (919650, 'Powell', 'Lillford', 'plillford9s@msn.com', '2014/05/13', 'M', 55620, 3);
INSERT INTO employees VALUES (65849, 'Ruben', 'Lindeman', 'rlindeman9t@jugem.jp', '2013/03/24', 'M', 32034, 3);
INSERT INTO employees VALUES (811703, 'Tedie', 'Antonsen', 'tantonsen9u@dot.gov', '2013/05/11', 'M', 63851, 5);
INSERT INTO employees VALUES (69554, 'Gene', 'Keighly', 'gkeighly9v@infoseek.co.jp', '2014/05/19', 'M', 58060, 4);
INSERT INTO employees VALUES (315234, 'Rowan', 'Ashard', 'rashard9w@macromedia.com', '2019/09/01', 'M', 41379, 1);
INSERT INTO employees VALUES (10771, 'Odelinda', 'Dunnett', 'odunnett9x@nba.com', '2014/07/06', 'F', 51840, 3);
INSERT INTO employees VALUES (577550, 'Alfred', 'Yosifov', NULL, '2019/02/23', 'M', 46137, 1);
INSERT INTO employees VALUES (467651, 'Emylee', 'Webber', 'ewebber9z@prlog.org', '2017/07/28', 'F', 64048, 5);
INSERT INTO employees VALUES (367315, 'Devan', 'Skunes', 'dskunesa0@nih.gov', '2022/10/03', 'F', 44635, 4);
INSERT INTO employees VALUES (597837, 'Reamonn', 'Tuffell', 'rtuffella1@nhs.uk', '2013/09/19', 'M', 29938, 2);
INSERT INTO employees VALUES (5148, 'Irving', 'Tainton', 'itaintona2@cdbaby.com', '2018/04/01', 'M', 46859, 2);
INSERT INTO employees VALUES (303547, 'Rayshell', 'Tomkins', 'rtomkinsa3@upenn.edu', '2018/12/28', 'F', 61177, 2);
INSERT INTO employees VALUES (167471, 'Doralia', 'Boyd', 'dboyda4@ning.com', '2019/05/06', 'F', 16292, 1);
INSERT INTO employees VALUES (435574, 'Ray', 'Pargeter', 'rpargetera5@aol.com', '2017/08/17', 'M', 25843, 5);
INSERT INTO employees VALUES (559611, 'Oralee', 'Spooner', 'ospoonera6@cdc.gov', '2010/04/14', 'F', 33264, 5);
INSERT INTO employees VALUES (847787, 'Mureil', 'Fairbrother', 'mfairbrothera7@dmoz.org', '2014/09/01', 'F', 15285, 5);
INSERT INTO employees VALUES (260019, 'Karrie', 'Margetson', 'kmargetsona8@unc.edu', '2021/04/10', 'F', 54434, 3);
INSERT INTO employees VALUES (757575, 'Ruperta', 'Chatto', NULL, '2023/01/17', 'F', 27063, 5);
INSERT INTO employees VALUES (102934, 'Betti', 'Maddick', 'bmaddickaa@ucoz.com', '2013/01/24', 'F', 53889, 4);
INSERT INTO employees VALUES (923805, 'Samantha', 'Cota', 'scotaab@biblegateway.com', '2020/07/23', 'F', 11225, 4);
INSERT INTO employees VALUES (514583, 'Harriett', 'Ericssen', 'hericssenac@google.ca', '2019/07/09', 'F', 29372, 3);
INSERT INTO employees VALUES (606799, 'Leila', 'MacCafferty', 'lmaccaffertyad@ow.ly', '2021/05/24', 'F', 49409, 2);
INSERT INTO employees VALUES (319378, 'Tobi', 'OConnel', 'toconnelae@cloudflare.com', '2010/01/11', 'F', 32408, 1);
INSERT INTO employees VALUES (56289, 'Enrica', 'Graysmark', 'egraysmarkaf@prnewswire.com', '2017/04/14', 'F', 21803, 4);
INSERT INTO employees VALUES (296287, 'Gerik', 'Siaspinski', NULL, '2014/12/01', 'M', 11892, 5);
INSERT INTO employees VALUES (972512, 'Frants', 'Tosh', 'ftoshah@google.co.jp', '2018/01/10', 'M', 36841, 2);
INSERT INTO employees VALUES (234102, 'Kattie', 'Lynagh', 'klynaghai@posterous.com', '2019/09/06', 'F', 13005, 4);
INSERT INTO employees VALUES (409298, 'Petronille', 'Capelin', 'pcapelinaj@cbslocal.com', '2019/06/22', 'F', 36642, 1);
INSERT INTO employees VALUES (211210, 'Verina', 'De Robertis', 'vderobertisak@upenn.edu', '2020/07/03', 'F', 61872, 5);
INSERT INTO employees VALUES (644270, 'Heall', 'Battie', NULL, '2015/11/07', 'M', 44036, 1);
INSERT INTO employees VALUES (992455, 'Ermin', 'Coomer', 'ecoomeram@sitemeter.com', '2017/06/27', 'M', 30316, 1);
INSERT INTO employees VALUES (589816, 'Fidel', 'Burford', NULL, '2015/09/30', 'M', 28523, 1);
INSERT INTO employees VALUES (418702, 'Babs', 'Weich', NULL, '2018/07/02', 'F', 36561, 2);
INSERT INTO employees VALUES (404384, 'Laurena', 'Renak', 'lrenakap@usatoday.com', '2019/08/29', 'F', 29359, 3);
INSERT INTO employees VALUES (258998, 'Ursala', 'Suckling', NULL, '2010/12/16', 'F', 32316, 5);
INSERT INTO employees VALUES (626942, 'Donica', 'Britzius', 'dbritziusar@umich.edu', '2012/02/12', 'F', 15540, 3);
INSERT INTO employees VALUES (221556, 'Devan', 'Davidescu', 'ddavidescuas@scribd.com', '2019/03/11', 'F', 40374, 4);
INSERT INTO employees VALUES (826175, 'Jeremias', 'McCane', NULL, '2016/05/06', 'M', 50743, 3);
INSERT INTO employees VALUES (812465, 'Adora', 'Billion', 'abillionau@shutterfly.com', '2011/12/29', 'F', 14378, 4);
INSERT INTO employees VALUES (700694, 'Catlin', 'Simmen', 'csimmenav@loc.gov', '2019/05/27', 'F', 20759, 2);
INSERT INTO employees VALUES (598931, 'Con', 'Moir', 'cmoiraw@hostgator.com', '2019/01/02', 'M', 33184, 4);
INSERT INTO employees VALUES (637742, 'Vida', 'Alsopp', 'valsoppax@wp.com', '2021/09/27', 'F', 56433, 4);
INSERT INTO employees VALUES (832172, 'Del', 'Cassell', 'dcassellay@upenn.edu', '2014/02/26', 'F', 59346, 4);
INSERT INTO employees VALUES (208321, 'Elianore', 'Whittuck', 'ewhittuckaz@yale.edu', '2022/11/02', 'F', 25729, 1);
INSERT INTO employees VALUES (257245, 'Melvin', 'Veness', NULL, '2020/01/31', 'M', 28232, 1);
INSERT INTO employees VALUES (61424, 'Danya', 'Ferandez', 'dferandezb1@hhs.gov', '2011/07/16', 'F', 22576, 3);
INSERT INTO employees VALUES (18059, 'Donal', 'Leyburn', 'dleyburnb2@angelfire.com', '2014/09/27', 'M', 56594, 1);
INSERT INTO employees VALUES (655755, 'Barnard', 'MacMickan', 'bmacmickanb3@unblog.fr', '2016/03/04', 'M', 29460, 3);
INSERT INTO employees VALUES (147722, 'Cassandry', 'Baumann', 'cbaumannb4@webmd.com', '2011/04/20', 'F', 46230, 3);
INSERT INTO employees VALUES (592770, 'Ahmed', 'Cornborough', NULL, '2013/09/08', 'M', 58236, 3);
INSERT INTO employees VALUES (860192, 'Dorri', 'Burgwin', 'dburgwinb6@eventbrite.com', '2022/05/08', 'F', 22229, 4);
INSERT INTO employees VALUES (887907, 'Kienan', 'Worral', NULL, '2022/12/23', 'M', 50647, 2);
INSERT INTO employees VALUES (787752, 'Baillie', 'Degenhardt', NULL, '2017/02/21', 'M', 21066, 2);
INSERT INTO employees VALUES (386183, 'Melisandra', 'Barlie', NULL, '2017/05/08', 'F', 14990, 5);
INSERT INTO employees VALUES (621475, 'Elke', 'Pittam', NULL, '2014/11/28', 'F', 55129, 1);
INSERT INTO employees VALUES (466371, 'Roanne', 'Sketch', 'rsketchbb@washington.edu', '2022/01/31', 'F', 42141, 1);
INSERT INTO employees VALUES (700830, 'Clarissa', 'Castelli', 'ccastellibc@slashdot.org', '2018/08/21', 'F', 59785, 3);
INSERT INTO employees VALUES (175312, 'Janela', 'Vidgen', 'jvidgenbd@irs.gov', '2012/04/17', 'F', 11265, 4);
INSERT INTO employees VALUES (582583, 'Samuele', 'Beckhurst', 'sbeckhurstbe@mozilla.org', '2020/11/28', 'M', 39070, 1);
INSERT INTO employees VALUES (165669, 'Yoko', 'Larvent', 'ylarventbf@meetup.com', '2019/09/05', 'F', 21277, 2);
INSERT INTO employees VALUES (955577, 'Lodovico', 'Sherrin', 'lsherrinbg@google.co.jp', '2013/04/27', 'M', 20993, 1);
INSERT INTO employees VALUES (123501, 'Tomi', 'Kermott', 'tkermottbh@sciencedirect.com', '2021/03/08', 'F', 10592, 3);
INSERT INTO employees VALUES (884668, 'Chloris', 'Buntin', 'cbuntinbi@netvibes.com', '2016/02/15', 'F', 38345, 4);
INSERT INTO employees VALUES (301877, 'Leshia', 'Frail', 'lfrailbj@ibm.com', '2010/10/01', 'F', 43427, 1);
INSERT INTO employees VALUES (491388, 'Oneida', 'Easeman', NULL, '2010/12/10', 'F', 32380, 5);
INSERT INTO employees VALUES (273078, 'Betty', 'Markos', NULL, '2011/04/28', 'F', 60557, 4);
INSERT INTO employees VALUES (245528, 'Talya', 'Beaglehole', 'tbeagleholebm@techcrunch.com', '2012/10/17', 'F', 60059, 1);
INSERT INTO employees VALUES (926973, 'Tynan', 'Tolchard', 'ttolchardbn@ebay.com', '2017/12/26', 'M', 35390, 3);
INSERT INTO employees VALUES (113423, 'Malissia', 'MacClinton', 'mmacclintonbo@amazon.com', '2013/11/30', 'F', 40710, 5);
INSERT INTO employees VALUES (817162, 'Leelah', 'Featonby', 'lfeatonbybp@msu.edu', '2013/10/27', 'F', 51841, 1);
INSERT INTO employees VALUES (61081, 'Maurise', 'Lyddiard', 'mlyddiardbq@fema.gov', '2018/06/06', 'F', 15906, 5);
INSERT INTO employees VALUES (455696, 'Ferdie', 'Torrent', NULL, '2013/01/01', 'M', 57219, 2);
INSERT INTO employees VALUES (379675, 'Paxton', 'MacGaughie', 'pmacgaughiebs@cnet.com', '2022/05/06', 'M', 25685, 3);
INSERT INTO employees VALUES (297214, 'Arnaldo', 'Border', NULL, '2019/05/31', 'M', 49515, 4);
INSERT INTO employees VALUES (458697, 'Marcelia', 'Bresson', NULL, '2021/08/10', 'F', 29269, 5);
INSERT INTO employees VALUES (637721, 'Noby', 'Solan', 'nsolanbv@fotki.com', '2020/12/28', 'M', 13286, 4);
INSERT INTO employees VALUES (393090, 'Geri', 'Mulvenna', 'gmulvennabw@storify.com', '2014/09/25', 'F', 21740, 5);
INSERT INTO employees VALUES (734896, 'Dorise', 'Sahlstrom', 'dsahlstrombx@shareasale.com', '2014/07/02', 'F', 57294, 5);
INSERT INTO employees VALUES (742242, 'Pernell', 'Shobbrook', NULL, '2011/02/26', 'M', 38247, 1);
INSERT INTO employees VALUES (90377, 'Orsola', 'Giddons', 'ogiddonsbz@over-blog.com', '2015/08/10', 'F', 12620, 3);
INSERT INTO employees VALUES (119543, 'Hedvig', 'Sharma', 'hsharmac0@yolasite.com', '2019/10/02', 'F', 24291, 5);
INSERT INTO employees VALUES (310693, 'Teddie', 'Itzkovitch', 'titzkovitchc1@moonfruit.com', '2020/08/07', 'M', 11823, 5);
INSERT INTO employees VALUES (727187, 'Bartholomew', 'Oneile', 'boneilec2@hugedomains.com', '2019/03/21', 'M', 55477, 1);
INSERT INTO employees VALUES (355331, 'Cecilia', 'Ardley', 'cardleyc3@senate.gov', '2014/02/14', 'F', 52431, 3);
INSERT INTO employees VALUES (604694, 'Kliment', 'Stert', NULL, '2010/07/06', 'M', 17776, 5);
INSERT INTO employees VALUES (882505, 'Marcello', 'Athy', NULL, '2015/01/18', 'M', 63912, 5);
INSERT INTO employees VALUES (217151, 'Sunny', 'Lurriman', 'slurrimanc6@instagram.com', '2013/12/23', 'M', 62221, 5);
INSERT INTO employees VALUES (12576, 'Dacy', 'McIlwreath', NULL, '2020/04/21', 'F', 18631, 5);
INSERT INTO employees VALUES (814219, 'Zilvia', 'Brackpool', 'zbrackpoolc8@hhs.gov', '2017/10/06', 'F', 20609, 4);
INSERT INTO employees VALUES (428129, 'Talia', 'Shaddick', NULL, '2019/08/03', 'F', 58500, 3);
INSERT INTO employees VALUES (451501, 'Marybeth', 'Farnworth', 'mfarnworthca@oracle.com', '2017/08/16', 'F', 22900, 3);
INSERT INTO employees VALUES (645290, 'Nick', 'Ismirnioglou', 'nismirniogloucb@walmart.com', '2015/04/11', 'M', 29131, 5);
INSERT INTO employees VALUES (305671, 'Purcell', 'Spens', 'pspenscc@ezinearticles.com', '2017/11/04', 'M', 16678, 2);
INSERT INTO employees VALUES (387258, 'Lewie', 'Barbie', 'lbarbiecd@japanpost.jp', '2010/06/29', 'M', 62632, 1);
INSERT INTO employees VALUES (97597, 'Jerrilyn', 'Bruno', 'jbrunoce@businessinsider.com', '2012/03/23', 'F', 59038, 4);
INSERT INTO employees VALUES (19488, 'Dacia', 'Stainton', 'dstaintoncf@xinhuanet.com', '2022/07/19', 'F', 20346, 2);
INSERT INTO employees VALUES (993333, 'Rozelle', 'Reolfi', NULL, '2015/01/25', 'F', 49133, 1);
INSERT INTO employees VALUES (769610, 'Cassandra', 'Deares', 'cdearesch@kickstarter.com', '2019/08/14', 'F', 43651, 1);
INSERT INTO employees VALUES (483626, 'Sumner', 'Gwilliams', 'sgwilliamsci@psu.edu', '2013/12/21', 'M', 60716, 4);
INSERT INTO employees VALUES (186170, 'Heath', 'Pinckstone', 'hpinckstonecj@msn.com', '2015/06/22', 'F', 19624, 1);
INSERT INTO employees VALUES (592641, 'Justis', 'Pirdue', 'jpirdueck@apple.com', '2013/11/08', 'M', 35223, 3);
INSERT INTO employees VALUES (26448, 'Melina', 'Bathersby', NULL, '2022/02/07', 'F', 21618, 4);
INSERT INTO employees VALUES (221894, 'Hilliard', 'Pedrozzi', 'hpedrozzicm@123-reg.co.uk', '2010/06/22', 'M', 30962, 2);
INSERT INTO employees VALUES (113056, 'Aguistin', 'Placide', 'aplacidecn@gravatar.com', '2014/03/24', 'M', 61564, 1);
INSERT INTO employees VALUES (129948, 'Drusie', 'Heustace', NULL, '2022/07/17', 'F', 51648, 5);
INSERT INTO employees VALUES (590805, 'Angeline', 'Coles', 'acolescp@cdc.gov', '2010/10/21', 'F', 28162, 4);
INSERT INTO employees VALUES (901775, 'Merola', 'Husbands', 'mhusbandscq@economist.com', '2018/03/01', 'F', 17256, 4);
INSERT INTO employees VALUES (79553, 'Samuel', 'McGuckin', 'smcguckincr@weather.com', '2016/04/12', 'M', 29795, 1);
INSERT INTO employees VALUES (672090, 'Ashil', 'Hasney', 'ahasneycs@google.cn', '2014/04/21', 'F', 51359, 1);
INSERT INTO employees VALUES (808217, 'Kenon', 'McPhelimey', 'kmcphelimeyct@taobao.com', '2020/06/23', 'M', 45080, 2);
INSERT INTO employees VALUES (354621, 'Ethelin', 'Kleinhausen', NULL, '2015/11/20', 'F', 56378, 4);
INSERT INTO employees VALUES (730132, 'Corabella', 'McGucken', 'cmcguckencv@mac.com', '2012/08/15', 'F', 33095, 4);
INSERT INTO employees VALUES (868352, 'Horatia', 'Calbreath', 'hcalbreathcw@answers.com', '2011/07/26', 'F', 35756, 5);
INSERT INTO employees VALUES (625080, 'Shelden', 'Olivey', 'soliveycx@purevolume.com', '2014/10/24', 'M', 39508, 1);
INSERT INTO employees VALUES (818446, 'Cobby', 'Bascombe', NULL, '2017/05/09', 'M', 11479, 4);
INSERT INTO employees VALUES (413367, 'Corly', 'Libby', NULL, '2020/03/09', 'F', 14485, 5);
INSERT INTO employees VALUES (544558, 'Becki', 'Wadworth', 'bwadworthd0@surveymonkey.com', '2019/08/14', 'F', 42549, 4);
INSERT INTO employees VALUES (765631, 'Chrissy', 'Sancroft', 'csancroftd1@friendfeed.com', '2023/01/15', 'M', 65663, 2);
INSERT INTO employees VALUES (200518, 'Jacques', 'Malarkey', 'jmalarkeyd2@dmoz.org', '2010/03/04', 'M', 39757, 3);
INSERT INTO employees VALUES (451446, 'Lewiss', 'Guswell', 'lguswelld3@edublogs.org', '2021/01/20', 'M', 49597, 4);
INSERT INTO employees VALUES (213719, 'Nealy', 'Shipperbottom', 'nshipperbottomd4@cbslocal.com', '2022/07/28', 'M', 13299, 1);
INSERT INTO employees VALUES (292928, 'Liane', 'Beardwell', 'lbeardwelld5@army.mil', '2015/03/05', 'F', 12557, 2);
INSERT INTO employees VALUES (634188, 'Hermia', 'Bebb', 'hbebbd6@amazon.de', '2010/05/07', 'F', 34830, 5);
INSERT INTO employees VALUES (843062, 'Rosalie', 'Boome', 'rboomed7@ycombinator.com', '2018/05/09', 'F', 22514, 2);
INSERT INTO employees VALUES (522265, 'Dosi', 'Huby', 'dhubyd8@github.io', '2012/08/12', 'F', 19566, 2);
INSERT INTO employees VALUES (842691, 'Goddard', 'Snaddon', 'gsnaddond9@dailymotion.com', '2014/08/24', 'M', 31886, 5);
INSERT INTO employees VALUES (450718, 'Fionnula', 'Gatehouse', 'fgatehouseda@nytimes.com', '2022/05/06', 'F', 27662, 2);
INSERT INTO employees VALUES (711847, 'Jocelin', 'Tieraney', 'jtieraneydb@yahoo.co.jp', '2013/10/24', 'F', 29855, 3);
INSERT INTO employees VALUES (814614, 'Simonne', 'Hatchett', NULL, '2013/03/31', 'F', 13488, 2);
INSERT INTO employees VALUES (13349, 'Alasteir', 'Wison', 'awisondd@vinaora.com', '2011/02/03', 'M', 46402, 2);
INSERT INTO employees VALUES (3854, 'Anni', 'Calderon', 'acalderonde@wisc.edu', '2013/04/28', 'F', 42509, 4);
INSERT INTO employees VALUES (179533, 'Catha', 'Fergie', 'cfergiedf@jimdo.com', '2019/11/30', 'F', 62740, 3);
INSERT INTO employees VALUES (134503, 'Lindsey', 'Hatliff', 'lhatliffdg@scientificamerican.com', '2019/09/15', 'F', 27901, 4);
INSERT INTO employees VALUES (323702, 'Rich', 'Heims', 'rheimsdh@wikipedia.org', '2017/02/05', 'M', 17620, 1);
INSERT INTO employees VALUES (46169, 'Veronike', 'Chicchelli', 'vchicchellidi@4shared.com', '2022/09/27', 'F', 22703, 2);
INSERT INTO employees VALUES (561166, 'Eada', 'Primmer', 'eprimmerdj@vk.com', '2017/07/06', 'F', 46598, 3);
INSERT INTO employees VALUES (909674, 'Brandise', 'Cowland', 'bcowlanddk@icq.com', '2019/01/05', 'F', 47792, 2);
INSERT INTO employees VALUES (278597, 'Trefor', 'Clew', 'tclewdl@tamu.edu', '2022/07/11', 'M', 23626, 4);
INSERT INTO employees VALUES (770040, 'Saunderson', 'Sproson', 'ssprosondm@t.co', '2018/12/05', 'M', 25886, 5);
INSERT INTO employees VALUES (386546, 'Benedicto', 'Wassung', 'bwassungdn@sun.com', '2016/11/14', 'M', 56959, 5);
INSERT INTO employees VALUES (597424, 'Carlie', 'McGillivray', 'cmcgillivraydo@vistaprint.com', '2014/06/13', 'F', 31335, 1);
INSERT INTO employees VALUES (93770, 'Nessa', 'June', 'njunedp@unesco.org', '2021/08/31', 'F', 41492, 1);
INSERT INTO employees VALUES (340638, 'Ban', 'Lowell', 'blowelldq@wufoo.com', '2012/11/25', 'M', 62866, 5);
INSERT INTO employees VALUES (156255, 'Molly', 'Penright', 'mpenrightdr@fda.gov', '2016/02/25', 'F', 21024, 5);
INSERT INTO employees VALUES (41210, 'Gerri', 'Culter', 'gculterds@blinklist.com', '2015/07/27', 'M', 38526, 4);
INSERT INTO employees VALUES (398443, 'Quentin', 'Chalkly', 'qchalklydt@wsj.com', '2012/03/12', 'F', 38767, 1);
INSERT INTO employees VALUES (950016, 'Hayyim', 'Humblestone', NULL, '2023/03/08', 'M', 22292, 2);
INSERT INTO employees VALUES (36295, 'Raynor', 'Hance', 'rhancedv@joomla.org', '2012/12/22', 'M', 17039, 3);
INSERT INTO employees VALUES (304894, 'Renato', 'McNern', NULL, '2016/07/14', 'M', 46213, 2);
INSERT INTO employees VALUES (275505, 'Huntley', 'Lovewell', 'hlovewelldx@tmall.com', '2013/06/24', 'M', 67560, 3);
INSERT INTO employees VALUES (387571, 'Trina', 'Vickery', 'tvickerydy@creativecommons.org', '2017/01/20', 'F', 15446, 3);
INSERT INTO employees VALUES (938454, 'Beitris', 'Brownstein', NULL, '2020/10/23', 'F', 17819, 5);
INSERT INTO employees VALUES (454685, 'Skipp', 'Kyllford', 'skyllforde0@dell.com', '2019/10/13', 'M', 37414, 5);
INSERT INTO employees VALUES (987795, 'Abelard', 'Edinborough', 'aedinboroughe1@stumbleupon.com', '2018/07/17', 'M', 63289, 3);
INSERT INTO employees VALUES (135738, 'Federica', 'Clewett', 'fclewette2@icio.us', '2019/05/15', 'F', 16142, 1);
INSERT INTO employees VALUES (464471, 'Joshua', 'Brickhill', NULL, '2012/06/27', 'M', 52484, 5);
INSERT INTO employees VALUES (832941, 'Kalinda', 'Schollick', 'kschollicke4@flavors.me', '2019/04/28', 'F', 13348, 5);
INSERT INTO employees VALUES (153718, 'Maison', 'Ratcliffe', NULL, '2021/04/21', 'M', 49193, 5);
INSERT INTO employees VALUES (983943, 'Grace', 'Skivington', 'gskivingtone6@google.de', '2012/01/30', 'M', 43412, 1);
INSERT INTO employees VALUES (453869, 'Matty', 'Dolden', 'mdoldene7@example.com', '2020/11/14', 'F', 10681, 4);
INSERT INTO employees VALUES (211931, 'Derrick', 'Kareman', 'dkaremane8@goo.gl', '2017/07/05', 'M', 60834, 3);
INSERT INTO employees VALUES (189553, 'Kincaid', 'Duro', 'kduroe9@skyrock.com', '2020/07/31', 'M', 44138, 4);
INSERT INTO employees VALUES (327219, 'Marlow', 'McGillivray', 'mmcgillivrayea@wikipedia.org', '2018/12/16', 'M', 60136, 3);
INSERT INTO employees VALUES (486538, 'Berget', 'Blakesley', 'bblakesleyeb@geocities.com', '2011/09/21', 'F', 20581, 5);
INSERT INTO employees VALUES (860506, 'Hestia', 'Springate', 'hspringateec@newsvine.com', '2014/02/15', 'F', 58302, 3);
INSERT INTO employees VALUES (449121, 'Vannie', 'Naile', 'vnaileed@pinterest.com', '2022/02/01', 'F', 13439, 4);
INSERT INTO employees VALUES (5550, 'Chandler', 'Baison', 'cbaisonee@irs.gov', '2015/01/03', 'M', 61482, 5);
INSERT INTO employees VALUES (855599, 'Halli', 'Peart', NULL, '2017/11/09', 'F', 42268, 1);
INSERT INTO employees VALUES (131931, 'Tanney', 'Kann', 'tkanneg@vimeo.com', '2013/06/04', 'M', 19883, 4);
INSERT INTO employees VALUES (498580, 'Wilton', 'Samwaye', NULL, '2022/11/11', 'M', 43256, 1);
INSERT INTO employees VALUES (237750, 'Karlie', 'Kitteman', 'kkittemanei@china.com.cn', '2017/08/24', 'F', 11187, 3);
INSERT INTO employees VALUES (847782, 'Glenden', 'Kleinhausen', 'gkleinhausenej@pbs.org', '2011/08/09', 'M', 56374, 1);
INSERT INTO employees VALUES (719542, 'Crystal', 'Harback', 'charbackek@sakura.ne.jp', '2011/11/27', 'F', 11032, 4);
INSERT INTO employees VALUES (744834, 'Kalindi', 'Cromblehome', 'kcromblehomeel@reddit.com', '2021/02/09', 'F', 53223, 1);
INSERT INTO employees VALUES (745522, 'Holly', 'Diter', NULL, '2023/01/15', 'M', 59141, 1);
INSERT INTO employees VALUES (254469, 'Lurline', 'Coppin', 'lcoppinen@fc2.com', '2022/11/16', 'F', 60227, 4);
INSERT INTO employees VALUES (967956, 'Teodoor', 'Counihan', 'tcounihaneo@epa.gov', '2016/02/15', 'M', 66778, 3);
INSERT INTO employees VALUES (117542, 'Gisela', 'Muxworthy', 'gmuxworthyep@nps.gov', '2015/06/08', 'F', 18557, 5);
INSERT INTO employees VALUES (351070, 'Benji', 'Creenan', 'bcreenaneq@about.com', '2016/10/17', 'M', 39845, 5);
INSERT INTO employees VALUES (172709, 'Imelda', 'Laslett', 'ilasletter@themeforest.net', '2019/06/16', 'F', 57701, 3);
INSERT INTO employees VALUES (558066, 'Chrisy', 'Neat', 'cneates@reference.com', '2013/04/30', 'M', 36931, 3);
INSERT INTO employees VALUES (724864, 'Stephanie', 'Portam', 'sportamet@nydailynews.com', '2019/05/26', 'F', 52470, 2);
INSERT INTO employees VALUES (132342, 'Bary', 'Horbath', NULL, '2019/10/29', 'M', 62084, 2);
INSERT INTO employees VALUES (335028, 'Hannie', 'Nouch', 'hnouchev@economist.com', '2018/06/17', 'F', 32814, 4);
INSERT INTO employees VALUES (123607, 'Dewain', 'Seadon', 'dseadonew@people.com.cn', '2011/09/23', 'M', 10447, 4);
INSERT INTO employees VALUES (881896, 'Malinde', 'Dunham', NULL, '2011/09/11', 'F', 23637, 1);
INSERT INTO employees VALUES (869825, 'Remus', 'Mumbeson', 'rmumbesoney@soundcloud.com', '2011/10/30', 'M', 47399, 1);
INSERT INTO employees VALUES (434218, 'Dewitt', 'Paladini', 'dpaladiniez@apache.org', '2010/03/03', 'M', 37106, 5);
INSERT INTO employees VALUES (594316, 'Almire', 'Moir', 'amoirf0@is.gd', '2015/10/30', 'F', 58636, 5);
INSERT INTO employees VALUES (755682, 'Elka', 'Janaszkiewicz', 'ejanaszkiewiczf1@rambler.ru', '2019/10/10', 'F', 27351, 3);
INSERT INTO employees VALUES (506651, 'Steffen', 'Hatcliffe', 'shatcliffef2@reverbnation.com', '2011/09/20', 'M', 52219, 2);
INSERT INTO employees VALUES (310537, 'Gilbertine', 'Whiscard', NULL, '2018/05/14', 'F', 10176, 2);
INSERT INTO employees VALUES (35977, 'Eddi', 'Cureton', 'ecuretonf4@google.ru', '2019/12/07', 'F', 37285, 4);
INSERT INTO employees VALUES (100503, 'Kristoforo', 'Mahomet', 'kmahometf5@hatena.ne.jp', '2015/04/17', 'M', 55286, 5);
INSERT INTO employees VALUES (708172, 'Alaster', 'Demcik', 'ademcikf6@instagram.com', '2013/10/11', 'M', 46401, 3);
INSERT INTO employees VALUES (816499, 'Sarine', 'Keeler', 'skeelerf7@imageshack.us', '2010/08/16', 'F', 17912, 4);
INSERT INTO employees VALUES (313918, 'Luisa', 'Blazek', 'lblazekf8@weather.com', '2019/11/10', 'F', 33199, 4);
INSERT INTO employees VALUES (391271, 'Catherin', 'Miklem', 'cmiklemf9@homestead.com', '2014/09/07', 'F', 64844, 3);
INSERT INTO employees VALUES (157936, 'Fred', 'Goodlett', NULL, '2016/11/12', 'F', 10536, 5);
INSERT INTO employees VALUES (630722, 'Marion', 'Pachta', 'mpachtafb@woothemes.com', '2016/05/07', 'F', 46240, 2);
INSERT INTO employees VALUES (826249, 'Germaine', 'Bustin', 'gbustinfc@google.com.br', '2016/05/17', 'F', 50845, 5);
INSERT INTO employees VALUES (332977, 'Raf', 'Croysdale', 'rcroysdalefd@chronoengine.com', '2023/04/07', 'F', 66713, 5);
INSERT INTO employees VALUES (467929, 'Casie', 'Bathow', NULL, '2012/08/23', 'F', 24465, 2);
INSERT INTO employees VALUES (866387, 'Zsa zsa', 'Delves', 'zdelvesff@mit.edu', '2017/08/10', 'F', 51530, 4);
INSERT INTO employees VALUES (808185, 'Axe', 'Coppledike', NULL, '2010/03/27', 'M', 47015, 1);
INSERT INTO employees VALUES (615625, 'Wilmette', 'Mein', 'wmeinfh@live.com', '2010/09/28', 'F', 59009, 3);
INSERT INTO employees VALUES (310713, 'Ingrid', 'Hudd', 'ihuddfi@google.cn', '2019/10/04', 'F', 30094, 5);
INSERT INTO employees VALUES (139744, 'Ad', 'Thurner', 'athurnerfj@va.gov', '2018/02/01', 'M', 52979, 5);
INSERT INTO employees VALUES (635191, 'Chanda', 'Melwall', 'cmelwallfk@army.mil', '2010/04/25', 'F', 62481, 2);
INSERT INTO employees VALUES (593508, 'Bondon', 'Thying', 'bthyingfl@yolasite.com', '2010/12/29', 'M', 48799, 5);
INSERT INTO employees VALUES (748923, 'Sherlocke', 'Reyson', NULL, '2020/01/22', 'M', 39052, 4);
INSERT INTO employees VALUES (15685, 'Marcile', 'Rustedge', NULL, '2012/03/26', 'F', 34178, 5);
INSERT INTO employees VALUES (163861, 'Torrey', 'Cuerda', NULL, '2020/11/06', 'M', 35558, 2);
INSERT INTO employees VALUES (854769, 'Shena', 'Jerke', 'sjerkefp@zimbio.com', '2010/11/08', 'F', 36226, 5);
INSERT INTO employees VALUES (90861, 'Zonda', 'Lowrey', NULL, '2010/11/21', 'F', 47722, 4);
INSERT INTO employees VALUES (9726, 'Ariel', 'Nasi', 'anasifr@pinterest.com', '2017/06/20', 'F', 43333, 4);
INSERT INTO employees VALUES (295243, 'Enrichetta', 'Bondar', 'ebondarfs@yelp.com', '2015/02/27', 'F', 13131, 5);
INSERT INTO employees VALUES (798766, 'Nicolle', 'Leaton', NULL, '2015/09/02', 'F', 10750, 4);
INSERT INTO employees VALUES (651180, 'Zedekiah', 'McIlrath', 'zmcilrathfu@cbsnews.com', '2021/07/18', 'M', 56030, 2);
INSERT INTO employees VALUES (486450, 'Kerstin', 'Vaugham', 'kvaughamfv@seesaa.net', '2019/12/21', 'F', 33487, 2);
INSERT INTO employees VALUES (637715, 'Meridith', 'Copes', NULL, '2014/06/23', 'F', 14622, 5);
INSERT INTO employees VALUES (402389, 'Jeddy', 'Rickwood', 'jrickwoodfx@auda.org.au', '2021/08/01', 'M', 47168, 4);
INSERT INTO employees VALUES (569041, 'Jacob', 'Conkie', 'jconkiefy@flavors.me', '2015/11/24', 'M', 39309, 2);
INSERT INTO employees VALUES (620328, 'Freeland', 'Sunshine', 'fsunshinefz@vkontakte.ru', '2020/04/13', 'M', 20941, 1);
INSERT INTO employees VALUES (970574, 'Brant', 'Blackwood', 'bblackwoodg0@surveymonkey.com', '2021/04/30', 'M', 26259, 1);
INSERT INTO employees VALUES (421180, 'Vinny', 'Cobain', 'vcobaing1@google.cn', '2021/01/13', 'F', 51962, 4);
INSERT INTO employees VALUES (107135, 'Darrell', 'Bickerstasse', NULL, '2014/06/27', 'M', 43830, 1);
INSERT INTO employees VALUES (765510, 'Gloria', 'Doring', 'gdoringg3@wordpress.org', '2021/11/27', 'F', 10239, 5);
INSERT INTO employees VALUES (783069, 'Thalia', 'Risbrough', NULL, '2015/04/14', 'F', 66706, 2);
INSERT INTO employees VALUES (803743, 'Emmery', 'Dono', 'edonog5@joomla.org', '2022/02/14', 'M', 34099, 2);
INSERT INTO employees VALUES (497207, 'Ceciley', 'Hinckes', 'chinckesg6@nytimes.com', '2018/09/12', 'F', 64441, 1);
INSERT INTO employees VALUES (273501, 'Lothaire', 'Dron', 'ldrong7@about.me', '2017/04/14', 'M', 55887, 4);
INSERT INTO employees VALUES (652424, 'Myrtia', 'Bilbey', 'mbilbeyg8@technorati.com', '2014/02/16', 'F', 14095, 3);
INSERT INTO employees VALUES (944713, 'Rafaelia', 'Letrange', 'rletrangeg9@meetup.com', '2018/02/01', 'F', 55954, 3);
INSERT INTO employees VALUES (594986, 'Gretal', 'Durdy', 'gdurdyga@auda.org.au', '2017/09/16', 'F', 56821, 3);
INSERT INTO employees VALUES (175543, 'Jimmie', 'Red', 'jredgb@walmart.com', '2023/01/14', 'M', 31444, 1);
INSERT INTO employees VALUES (419731, 'Jennee', 'Grieg', NULL, '2016/12/02', 'F', 58298, 1);
INSERT INTO employees VALUES (892896, 'Elvis', 'Buckeridge', 'ebuckeridgegd@narod.ru', '2015/08/08', 'M', 56643, 3);
INSERT INTO employees VALUES (354276, 'Osgood', 'McSporon', 'omcsporonge@macromedia.com', '2012/08/30', 'M', 25815, 1);
INSERT INTO employees VALUES (156830, 'Gill', 'Hedaux', 'ghedauxgf@cargocollective.com', '2010/08/16', 'M', 26023, 1);
INSERT INTO employees VALUES (324525, 'Kellina', 'Beckett', 'kbeckettgg@jugem.jp', '2012/02/15', 'F', 11487, 1);
INSERT INTO employees VALUES (359950, 'Hieronymus', 'Lent', 'hlentgh@360.cn', '2019/04/04', 'M', 46463, 3);
INSERT INTO employees VALUES (59116, 'Dew', 'Blewett', 'dblewettgi@meetup.com', '2019/03/29', 'M', 24109, 5);
INSERT INTO employees VALUES (646102, 'Adolphe', 'Gerleit', 'agerleitgj@google.it', '2017/04/22', 'M', 32326, 3);
INSERT INTO employees VALUES (587471, 'Myron', 'Wagner', 'mwagnergk@engadget.com', '2022/09/11', 'M', 40003, 1);
INSERT INTO employees VALUES (919450, 'Piggy', 'Ralph', NULL, '2016/01/13', 'M', 15175, 1);
INSERT INTO employees VALUES (671138, 'Olvan', 'Mc Gee', 'omcgeegm@harvard.edu', '2022/10/05', 'M', 44233, 4);
INSERT INTO employees VALUES (445855, 'Gregoire', 'Charrette', 'gcharrettegn@sun.com', '2010/09/06', 'M', 27991, 2);
INSERT INTO employees VALUES (620600, 'Morgen', 'Filimore', NULL, '2016/10/12', 'F', 46909, 2);
INSERT INTO employees VALUES (799708, 'Stephie', 'Dene', 'sdenegp@lulu.com', '2011/10/22', 'F', 42467, 3);
INSERT INTO employees VALUES (668661, 'Patrice', 'Gilligan', 'pgilligangq@alexa.com', '2011/06/22', 'M', 50886, 2);
INSERT INTO employees VALUES (950841, 'Micki', 'Orritt', 'morrittgr@bravesites.com', '2022/08/15', 'F', 36441, 1);
INSERT INTO employees VALUES (417716, 'Alexandr', 'Shapero', 'ashaperogs@adobe.com', '2010/09/07', 'M', 25271, 1);
INSERT INTO employees VALUES (164263, 'Nichol', 'Fishbourn', 'nfishbourngt@adobe.com', '2016/09/08', 'F', 59965, 5);
INSERT INTO employees VALUES (14924, 'Timotheus', 'Poynzer', NULL, '2010/03/27', 'M', 37313, 2);
INSERT INTO employees VALUES (62913, 'Dilly', 'Irlam', 'dirlamgv@google.ca', '2015/03/01', 'M', 18225, 2);
INSERT INTO employees VALUES (959207, 'Welch', 'Priddy', 'wpriddygw@latimes.com', '2014/11/21', 'M', 58130, 2);
INSERT INTO employees VALUES (793737, 'Jacintha', 'Gorger', 'jgorgergx@ft.com', '2018/06/09', 'F', 61234, 1);
INSERT INTO employees VALUES (518093, 'Cyrill', 'Gatherer', 'cgatherergy@g.co', '2010/08/25', 'M', 32862, 5);
INSERT INTO employees VALUES (716743, 'Veronique', 'Colaton', 'vcolatongz@t-online.de', '2023/01/01', 'F', 22517, 3);
INSERT INTO employees VALUES (542112, 'Hobey', 'Treace', NULL, '2010/01/01', 'M', 17691, 2);
INSERT INTO employees VALUES (787503, 'Perceval', 'Divis', 'pdivish1@walmart.com', '2013/06/12', 'M', 38291, 4);
INSERT INTO employees VALUES (245433, 'Isidro', 'Hallyburton', 'ihallyburtonh2@dropbox.com', '2017/11/18', 'M', 13622, 5);
INSERT INTO employees VALUES (470426, 'Terrie', 'Wrigley', 'twrigleyh3@bing.com', '2015/12/14', 'F', 28806, 3);
INSERT INTO employees VALUES (8602, 'Beniamino', 'Scurfield', 'bscurfieldh4@vistaprint.com', '2015/08/22', 'M', 47434, 3);
INSERT INTO employees VALUES (785386, 'Tiffani', 'Bausmann', 'tbausmannh5@weebly.com', '2023/02/16', 'F', 46956, 2);
INSERT INTO employees VALUES (612524, 'Sinclare', 'Dauber', NULL, '2014/12/26', 'M', 14690, 1);
INSERT INTO employees VALUES (432995, 'Ludovika', 'Deplacido', 'ldeplacidoh7@paypal.com', '2015/02/08', 'F', 56758, 1);
INSERT INTO employees VALUES (249748, 'Deanne', 'Fenwick', 'dfenwickh8@tinyurl.com', '2013/07/06', 'F', 28056, 2);
INSERT INTO employees VALUES (595180, 'Pinchas', 'Kubat', 'pkubath9@opera.com', '2014/05/03', 'M', 30379, 2);
INSERT INTO employees VALUES (464881, 'Bibbie', 'Greader', 'bgreaderha@nifty.com', '2010/04/21', 'F', 40058, 5);
INSERT INTO employees VALUES (34311, 'Chase', 'Mundell', NULL, '2018/06/27', 'M', 37543, 3);
INSERT INTO employees VALUES (747112, 'Donnie', 'Collop', NULL, '2013/10/20', 'F', 23580, 1);
INSERT INTO employees VALUES (979671, 'Zared', 'Ortes', NULL, '2022/01/26', 'M', 26551, 1);
INSERT INTO employees VALUES (404429, 'Eleonore', 'Mewha', 'emewhahe@ucsd.edu', '2020/05/26', 'F', 44551, 3);
INSERT INTO employees VALUES (74978, 'Adrianna', 'Joselson', 'ajoselsonhf@economist.com', '2021/08/31', 'F', 67233, 4);
INSERT INTO employees VALUES (559473, 'Julian', 'Wapol', 'jwapolhg@homestead.com', '2012/06/02', 'M', 17203, 4);
INSERT INTO employees VALUES (582550, 'Enid', 'Blackford', 'eblackfordhh@ezinearticles.com', '2011/10/31', 'F', 45268, 3);
INSERT INTO employees VALUES (525308, 'Ginnie', 'Carwithim', 'gcarwithimhi@free.fr', '2011/02/05', 'F', 16148, 4);
INSERT INTO employees VALUES (360950, 'Garret', 'Croy', 'gcroyhj@wufoo.com', '2018/01/18', 'M', 55533, 1);
INSERT INTO employees VALUES (589399, 'Dulcia', 'Lansly', 'dlanslyhk@yelp.com', '2020/05/01', 'F', 19444, 2);
INSERT INTO employees VALUES (323241, 'Moishe', 'Lowrie', NULL, '2022/05/15', 'M', 19475, 3);
INSERT INTO employees VALUES (342871, 'Michale', 'Vickerstaff', 'mvickerstaffhm@pen.io', '2019/05/07', 'M', 15815, 5);
INSERT INTO employees VALUES (608725, 'Clio', 'Durn', 'cdurnhn@census.gov', '2016/08/06', 'F', 19295, 5);
INSERT INTO employees VALUES (493973, 'Caz', 'Wilbud', 'cwilbudho@google.nl', '2020/12/11', 'M', 36422, 4);
INSERT INTO employees VALUES (700469, 'Giraud', 'Lawless', 'glawlesshp@over-blog.com', '2017/10/22', 'M', 23785, 4);
INSERT INTO employees VALUES (395480, 'Westley', 'Ivatt', 'wivatthq@reddit.com', '2022/07/31', 'M', 32473, 5);
INSERT INTO employees VALUES (102669, 'Davina', 'Middle', 'dmiddlehr@123-reg.co.uk', '2021/05/19', 'F', 15855, 1);
INSERT INTO employees VALUES (232949, 'Adamo', 'Ucceli', 'auccelihs@aol.com', '2018/08/09', 'M', 41865, 3);
INSERT INTO employees VALUES (515109, 'Tiphany', 'Purviss', 'tpurvissht@army.mil', '2015/08/15', 'F', 32868, 3);
INSERT INTO employees VALUES (912492, 'Morgana', 'Fairnie', 'mfairniehu@usatoday.com', '2022/03/22', 'F', 44294, 5);
INSERT INTO employees VALUES (748158, 'Melania', 'Harryman', 'mharrymanhv@baidu.com', '2012/01/19', 'F', 49895, 5);
INSERT INTO employees VALUES (616206, 'Vachel', 'Wolstencroft', 'vwolstencrofthw@tmall.com', '2018/05/06', 'M', 23341, 4);
INSERT INTO employees VALUES (158724, 'Franny', 'Hearse', NULL, '2015/10/03', 'M', 35958, 4);
INSERT INTO employees VALUES (863973, 'Henry', 'Roggers', NULL, '2020/07/15', 'M', 63579, 5);
INSERT INTO employees VALUES (523732, 'Seamus', 'Blaine', 'sblainehz@cbc.ca', '2014/08/18', 'M', 62820, 3);
INSERT INTO employees VALUES (321329, 'Irita', 'Stripp', 'istrippi0@amazon.co.uk', '2021/04/03', 'F', 66760, 4);
INSERT INTO employees VALUES (861461, 'Carmen', 'Wormleighton', 'cwormleightoni1@sphinn.com', '2020/01/15', 'F', 52340, 1);
INSERT INTO employees VALUES (529529, 'Lorens', 'Swate', 'lswatei2@nps.gov', '2010/07/28', 'M', 63641, 4);
INSERT INTO employees VALUES (631157, 'Brana', 'McVeigh', NULL, '2020/11/30', 'F', 62672, 3);
INSERT INTO employees VALUES (187780, 'Laurene', 'Bolton', 'lboltoni4@google.cn', '2014/09/23', 'F', 61120, 3);
INSERT INTO employees VALUES (858375, 'Rori', 'Tissell', 'rtisselli5@cnet.com', '2023/03/16', 'F', 49360, 3);
INSERT INTO employees VALUES (732060, 'Neill', 'Armsden', NULL, '2021/08/17', 'M', 66717, 5);
INSERT INTO employees VALUES (506602, 'Gerry', 'Forrest', 'gforresti7@posterous.com', '2012/05/09', 'M', 62054, 2);
INSERT INTO employees VALUES (406077, 'Wolfgang', 'Banner', NULL, '2016/09/08', 'M', 51241, 5);
INSERT INTO employees VALUES (805834, 'Opal', 'Catterick', NULL, '2018/02/17', 'F', 28427, 3);
INSERT INTO employees VALUES (259028, 'Ebba', 'Josifovic', 'ejosifovicia@ning.com', '2014/07/23', 'F', 23238, 3);
INSERT INTO employees VALUES (534562, 'Britney', 'Bamborough', NULL, '2012/03/16', 'F', 16707, 3);
INSERT INTO employees VALUES (502267, 'Dante', 'Wodeland', 'dwodelandic@epa.gov', '2015/10/23', 'M', 34098, 1);
INSERT INTO employees VALUES (931198, 'Merrill', 'Farnall', 'mfarnallid@joomla.org', '2019/12/21', 'M', 59784, 1);
INSERT INTO employees VALUES (778565, 'Cristobal', 'Taw', 'ctawie@arizona.edu', '2019/04/30', 'M', 21687, 3);
INSERT INTO employees VALUES (699486, 'Roi', 'Comolli', 'rcomolliif@amazonaws.com', '2012/11/21', 'M', 54417, 3);
INSERT INTO employees VALUES (530603, 'Denys', 'Martignoni', NULL, '2021/07/11', 'M', 26426, 4);
INSERT INTO employees VALUES (806042, 'Gardner', 'Kellie', NULL, '2018/12/31', 'M', 45825, 3);
INSERT INTO employees VALUES (618919, 'Cecil', 'Jerok', 'cjerokii@census.gov', '2016/10/21', 'M', 25520, 5);
INSERT INTO employees VALUES (127160, 'Katerine', 'Valance', NULL, '2020/01/26', 'F', 46351, 5);
INSERT INTO employees VALUES (566058, 'Early', 'Nicklin', 'enicklinik@hibu.com', '2014/12/06', 'M', 49207, 1);
INSERT INTO employees VALUES (409762, 'Rodrique', 'Bonny', 'rbonnyil@ifeng.com', '2020/09/05', 'M', 48959, 4);
INSERT INTO employees VALUES (976291, 'Montgomery', 'Matzl', 'mmatzlim@bravesites.com', '2022/01/25', 'M', 65991, 5);
INSERT INTO employees VALUES (798789, 'Mercedes', 'Diggar', 'mdiggarin@prweb.com', '2017/08/13', 'F', 39831, 3);
INSERT INTO employees VALUES (748433, 'Rosalyn', 'Tonbye', 'rtonbyeio@github.com', '2019/11/18', 'F', 42763, 4);
INSERT INTO employees VALUES (954781, 'Chip', 'Smallcombe', 'csmallcombeip@meetup.com', '2021/09/06', 'M', 37142, 3);
INSERT INTO employees VALUES (105042, 'Isahella', 'de Glanville', 'ideglanvilleiq@marriott.com', '2013/11/14', 'F', 62866, 4);
INSERT INTO employees VALUES (377984, 'Hogan', 'Fenby', 'hfenbyir@nyu.edu', '2019/08/19', 'M', 21473, 5);
INSERT INTO employees VALUES (650959, 'Berny', 'Methingam', 'bmethingamis@mozilla.org', '2013/01/15', 'F', 52416, 3);
INSERT INTO employees VALUES (990424, 'Jillayne', 'Tattersfield', 'jtattersfieldit@bloglines.com', '2014/01/13', 'F', 45123, 5);
INSERT INTO employees VALUES (520879, 'Germaine', 'Guppy', NULL, '2010/06/11', 'M', 41699, 5);
INSERT INTO employees VALUES (556250, 'Mikaela', 'Widdowson', 'mwiddowsoniv@desdev.cn', '2022/03/18', 'F', 60880, 4);
INSERT INTO employees VALUES (627106, 'Cherise', 'Balazs', 'cbalazsiw@histats.com', '2016/06/16', 'F', 33534, 3);
INSERT INTO employees VALUES (956367, 'Perice', 'Tenaunt', 'ptenauntix@npr.org', '2015/03/13', 'M', 30917, 3);
INSERT INTO employees VALUES (702386, 'Abigael', 'Goodere', 'agoodereiy@bloglovin.com', '2014/06/22', 'F', 16301, 3);
INSERT INTO employees VALUES (36466, 'Marie', 'Trebbett', 'mtrebbettiz@mayoclinic.com', '2014/11/09', 'F', 15996, 1);
INSERT INTO employees VALUES (652646, 'Claiborne', 'McVaugh', 'cmcvaughj0@bloomberg.com', '2017/09/17', 'M', 64876, 1);
INSERT INTO employees VALUES (555720, 'Stormi', 'Howselee', 'showseleej1@yolasite.com', '2022/05/06', 'F', 13954, 3);
INSERT INTO employees VALUES (39112, 'May', 'Leverentz', 'mleverentzj2@arizona.edu', '2020/07/17', 'F', 31655, 3);
INSERT INTO employees VALUES (143397, 'Aggy', 'Oaks', 'aoaksj3@nytimes.com', '2012/03/24', 'F', 28991, 4);
INSERT INTO employees VALUES (96037, 'Rennie', 'Bignell', NULL, '2017/09/30', 'F', 38250, 4);
INSERT INTO employees VALUES (164960, 'Arv', 'Garnsworthy', 'agarnsworthyj5@baidu.com', '2019/07/16', 'M', 42491, 1);
INSERT INTO employees VALUES (692097, 'Roland', 'Morison', 'rmorisonj6@issuu.com', '2016/07/19', 'M', 30456, 4);
INSERT INTO employees VALUES (599702, 'Kara', 'Dohms', 'kdohmsj7@freewebs.com', '2021/07/02', 'F', 52859, 1);
INSERT INTO employees VALUES (241001, 'Arel', 'De Biaggi', NULL, '2023/03/28', 'M', 10718, 5);
INSERT INTO employees VALUES (638204, 'Killian', 'Gillett', 'kgillettj9@reuters.com', '2019/08/15', 'M', 58768, 1);
INSERT INTO employees VALUES (910638, 'Eustace', 'Pimerick', 'epimerickja@multiply.com', '2014/12/09', 'M', 24229, 2);
INSERT INTO employees VALUES (522088, 'Peterus', 'Bruggen', NULL, '2010/11/26', 'M', 34398, 3);
INSERT INTO employees VALUES (826290, 'Mickey', 'Harwood', 'mharwoodjc@purevolume.com', '2018/12/12', 'M', 19980, 4);
INSERT INTO employees VALUES (976042, 'Harrietta', 'Rolstone', 'hrolstonejd@archive.org', '2014/04/29', 'F', 16433, 3);
INSERT INTO employees VALUES (891871, 'Reine', 'Caney', NULL, '2022/08/15', 'F', 19468, 5);
INSERT INTO employees VALUES (408159, 'Damiano', 'Philips', 'dphilipsjf@gizmodo.com', '2013/07/11', 'M', 39440, 1);
INSERT INTO employees VALUES (216158, 'Chryste', 'Flinders', 'cflindersjg@google.co.jp', '2016/07/30', 'F', 40540, 3);
INSERT INTO employees VALUES (331440, 'Charley', 'Schulze', 'cschulzejh@dyndns.org', '2016/08/14', 'M', 33509, 3);
INSERT INTO employees VALUES (29282, 'Jaquith', 'Merwood', 'jmerwoodji@wikimedia.org', '2019/12/24', 'F', 17473, 5);
INSERT INTO employees VALUES (289575, 'Milo', 'Eglese', NULL, '2016/03/10', 'M', 26489, 5);
INSERT INTO employees VALUES (515502, 'Harper', 'Dale', 'hdalejk@github.com', '2012/10/11', 'M', 48827, 5);
INSERT INTO employees VALUES (361422, 'Riccardo', 'Pariso', 'rparisojl@msn.com', '2019/02/23', 'M', 13661, 5);
INSERT INTO employees VALUES (952773, 'Emmett', 'Crowne', 'ecrownejm@barnesandnoble.com', '2018/06/20', 'M', 45879, 3);
INSERT INTO employees VALUES (647839, 'Gusella', 'Bolan', 'gbolanjn@shutterfly.com', '2011/08/20', 'F', 16757, 1);
INSERT INTO employees VALUES (207906, 'Itch', 'Schild', 'ischildjo@aol.com', '2012/02/25', 'M', 42280, 5);
INSERT INTO employees VALUES (856421, 'Doralynn', 'Billison', 'dbillisonjp@trellian.com', '2018/08/15', 'F', 52247, 2);
INSERT INTO employees VALUES (973657, 'Rosaleen', 'Parham', 'rparhamjq@timesonline.co.uk', '2021/05/03', 'F', 46000, 3);
INSERT INTO employees VALUES (187531, 'Reidar', 'Alishoner', 'ralishonerjr@bandcamp.com', '2019/12/20', 'M', 33439, 4);
INSERT INTO employees VALUES (240742, 'Claudette', 'Alwen', 'calwenjs@wikipedia.org', '2016/04/29', 'F', 15209, 5);
INSERT INTO employees VALUES (290971, 'Janean', 'Mecco', NULL, '2020/10/21', 'F', 36405, 5);
INSERT INTO employees VALUES (540056, 'Vick', 'Frift', 'vfriftju@harvard.edu', '2012/08/08', 'M', 58856, 2);
INSERT INTO employees VALUES (779807, 'Amerigo', 'McGivena', 'amcgivenajv@globo.com', '2018/04/22', 'M', 38968, 2);
INSERT INTO employees VALUES (6566, 'Darin', 'Hackley', 'dhackleyjw@surveymonkey.com', '2013/04/07', 'M', 44092, 3);
INSERT INTO employees VALUES (859912, 'Freddy', 'Copnell', NULL, '2016/11/28', 'M', 44599, 3);
INSERT INTO employees VALUES (886814, 'Penelopa', 'Housden', 'phousdenjy@oracle.com', '2010/07/31', 'F', 21072, 1);
INSERT INTO employees VALUES (816011, 'Read', 'Asplen', 'rasplenjz@free.fr', '2019/09/04', 'M', 28645, 5);
INSERT INTO employees VALUES (149668, 'Lorelei', 'Trever', 'ltreverk0@sina.com.cn', '2021/06/15', 'F', 39093, 4);
INSERT INTO employees VALUES (263968, 'Isidore', 'Beckey', NULL, '2010/10/13', 'M', 51314, 3);
INSERT INTO employees VALUES (821497, 'Cyb', 'Hurley', 'churleyk2@youku.com', '2012/07/19', 'F', 66402, 4);
INSERT INTO employees VALUES (869063, 'Ichabod', 'Durno', 'idurnok3@unblog.fr', '2021/10/21', 'M', 29070, 3);
INSERT INTO employees VALUES (971313, 'Conney', 'Critchlow', NULL, '2017/09/18', 'M', 65762, 5);
INSERT INTO employees VALUES (719706, 'Maurine', 'Gavey', 'mgaveyk5@amazon.co.uk', '2014/12/01', 'F', 61948, 2);
INSERT INTO employees VALUES (300026, 'Heinrik', 'Hek', 'hhekk6@unc.edu', '2019/08/28', 'M', 37128, 4);
INSERT INTO employees VALUES (320343, 'Prudi', 'Revance', 'prevancek7@friendfeed.com', '2010/07/20', 'F', 31815, 2);
INSERT INTO employees VALUES (596597, 'Caleb', 'Lenox', 'clenoxk8@house.gov', '2016/01/12', 'M', 42806, 2);
INSERT INTO employees VALUES (389520, 'Junia', 'Frankum', 'jfrankumk9@thetimes.co.uk', '2019/01/08', 'F', 21192, 2);
INSERT INTO employees VALUES (239969, 'Berrie', 'Satterley', 'bsatterleyka@un.org', '2013/02/10', 'F', 10753, 4);
INSERT INTO employees VALUES (622649, 'Kellia', 'Jarrett', 'kjarrettkb@ezinearticles.com', '2017/07/26', 'F', 12321, 5);
INSERT INTO employees VALUES (12147, 'Rees', 'Murford', 'rmurfordkc@icq.com', '2013/11/14', 'M', 40378, 4);
INSERT INTO employees VALUES (591208, 'Cristobal', 'Lower', 'clowerkd@cnn.com', '2015/09/19', 'M', 28023, 3);
INSERT INTO employees VALUES (159254, 'Benton', 'Schusterl', 'bschusterlke@people.com.cn', '2018/06/02', 'M', 26976, 3);
INSERT INTO employees VALUES (215123, 'Natala', 'Shekle', 'nsheklekf@uol.com.br', '2020/08/27', 'F', 14375, 5);
INSERT INTO employees VALUES (3681, 'Marwin', 'Berkowitz', 'mberkowitzkg@blog.com', '2019/06/09', 'M', 30413, 4);
INSERT INTO employees VALUES (348834, 'Alfons', 'McPhillimey', 'amcphillimeykh@amazon.com', '2011/03/22', 'M', 19142, 5);
INSERT INTO employees VALUES (670432, 'Derron', 'Noriega', 'dnoriegaki@e-recht24.de', '2015/08/11', 'M', 42667, 5);
INSERT INTO employees VALUES (232837, 'Meghann', 'Eilhermann', NULL, '2017/11/04', 'F', 13263, 2);
INSERT INTO employees VALUES (356335, 'Gabriell', 'Drakers', 'gdrakerskk@odnoklassniki.ru', '2018/10/02', 'F', 34253, 1);
INSERT INTO employees VALUES (88069, 'Stevy', 'Liffe', 'sliffekl@independent.co.uk', '2015/03/12', 'M', 59321, 5);
INSERT INTO employees VALUES (604020, 'Sherrie', 'Laidler', NULL, '2010/01/23', 'F', 12905, 4);
INSERT INTO employees VALUES (700274, 'Ingra', 'Cassel', 'icasselkn@jugem.jp', '2020/09/21', 'M', 27452, 2);
INSERT INTO employees VALUES (88687, 'Doralia', 'OKerin', 'dokerinko@dmoz.org', '2011/01/25', 'F', 25809, 1);
INSERT INTO employees VALUES (451681, 'Vince', 'Sodory', 'vsodorykp@bloglines.com', '2015/12/26', 'M', 40070, 2);
INSERT INTO employees VALUES (435437, 'Oliver', 'Sapwell', 'osapwellkq@yellowbook.com', '2015/07/20', 'M', 25813, 1);
INSERT INTO employees VALUES (3599, 'Rooney', 'Livingstone', 'rlivingstonekr@nymag.com', '2017/03/14', 'M', 46257, 3);
INSERT INTO employees VALUES (342817, 'Adorne', 'Zahor', NULL, '2012/11/07', 'F', 55589, 1);
INSERT INTO employees VALUES (929467, 'Brit', 'Wainman', 'bwainmankt@zimbio.com', '2020/10/11', 'F', 50471, 1);
INSERT INTO employees VALUES (458176, 'Zsa zsa', 'Tout', 'ztoutku@shinystat.com', '2014/04/18', 'F', 47119, 3);
INSERT INTO employees VALUES (180138, 'Rochester', 'Grewer', NULL, '2021/07/19', 'M', 44394, 3);
INSERT INTO employees VALUES (332933, 'Wat', 'Wallbank', 'wwallbankkw@squidoo.com', '2017/12/18', 'M', 52745, 4);
INSERT INTO employees VALUES (243037, 'Nalani', 'Karleman', 'nkarlemankx@msn.com', '2021/06/28', 'F', 46438, 4);
INSERT INTO employees VALUES (807772, 'Launce', 'MacFadzan', NULL, '2019/03/01', 'M', 33872, 1);
INSERT INTO employees VALUES (148257, 'Jacintha', 'Lightoller', 'jlightollerkz@ucsd.edu', '2013/05/27', 'F', 36458, 2);
INSERT INTO employees VALUES (624702, 'Martie', 'Pally', 'mpallyl0@webnode.com', '2011/02/17', 'M', 33336, 5);
INSERT INTO employees VALUES (246006, 'Harriett', 'Entwisle', NULL, '2014/10/01', 'F', 24231, 2);
INSERT INTO employees VALUES (689086, 'Loria', 'Jillions', NULL, '2022/04/12', 'F', 61583, 1);
INSERT INTO employees VALUES (431992, 'Nani', 'Drysdall', 'ndrysdalll3@deliciousdays.com', '2013/01/10', 'F', 21500, 2);
INSERT INTO employees VALUES (794258, 'Genia', 'McGarrity', 'gmcgarrityl4@independent.co.uk', '2020/05/26', 'F', 29371, 1);
INSERT INTO employees VALUES (670668, 'Rand', 'Crimin', NULL, '2018/09/18', 'M', 14345, 1);
INSERT INTO employees VALUES (26531, 'Claudell', 'Maha', 'cmahal6@symantec.com', '2010/09/29', 'M', 10934, 2);
INSERT INTO employees VALUES (386702, 'Worthy', 'Giottini', 'wgiottinil7@harvard.edu', '2016/07/19', 'M', 23167, 4);
INSERT INTO employees VALUES (754546, 'Osbourne', 'Muck', NULL, '2020/10/06', 'M', 31007, 1);
INSERT INTO employees VALUES (65934, 'Rufus', 'Siburn', 'rsiburnl9@edublogs.org', '2022/10/06', 'M', 17334, 4);
INSERT INTO employees VALUES (197582, 'Joceline', 'Geertsen', 'jgeertsenla@domainmarket.com', '2021/07/10', 'F', 43944, 3);
INSERT INTO employees VALUES (796836, 'Candice', 'Darnbrook', NULL, '2019/05/31', 'F', 17292, 3);
INSERT INTO employees VALUES (641429, 'Sheela', 'Courtes', 'scourteslc@epa.gov', '2011/03/09', 'F', 58651, 4);
INSERT INTO employees VALUES (391269, 'Averil', 'Capstick', 'acapstickld@geocities.com', '2013/09/10', 'M', 54908, 5);
INSERT INTO employees VALUES (519338, 'Sargent', 'Stollard', 'sstollardle@bandcamp.com', '2017/04/06', 'M', 57960, 1);
INSERT INTO employees VALUES (615880, 'Lemar', 'Cotgrove', 'lcotgrovelf@mac.com', '2022/03/09', 'M', 10220, 5);
INSERT INTO employees VALUES (252050, 'Regan', 'Gerram', 'rgerramlg@constantcontact.com', '2021/10/15', 'F', 53756, 4);
INSERT INTO employees VALUES (248669, 'Helen', 'Goodby', 'hgoodbylh@google.com.hk', '2011/10/14', 'F', 49891, 3);
INSERT INTO employees VALUES (801385, 'Bendix', 'Baton', NULL, '2012/07/27', 'M', 52398, 4);
INSERT INTO employees VALUES (339442, 'Otho', 'Matzke', 'omatzkelj@sina.com.cn', '2023/03/26', 'M', 12450, 1);
INSERT INTO employees VALUES (564368, 'Isador', 'Gobbett', 'igobbettlk@examiner.com', '2016/02/14', 'M', 13660, 5);
INSERT INTO employees VALUES (721344, 'Georgia', 'Ghelardi', 'gghelardill@wikia.com', '2016/06/04', 'F', 42275, 1);
INSERT INTO employees VALUES (114602, 'Ervin', 'Fessions', 'efessionslm@soundcloud.com', '2013/02/06', 'M', 53007, 2);
INSERT INTO employees VALUES (777464, 'Ajay', 'Budgey', 'abudgeyln@epa.gov', '2017/11/22', 'F', 63754, 2);
INSERT INTO employees VALUES (546126, 'Marketa', 'Quigg', 'mquigglo@cafepress.com', '2023/01/05', 'F', 48845, 4);
INSERT INTO employees VALUES (892815, 'Colleen', 'Langley', 'clangleylp@pcworld.com', '2013/05/31', 'F', 35768, 5);
INSERT INTO employees VALUES (839025, 'Xaviera', 'Downton', 'xdowntonlq@apache.org', '2020/09/02', 'F', 66380, 3);
INSERT INTO employees VALUES (312252, 'Osbourne', 'Alcorn', NULL, '2019/06/14', 'M', 62677, 5);
INSERT INTO employees VALUES (440914, 'Carolin', 'Tompsett', 'ctompsettls@columbia.edu', '2016/10/15', 'F', 18447, 5);
INSERT INTO employees VALUES (204262, 'Gerrie', 'MacAndie', 'gmacandielt@yahoo.co.jp', '2016/07/31', 'M', 43138, 5);
INSERT INTO employees VALUES (40841, 'Wendeline', 'Pennigar', 'wpennigarlu@g.co', '2016/10/23', 'F', 55591, 3);
INSERT INTO employees VALUES (304211, 'Jareb', 'Taks', 'jtakslv@prnewswire.com', '2010/09/28', 'M', 26198, 3);
INSERT INTO employees VALUES (300853, 'Arabelle', 'Gencke', 'agenckelw@miitbeian.gov.cn', '2020/06/11', 'F', 38060, 2);
INSERT INTO employees VALUES (503016, 'Ellsworth', 'Kytley', 'ekytleylx@theatlantic.com', '2013/05/27', 'M', 17132, 4);
INSERT INTO employees VALUES (155519, 'Sid', 'Lias', 'sliasly@drupal.org', '2021/03/30', 'M', 43129, 4);
INSERT INTO employees VALUES (100811, 'Antin', 'Whild', NULL, '2017/06/24', 'M', 13643, 3);
INSERT INTO employees VALUES (468858, 'Thedric', 'Laurand', 'tlaurandm0@rediff.com', '2019/04/11', 'M', 40392, 1);
INSERT INTO employees VALUES (525505, 'Latrena', 'Deesly', 'ldeeslym1@scientificamerican.com', '2023/02/08', 'F', 12247, 5);
INSERT INTO employees VALUES (303888, 'Jackelyn', 'Lohan', 'jlohanm2@state.tx.us', '2015/09/28', 'F', 17323, 3);
INSERT INTO employees VALUES (323494, 'Gram', 'Ricca', 'griccam3@naver.com', '2016/03/28', 'M', 50738, 4);
INSERT INTO employees VALUES (161559, 'Odetta', 'Marchington', 'omarchingtonm4@addthis.com', '2015/12/07', 'F', 35536, 2);
INSERT INTO employees VALUES (570607, 'Bette', 'Hedworth', 'bhedworthm5@pinterest.com', '2019/05/11', 'F', 35474, 5);
INSERT INTO employees VALUES (701981, 'Gunter', 'Raggett', 'graggettm6@ft.com', '2013/11/24', 'M', 17602, 1);
INSERT INTO employees VALUES (811558, 'Luciana', 'OLyhane', 'lolyhanem7@w3.org', '2018/11/21', 'F', 12847, 3);
INSERT INTO employees VALUES (763376, 'Frants', 'Paviour', 'fpaviourm8@alexa.com', '2018/08/15', 'M', 67140, 3);
INSERT INTO employees VALUES (340428, 'Kristy', 'Date', 'kdatem9@twitter.com', '2016/03/14', 'F', 37100, 2);
INSERT INTO employees VALUES (414521, 'Bernardine', 'Mousley', 'bmousleyma@com.com', '2019/03/29', 'F', 64762, 2);
INSERT INTO employees VALUES (10816, 'Maris', 'Ivashkov', 'mivashkovmb@nytimes.com', '2010/05/12', 'F', 11258, 4);
INSERT INTO employees VALUES (369823, 'Hildy', 'Haggleton', NULL, '2019/11/05', 'F', 28320, 5);
INSERT INTO employees VALUES (599663, 'Lona', 'Di Bartolomeo', 'ldibartolomeomd@marriott.com', '2014/07/13', 'F', 63568, 5);
INSERT INTO employees VALUES (66099, 'Jimmie', 'Summons', 'jsummonsme@twitter.com', '2013/10/21', 'M', 39060, 4);
INSERT INTO employees VALUES (494837, 'Idalina', 'Pavinese', NULL, '2014/03/19', 'F', 17740, 2);
INSERT INTO employees VALUES (720854, 'Sandor', 'Bussy', NULL, '2012/10/10', 'M', 23088, 1);
INSERT INTO employees VALUES (33160, 'Emmy', 'Embery', 'eemberymh@cnn.com', '2014/01/30', 'M', 33445, 2);
INSERT INTO employees VALUES (916701, 'Bertie', 'Flancinbaum', 'bflancinbaummi@omniture.com', '2017/08/03', 'M', 45234, 1);
INSERT INTO employees VALUES (666364, 'Ryley', 'Dust', 'rdustmj@people.com.cn', '2014/06/03', 'M', 45939, 1);
INSERT INTO employees VALUES (913674, 'Marguerite', 'Talkington', 'mtalkingtonmk@gmpg.org', '2017/09/28', 'F', 19412, 4);
INSERT INTO employees VALUES (417221, 'Claudetta', 'Radden', 'craddenml@hatena.ne.jp', '2022/08/12', 'F', 42703, 4);
INSERT INTO employees VALUES (306223, 'Celka', 'Esp', NULL, '2012/07/21', 'F', 48843, 3);
INSERT INTO employees VALUES (465022, 'Wakefield', 'Jaze', 'wjazemn@xrea.com', '2022/01/31', 'M', 40020, 1);
INSERT INTO employees VALUES (206334, 'Prudence', 'McKerley', 'pmckerleymo@alexa.com', '2011/06/25', 'F', 36657, 4);
INSERT INTO employees VALUES (842959, 'Francois', 'Bracken', NULL, '2011/01/15', 'M', 34870, 4);
INSERT INTO employees VALUES (645755, 'Trent', 'Corryer', NULL, '2020/07/18', 'M', 14321, 5);
INSERT INTO employees VALUES (608727, 'Franchot', 'Benedick', 'fbenedickmr@wikispaces.com', '2019/06/02', 'M', 37283, 5);
INSERT INTO employees VALUES (97658, 'Drusie', 'Mapis', 'dmapisms@toplist.cz', '2020/07/11', 'F', 33855, 2);
INSERT INTO employees VALUES (682016, 'Alicea', 'Spillett', 'aspillettmt@xrea.com', '2011/11/22', 'F', 61421, 3);
INSERT INTO employees VALUES (166035, 'Fons', 'Jochanany', 'fjochananymu@livejournal.com', '2010/08/02', 'M', 63297, 4);
INSERT INTO employees VALUES (74235, 'Devlen', 'Cauderlie', 'dcauderliemv@washingtonpost.com', '2016/05/08', 'M', 60470, 2);
INSERT INTO employees VALUES (769348, 'Lorrie', 'Candelin', 'lcandelinmw@dion.ne.jp', '2020/11/16', 'M', 38231, 2);
INSERT INTO employees VALUES (119614, 'Dixie', 'Booi', 'dbooimx@jiathis.com', '2015/07/06', 'F', 31295, 3);
INSERT INTO employees VALUES (100542, 'Wiatt', 'Blockley', 'wblockleymy@mysql.com', '2019/10/25', 'M', 55150, 4);
INSERT INTO employees VALUES (37528, 'Bernardine', 'Biesterfeld', 'bbiesterfeldmz@indiegogo.com', '2021/08/17', 'F', 46990, 3);
INSERT INTO employees VALUES (995691, 'Bendicty', 'Hartfleet', 'bhartfleetn0@bandcamp.com', '2021/08/08', 'M', 48633, 4);
INSERT INTO employees VALUES (658193, 'Morton', 'Piquard', NULL, '2019/09/22', 'M', 46321, 3);
INSERT INTO employees VALUES (971295, 'Aaren', 'Rickword', 'arickwordn2@nationalgeographic.com', '2021/05/27', 'F', 46152, 3);
INSERT INTO employees VALUES (262627, 'Horatius', 'Soutar', 'hsoutarn3@elegantthemes.com', '2019/01/09', 'M', 25109, 5);
INSERT INTO employees VALUES (850058, 'Trenton', 'Acres', 'tacresn4@vinaora.com', '2015/06/20', 'M', 66389, 2);
INSERT INTO employees VALUES (413474, 'Alaine', 'Alberts', 'aalbertsn5@domainmarket.com', '2015/08/22', 'F', 21251, 5);
INSERT INTO employees VALUES (503621, 'Liliane', 'Smallpeice', 'lsmallpeicen6@miibeian.gov.cn', '2020/07/01', 'F', 53700, 5);
INSERT INTO employees VALUES (818843, 'Palm', 'Pyke', NULL, '2019/03/30', 'M', 51831, 1);
INSERT INTO employees VALUES (36372, 'Ignazio', 'Tellenbroker', NULL, '2015/07/18', 'M', 19921, 4);
INSERT INTO employees VALUES (603571, 'Spencer', 'Oldmeadow', 'soldmeadown9@icq.com', '2012/02/22', 'M', 19542, 4);
INSERT INTO employees VALUES (329742, 'Jacqueline', 'Shuttell', 'jshuttellna@flickr.com', '2022/07/09', 'F', 29745, 3);
INSERT INTO employees VALUES (8297, 'Armando', 'Saffer', 'asaffernb@multiply.com', '2018/08/04', 'M', 67529, 3);
INSERT INTO employees VALUES (758115, 'Buddie', 'Saberton', NULL, '2022/07/14', 'M', 48067, 3);
INSERT INTO employees VALUES (668482, 'Maitilde', 'Bartul', 'mbartulnd@blogspot.com', '2020/04/22', 'F', 49161, 2);
INSERT INTO employees VALUES (321051, 'Red', 'Lezemere', 'rlezemerene@quantcast.com', '2012/07/08', 'M', 11911, 4);
INSERT INTO employees VALUES (828440, 'Brigida', 'Kilgallon', 'bkilgallonnf@howstuffworks.com', '2021/08/15', 'F', 58535, 4);
INSERT INTO employees VALUES (994160, 'Arel', 'Sisneros', 'asisnerosng@histats.com', '2015/09/14', 'M', 58852, 3);
INSERT INTO employees VALUES (82125, 'Forest', 'Brookes', 'fbrookesnh@google.pl', '2019/03/17', 'M', 48095, 1);
INSERT INTO employees VALUES (574490, 'Erna', 'Choat', 'echoatni@usda.gov', '2013/02/14', 'F', 11769, 2);
INSERT INTO employees VALUES (380383, 'Ferrell', 'Allsepp', 'fallseppnj@adobe.com', '2020/06/06', 'M', 16091, 2);
INSERT INTO employees VALUES (556789, 'Nomi', 'Bettinson', NULL, '2014/11/01', 'F', 56683, 3);
INSERT INTO employees VALUES (126531, 'Brand', 'Smeeton', 'bsmeetonnl@eepurl.com', '2014/10/09', 'M', 47620, 5);
INSERT INTO employees VALUES (356659, 'Dillon', 'Bourges', 'dbourgesnm@wikispaces.com', '2022/01/26', 'M', 67599, 4);
INSERT INTO employees VALUES (795038, 'Hayward', 'Oxterby', 'hoxterbynn@over-blog.com', '2014/01/04', 'M', 31524, 3);
INSERT INTO employees VALUES (300539, 'Luciana', 'Liles', 'llilesno@mtv.com', '2014/07/15', 'F', 37198, 1);
INSERT INTO employees VALUES (506891, 'Francine', 'Boij', NULL, '2014/09/27', 'F', 49654, 4);
INSERT INTO employees VALUES (601489, 'Edik', 'Saffell', 'esaffellnq@ehow.com', '2018/02/11', 'M', 42571, 5);
INSERT INTO employees VALUES (141442, 'Torey', 'Mcasparan', NULL, '2011/07/26', 'F', 52368, 5);
INSERT INTO employees VALUES (72434, 'Wallie', 'McGavigan', 'wmcgaviganns@uol.com.br', '2012/12/01', 'F', 46396, 5);
INSERT INTO employees VALUES (275249, 'Suzi', 'Ganforthe', 'sganforthent@house.gov', '2013/06/27', 'F', 62946, 2);
INSERT INTO employees VALUES (753466, 'Opal', 'Brunel', 'obrunelnu@nifty.com', '2017/11/14', 'F', 42853, 4);
INSERT INTO employees VALUES (307082, 'Farica', 'Donnelly', 'fdonnellynv@over-blog.com', '2010/02/10', 'F', 20835, 4);
INSERT INTO employees VALUES (463393, 'Gale', 'Coxhell', 'gcoxhellnw@reference.com', '2019/04/09', 'F', 49610, 2);
INSERT INTO employees VALUES (508464, 'Jamey', 'Burfitt', 'jburfittnx@reuters.com', '2021/06/16', 'M', 15361, 2);
INSERT INTO employees VALUES (312698, 'Gordy', 'Aylmore', 'gaylmoreny@skyrock.com', '2020/04/15', 'M', 51222, 5);
INSERT INTO employees VALUES (304268, 'Annis', 'Philipeaux', NULL, '2016/07/24', 'F', 17973, 1);
INSERT INTO employees VALUES (431600, 'Kathe', 'Tocknell', 'ktocknello0@uiuc.edu', '2016/06/08', 'F', 55895, 2);
INSERT INTO employees VALUES (804150, 'Bertrand', 'Essam', 'bessamo1@cdc.gov', '2015/12/12', 'M', 12280, 3);
INSERT INTO employees VALUES (714848, 'Ara', 'Ringe', NULL, '2022/02/22', 'M', 10086, 2);
INSERT INTO employees VALUES (58648, 'Claudio', 'Cornelius', NULL, '2011/03/11', 'M', 29698, 3);
INSERT INTO employees VALUES (870912, 'Gordie', 'Wynes', 'gwyneso4@is.gd', '2012/11/07', 'M', 32902, 5);
INSERT INTO employees VALUES (993563, 'Roxana', 'Foxley', 'rfoxleyo5@google.es', '2010/01/23', 'F', 21508, 4);
INSERT INTO employees VALUES (36435, 'Kristina', 'Peaseman', 'kpeasemano6@symantec.com', '2011/08/10', 'F', 58235, 2);
INSERT INTO employees VALUES (30911, 'Giffard', 'Jillins', 'gjillinso7@privacy.gov.au', '2010/02/07', 'M', 35271, 3);
INSERT INTO employees VALUES (459611, 'Lindsay', 'Mowday', 'lmowdayo8@mozilla.org', '2014/12/31', 'M', 22635, 2);
INSERT INTO employees VALUES (115975, 'Tonia', 'Kiddy', 'tkiddyo9@people.com.cn', '2012/04/14', 'F', 22068, 1);
INSERT INTO employees VALUES (417148, 'Alexia', 'Kille', 'akilleoa@jiathis.com', '2014/08/15', 'F', 52473, 4);
INSERT INTO employees VALUES (391639, 'Denny', 'Fobidge', 'dfobidgeob@flickr.com', '2018/04/11', 'F', 66256, 1);
INSERT INTO employees VALUES (907514, 'Maire', 'Kennady', NULL, '2014/12/25', 'F', 49218, 3);
INSERT INTO employees VALUES (8226, 'Nikki', 'Besnardeau', NULL, '2017/06/19', 'M', 48810, 3);
INSERT INTO employees VALUES (488195, 'Sayre', 'Fritchley', 'sfritchleyoe@sun.com', '2010/09/08', 'F', 49626, 3);
INSERT INTO employees VALUES (583036, 'Colas', 'Adicot', 'cadicotof@businessinsider.com', '2018/08/27', 'M', 36603, 2);
INSERT INTO employees VALUES (566156, 'Mill', 'Coatham', 'mcoathamog@epa.gov', '2020/11/02', 'M', 46713, 3);
INSERT INTO employees VALUES (230049, 'Kevon', 'Perrigo', NULL, '2015/02/18', 'M', 9878, 4);
INSERT INTO employees VALUES (267674, 'Joseph', 'Dumper', 'jdumperoi@blinklist.com', '2021/05/09', 'M', 43475, 3);
INSERT INTO employees VALUES (169779, 'Jerald', 'Ketton', 'jkettonoj@blogger.com', '2022/06/06', 'M', 58033, 5);
INSERT INTO employees VALUES (82874, 'Guthrey', 'Mullins', 'gmullinsok@yahoo.co.jp', '2014/11/22', 'M', 48992, 1);
INSERT INTO employees VALUES (139608, 'Quinton', 'Connah', 'qconnahol@w3.org', '2021/07/10', 'M', 63632, 4);
INSERT INTO employees VALUES (81671, 'Todd', 'Philipsson', 'tphilipssonom@goodreads.com', '2022/09/06', 'M', 27557, 4);
INSERT INTO employees VALUES (187979, 'Donal', 'Skea', 'dskeaon@discovery.com', '2011/04/29', 'M', 51447, 1);
INSERT INTO employees VALUES (988360, 'Victoir', 'Sewley', 'vsewleyoo@miibeian.gov.cn', '2020/05/24', 'M', 18812, 5);
INSERT INTO employees VALUES (995996, 'Goldie', 'Rraundl', NULL, '2010/09/08', 'F', 11907, 4);
INSERT INTO employees VALUES (108269, 'Rhianon', 'MacColl', 'rmaccolloq@over-blog.com', '2022/12/18', 'F', 37055, 3);
INSERT INTO employees VALUES (242039, 'Jenn', 'Chooter', 'jchooteror@free.fr', '2013/02/02', 'F', 52940, 3);
INSERT INTO employees VALUES (240454, 'Candace', 'Grinyov', 'cgrinyovos@youtube.com', '2014/11/09', 'F', 58280, 1);
INSERT INTO employees VALUES (942172, 'Zitella', 'Alwen', 'zalwenot@sohu.com', '2017/10/02', 'F', 21606, 1);
INSERT INTO employees VALUES (914876, 'Rafaellle', 'Siaspinski', 'rsiaspinskiou@pen.io', '2020/10/31', 'M', 22210, 5);
INSERT INTO employees VALUES (297631, 'Nolan', 'Coye', NULL, '2015/08/24', 'M', 67548, 1);
INSERT INTO employees VALUES (557265, 'Bord', 'Petrie', NULL, '2018/01/19', 'M', 54145, 3);
INSERT INTO employees VALUES (329345, 'Lannie', 'Joseff', 'ljoseffox@timesonline.co.uk', '2010/10/26', 'M', 42748, 3);
INSERT INTO employees VALUES (452645, 'Urbain', 'Morfield', 'umorfieldoy@vimeo.com', '2022/04/06', 'M', 46527, 4);
INSERT INTO employees VALUES (786176, 'Frederick', 'Koppes', 'fkoppesoz@ucoz.ru', '2020/07/08', 'M', 44686, 1);
INSERT INTO employees VALUES (412861, 'Melanie', 'Barstow', NULL, '2023/01/25', 'F', 56326, 2);
INSERT INTO employees VALUES (609367, 'Gennifer', 'MacCulloch', NULL, '2011/03/25', 'F', 64292, 2);
INSERT INTO employees VALUES (980986, 'Swen', 'Ondrak', 'sondrakp2@elpais.com', '2016/12/17', 'M', 55781, 3);
INSERT INTO employees VALUES (997332, 'Stephan', 'Honniebal', 'shonniebalp3@berkeley.edu', '2023/01/24', 'M', 50492, 4);
INSERT INTO employees VALUES (171454, 'Robbie', 'Camock', 'rcamockp4@weather.com', '2010/07/19', 'F', 51250, 4);
INSERT INTO employees VALUES (349993, 'Stanleigh', 'Conkay', 'sconkayp5@tumblr.com', '2022/10/10', 'M', 13738, 1);
INSERT INTO employees VALUES (183472, 'Findlay', 'Steade', NULL, '2010/06/16', 'M', 30558, 3);
INSERT INTO employees VALUES (985663, 'Hirsch', 'Comsty', 'hcomstyp7@boston.com', '2015/10/20', 'M', 32693, 1);
INSERT INTO employees VALUES (830873, 'Forrester', 'Roze', 'frozep8@topsy.com', '2013/03/12', 'M', 67724, 5);
INSERT INTO employees VALUES (622314, 'Fenelia', 'Vanyard', 'fvanyardp9@paypal.com', '2021/05/07', 'F', 12677, 2);
INSERT INTO employees VALUES (542156, 'Clerc', 'Vinsen', 'cvinsenpa@zdnet.com', '2012/11/12', 'M', 29381, 5);
INSERT INTO employees VALUES (859865, 'Farrell', 'Lorent', NULL, '2013/08/27', 'M', 47258, 4);
INSERT INTO employees VALUES (88381, 'Ramona', 'Limpkin', 'rlimpkinpc@aol.com', '2020/07/16', 'F', 12405, 4);
INSERT INTO employees VALUES (63464, 'Klaus', 'Everix', 'keverixpd@google.nl', '2020/04/03', 'M', 33136, 4);
INSERT INTO employees VALUES (193323, 'Darcee', 'Richings', 'drichingspe@google.ca', '2022/07/31', 'F', 16787, 4);
INSERT INTO employees VALUES (514602, 'Aldus', 'Fermor', 'afermorpf@hostgator.com', '2022/05/08', 'M', 34136, 1);
INSERT INTO employees VALUES (941889, 'Hobey', 'Scorah', 'hscorahpg@howstuffworks.com', '2019/07/21', 'M', 42952, 1);
INSERT INTO employees VALUES (783014, 'Cecelia', 'Huws', 'chuwsph@forbes.com', '2014/03/06', 'F', 10241, 2);
INSERT INTO employees VALUES (911029, 'Ferdy', 'Espy', 'fespypi@discuz.net', '2017/01/24', 'M', 41404, 4);
INSERT INTO employees VALUES (126589, 'Giffie', 'Althrope', NULL, '2020/09/12', 'M', 42708, 1);
INSERT INTO employees VALUES (89911, 'Dalli', 'Skeermer', 'dskeermerpk@nhs.uk', '2020/10/13', 'M', 31110, 3);
INSERT INTO employees VALUES (234071, 'Lutero', 'Isaak', 'lisaakpl@amazon.co.uk', '2021/06/16', 'M', 20667, 4);
INSERT INTO employees VALUES (618965, 'Lin', 'Brice', 'lbricepm@bloglines.com', '2017/03/07', 'F', 30478, 5);
INSERT INTO employees VALUES (18563, 'Vere', 'Haskell', 'vhaskellpn@arizona.edu', '2016/10/14', 'F', 48456, 1);
INSERT INTO employees VALUES (34644, 'Revkah', 'Mayhou', 'rmayhoupo@squidoo.com', '2013/06/14', 'F', 62263, 4);
INSERT INTO employees VALUES (104993, 'Tripp', 'Reye', 'treyepp@vkontakte.ru', '2017/04/13', 'M', 27564, 2);
INSERT INTO employees VALUES (117077, 'Vittoria', 'Pasmore', 'vpasmorepq@blogger.com', '2012/04/11', 'F', 11491, 4);
INSERT INTO employees VALUES (30356, 'Delmar', 'Phillput', NULL, '2012/10/13', 'M', 46625, 2);
INSERT INTO employees VALUES (917528, 'Brendan', 'Vamplew', 'bvamplewps@scientificamerican.com', '2010/04/07', 'M', 19095, 3);
INSERT INTO employees VALUES (108250, 'Roderigo', 'Varley', 'rvarleypt@photobucket.com', '2017/12/10', 'M', 28140, 4);
INSERT INTO employees VALUES (606017, 'Jania', 'Cammish', 'jcammishpu@ovh.net', '2012/07/08', 'F', 46205, 4);
INSERT INTO employees VALUES (781733, 'Victoir', 'Bras', NULL, '2022/12/02', 'M', 21471, 4);
INSERT INTO employees VALUES (11660, 'Templeton', 'Stedman', 'tstedmanpw@latimes.com', '2011/06/25', 'M', 54787, 4);
INSERT INTO employees VALUES (114498, 'Lamont', 'Harbertson', NULL, '2011/02/18', 'M', 48827, 3);
INSERT INTO employees VALUES (981052, 'Frank', 'Briant', 'fbriantpy@seesaa.net', '2016/09/02', 'M', 28513, 5);
INSERT INTO employees VALUES (183779, 'Frederik', 'Jindrak', 'fjindrakpz@aol.com', '2023/04/06', 'M', 23676, 5);
INSERT INTO employees VALUES (362779, 'Inna', 'Dirkin', NULL, '2019/08/18', 'F', 58862, 1);
INSERT INTO employees VALUES (758347, 'Pris', 'Adami', 'padamiq1@netvibes.com', '2022/10/19', 'F', 50700, 4);
INSERT INTO employees VALUES (189901, 'Shelli', 'Rubinfajn', 'srubinfajnq2@wsj.com', '2014/12/22', 'F', 22946, 1);
INSERT INTO employees VALUES (451605, 'Paolina', 'Skill', NULL, '2018/02/28', 'F', 19427, 4);
INSERT INTO employees VALUES (792279, 'Kelvin', 'Klement', 'kklementq4@huffingtonpost.com', '2019/01/20', 'M', 15855, 3);
INSERT INTO employees VALUES (466777, 'Christabel', 'Vickar', 'cvickarq5@tinypic.com', '2016/08/17', 'F', 57268, 4);
INSERT INTO employees VALUES (507904, 'Petronella', 'Le land', NULL, '2019/09/03', 'F', 10790, 2);
INSERT INTO employees VALUES (399570, 'Rosetta', 'Rockall', 'rrockallq7@t.co', '2015/01/24', 'F', 40222, 1);
INSERT INTO employees VALUES (593518, 'Iggy', 'Huygen', NULL, '2017/12/12', 'M', 36574, 4);
INSERT INTO employees VALUES (743513, 'Edie', 'McGerr', NULL, '2021/09/21', 'F', 21643, 2);
INSERT INTO employees VALUES (764266, 'Aila', 'Beyne', 'abeyneqa@webeden.co.uk', '2020/06/29', 'F', 42605, 3);
INSERT INTO employees VALUES (771498, 'Malvina', 'Kloser', 'mkloserqb@tamu.edu', '2018/08/25', 'F', 10256, 1);
INSERT INTO employees VALUES (346758, 'Dorene', 'Misken', 'dmiskenqc@usatoday.com', '2010/03/02', 'F', 55740, 2);
INSERT INTO employees VALUES (359365, 'Stirling', 'Stanford', 'sstanfordqd@webnode.com', '2016/01/13', 'M', 44539, 4);
INSERT INTO employees VALUES (304318, 'Alisha', 'Gaveltone', 'agaveltoneqe@smugmug.com', '2022/04/01', 'F', 50220, 4);
INSERT INTO employees VALUES (957865, 'Kris', 'Churm', 'kchurmqf@disqus.com', '2016/05/08', 'F', 45301, 3);
INSERT INTO employees VALUES (219723, 'Bogey', 'Ghent', NULL, '2018/02/21', 'M', 60965, 2);
INSERT INTO employees VALUES (26354, 'Cordell', 'Lechmere', NULL, '2012/04/30', 'M', 59855, 2);
INSERT INTO employees VALUES (232257, 'Oliy', 'Aulsford', 'oaulsfordqi@altervista.org', '2013/07/14', 'F', 10601, 2);
INSERT INTO employees VALUES (552851, 'Vidovic', 'Elster', 'velsterqj@wikia.com', '2013/01/02', 'M', 60229, 1);
INSERT INTO employees VALUES (772664, 'Dehlia', 'Bromwich', 'dbromwichqk@blogs.com', '2016/03/27', 'F', 22590, 4);
INSERT INTO employees VALUES (563265, 'Raynard', 'Westmorland', 'rwestmorlandql@adobe.com', '2017/12/11', 'M', 67494, 1);
INSERT INTO employees VALUES (843290, 'Jojo', 'Venus', 'jvenusqm@ibm.com', '2010/12/11', 'F', 38391, 5);
INSERT INTO employees VALUES (220466, 'Boyce', 'Reasce', 'breasceqn@skyrock.com', '2020/12/12', 'M', 49847, 2);
INSERT INTO employees VALUES (515229, 'Darby', 'Clawley', 'dclawleyqo@nationalgeographic.com', '2016/07/10', 'F', 66015, 1);
INSERT INTO employees VALUES (896228, 'Chuck', 'Habbeshaw', 'chabbeshawqp@ftc.gov', '2013/12/31', 'M', 35990, 3);
INSERT INTO employees VALUES (326766, 'Kizzee', 'Milch', NULL, '2023/04/09', 'F', 45977, 1);
INSERT INTO employees VALUES (576929, 'Barbe', 'McCarry', 'bmccarryqr@princeton.edu', '2022/09/05', 'F', 31226, 5);
INSERT INTO employees VALUES (40998, 'Levy', 'Weth', 'lwethqs@usnews.com', '2012/09/10', 'M', 30075, 2);
INSERT INTO employees VALUES (845425, 'Ringo', 'Baskeyfield', 'rbaskeyfieldqt@disqus.com', '2011/06/16', 'M', 30259, 5);
INSERT INTO employees VALUES (538105, 'Thatch', 'Trowell', 'ttrowellqu@auda.org.au', '2022/01/05', 'M', 37163, 5);
INSERT INTO employees VALUES (994268, 'Colleen', 'Maddy', NULL, '2022/09/16', 'F', 32001, 2);
INSERT INTO employees VALUES (438120, 'Prudence', 'Scudamore', 'pscudamoreqw@economist.com', '2013/01/22', 'F', 53603, 4);
INSERT INTO employees VALUES (25124, 'Miles', 'Wittman', 'mwittmanqx@epa.gov', '2011/11/07', 'M', 63786, 3);
INSERT INTO employees VALUES (634345, 'Colver', 'Lauga', 'claugaqy@jalbum.net', '2014/06/11', 'M', 44385, 5);
INSERT INTO employees VALUES (858017, 'Sherill', 'Tockell', NULL, '2011/02/01', 'F', 59482, 2);
INSERT INTO employees VALUES (217200, 'Rickie', 'Bisacre', 'rbisacrer0@yellowbook.com', '2011/01/24', 'M', 65592, 1);
INSERT INTO employees VALUES (507776, 'Susette', 'Barbery', 'sbarberyr1@canalblog.com', '2014/11/01', 'F', 39414, 3);
INSERT INTO employees VALUES (686872, 'Hadlee', 'Velti', 'hveltir2@freewebs.com', '2010/07/01', 'M', 12569, 2);
INSERT INTO employees VALUES (992121, 'Corbin', 'Van der Kruys', NULL, '2015/12/01', 'M', 40758, 5);
INSERT INTO employees VALUES (166763, 'Roth', 'Cristofolini', 'rcristofolinir4@cmu.edu', '2014/12/18', 'M', 50846, 5);
INSERT INTO employees VALUES (866422, 'Cynthie', 'Allenby', 'callenbyr5@statcounter.com', '2012/05/04', 'F', 58923, 3);
INSERT INTO employees VALUES (691775, 'Ami', 'Cappell', 'acappellr6@ehow.com', '2013/06/17', 'F', 56054, 1);
INSERT INTO employees VALUES (475619, 'Carole', 'Le Floch', 'cleflochr7@mysql.com', '2010/12/06', 'F', 34452, 1);
INSERT INTO employees VALUES (117408, 'Myrna', 'Zapata', 'mzapatar8@wikispaces.com', '2016/05/04', 'F', 35476, 5);
INSERT INTO employees VALUES (923221, 'Syman', 'Pellett', 'spellettr9@ameblo.jp', '2021/08/07', 'M', 59622, 5);
INSERT INTO employees VALUES (453484, 'Sly', 'Valens-Smith', 'svalenssmithra@cloudflare.com', '2010/09/25', 'M', 34889, 5);
INSERT INTO employees VALUES (259484, 'Berenice', 'Christley', 'bchristleyrb@cnn.com', '2021/09/14', 'F', 35654, 2);
INSERT INTO employees VALUES (473987, 'Gallard', 'Connors', 'gconnorsrc@zdnet.com', '2010/03/12', 'M', 18104, 3);
INSERT INTO employees VALUES (537284, 'Kesley', 'Alpe', 'kalperd@surveymonkey.com', '2010/07/08', 'F', 34701, 5);
INSERT INTO employees VALUES (875576, 'Loren', 'Greeveson', NULL, '2016/08/07', 'F', 62907, 4);
INSERT INTO employees VALUES (756330, 'Georgia', 'Scarisbrick', 'gscarisbrickrf@unesco.org', '2017/09/03', 'F', 63932, 2);
INSERT INTO employees VALUES (32078, 'Arri', 'Bachshell', 'abachshellrg@reuters.com', '2022/06/05', 'M', 37283, 2);
INSERT INTO employees VALUES (731179, 'Ilyse', 'Tapley', 'itapleyrh@edublogs.org', '2017/09/29', 'F', 49910, 1);
INSERT INTO employees VALUES (427264, 'Tillie', 'Button', NULL, '2020/11/10', 'F', 59123, 5);
INSERT INTO employees VALUES (403270, 'Adella', 'Culbert', 'aculbertrj@fastcompany.com', '2019/04/27', 'F', 34331, 4);
INSERT INTO employees VALUES (64787, 'Griswold', 'Colebourn', 'gcolebournrk@abc.net.au', '2013/07/14', 'M', 21055, 2);
INSERT INTO employees VALUES (644289, 'Julianna', 'Sydry', NULL, '2021/12/08', 'F', 57353, 4);
INSERT INTO employees VALUES (471002, 'Sly', 'Fern', 'sfernrm@google.com.hk', '2021/08/28', 'M', 21907, 1);
INSERT INTO employees VALUES (706898, 'Cathrine', 'Barkley', 'cbarkleyrn@freewebs.com', '2023/03/19', 'F', 47588, 1);
INSERT INTO employees VALUES (767607, 'Burt', 'Doll', NULL, '2023/01/15', 'M', 38228, 3);
INSERT INTO employees VALUES (450209, 'Craggie', 'Kryska', 'ckryskarp@ycombinator.com', '2016/01/03', 'M', 37565, 3);
INSERT INTO employees VALUES (649003, 'Sonya', 'Klassmann', 'sklassmannrq@shop-pro.jp', '2020/03/29', 'F', 45751, 4);
INSERT INTO employees VALUES (217484, 'Caldwell', 'Bridgeman', 'cbridgemanrr@ow.ly', '2020/11/11', 'M', 30140, 3);

----- moving on to select statements 

Select employee_id, hire_date, salary 
From employees; 

------- Where clause + AND/OR

--show only the employees w/ more than 50 K salary in order from Large to Small
Select employee_id, first_name, last_name, salary
FROM employees
Where salary > 50000
order by salary desc; 


--select all employees that work in "common grounds" cofeeshop

Select employee_id, first_name, last_name, coffeeshop_id
From employees 
Where coffeeshop_id=1; 

-- select all employees who work in Common grounds & make more than 50 K

Select employee_id, first_name, last_name, salary, coffeeshop_id
From employees 
Where (coffeeshop_id=1 AND salary > 50000)
Order by salary asc; 


-- select all employees who work in Common grounds OR make more than 50 K 
--and I wanted to see each coffee shop ID partitioned
Select employee_id, first_name, last_name, salary, coffeeshop_id, dense_rank() OVER(partition by coffeeshop_id order by salary desc)
From employees 
Where (coffeeshop_id=1 OR salary > 50000)
; 


-- select all employees who work in Common grounds & make more than 50 K & MALE 
Select employee_id, first_name, last_name, salary, coffeeshop_id, gender
From employees 
Where (coffeeshop_id=1 and salary > 50000 and gender='M');


---------------------------IN, not in, is null, between-----------------------------

--Select all rows from supplier table where supplier is beans & barley

Select* 
From suppliers 
Where supplier_name like 'Beans%'; --or supplier_name='Beans and Barley'

--Select all rows from supplier table where supplier is NOT beans & barley
Select* 
From suppliers 
Where supplier_name <>'Beans and Barley'; -- or you can do Where not supplier_name='Beans and Barley'

-- Select all robusta and arabica coffee types 

Select* 
From suppliers 
Where coffee_type='Robusta' OR coffee_type='Arabica'
ORDER BY 3;

--OR CAN DO IT THIS WAY

Select* 
From suppliers 
Where coffee_type IN ('Robusta','Arabica');

--Select coffee types that are not robusta or arabica 

Select* 
From suppliers 
Where coffee_type NOT IN ('Robusta','Arabica')
order by 1;
--when i order by one this for ex tells me that coffeeshop_id 3 refers to coffeeshop_name ancient bean that has 2 suppliers and each supplier brings 2 different coffee types


--Select all employees with missing email address

Select employee_id, first_name, last_name, email
from employees 
Where email IS Null;

--Select all employees with email addressess 

Select employee_id, first_name, last_name, email
from employees 
Where email IS NOT Null; --or can say where not email is null

--select all employees who make betw. 35K and 50K

Select employee_id, first_name, last_name, salary
from employees 
Where salary >= 35000 AND salary <= 50000
order by salary asc;

--or can write it this way
Select employee_id, first_name, last_name, salary
from employees 
Where salary BETWEEN 35000 AND 50000 --this is inclusive of 35 and 50 as well
order by salary asc;


------------------ORDER BY, LIMIT, DISTINCT, GROUP BY, CTE--------------------------------

--Top 10 highest paid employees 
WITH Salary_Ranking as(
Select employee_id, first_name, last_name, salary, dense_rank() over(order by salary desc) as ranking
from employees
)
Select*
from  Salary_Ranking
where ranking <=10;

--or do it the easier way haha
Select employee_id, first_name, last_name, salary
from employees
order by salary desc
limit 10;

--return all unique coffeeshop_ids from employees table

Select distinct country
from locations
;


--from each coffeeshop i want the employer that makes the highest salary
--i want top 5 salaries, 1 from each coffeeshop_name so do CTE and a join 

WITH Salary_Ranking as(
SELECT coffeeshop_id, MAX(salary) AS highest_salary
FROM employees
GROUP BY coffeeshop_id
) 
Select emp.employee_id, emp.first_name, emp.last_name, emp.salary, emp.coffeeshop_id
from employees as emp
Join Salary_Ranking as sal
On sal.coffeeshop_id = emp.coffeeshop_id AND emp.salary=sal.highest_salary
;


--- Extract on SQL FOR DATETIME is same as text to column in excel 
---- SPLIT_PART IS USED ON STRINGS IN SQL

Select hire_date, 
	EXTRACT(year from hire_date),
	Extract(Month from hire_date),
	EXTRACT(day from hire_date)
FROM employees; 


----string manipulation--------

--Uppercase first and last name---

Select first_name, last_name, upper(first_name) as first_name_upper, upper(last_name)
FROM employees; 

--lowercase first and last name---
Select first_name, last_name, lower(first_name) as first_name_upper, lower(last_name)
FROM employees; 

-- return the email and length of email 
Select email, length(email)
From employees; 

--------Concatenation, boolean expressions, wildcard--------

--concatenate first and last name to create full name 

--concat here is different from MySQL
select first_name, last_name, first_name || ' ' || last_name as full_name
from employees;

--concatenate column to make sentence 

select first_name || ' ' || last_name || ' ' || 'makes' || ' '|| salary as sentence
from employees;

--Boolean Expressions (true or false expressions)**

--if the person makes less than 50K, then true, otherwise false

--one way to do it, shorter version: 

SELECT first_name || ' ' ||last_name as full_name, salary,(salary <50000) as less_than_50K
from employees; 
	
	
---another way to do it is case statement
--better when u want to mention certain next not just say true and false: 
	
SELECT first_name || ' ' ||last_name as full_name, salary,
CASE 
	WHEN salary < 50000 THEN 'true'
    WHEN salary >= 50000 THEN 'false'
END AS less_than_50K    --In case statement u can add the alias after END 
FROM employees
order by salary desc;

--if the person is female and makes less than 50K, then true, otherwise false

select first_name || ' ' || last_name as full_name, gender, salary, 
	(salary<50000 and gender='F')as F_less_than_50K
from employees; 

--boolean expressions w/ wildcards 

--if email has .com return true otherwise false 

select first_name, last_name, email, (email like '%.com%') as email_dot_com
from employees;

--lets say now you just want to see all the true with the .com in it ONLY 

with Dot_com_flag as 
(
select first_name, last_name, email, (email like '%.com%') as email_dot_com
from employees
)
select* 
from Dot_com_flag
where email_dot_com = 'true'; 


--just wanna see true for .gov 
select first_name, last_name, email, (email like '%.gov%') as email_dot_gov
from employees;


--substring, position, and coalesce

--get the email from the 5th character 

select email, substring(email from 5) --inclusive of 5th char
from employees; 


--find the position of @ in the email 
select email, position ('@' in email)
from employees;


---substring and position to find the email client for each of employees

select email, substring(email from position ('@' in email)+1) as email_client --+1 is to remove the @sign in output
from employees; 

--substring, position, and the opposite of concat

select email, split_part(email, '@', 2)
from employees; 

--here takes only first word 
select coffeeshop_name, substring (coffeeshop_name from 1 for position(' ' in coffeeshop_name || ' ')-1)
from shops;
--or easy version:
select coffeeshop_name, 
	SPLIT_PART(coffeeshop_name, ' ', 1) AS first_word
from shops; 

--here takes only last word
select coffeeshop_name, substring (coffeeshop_name from position(' ' in coffeeshop_name)+1)
from shops; 

--easy versions using split_part:
select coffeeshop_name, 
    SPLIT_PART(coffeeshop_name, ' ', 2) AS second_word
from shops; 

--text to column like excel : here seprates coffeeshop_name into 2 columns
select coffeeshop_name, 
	SPLIT_PART(coffeeshop_name, ' ', 1) AS first_word,
    SPLIT_PART(coffeeshop_name, ' ', 2) AS second_word
from shops; 


--coalesce to find missing emails w/ custom value 

select first_name, last_name, email, coalesce (email, 'NO EMAIL!')
from employees; 

--a different way of putting it i came up with including CTE and case statement

WITH null_email as
(select first_name, last_name, email
from employees
)
select *, 
case 
	when email is null then 'PROVIDE EMAIL NOW!'
	else 'ok:)'
end as no_email
from null_email; 

--from the above show me cells only with 'Provide email now'

WITH null_email as
(select first_name, last_name, email
from employees
), two_options as
(select *, 
case 
	when email is null then 'PROVIDE EMAIL NOW!'
	else 'ok:)'
end as no_email
from null_email
)
select *
from two_options
where no_email = 'PROVIDE EMAIL NOW!';
--kida i know that i have 209 employees with no emails from 1000 employees
--or can make it easier and use it with coalesce and is smaller query 
With email as 
(
select first_name, last_name, email, coalesce (email, 'NO EMAIL!') as email_needed
from employees 	
)
select * 
from email
where email_needed = 'NO EMAIL!';


-----------------------min, max, avg, sum, count ------------------------------------

select min(salary)
from employees
;


--want to see lowest salary provided and to which employee in each coffeeshop name/id
WITH Min_Salary_Ranking as(
SELECT coffeeshop_id, min(salary) AS lowest_salary
FROM employees
GROUP BY coffeeshop_id
) 
Select emp.employee_id, emp.first_name, emp.last_name, emp.salary, emp.coffeeshop_id
from employees as emp
Join min_Salary_Ranking as sal
On sal.coffeeshop_id = emp.coffeeshop_id AND emp.salary=sal.lowest_salary
order by salary desc
;

--want to see max salary only 
select max(salary)
from employees
;


--want to see difference between max and min salary 

select max(salary) as max_sal, min(salary) as min_sal, (max(salary) - min(salary)) as difference
from employees; 

--lets say i wanna know the max and min salary in each coffee shop id
-- and the difference between the salaries and the names of these people too 
WITH difference_Salary_Ranking as(
select coffeeshop_id, max(salary) as max_salary, min(salary) as min_salary, (max(salary) - min(salary)) as difference
from employees
group by coffeeshop_id
) 
Select e1.employee_id, e1.coffeeshop_id, 
	e1.first_name as highest_salary_first_name, 
	e1.last_name AS highest_salary_last_name,
    e1.salary AS highest_salary,
	e2.first_name AS lowest_salary_first_name,
    e2.last_name AS lowest_salary_last_name,
    e2.salary AS lowest_salary,
    dsr.difference
from 
	difference_Salary_Ranking as dsr
Join 
    employees as e1 ON dsr.coffeeshop_id = e1.coffeeshop_id AND dsr.max_salary = e1.salary
JOIN 
    employees as e2 ON dsr.coffeeshop_id = e2.coffeeshop_id AND dsr.min_salary = e2.salary
Order by coffeeshop_id asc
;

--select avg salary 

select avg(salary)
from employees; 

--round the avg sal to nearest integer 
select round (avg(salary),0)
from employees; 

--sum salaries & i want sum for female and sum for male 
select gender,sum(salary)
from employees
group by gender; 

--which coffeeshop_id has the highest spent on salaries, from this u find out its 3
select coffeeshop_id,sum(salary) as sum_
from employees
group by coffeeshop_id
order by sum_ desc; 


--count number of entries

--this tells us number of rows so can say u have 1000 employees records
select count(*)
from employees; 

--so here tells us we have 1000 salaries so none are missing 
select count(salary)
from employees; 

--so here tells us we have missing emails cuz some null 
select count(email)
from employees; 

---------GROUP BY AND HAVING-------------------------------- 

--return number of employees for each coffeeshop 

select coffeeshop_id, count (employees)
from employees
group by coffeeshop_id;

--return number of employees for each coffeeshop id and return coffeeshop name 

with employees_table as 
(select coffeeshop_id, count (employees)
from employees
group by coffeeshop_id 
), shop_table as 
(
	select coffeeshop_id, coffeeshop_name
	from shops
)
select * 
from employees_table 
join shop_table
on employees_table .coffeeshop_id=shop_table.coffeeshop_id;


--return total salary of each coffeeshop 
select coffeeshop_id, sum(salary)
from employees
group by coffeeshop_id; 


--return # of employees, avg, min, max, total salary for each coffeeshop and see each for male & female

select coffeeshop_id, gender, count(*) as emp_number,round(avg(salary),0) as avg_sal, min(salary), max(salary), sum(salary)
from employees
group by coffeeshop_id, gender
order by coffeeshop_id;


--without breaking it up into male and female 

select coffeeshop_id, count(*) as emp_number,round(avg(salary),0) as avg_sal, min(salary), max(salary), sum(salary)
from employees
group by coffeeshop_id
order by emp_number desc;
--now makes sense that coffeeshop 3 has highest sum of salaries cuz also highest number of employees


--having 
--after group by return only the coffeeshop with more than 200 employees

select coffeeshop_id, count(*) as emp_number,round(avg(salary),0) as avg_sal, min(salary), max(salary), sum(salary)
from employees
group by coffeeshop_id
having count(*)>200 --be careful having doesnt read alias 
order by emp_number desc;

--after group by return only the coffeeshop with min sal <10K

select coffeeshop_id, count(*) as emp_number,round(avg(salary),0) as avg_sal, min(salary), max(salary), sum(salary)
from employees
group by coffeeshop_id
having min(salary)<10000 --be careful having doesnt read alias 
order by min(salary) desc;


---------------------CASE, CASE WITH GROUP BY, AND CASE FOR TRANSPOSING DATA ------------------

--CASE 
--if pay less than 50K, then low pase, if more than 65 is high pay, in between is okay 

select *,
case 
	when salary<50000 then 'low pay'
	when salary >=65000 then 'high pay'
	else 'ok pay'
end as pay_category
from employees
order by salary desc; 

--case and group by 
--return the count of employees in each pay category which are 3 categories

--as a cte 
with cte as 
(select employee_id, first_name, last_name, salary,
case 
	when salary<20000 then 'low pay'
	when salary between 20000 and 50000 then 'medium pay'
	when salary >50000 then 'high pay'
	else 'ok pay'
end as pay_category
from employees
)
select pay_category, count(*) 
from cte
group by pay_category
order by count(*) ; 

--as a subquery instead of CTE but less professional 

select a.pay_category, count(*)
from (
select employee_id, first_name, last_name, salary,
case 
	when salary<20000 then 'low pay'
	when salary between 20000 and 50000 then 'medium pay'
	when salary >50000 then 'high pay'
	else 'ok pay'
end as pay_category
from employees	
) as a
group by a.pay_category;


--now i want to take data above and transpose, which is turn rows into columns

SELECT 
	sum(case when salary < 20000 then 1 else 0 end) as low_pay,
	sum(case when salary between 20000 and 50000 then 1 else 0 end) as medium_pay, 
	sum(case when salary > 50000 then 1 else 0 end) as high_pay
from employees; 

-------------------------------------JOINS (INNER, LEFT, RIGHT)---------------------------------

--	Inserting values just for join exercise 

INSERT INTO locations values(4,'Paris','France');
INSERT into shops values (6,'Happy Brew', Null);

--CHEck values we inserted 
select*
from shops;

select * from locations; 

--inner join shops & locations 

select s.coffeeshop_name, l.city, l.country 
from shops as s
join locations as l
On s.city_id=l.city_id; --basically saying that foreign key in shops is refering to primary key in locations
--also hina took just common mabinhom so happy brew isnt here nor paris (il new values entered) 


--Left join 

select s.coffeeshop_name, l.city, l.country 
from shops as s
left join locations as l
On s.city_id=l.city_id; ---so here shows took city id 4 even though its not in locations table so thats why is null in city and country 

select s.coffeeshop_name, l.city, l.country 
from shops as s
right join locations as l
On s.city_id=l.city_id;  --so hina coffeeshop name is null and will take everythign in right table even if missing in left table  


select s.coffeeshop_name, l.city, l.country 
from shops as s
full outer join locations as l
On s.city_id=l.city_id; --if value missign from right or left it will take both 


--delete values we created in join exercise 

delete 
from shops 
where coffeeshop_name like 'Happ%';

select * 
from shops; 

delete 
from locations 
where city_id= 4;

select * from locations; 

--Unions (to stack data on top of each other vertically)

--return all cities and countries 

select city
from locations
union 
select country 
from locations
order by city;  --note: union removes duplicates BUT UNION ALL DOES NOT 

--UNION ALL 
select city
from locations
union ALL 
select country 
from locations
order by city; --here US repeated twice 

--return all coffeeshop names, city and country 

select coffeeshop_name as shops_and_locations
from shops
union 
select city
from locations
union
select country 
from locations; 

--lets say you want categorize them in terms of 'SORT ORDER'

--SORT ORDER NEW CONCEPT
select coffeeshop_name as shops_and_locations, 1 as sort_order
from shops
union 
select city, 2
from locations
union 
select country, 3
from locations
order by sort_order; 

--lets say i dotn want to show sort_order column 

with categorized as
(select coffeeshop_name as shops_and_locations, 1 as sort_order
from shops
union 
select city, 2
from locations
union 
select country, 3
from locations)
select shops_and_locations
from categorized
order by sort_order;

----------------------------Subqueries/CTE--------------------------------

--basic subqueries w/ subqueries in the from clause 

--Select employees with coffeeshop id 3 and 4

--first basic form of it :
select first_name, last_name, coffeeshop_id
from employees 
where coffeeshop_id = 3 or coffeeshop_id=4
order by coffeeshop_id asc;

--or :
select first_name, last_name, coffeeshop_id
from employees 
where coffeeshop_id in (3,4)
order by coffeeshop_id asc;

--now lets create it in subquery form 

select * 
from (
	select first_name, last_name, coffeeshop_id
from employees 
where coffeeshop_id in (3,4)
order by coffeeshop_id asc
) as a;

--or can do it as CTE 

With a as(
	select first_name, last_name, coffeeshop_id
from employees 
where coffeeshop_id in (3,4)
order by coffeeshop_id asc
)
select * 
from a;


--select max salary in entire table with names 

select first_name, last_name, salary, max(salary)
from employees
group By first_name, last_name, salary
Order By salary desc
limit 1; 

--basic subqueries w/ subquery in the select clause 

--i want to select max slary and i want it to appear in every row next to salary of each person

--in subquery form 
select first_name, last_name, salary, (select max(salary) from employees limit 1) 
from employees
Order By salary desc
; 

--want to see avg salary in each row to compare next to salary of each person 
select first_name, last_name, salary, (select round(avg(salary),0) as avg from employees limit 1) 
from employees
Order By salary desc
; 

--want to see avg salary in each row to compare next to salary of each person and difference as well 
select first_name, last_name, salary, 
	(select round(avg(salary),0) as avg from employees),
	salary - (select round(avg(salary),0) as avg from employees) as difference
from employees
--where first_name like 'Cars%' --lets say i want to check only carson
; 
--here tells me cars makes less than avg by $5,208


--subqueries in the WHERE clause 

--return all US coffeeshops w/ country US and corresponding city IDs for it
WITH cte1 as
(select country, city_id 
from locations 
where country = 'United States'), 
cte2 as(
select coffeeshop_name, city_id, coffeeshop_id 
from shops
where city_id in (select city_id from cte1) --INSTEAD OF SAYING city_id in (1,2) cuz lets say there is so many so this is more professional
)
select coffeeshop_id, coffeeshop_name, cte2.city_id, country
from cte2
join cte1 
on cte2.city_id=cte1.city_id;
--makes sense to do it this way only if wanted to include country too from locations table
--if dont want to include country check easier CTE below 

--can do it in subquery form & get same output w/out incl country name column
select * 
from shops 
where city_id in (
	select city_id from locations
	where country = 'United States'
	);

--same as above but in cte format (above is easier)
with us_cities as (
    select city_id 
    from locations
    where country = 'United States'
)
select * 
from shops 
where city_id in (select city_id from us_cities);

--return all employees who work in US coffeeshops 

select * 
from employees 
where coffeeshop_id in (
	select coffeeshop_id
	from shops 
	where city_id in (
	select city_id from locations 
	where country = 'United States'
	)
); --walk it backwards if it helps to track where everything is coming from

--employees who make more than 35K and work in US shops 
--as subquery
select * from employees 
where salary > 35000 and coffeeshop_id in(
select coffeeshop_id from shops 
where city_id in (
select city_id from locations 
where country='United States'))
order by coffeeshop_id;

---as a cte, but subquery easier cuz dont always need to refer to cte before 
with us_cities as (
    select city_id 
    from locations
    where country = 'United States'
), cte2 as
(select coffeeshop_id 
from shops 
where city_id in (select city_id from us_cities))
select *
from employees
where salary > 35000
and coffeeshop_id in (select coffeeshop_id from cte2)
order by coffeeshop_id
;

--BONUS: 
--30 day movign total pay, i wanna know in 30 days ana batfa3 salaries 3amla izaay 

select hire_date, salary, (
	select sum(salary) from employees as e2
	where e2.hire_date between e1.hire_date -30 and e1.hire_date) as pay_pattern
from employees as e1
order by hire_date; 

--do it another way, which is actually even better cuz hina accounts that date is not an int, above code treats date as an int which is not correct, might casue issues : 
select hire_date, salary, 
	sum(salary)over(order by hire_date range between INTERVAL '30 days' preceding and current row) 
	from employees; 
--When to Use ROWS: Use ROWS when you want a specific number of rows in the window, independent of the actual values in those rows.
--When to Use RANGE: Use RANGE when you want to consider a range of values (e.g., a date range) rather than a fixed number of rows.

--can also write the interval 30 day in this way too: 

select hire_date, salary, 
	sum(salary)over(order by hire_date range between '30 days'::interval preceding and current row) 
	from employees; 

--cte 
WITH pay_pattern_cte AS (
    SELECT e1.hire_date, e1.salary, 
           (SELECT SUM(e2.salary) 
            FROM employees AS e2 
            WHERE e2.hire_date BETWEEN e1.hire_date -30 AND e1.hire_date) AS pay_pattern
    FROM employees AS e1
)
SELECT hire_date, salary, pay_pattern
FROM pay_pattern_cte
ORDER BY hire_date;


---lets say i just want to know every month how much i paid in 2022 and compare it to max_total

WITH Rolling_Total as 
(
SELECT TO_CHAR(hire_date,'YYYY-MM') as month_for_pay, SUM(salary) as total_sal --same as mysql's substring(hire_date, 1,7)
FROM employees
Where TO_CHAR(hire_date,'YYYY-MM') like '2022%' --if i want to know every month in every year then remove this clause
GROUP BY month_for_pay
)
Select month_for_pay,total_sal, max(total_sal) OVER(order by month_for_pay) as rolling_max_MONTH, 
	max(total_sal)over(order by month_for_pay rows between unbounded preceding and unbounded following) as rolling_max_unbounded
From Rolling_Total
;

--we know max sal in a month is 343,767, but since in rolling_max_total still max salary comes in 7/2022
-- it basically looks at current and all before as default 
--however if i specify no look at whole table as in next column then we see 343,767 appear 



--lets say i just want to know every month how much i paid in 2022 and get rolling totals 
WITH Rolling_Total as 
(
SELECT TO_CHAR(hire_date,'YYYY-MM') as month_for_pay, SUM(salary) as total_sal --same as mysql's substring(hire_date, 1,7)
FROM employees
Where TO_CHAR(hire_date,'YYYY-MM') like '2022%' --if i want to know every month in every year then remove this clause
GROUP BY month_for_pay
)
Select month_for_pay,total_sal, sum(total_sal) OVER(order by month_for_pay) as rolling_total_MONTH, 
	sum(total_sal) OVER(order by month_for_pay rows between unbounded preceding and unbounded following) as rolling_unbounded
From Rolling_Total
;
--basically what i found here is that sum with unbounded rows basically got me sum of all salaries in 2022 
--cuz i told it to not just look at current and preceding rows but to consider the whole table  

--check 2022 total salary
select to_char(hire_date,'YYYY') as Year, sum(salary)
from employees 
where to_char(hire_date,'YYYY') = '2022'
group by to_char(hire_date,'YYYY') ;
--so yes im correct the 2727628 referred to total sal of 2022


--using window functions and fetching functions 
with cte as (
select to_char(hire_date, 'YYYY-MM') as month_hire , sum(salary) as total_sal
from employees
where to_char(hire_date, 'YYYY-MM') ilike '2022%'
group by to_char(hire_date, 'YYYY-MM'))
select month_hire, total_sal, 
	first_value(total_sal)over(order by month_hire) as first_val_jan, 
	last_value(total_sal)over(order by month_hire rows between unbounded preceding and unbounded following) as last_val_dec,
	lag(total_sal, 1)over() as last_month_pay, lead(total_sal, 1)over() as next_month_pay
from cte; 
/*writing it as first_value(total_sal)over(order by month_hire rows between unbounded preceding and unbounded following) doesnt matter 
cuz first_value already considers 1st row only/1st month, but for last_val its important to include unbounded preceding and followign to give u the last 
val in 2022 which is in dec */

-- create a VIEW (similar to temp table) u can then call the view and query from it-------------- 
create view employee_names as 
select first_name, last_name, hire_date 
from employees; 

select * 
from employee_names; 

--checking the table views you created
SELECT * FROM information_schema.views
WHERE table_schema not in ('pg_catalog', 'information_schema');

--checking tables 
SELECT * FROM information_schema.tables
WHERE table_schema not in ('pg_catalog', 'information_schema');


--- i want the employee id, name, salary of employees who's salaries above the avg salary 

--subquery format 
select employee_id, first_name, last_name, salary, (select avg(salary) from employees)
from employees
where salary > (select avg(salary) from employees); 

--cte format
with avg_salary as
(
select avg(salary) as avg_sal
from employees 	
)
select employee_id, first_name, last_name, salary, avg_sal
from employees, avg_salary 
where salary > avg_sal;


--compare employees' salaries to the average salary for their city location 

--firs thing joined imp columns in the 3 tables
create temporary table temp_table as(	
select shop.coffeeshop_id, coffeeshop_name, shop.city_id, first_name, last_name,emp.salary,city
from shops as shop
join locations as loc on shop.city_id=loc.city_id
join employees as emp on shop.coffeeshop_id = emp.coffeeshop_id
order by city_id) ; 

select*
from temp_table; 

--2nd thing created avg salary based on city and called on column from table 1 and 3
create temporary table loc_avg_sal as(
select city, avg(salary)
from temp_table
group by city); 

--3rd thing join 1st and second query 
select *
from temp_table as tempT 
join loc_avg_sal as loc
on tempT.city = loc.city; 


-- you could've also cleaned it up in a CTE to acheive same results and to avoid so many temp. tables : 
WITH temp_table AS (
    SELECT 
        shop.coffeeshop_id, 
        shop.coffeeshop_name, 
        shop.city_id, 
        emp.first_name, 
        emp.last_name, 
        emp.salary, 
        loc.city
    FROM shops AS shop
    JOIN locations AS loc 
        ON shop.city_id = loc.city_id
    JOIN employees AS emp 
        ON shop.coffeeshop_id = emp.coffeeshop_id
),
loc_avg_sal AS (
    SELECT 
        city, 
        AVG(salary) AS avg_salary
    FROM temp_table
    GROUP BY city
)
SELECT 
    tempT.*, 
    loc.avg_salary
FROM temp_table AS tempT
JOIN loc_avg_sal AS loc
    ON tempT.city = loc.city
ORDER BY tempT.city_id;

-----------Pivot tables--------
--select in 2015 salaries paid in august and september grouping by gender and hire date 
/*when creating the pivot tabel make sure first select is what u want in first column and then second select 
is what will appear as headlines of other columns and 3rd select will be the values added in the rows
make sure after ct is in same order with correct datatype and in double quotes*/ 

create extension if not exists tablefunc; 

select * from crosstab ($$
select coffeeshop_id, coffee_type, supplier_name 
from suppliers
where coffee_type in ('Arabica', 'Robusta')
ORDER BY coffeeshop_id asc, coffee_type desc
$$) as ct (coffeeshop_id INTEGER, "Arabica" VARCHAR, "Robusta" VARCHAR); 

--another pivot table i want to see what suppliers bring coffee type arabic and robusta for each coffeeshop_id 
create extension if not exists tablefunc; 

select * from crosstab($$
select gender, to_char(hire_date,'YYYY-MM') as hire_month, sum(salary) :: NUMERIC as Sal
from employees
where to_char(hire_date,'YYYY-MM') in ('2015-08', '2015-09')
group by gender,  to_char(hire_date,'YYYY-MM')
ORDER BY gender, hire_month
$$) as ct(gender VARCHAR, "2015-08" NUMERIC,  "2015-09" NUMERIC);

--couldve also solved it with window functions ranking them from highest to lowest salary total each month

select * from crosstab($$
with cte as(
select gender, to_char(hire_date,'YYYY-MM') as hire_month, sum(salary) :: NUMERIC as Sal
from employees
where to_char(hire_date,'YYYY-MM') in ('2015-08', '2015-09')
group by gender, to_char(hire_date,'YYYY-MM')
)
select gender, hire_month,  
	dense_rank()over(partition by hire_month order by sal desc) :: NUMERIC AS rank
from cte
ORDER BY gender desc, hire_month
$$) as ct(gender VARCHAR, "2015-08" NUMERIC,  "2015-09" NUMERIC);

----------------------PAGING-------------------------------

with cte as (
select salary, ntile(3)over(order by salary desc) as Salary_Group
from employees)
select salary, Salary_Group, 
case 
	when Salary_Group=1 then 'Highest Paid'
	when Salary_Group =2 then 'Medium Paid'
	when Salary_Group = 3 then 'Lowest Paid'
end
from cte; 
--Employees in SalaryGroup 1 have the highest salaries.
--Employees in SalaryGroup 2 have medium salaries.
--Employees in SalaryGroup 3 have the lowest salaries.
/*Using NTILE and passing 3 as n, and ordering by the salaries in descending order, 
        --the query's results will be split into thirds, with the top 33% of salaries in the top third 
        (with the Third column's value being 1), the middle 33% in the middle third (with the Third column's value being 2), 
        and the bottom 33% in the bottom third (with the Third column's value being 3). This way, you can easily label the top, 
        middle, or bottom x% of your data.*/ 






-----------------------ROLL-UP AND CUBE------------------------ 

--regular group by 
select emp.coffeeshop_id, sh.coffeeshop_name, gender, sum(salary)
from employees as emp
join shops as sh
on emp. coffeeshop_id = sh.coffeeshop_id
Group by emp.coffeeshop_id, sh.coffeeshop_name, gender
order by emp.coffeeshop_id; 

--roll-up group by : lets say i want to see totals regardless fo gender in each coffee shop 
	--can include this makaan gender to remove the nulls, but nulls indicate group totals : coalesce (gender, 'All genders') as gender_type
select emp.coffeeshop_id, sh.coffeeshop_name, gender, sum(salary), (select sum(salary) from employees) as total_all_shops
from employees as emp
join shops as sh
on emp. coffeeshop_id = sh.coffeeshop_id
Group by emp.coffeeshop_id, sh.coffeeshop_name, rollup (gender)
order by emp.coffeeshop_id; 

---group by cube: lets say i want to see all totals 
select emp.coffeeshop_id, sh.coffeeshop_name, gender, sum(salary)
from employees as emp
join shops as sh
on emp. coffeeshop_id = sh.coffeeshop_id
Group by cube(emp.coffeeshop_id, sh.coffeeshop_name, gender)
order by emp.coffeeshop_id; 
-- generates a result set that includes:
	--Total salary by coffeeshop_id, coffeeshop_name, and gender.
	--Total salary by coffeeshop_id and coffeeshop_name (regardless of gender).
	--Total salary by coffeeshop_id and gender (regardless of coffee shop name).
	--Total salary by sh.coffeeshop_name and gender (regardless of coffeeshop_id).
	--Total salary by coffeeshop_id only.
	--Total salary by sh.coffeeshop_name only.
	--Total salary by gender only.
	--Grand total (all salaries regardless of coffeeshop_id, sh.coffeeshop_name, or gender).

--but above results are all over the place, lets organize it: 
SELECT emp.coffeeshop_id,
    COALESCE(sh.coffeeshop_name, 'All Coffee Shops') AS coffeeshop_name,
    COALESCE(gender, 'All Genders') AS gender,
    SUM(salary) AS total_salary,
    CASE
        WHEN GROUPING(emp.coffeeshop_id) = 1 THEN 'Grand Total'
        WHEN GROUPING(gender) = 1 THEN 'Subtotal by Coffee Shop'
        ELSE 'Detailed'
    END AS aggregation_level
FROM employees AS emp
JOIN shops AS sh
ON emp.coffeeshop_id = sh.coffeeshop_id
GROUP BY CUBE(emp.coffeeshop_id, sh.coffeeshop_name, gender)
ORDER BY 
 	emp.coffeeshop_id NULLS FIRST, 
    sh.coffeeshop_name NULLS FIRST, 
    gender NULLS FIRST;
  

/* Explanation: 

GROUPING() is a function used with the CUBE, ROLLUP, or GROUPING SETS clauses to determine whether a column in the result set is 
being aggregated (i.e., whether it appears as NULL because of the aggregation). It returns 1 if the column is aggregated 
and 0 if it is not.
WHEN GROUPING(emp.coffeeshop_id) = 1 THEN 'Grand Total':

This condition checks if GROUPING(emp.coffeeshop_id) returns 1, meaning that coffeeshop_id is aggregated (i.e., it is NULL in the result
set). If true, it labels the row as 'Grand Total'. This label appears when all other columns are aggregated, showing the total across 
all coffee shops and genders.
WHEN GROUPING(gender) = 1 THEN 'Subtotal by Coffee Shop':

This condition checks if GROUPING(gender) returns 1, meaning that gender is aggregated. If true, it labels it. This label appears 
when coffeeshop_id is included but gender is aggregated, showing subtotals for each coffee shop across all genders.

ELSE 'Detailed':
The ELSE clause catches all other cases where neither coffeeshop_id nor gender are fully aggregated 
*/
   
---removing coffeeshop_id so u dont have unecessary repitition    
select COALESCE(sh.coffeeshop_name, 'All Coffee Shops') AS coffeeshop_name,
    COALESCE(gender, 'All Genders') AS gender,
    SUM(salary) AS total_salary,
    CASE
        WHEN GROUPING(sh.coffeeshop_name) = 1 THEN 'Grand Total'
        WHEN GROUPING(gender) = 1 THEN 'Subtotal by Coffee Shop'
        ELSE 'Detailed'
    END AS aggregation_level
FROM employees AS emp
JOIN shops AS sh
ON emp.coffeeshop_id = sh.coffeeshop_id
GROUP BY cube(sh.coffeeshop_name, gender)
ORDER BY 
    sh.coffeeshop_name NULLS FIRST, 
    gender NULLS FIRST;
   
--notice this rollup : 
   
select COALESCE(sh.coffeeshop_name, 'All Coffee Shops') AS coffeeshop_name,
    COALESCE(gender, 'All Genders') AS gender,
    SUM(salary) AS total_salary,
    CASE
        WHEN GROUPING(sh.coffeeshop_name) = 1 THEN 'Grand Total'
        WHEN GROUPING(gender) = 1 THEN 'Subtotal by Coffee Shop'
        ELSE 'Detailed'
    END AS aggregation_level
FROM employees AS emp
JOIN shops AS sh
ON emp.coffeeshop_id = sh.coffeeshop_id
GROUP BY rollup(sh.coffeeshop_name, gender)
ORDER BY 
    sh.coffeeshop_name NULLS FIRST, 
    gender NULLS FIRST;
   
--compare rollup above to the following : 
   
select COALESCE(sh.coffeeshop_name, 'All Coffee Shops') AS coffeeshop_name,
    COALESCE(gender, 'All Genders') AS gender,
    SUM(salary) AS total_salary,
    CASE
        WHEN GROUPING(sh.coffeeshop_name) = 1 THEN 'Grand Total'
        WHEN GROUPING(gender) = 1 THEN 'Subtotal by Coffee Shop'
        ELSE 'Detailed'
    END AS aggregation_level
FROM employees AS emp
JOIN shops AS sh
ON emp.coffeeshop_id = sh.coffeeshop_id
GROUP BY rollup(gender, sh.coffeeshop_name)
ORDER BY 
    sh.coffeeshop_name NULLS FIRST, 
    gender NULLS FIRST;

   
   
 --Grouping sets,here i did regular group by first with gender only, then with coffeeshop_name only 
 --and one with the combination of coffeeshop_name and gender 
select COALESCE(sh.coffeeshop_name, 'All Coffee Shops') AS coffeeshop_name,
    COALESCE(gender, 'All Genders') AS gender,
    SUM(salary) AS total_salary,
    CASE
        WHEN GROUPING(sh.coffeeshop_name) = 1 THEN 'Grand Total'
        WHEN GROUPING(gender) = 1 THEN 'Subtotal by Coffee Shop'
        ELSE 'Detailed'
    END AS aggregation_level
FROM employees AS emp
JOIN shops AS sh
ON emp.coffeeshop_id = sh.coffeeshop_id
GROUP BY grouping sets((sh.coffeeshop_name), (gender), (sh.coffeeshop_name, gender))
ORDER BY 
    sh.coffeeshop_name NULLS FIRST, 
    gender nulls FIRST;
   
   
   
--check this grouping sets: --i did regular group by  with gender only, then i want grand total salary as if i didnt even group by
-- and then with the combination of coffeeshop_name and gender  
  
select COALESCE(sh.coffeeshop_name, 'All Coffee Shops') AS coffeeshop_name,
    COALESCE(gender, 'All Genders') AS gender,
    SUM(salary) AS total_salary,
    CASE
        WHEN GROUPING(sh.coffeeshop_name) = 1 THEN 'Grand Total'
        WHEN GROUPING(gender) = 1 THEN 'Subtotal by Coffee Shop'
        ELSE 'Detailed'
    END AS aggregation_level
FROM employees AS emp
JOIN shops AS sh
ON emp.coffeeshop_id = sh.coffeeshop_id
GROUP BY grouping sets((gender), (sh.coffeeshop_name, gender), ())
ORDER BY 
    sh.coffeeshop_name NULLS FIRST, 
    gender NULLS FIRST;

-----------------String_agg-----------------

--Top 2 highest paid employees without mentioning rank number i just wanna grab top 2 bas kida 
WITH Salary_Ranking as(
Select employee_id, first_name, last_name, salary, dense_rank() over(order by salary desc) as ranking
from employees
)
Select string_agg(first_name || ' ' || last_name || ' - ' || employee_id, ' ,  ')
from  Salary_Ranking
where ranking <=2; 

---check properties of table either with this code or right click properties on table
SELECT * 
 FROM INFORMATION_SCHEMA.COLUMNS
 WHERE table_name = 'suppliers'; 

select column_name, data_type 
from INFORMATION_SCHEMA.COLUMNS
where table_name = 'shops'; 


--interval data types 
select hire_date, hire_date + interval '3 days' as interval from employees; 

--i want to add 3 days to today
select current_timestamp, interval '3 days' + current_timestamp as interval;  


	
--how long have employees been at the company USING AGE FUNCTION
select hire_date, age(hire_date), first_name 
from employees
--where age(hire_date)::text like '10 year%' 
order by age(hire_date) desc; 



--find those who have been employees for 8 to 14 years at the company
--for the between fn to work balaash to use text datatype and use extract  
SELECT hire_date, age(hire_date), first_name 
FROM employees
WHERE EXTRACT(YEAR FROM age(hire_date)) BETWEEN 8 AND 14
ORDER BY age(hire_date) DESC;

select * from employees; 

select pg_typeof(employee_id)
from employees; 

--tells u current date and time right now , check SQL notes also for more
select now(); 
--date only
SELECT cast( now() AS date ); 

--cast and :: same thing
select cast(3.7 as integer); 
select 3.7::integer; 

--truncating and grouping : I wanna know how many employees make a salary within each group of 10,000s so i need 4 zeros

select trunc(salary, -4) as trunc_sal , count (*)
from employees 
group by trunc(salary, -4) 
order by trunc(salary, -4) desc; 
--so basically means in the 20,000s there are 155 employees making that amount (and it ranges from 20,000 to 29,999)


--i wanna bin employee salaries in incraments of 5,000 seeing how many earn from 10,000 to 65,000

SELECT floor(salary / 5000) * 5000 AS trunc_sal, --use floor fn to allocate salary to a bin, cant use trunc here like above 
        count(*) AS count
    FROM employees
    WHERE salary >= 10000 AND salary < 65000
    GROUP BY trunc_sal
    ORDER BY trunc_sal; 
   
--sometimes you have year 1900s to 2020 and maybe u need to increment into decades for ex: 1910s together and 1920s together and 1930s 
--together and so on and will have to then floor(salary/10)*10 

/*WHY DO I NEED TO FLOOR SALARY: 

EX:
For a salary of 23,456:

FLOOR(salary / 5000) * 5000 becomes:
salary / 5000 = 23,456 / 5000 = 4.6912
FLOOR(4.6912) = 4
4 * 5000 = 20,000

YOU cant just floor (salary) cuz what this returns is 23,456 not allocate it to its bin of 20,000 */


----i wanna bin employee salaries in incraments of 5,000 seeing how many earn from 10,000 to 65,000 with upper and lower bounds

WITH bins AS (
    SELECT generate_series(10000, 60000, 5000) AS lower_bound,
           generate_series(15000, 65000, 5000) AS upper_bound
),
salary_bins AS (
    SELECT 
        salary 
    FROM employees
    WHERE salary >= 10000 AND salary < 65000
)
-- Count values in each bin
SELECT 
    bins.lower_bound AS lower, 
    bins.upper_bound AS upper, 
   count(salary) AS count
FROM bins
LEFT JOIN salary_bins
ON salary >= bins.lower_bound
AND salary < bins.upper_bound
group by lower, upper
ORDER BY bins.lower_bound desc;

--basically im saying from 20,000 to 25,000 i have 79 employees making that amount and 25,000 and 30,000 i have 76 employees which adds up to 155 as in the query above
--the lower_bound is inclusive and the upper_bound is exclusive
--For example, if the bin range is [10000, 15000), it includes 10000 but excludes 15000


select * from employees; 


--is there a correlation between hire date age and salary of the person 
create temp table correlation as 
SELECT corr(EXTRACT(YEAR FROM age(hire_date)), salary) AS correlation
    FROM employees

--I want to round it to 2 decimal places, first cast it to numeric for rounding to work
select round (correlation::numeric, 2) from correlation; 

--there appears to be no correlation between age spent by employee at the company and salary


--i want the median of salary ranges in my table 

select percentile_disc(0.5) within group (order by salary)
from employees; 

select percentile_cont(0.5) within group (order by salary)
from employees;

----here sal of percentile_disc does exist cuz it onyl returns values that exist in data
select first_name, salary 
from employees 
where salary = 38345

--here sal of percentile_cont does not exist cuz it treats ur data as continous 
select first_name, salary 
from employees 
where salary = 3816

select avg(salary),stddev (salary)
from employees; 

with count_table as(
select count (*) as count_employees, coffeeshop_id
from employees
group by coffeeshop_id
order by coffeeshop_id
)
select corr(count_employees,coffeeshop_id) 
from count_table
; 
--there appears to be a very strong positive correlation between employee count and which coffeeshop they are in 

with count_table as(
select count (*) as count_employees, coffeeshop_id, city_id
from employees
join shops 
using (coffeeshop_id)
join locations 
using (city_id)
order by coffeeshop_id
)
select corr(count_employees,city_id) 
from count_table
; 
----there appears to be no strong positive correlation between employee count and which city they are in 


select * from locations ;  
select * from shops; 

--create temp table for the 80th percentile in each coffeeshop(in which 80% or less of employees make that amountand onyl 20% make higher salaries)

create temp table percentile80 as 
select coffeeshop_id, percentile_disc (0.8) within group (order by salary) 
from employees
group by coffeeshop_id; 

select * from percentile80 ;

--i want to see if median and avg are close or not and which direction it is skewed more towards
select coffeeshop_id, percentile_disc (0.5) within group (order by salary), round(avg(salary),0)
from employees
group by coffeeshop_id


select * from employees ; 

select * from shops; 

select * from locations;


/* EXISTS: It is a special case of a correlated nested query and allows us the check whether the result of a correlated nested
 query is empty or not. The EXISTS function returns a boolean value, which is either TRUE or FALSE. TRUE is returned if 
the result of the correlated nested query has at least one row, that means it is not empty. FALSE is returned if the query 
returns an empty table. When EXISTS returns TRUE the corresponding row of the outer query is selected.*/

select * 
from locations as l
where exists (
select * 
from shops s
where s.city_id=l.city_id
)

