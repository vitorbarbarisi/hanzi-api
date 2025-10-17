--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22
-- Dumped by pg_dump version 12.22

-- Started on 2025-10-10 15:24:10 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16394)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16385)
-- Name: hanzi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hanzi (
    "character" character varying(1) NOT NULL,
    frequency integer NOT NULL,
    calls integer,
    meaning character varying,
    decomposition character varying,
    etymology character varying,
    related_words character varying,
    CONSTRAINT ck_hanzi_character_length CHECK ((length(("character")::text) = 1))
);


ALTER TABLE public.hanzi OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16420)
-- Name: word; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.word (
    word character varying NOT NULL,
    pinyin character varying NOT NULL,
    translation character varying NOT NULL,
    calls integer,
    confidence_level integer NOT NULL,
    tone_pair integer,
    CONSTRAINT ck_word_confidence_level_range CHECK (((confidence_level >= 1) AND (confidence_level <= 3)))
);


ALTER TABLE public.word OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 41026)
-- Name: word_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.word_translation (
    id integer NOT NULL,
    word character varying NOT NULL,
    translation character varying NOT NULL
);


ALTER TABLE public.word_translation OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 41024)
-- Name: word_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.word_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.word_translation_id_seq OWNER TO postgres;

--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 205
-- Name: word_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.word_translation_id_seq OWNED BY public.word_translation.id;


--
-- TOC entry 2910 (class 2604 OID 41029)
-- Name: word_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_translation ALTER COLUMN id SET DEFAULT nextval('public.word_translation_id_seq'::regclass);


--
-- TOC entry 3047 (class 0 OID 16394)
-- Dependencies: 203
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
d315a7406375
\.


--
-- TOC entry 3046 (class 0 OID 16385)
-- Dependencies: 202
-- Data for Name: hanzi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hanzi ("character", frequency, calls, meaning, decomposition, etymology, related_words) FROM stdin;
介	829	0				
绍	1232	0				
家	56	0				
张	318	0				
亮	838	0				
年	45	0				
岁	771	0				
北	315	0				
京	566	0				
高	134	0				
兴	531	0				
工	118	0				
作	49	0				
谢	895	0				
紹	1232	0				
張	318	0				
歲	771	0				
歡	684	0				
興	531	0				
謝	895	0				
爸	1048	0				
名	203	0				
医	482	0				
生	34	0				
院	338	0				
病	427	0				
师	333	0				
数	231	0				
习	675	0				
醫	482	0				
師	333	0				
數	231	0				
習	675	0				
朋	880	0				
字	393	0				
李	472	0				
认	213	0				
识	340	0				
漂	1566	0				
温	865	0				
柔	1571	0				
猫	1671	0				
儿	192	0				
因	96	0				
经	62	0				
常	187	0				
语	493	0				
認	213	0				
識	340	0				
溫	865	0				
貓	1671	0				
兒	192	0				
漢	710	0				
語	493	0				
喂	1985	0				
飞	347	0				
机	111	0				
现	70	0				
准	379	0				
备	397	0				
出	28	0				
租	1395	0				
饭	933	0				
店	1039	0				
再	242	0				
飛	347	0				
機	111	0				
現	70	0				
準	379	0				
備	397	0				
飯	933	0				
久	636	0				
爷	1005	0				
鬼	1040	0				
突	484	0				
然	55	0				
跳	997	0				
谁	647	0				
偷	1282	0				
爺	1005	0				
誰	647	0				
水	202	0				
果	165	0				
苹	2473	0				
梨	2998	0				
视	438	0				
蘋	2473	0				
視	438	0				
少	233	0				
钱	603	0				
员	200	0				
块	791	0				
香	775	0				
给	180	5				
国	20	207				
和	19	44				
里	50	6				
話	170	14				
完	301	3				
給	180	7				
個	12	32				
經	62	6				
做	246	6				
樣	88	13				
本	92	260				
呢	383	65				
有	8	124				
吧	470	40				
话	170	10				
什	156	50				
中	14	183				
書	282	21				
狗	1279	6				
大	17	36				
下	42	25				
自	43	1				
喜	667	1				
欢	684	1				
坐	611	14				
見	153	6				
能	35	126				
后	48	11				
電	230	24				
了	5	95				
来	15	43				
明	121	97				
丽	832	40				
们	13	21				
國	20	202				
麗	832	48				
叫	387	8				
麼	63	50				
老	179	14				
學	66	4				
校	632	8				
的	1	191				
友	594	20				
車	361	56				
学	66	4				
一	2	70				
书	282	15				
为	18	10				
為	18	10				
车	361	58				
對	33	20				
说	24	8				
酒	795	14				
也	31	29				
这	11	5				
玩	1070	15				
天	78	112				
影	390	18				
很	138	58				
见	153	4				
起	75	41				
教	191	12				
吃	475	50				
說	24	12				
样	88	9				
对	33	16				
汉	710	4				
多	61	13				
电	230	18				
後	48	13				
那	38	57				
在	6	63				
裡	50	8				
打	223	12				
來	15	45				
不	4	168				
媽	749	24				
妈	749	14				
她	91	14				
个	12	18				
蕉	3098	0				
斤	1863	0				
买	757	0				
文	148	0				
錢	603	0				
員	200	0				
塊	791	0				
買	757	0				
干	353	0				
幹	353	0				
星	537	0				
期	253	0				
六	478	0				
昨	1473	0				
月	169	0				
英	371	0				
图	476	0				
馆	1009	0				
圖	476	0				
館	1009	0				
二	157	0				
三	125	0				
週	490	0				
球	627	0				
战	145	0				
戰	145	0				
点	128	0				
九	445	0				
十	112	0				
刻	618	0				
半	513	0				
點	128	0				
午	1002	0				
商	402	0				
睡	962	0				
觉	327	0				
用	51	0				
客	583	0				
气	217	0				
覺	327	0				
氣	217	0				
脑	645	0				
桌	1191	0				
腦	645	0				
肚	1798	0				
疼	1708	0				
快	366	0				
走	207	0				
王	299	0				
平	215	0				
候	341	0				
回	172	0				
知	123	0				
道	52	0				
写	448	0				
寫	448	0				
又	126	0				
便	271	0				
宜	1288	0				
请	421	0				
事	58	0				
间	135	0				
請	421	0				
間	135	0				
所	54	0				
从	98	0				
住	309	0				
路	305	0				
分	79	0				
钟	903	0				
鐘	903	0				
同	69	0				
晚	640	0				
忘	1054	0				
关	127	0				
系	216	0				
關	127	0				
係	216	0				
海	189	0				
火	433	0				
票	908	0				
才	235	0				
长	109	0				
長	109	0				
冰	1068	0				
热	606	0				
杯	1394	0				
口	212	0				
渴	1969	0				
奇	563	0				
怪	774	0				
熱	606	0				
手	143	0				
表	177	0				
刚	621	0				
旁	979	0				
边	316	0				
錶	177	0				
剛	621	0				
邊	316	0				
最	139	0				
过	46	0				
女	224	0				
男	602	0				
茶	1270	0				
阿	471	0				
姨	2282	0				
进	81	0				
進	81	0				
元	370	0				
衣	724	0				
服	365	0				
淘	2494	0				
宝	809	0				
寶	809	0				
乒	3441	0				
乓	3495	0				
旅	948	0				
游	694	0				
遊	694	0				
泳	2602	0				
几	211	8				
只	97	14				
哪	651	132				
子	37	6				
樂	619	8				
四	226	6				
五	279	12				
等	158	1				
幾	211	10				
羅	392	4				
周	490	6				
以	23	50				
過	46	12				
記	306	9				
地	21	12				
上	16	51				
露	839	15				
行	53	4				
两	133	1				
保	266	8				
乐	619	8				
真	204	40				
問	137	13				
啊	752	21				
前	93	10				
會	29	40				
件	250	1				
開	94	49				
美	151	94				
喝	981	14				
呀	927	10				
他	10	24				
方	60	12				
问	137	9				
西	167	14				
還	80	22				
號	487	25				
想	99	47				
嗎	453	101				
些	86	15				
菜	1264	26				
到	22	16				
时	25	4				
太	240	24				
日	101	17				
记	306	8				
兩	133	2				
号	487	22				
雨	926	189				
没	72	10				
但	95	40				
要	26	27				
時	25	6				
面	74	17				
会	29	34				
這	11	16				
每	359	0				
凉	1579	0				
涼	1579	0				
咖	2374	0				
啡	2321	0				
辣	2415	0				
巧	1217	0				
克	262	0				
力	106	0				
淇	4001	0				
淋	2163	0				
广	468	0				
州	720	0				
早	462	0				
送	655	0				
登	815	0				
廣	468	0				
汪	1873	0				
杰	1127	0				
意	104	0				
思	298	0				
它	107	0				
傑	1127	0				
贵	871	0				
貴	871	0				
空	272	0				
听	285	0				
歌	1038	0				
聽	285	0				
啦	1192	0				
嗯	2038	0				
东	194	0				
東	194	0				
新	161	0				
姓	1147	0				
先	188	0				
祝	1649	0				
步	349	0				
正	129	0				
司	278	0				
山	259	0				
附	921	0				
近	374	0				
南	307	0				
句	706	0				
帮	768	0				
幫	768	0				
黄	561	0				
色	304	0				
耳	885	0				
朵	1569	0				
黑	519	0				
隻	97	0				
黃	561	0				
冷	699	0				
休	1080	0				
息	428	0				
考	495	0				
试	642	0				
試	642	0				
哥	802	0				
姐	828	0				
弟	814	0				
妹	1183	0				
读	751	0				
讀	751	0				
帅	1885	0				
帥	1885	0				
忙	825	0				
华	412	0				
華	412	0				
哇	2428	0				
第	114	0				
春	919	0				
节	514	0				
累	1321	0				
假	635	0				
節	514	0				
带	342	0				
班	882	0				
圆	1143	0				
圓	1143	0				
慢	820	0				
已	117	0				
算	403	0				
题	218	0				
梦	863	0				
題	218	0				
夢	863	0				
业	130	0				
堆	1368	0				
業	130	0				
超	753	0				
市	254	0				
麦	1169	0				
麥	1169	0				
相	152	0				
片	455	0				
万	322	0				
萬	322	0				
务	245	0				
拼	1818	0				
音	540	0				
密	591	0				
哎	2289	0				
務	245	0				
抱	1120	0				
歉	2144	0				
末	1162	0				
颜	1543	0				
绿	1086	0				
红	502	0				
蓝	1188	0				
紫	1644	0				
顏	1543	0				
綠	1086	0				
紅	502	0				
藍	1188	0				
哈	712	0				
花	410	0				
像	294	0				
阴	985	0				
希	508	0				
望	326	0				
陰	985	0				
别	222	0				
別	222	0				
世	181	0				
界	288	0				
哦	1910	0				
裏	50	0				
调	400	0				
調	400	0				
孩	533	0				
笑	346	0				
发	47	0				
短	887	0				
单	389	0				
眼	281	0				
懂	1209	36				
林	364	6				
己	162	1				
重	140	12				
辦	367	4				
您	725	1				
死	317	1				
非	283	1				
帶	342	6				
甜	2017	1				
宮	980	14				
故	572	29				
卖	972	4				
賣	972	4				
加	166	41				
信	176	47				
扫	1433	30				
办	367	2				
掃	1433	31				
法	65	6				
都	68	9				
愛	394	2				
级	415	5				
爱	394	1				
码	1343	5				
跑	862	10				
公	115	14				
汽	1198	14				
就	27	18				
課	1206	9				
次	183	18				
級	415	7				
宫	980	15				
拿	644	6				
找	466	10				
雪	1001	40				
课	1206	10				
共	330	14				
着	41	8				
碼	1343	7				
外	131	9				
皮	740	0				
双	581	0				
髮	47	0				
單	389	0				
雙	581	0				
头	147	0				
睛	932	0				
頭	147	0				
马	276	0				
馬	276	0				
门	185	0				
門	185	0				
川	1107	0				
食	670	0				
堂	978	0				
包	454	0				
室	707	0				
麵	74	0				
洗	1245	0				
馅	3756	0				
肉	1007	0				
餡	3756	0				
米	575	0				
稍	1371	0				
总	228	0				
迎	1067	0				
顺	936	0				
利	155	0				
總	228	0				
順	936	0				
站	544	0				
停	692	0				
卫	668	0				
唉	2087	0				
场	249	0				
衛	668	0				
場	249	0				
剧	907	0				
劇	907	0				
饿	1908	0				
餓	1908	0				
伞	2197	0				
傘	2197	0				
楼	874	0				
樓	874	0				
鸟	1261	0				
鳥	1261	0				
堡	1519	0				
鸡	1389	0				
蛋	1385	0				
雞	1389	0				
穿	783	0				
千	599	0				
百	407	0				
哼	1963	0				
秋	1149	0				
巴	546	0				
士	372	0				
煮	2577	0				
园	986	0				
園	986	0				
往	369	0				
袋	1308	0				
售	1112	0				
货	816	0				
支	437	0				
付	818	0				
貨	816	0				
白	286	0				
错	637	0				
噢	2342	0				
錯	637	0				
而	36	0				
且	296	0				
七	530	0				
猪	1760	0				
让	339	0				
豬	1760	0				
讓	339	0				
啤	2843	0				
哭	1208	0				
声	195	0				
聲	195	0				
薯	3357	0				
牛	1016	0				
油	946	0				
龙	695	0				
虾	2841	0				
种	57	0				
龍	695	0				
蝦	2841	0				
底	543	0				
购	1076	0				
購	1076	0				
低	592	0				
尾	1280	0				
笔	954	0				
筆	954	0				
词	957	0				
詞	957	0				
治	274	0				
金	260	0				
枪	872	0				
腿	1349	0				
槍	872	0				
椅	1661	0				
比	199	0				
糖	1744	0				
差	731	0				
身	164	0				
体	149	0				
體	149	0				
定	77	0				
答	559	0				
骂	1447	0				
罵	1447	0				
动	73	0				
画	881	0				
网	605	0				
卡	716	0				
畫	881	0				
網	605	0				
零	1340	0				
安	232	0				
棒	2283	0				
跟	541	0				
情	120	0				
傅	1884	0				
妻	1074	0				
湖	916	0				
瓜	1824	0				
警	686	0				
察	564	0				
主	87	0				
端	914	0				
粽	5035	0				
叶	918	0				
留	554	0				
硬	1168	0				
葉	918	0				
發	47	0				
床	1066	0				
懒	2225	0				
懶	2225	0				
难	295	0				
容	442	0				
易	461	0				
難	295	0				
夫	377	0				
泡	1997	0				
乾	1996	0				
存	384	0				
陪	1662	0				
如	67	0				
左	780	0				
右	781	0				
亲	362	0				
親	362	0				
跪	2124	0				
戏	1031	0				
溜	1920	0				
麻	1106	0				
烦	1251	0				
戲	1031	0				
煩	1251	0				
豆	1791	0				
变	225	0				
虽	504	0				
種	57	12				
物	142	12				
動	73	12				
八	451	1				
得	39	3				
鱼	850	4				
板	928	4				
魚	850	4				
奶	1276	1				
味	842	2				
鹅	2167	16				
嘛	1626	6				
窗	1072	10				
鵝	2167	24				
變	225	0				
雖	504	0				
告	310	0				
诉	595	0				
訴	595	0				
福	682	0				
幸	900	0				
简	715	0				
目	239	0				
簡	715	0				
骗	1501	0				
騙	1501	0				
胖	1890	0				
消	439	0				
晴	1965	0				
担	719	0				
擔	719	0				
礼	924	0				
糕	2408	0				
禮	924	0				
讲	555	0				
講	555	0				
聪	1667	0				
欧	821	0				
洲	700	0				
需	408	0				
聰	1667	0				
歐	821	0				
足	527	0				
摸	1365	0				
瑞	1330	0				
典	1042	0				
唱	1250	0				
挂	1230	0				
掛	1230	0				
鞋	1636	0				
脚	788	0				
腳	788	0				
夏	1124	0				
冬	1382	0				
之	44	0				
镜	1249	0				
器	441	0				
鏡	1249	0				
更	221	0				
接	247	0				
寓	2194	0				
酷	1864	0				
冒	1220	0				
险	671	0				
圣	958	0				
诞	1994	0				
聖	958	0				
誕	1994	0				
夜	664	0				
鞭	2245	0				
炮	912	0				
枝	1489	0				
玫	2298	0				
瑰	2487	0				
远	386	0				
遠	386	0				
独	626	0				
立	197	0				
烤	2623	0				
庆	1267	0				
獨	626	0				
慶	1267	0				
饼	2354	0				
餅	2354	0				
宠	2417	0				
寵	2417	0				
叔	1420	0				
照	443	0				
顾	813	0				
顧	813	0				
篮	2352	0				
籃	2352	0				
实	100	0				
寺	1889	0				
土	515	0				
悉	1426	0				
令	378	0				
管	252	0				
护	529	0				
矢	2805	0				
交	320	0				
通	190	0				
徒	1058	0				
謀	987	0				
木	693	0				
其	85	0				
树	696	0				
翔	2179	0				
虫	1285	0				
粉	1496	0				
標	473	0				
迢	3889	0				
止	596	0				
达	289	0				
赶	906	0				
敲	1730	0				
側	1218	0				
擊	395	0				
观	334	0				
若	650	0				
无	105	0				
扁	1735	0				
緣	1272	0				
框	2139	0				
式	303	0				
部	84	0				
首	481	0				
婪	3106	0				
论	205	0				
财	679	0				
禾	3580	0				
解	201	0				
智	883	0				
伦	968	0				
科	277	0				
清	335	0				
技	422	0				
丁	1166	0				
含	935	0				
宁	1017	0				
浆	2620	0				
类	311	0				
断	434	0				
精	435	0				
料	557	0				
继	654	0				
奥	970	0				
粮	1301	0				
糊	1391	0				
粗	1412	0				
澳	1625	0				
粒	1712	0				
粹	1734	0				
糟	1915	0				
粘	2235	0				
屡	2445	0				
谜	2466	0				
菊	2504	0				
麟	2746	0				
鳞	2757	0				
搂	2789	0				
粟	2877	0				
粪	2878	0				
缕	2888	0				
眯	2949	0				
磷	2950	0				
粥	3015	0				
鞠	3031	0				
糙	3112	0				
粤	3145	0				
懊	3206	0				
喽	3214	0				
咪	3307	0				
屎	3330	0				
彝	3547	0				
籽	3560	0				
粱	3592	0				
糜	3705	0				
髅	3752	0				
擞	3861	0				
篓	4003	0				
娄	4043	0				
糠	4157	0				
糯	4195	0				
褛	4237	0				
粼	4272	0				
镂	4287	0				
掬	4382	0				
嶙	4450	0				
偻	4553	0				
粑	4566	0				
璨	4617	0				
粕	4634	0				
活	219	1				
險	671	12				
境	582	6				
迷	1151	1				
酸	1454	44				
麋	4680	0				
田	776	0				
構	511	0				
痴	2220	0				
蜘	3037	0				
踟	5945	0				
聟	7824	0				
鼅	8275	0				
措	1146	0				
线	430	0				
翼	1292	0				
粲	4788	0				
薮	4813	0				
類	311	0				
遴	5028	0				
醚	5255	0				
鬻	5267	0				
瘘	5277	0				
僳	5333	0				
粳	5401	0				
蝼	5463	0				
糅	5482	0				
糁	5499	0				
籴	5502	0				
粜	5619	0				
粝	5663	0				
稻	2524	0				
籼	5842	0				
勺	3269	0				
匕	3246	0				
量	241	0				
约	424	0				
夕	2000	0				
钓	2300	0				
豹	2502	0				
灼	2861	0				
酌	2978	0				
芍	4346	0				
杓	5622	0				
尥	5772	0				
約	424	0				
趵	6010	0				
妁	6189	0				
訋	7576	0				
釣	2300	0				
靮	8031	0				
礿	8882	0				
湯	1616	0				
汤	1616	0				
舀	4288	0				
诛	3268	0				
梵	3270	0				
祭	1780	0				
儀	1281	0				
饲	1968	0				
嗣	2687	0				
伺	2776	0				
祠	3313	0				
笥	4653	0				
覗	7171	0				
飼	1968	0				
吐	1651	0				
壽	1613	0				
寿	1613	0				
官	432	0				
盎	3404	0				
匹	1905	0				
債	1221	0				
债	1221	0				
副	763	0				
權	297	0				
权	297	0				
達	289	0				
顶	998	0				
灯	1113	0				
订	1174	0				
厅	1215	0				
盯	1903	0				
亭	1999	0				
钉	2262	0				
叮	2606	0				
汀	3157	0				
町	3992	0				
酊	4769	0				
仃	4941	0				
玎	5838	0				
疔	6210	0				
耵	6506	0				
頂	998	0				
訂	1174	0				
釘	2262	0				
虰	7631	0				
饤	7870	0				
艼	8322	0				
布	380	0				
褲	2086	0				
裤	2086	0				
磊	3417	0				
亞	420	0				
亚	420	0				
神	227	0				
曲	1064	0				
墾	3032	0				
垦	3032	0				
屏	1888	0				
縣	875	0				
县	875	0				
志	542	0				
破	604	0				
针	1114	0				
织	578	0				
职	616	0				
积	727	0				
帜	2807	0				
炽	3271	0				
咫	4183	0				
枳	5257	0				
轵	6903	0				
怕	630	0				
形	269	0				
船	614	0				
提	196	0				
抓	990	0				
扔	1902	0				
推	505	0				
掌	888	0				
俄	973	0				
摩	1160	0				
拳	1782	0				
攀	2434	0				
娥	2778	0				
摹	3002	0				
挚	3006	0				
峨	3057	0				
挛	3344	0				
蛾	3392	0				
掣	3589	0				
掰	4240	0				
挈	5176	0				
挲	5184	0				
搿	5258	0				
硪	5318	0				
擘	5391	0				
莪	5754	0				
搴	5920	0				
義	208	0				
锇	6034	0				
議	368	0				
襻	6258	0				
镎	6279	0				
鐣	6714	0				
蟻	2512	0				
艤	7752	0				
藦	7716	0				
蒘	8126	0				
礒	8285	0				
睋	8565	0				
将	132	0				
报	234	0				
指	261	0				
据	313	0				
拉	324	0				
持	357	0				
势	506	0				
投	516	0				
批	569	0				
排	681	0				
挥	741	0				
执	762	0				
抗	765	0				
控	778	0				
托	797	0				
换	822	0				
掉	847	0				
括	848	0				
损	909	0				
摇	938	0				
择	959	0				
授	966	0				
型	556	1				
按	573	6				
探	915	6				
無	105	6				
言	355	2				
握	1030	0				
拍	1165	0				
招	939	0				
撑	2178	0				
擎	3046	0				
秧	3515	0				
苗	1917	0				
穗	3372	0				
程	314	0				
称	449	0				
委	457	0				
税	779	0				
移	878	0				
秘	894	0				
私	1021	0				
稳	1053	0				
透	1075	0				
秀	1134	0				
乘	1229	0				
季	1277	0				
秦	1392	0				
剩	1444	0				
黎	1474	0				
稿	1585	0				
魏	1646	0				
穆	1681	0				
诱	1705	0				
菌	1731	0				
秩	1747	0				
稀	1786	0				
莉	1875	0				
矮	2023	0				
秒	2024	0				
愁	2109	0				
稣	2287	0				
稽	2422	0				
绣	2429	0				
颖	2509	0				
秃	2516	0				
稚	2714	0				
萎	2751	0				
瞅	2761	0				
稼	2794	0				
秉	2803	0				
颓	2990	0				
揪	3059	0				
秽	3090	0				
犁	3170	0				
巍	3195	0				
臻	3292	0				
锈	3360	0				
稠	3361	0				
倭	3384	0				
酥	3509	0				
悸	3554	0				
俐	3557	0				
黏	3637	0				
秤	3728	0				
曦	3735	0				
秸	3831	0				
稷	3878	0				
羲	3933	0				
穑	4058	0				
啾	4071	0				
痢	4096	0				
蝌	4103	0				
秆	4121	0				
锹	4126	0				
嵇	4127	0				
诿	4282	0				
鳅	4445	0				
蜀	2597	0				
结	236	0				
伙	1045	0				
伴	1296	0				
逗	2582	0				
爬	1424	0				
肥	1618	0				
疤	3049	0				
芭	3120	0				
邑	3126	0				
靶	3231	0				
琶	3605	0				
笆	3609	0				
耙	4115	0				
杷	5171	0				
鲃	5781	0				
钯	5865	0				
岜	6072	0				
跁	8685	0				
匚	5437	0				
嘴	1008	0				
古	509	0				
啞	2363	0				
哑	2363	0				
奧	970	0				
乍	2908	0				
夭	3073	0				
炸	974	0				
窄	2239	0				
诈	2398	0				
咋	2824	0				
蚱	4394	0				
酢	4666	0				
祚	4777	0				
柞	5200	0				
笮	5249	0				
胙	5816	0				
舴	6170	0				
怍	6232	0				
砟	6264	0				
迮	6376	0				
阼	6453	0				
鲊	6969	0				
痄	7245	0				
苲	7657	0				
詐	2398	0				
驚	658	0				
惊	658	0				
浦	2156	0				
杭	2341	0				
灣	853	0				
湾	853	0				
啼	2907	0				
瓣	2909	0				
待	672	0				
街	1099	0				
德	256	0				
律	526	0				
征	738	0				
彻	1238	0				
役	1243	0				
彼	1254	0				
径	1305	0				
徐	1311	0				
御	1379	0				
循	1742	0				
履	1800	0				
惩	1819	0				
徽	2272	0				
徊	2997	0				
徘	3078	0				
薇	3187	0				
徙	3405	0				
徇	4075	0				
徨	4122	0				
徕	4759	0				
徭	4928	0				
屐	4958	0				
徉	5438	0				
徜	5555	0				
葎	5583	0				
徼	6099	0				
屣	6132	0				
徂	6321	0				
屦	6698	0				
縱	1234	0				
黴	2420	0				
蹤	1530	0				
禦	1379	0				
蓰	7152	0				
蓯	4682	0				
磫	7398	0				
鏦	7512	0				
藢	7950	0				
籞	8100	0				
矀	8281	0				
蓗	8325	0				
蕧	8449	0				
蘌	8454	0				
觀	334	0				
規	321	0				
粯	6513	0				
靦	4166	0				
覩	6580	0				
覍	7367	0				
覐	7726	0				
闚	7796	0				
覓	2819	0				
覙	7955	0				
覥	6758	0				
睍	8174	0				
蜆	5596	0				
萈	8442	0				
臗	8549	0				
覚	8664	0				
覛	8665	0				
覟	8666	0				
覠	8667	0				
覯	6484	0				
瞡	8810	0				
覵	8819	0				
规	321	0				
舰	849	0				
宽	1153	0				
览	1883	0				
搅	2673	0				
窥	2742	0				
揽	2801	0				
缆	2815	0				
觅	2819	0				
觑	3499	0				
榄	3600	0				
砚	4110	0				
觐	4418	0				
觎	4502	0				
觊	4570	0				
靓	4615	0				
苋	4798	0				
笕	4844	0				
髋	5045	0				
岘	5166	0				
蚬	5596	0				
觇	6247	0				
觋	6282	0				
觏	6484	0				
觍	6758	0				
枧	6766	0				
觌	6767	0				
鬶	8067	0				
錄	917	0				
橡	2865	0				
材	950	0				
睹	2563	0				
光	290	0				
感	243	0				
格	325	0				
直	255	0				
术	328	0				
根	352	0				
极	363	0				
具	391	0				
脏	1632	0				
值	600	0				
深	401	0				
省	665	0				
怀	761	0				
置	676	0				
集	406	0				
整	416	0				
督	944	0				
查	459	0				
刀	1065	0				
此	116	0				
化	178	0				
尼	653	0				
疑	697	0				
轮	1094	0				
倾	1258	0				
泥	1497	0				
凝	1629	0				
旨	1683	0				
蛇	1687	0				
柴	1978	0				
葬	2056	0				
妮	2120	0				
仑	2134	0				
陀	2138	0				
脂	2201	0				
雌	2377	0				
匙	2471	0				
哗	2481	0				
毙	2529	0				
驼	2632	0				
顷	2718	0				
沦	2727	0				
舵	3082	0				
靴	3085	0				
叱	3175	0				
诣	3469	0				
纶	3553	0				
讹	3773	0				
瘪	3803	0				
桦	3847	0				
抡	3860	0				
颍	3872	0				
疵	3977	0				
昵	4078	0				
鸵	4308	0				
沱	4366	0				
酯	4396	0				
晔	4424	0				
伲	4437	0				
龇	4507	0				
烨	4520	0				
佗	4550	0				
怩	4744	0				
骅	4781	0				
髭	4794	0				
砣	4900	0				
砦	4953	0				
鸨	4966	0				
牝	4991	0				
旎	5005	0				
囵	5202	0				
跎	5207	0				
呲	5313	0				
铧	5469	0				
肄	5501	0				
龀	5506	0				
鬯	5510	0				
誓	2091	0				
印	639	0				
代	174	0				
武	501	0				
贷	1603	0				
赋	1745	0				
斌	2437	0				
黛	2607	0				
腻	2813	0				
轼	2920	0				
忒	3138	0				
拭	3331	0				
鹉	3603	0				
贰	3885	0				
岱	4077	0				
弋	4252	0				
弑	4741	0				
鸢	4893	0				
玳	5407	0				
甙	5620	0				
赟	6379	0				
膩	2813	0				
贇	6379	0				
賦	1745	0				
铽	7196	0				
脦	7201	0				
碔	8080	0				
貣	8214	0				
貮	8469	0				
貸	1603	0				
鳶	4893	0				
鉽	8925	0				
鮘	8938	0				
族	549	0				
埃	1119	0				
疾	1271	0				
侯	1754	0				
挨	2009	0				
矣	2065	0				
喉	2092	0				
矩	2155	0				
嫉	2684	0				
簇	2890	0				
矫	2910	0				
俟	3598	0				
榘	4362	0				
雉	4541	0				
翳	4936	0				
蒺	5264	0				
嗾	5398	0				
诶	5467	0				
矬	5479	0				
镞	5690	0				
糇	5818	0				
彘	5998	0				
缑	6065	0				
矯	2910	0				
嶷	6188	0				
篌	6423	0				
窍	3014	0				
谷	1093	0				
藝	784	0				
當	71	0				
戈	1693	0				
段	567	0				
腕	2576	0				
套	1089	0				
森	1027	6				
册	1523	0				
研	447	0				
例	547	0				
石	414	0				
尢	6331	0				
丘	1926	0				
鹫	4368	0				
蹴	4917	0				
僦	5382	0				
鷲	4368	0				
决	273	0				
尤	1097	0				
成	59	0				
揮	741	0				
功	452	0				
位	182	0				
將	132	0				
計	251	0				
计	251	0				
寢	2800	0				
寝	2800	0				
擒	2844	0				
城	413	0				
景	812	0				
掠	1865	0				
谅	2116	0				
琼	2200	0				
鲸	2612	0				
晾	3900	0				
椋	4022	0				
黥	6146	0				
辌	7275	0				
麖	7464	0				
綡	8104	0				
諒	2116	0				
鯨	2612	0				
轄	1641	0				
辖	1641	0				
江	577	0				
帝	612	0				
蘇	590	0				
苏	590	0				
報	234	0				
荊	2546	0				
荆	2546	0				
雅	1137	0				
闻	823	0				
优	773	0				
犹	1228	0				
忧	1459	0				
扰	1481	0				
疣	3767	0				
鱿	4601	0				
蚘	7304	0				
怨	1635	0				
儆	4501	0				
效	551	0				
斯	168	0				
坦	1015	0				
溪	2189	0				
蚩	4441	0				
迹	1096	0				
竞	1098	0				
術	328	0				
臂	1686	0				
余	728	0				
钅	5495	0				
髦	3143	0				
拜	1216	0				
廷	1624	0				
弓	2224	0				
補	942	0				
选	499	0				
顿	792	0				
診	1399	0				
訊	1236	0				
施	553	0				
庙	1886	0				
佛	770	0				
特	173	0				
诗	904	0				
侍	1868	0				
峙	3040	0				
恃	3213	0				
痔	3759	0				
邿	6998	0				
詩	904	0				
秲	7546	0				
跱	7849	0				
寸	1901	0				
廟	1886	0				
座	810	0				
潭	2744	0				
柘	5519	0				
普	629	0				
骨	1034	0				
廈	2259	0				
草	787	0				
厦	2259	0				
哲	1115	0				
蚌	3938	0				
塔	1028	0				
爾	220	0				
导	343	0				
昭	2185	0				
府	417	0				
僕	1810	0				
旗	1405	0				
射	702	0				
仆	1810	0				
村	711	0				
錫	2054	0				
守	794	0				
尺	1472	0				
荫	2663	0				
示	425	0				
讨	831	0				
禅	2191	0				
封	869	0				
寻	960	0				
博	963	0				
尊	1132	0				
夺	1197	0				
符	1203	0				
耐	1407	0				
薄	1431	0				
碍	1435	0				
腐	1574	0				
遵	1591	0				
慰	1630	0				
筹	1675	0				
冠	1711	0				
辱	1904	0				
爵	1922	0				
涛	2050	0				
咐	2089	0				
尉	2122	0				
厨	2127	0				
俯	2256	0				
搏	2367	0				
膊	2435	0				
祷	2478	0				
蹲	2492	0				
衬	2497	0				
铸	2525	0				
缚	2572	0				
畴	2693	0				
嚼	2725	0				
簿	2842	0				
忖	2994	0				
肘	3004	0				
橱	3035	0				
蔚	3182	0				
狩	3184	0				
焘	3207	0				
踌	3296	0				
褥	3447	0				
腑	3484	0				
挝	3702	0				
溥	3873	0				
捋	4040	0				
麝	4044	0				
驸	4205	0				
荨	4246	0				
纣	4315	0				
榭	4319	0				
熨	4480	0				
俦	4484	0				
銀	756	0				
鋼	1607	0				
銅	1770	0				
鑽	1722	0				
矿	1383	0				
币	1186	0				
牌	1259	0				
鉴	1653	0				
釜	3777	0				
鑫	3834	0				
鋆	3914	0				
銮	4198	0				
鋈	4481	0				
淦	4590	0				
属	610	1				
任	186	1				
鍪	4713	0				
鎗	4812	0				
鏖	4834	0				
錾	4907	0				
鎏	5128	0				
鏊	5262	0				
針	1114	0				
鐾	5681	0				
銎	5764	0				
鈤	6051	0				
鎮	1000	0				
鍬	4126	0				
鎯	6471	0				
鐮	3815	0				
蓥	6520	0				
鍏	6555	0				
鉁	6575	0				
鉀	3792	0				
銧	6624	0				
滏	6633	0				
鍩	6036	0				
鎰	5214	0				
鋬	6672	0				
鍋	2070	0				
鑑	1653	0				
鐻	6719	0				
鈦	4296	0				
鎭	6783	0				
鉤	2249	0				
鋹	6792	0				
鋵	6796	0				
釤	6073	0				
鍵	1469	0				
銳	1848	0				
鏰	6935	0				
鈧	5384	0				
鈩	6919	0				
鐓	7387	0				
鈨	7000	0				
钁	5241	0				
鑨	7012	0				
鉅	4585	0				
鎌	7070	0				
錏	7077	0				
銷	902	0				
釙	5561	0				
鉄	7088	0				
錆	6035	0				
鐏	7096	0				
鉏	7101	0				
錞	7156	0				
钃	7189	0				
鈍	3053	0				
鈾	3099	0				
鈿	5127	0				
鍊	7217	0				
鋊	7224	0				
鋾	7238	0				
乙	1869	0				
义	208	0				
甲	1104	0				
丙	2639	0				
血	657	0				
户	799	0				
良	833	0				
永	840	0				
亡	955	0				
玉	999	0				
凡	1011	0				
瓦	1193	0				
必	248	0				
匆	1620	0				
乡	920	0				
斥	1854	0				
牙	995	0				
卜	1976	0				
乃	1163	0				
甫	2147	0				
叉	2226	0				
氕	6988	0				
兔	2359	0				
撇	2876	0				
丸	2457	0				
犬	2643	0				
刃	2694	0				
烯	4263	0				
戍	3758	0				
乱	764	0				
扎	1409	0				
乳	1828	0				
甩	2598	0				
札	3205	0				
轧	3263	0				
巳	3375	0				
羌	3502	0				
虬	4229	0				
乩	4588	0				
乜	5218	0				
钆	6248	0				
耴	8116	0				
糺	8297	0				
折	1129	0				
肝	1758	0				
醇	2555	0				
醛	4771	0				
丑	1898	0				
卯	3917	0				
基	280	0				
氐	4340	0				
幺	4487	0				
戋	6437	0				
尽	488	0				
斗	580	0				
枣	2845	0				
合	171	0				
亥	3173	0				
于	40	0				
與	108	0				
由	136	0				
补	942	0				
忍	1125	0				
宇	1154	0				
吁	2133	0				
迂	2953	0				
盂	4089	0				
芋	4233	0				
圩	4277	0				
竽	4904	0				
纡	5238	0				
盱	5817	0				
邘	7449	0				
穻	7484	0				
訏	7843	0				
趶	7966	0				
釪	8484	0				
終	558	0				
终	558	0				
至	267	0				
源	669	0				
勇	1204	0				
善	748	0				
急	656	0				
敢	793	0				
助	607	0				
宙	1419	0				
航	772	0				
荢	8323	0				
吳	1133	0				
吴	1133	0				
镇	1000	0				
軒	2384	0				
昂	1949	0				
轩	2384	0				
鮮	956	0				
卑	2055	0				
鲜	956	0				
局	483	0				
寰	3954	0				
杜	1275	0				
鵑	3045	0				
鹃	3045	0				
靖	2540	0				
命	258	0				
俞	3245	0				
佥	5549	0				
龠	6628	0				
雷	685	0				
響	503	0				
阜	3439	0				
喚	1832	0				
嚴	545	0				
竹	1586	0				
責	535	0				
繞	1483	0				
否	620	0				
究	429	0				
脸	615	0				
閉	1265	0				
悦	1992	0				
价	409	0				
屬	610	1				
嘻	2427	0				
嬉	3369	0				
熹	3862	0				
僖	4717	0				
糦	7818	0				
欣	1521	0				
度	184	0				
礂	8570	0				
蟢	8874	0				
予	923	0				
統	264	0				
列	500	0				
爭	344	0				
怒	1141	0				
哀	1749	0				
悅	1992	0				
恭	1740	0				
財	679	0				
勝	742	0				
胜	742	0				
青	497	0				
条	214	0				
责	535	0				
豕	4922	0				
素	660	0				
毒	945	0				
复	426	0				
绩	1545	0				
盤	1047	0				
傲	1957	0				
熬	2699	0				
落	496	0				
鳌	3444	0				
愫	3562	0				
敖	3566	0				
赘	3567	0				
略	703	0				
啧	3690	0				
降	743	0				
渍	3764	0				
嗷	4093	0				
额	934	0				
婊	4224	0				
洛	976	0				
碛	4768	0				
裱	4828	0				
络	1116	0				
遨	4869	0				
赜	4940	0				
賽	1062	0				
隆	1398	0				
嗉	5300	0				
静	721	0				
液	1449	0				
碡	5478	0				
骜	5503	0				
猜	1596	0				
峰	1471	0				
螯	5546	0				
腹	1587	0				
積	727	0				
雾	1668	0				
獒	6133	0				
锋	1669	0				
倩	2578	0				
纛	6187	0				
阁	1680	0				
菁	3315	0				
聱	6330	0				
帻	6369	0				
蜻	4035	0				
凌	1729	0				
氰	4446	0				
箦	6733	0				
蹟	1096	0				
俊	1844	0				
靛	5167	0				
鰲	3444	0				
婧	5687	0				
缝	1849	0				
贅	3567	0				
蜂	1909	0				
锖	6035	0				
廒	6961	0				
鲭	6171	0				
腈	6291	0				
陵	1962	0				
績	1545	0				
靜	721	0				
傻	1986	0				
鼇	7606	0				
箐	6496	0				
膆	5300	0				
蒨	6550	0				
脿	8617	0				
逢	2176	0				
鼱	7016	0				
諘	8674	0				
謸	8676	0				
搁	2375	0				
鶄	7342	0				
碃	7481	0				
圊	7792	0				
驁	5503	0				
蓬	2393	0				
篟	8426	0				
螦	8851	0				
喀	2464	0				
鯖	6171	0				
鰿	8939	0				
胳	2485	0				
峻	2501	0				
丰	1187	0				
篷	2574	0				
梭	2675	0				
咯	2738	0				
菱	2796	0				
骆	2850	0				
棱	2891	0				
咚	2944	0				
惫	3001	0				
劉	750	0				
涤	3212	0				
咎	3219	0				
绫	3256	0				
雲	691	0				
赂	3264	0				
骏	3267	0				
刘	750	0				
赣	3295	0				
云	691	0				
烙	3434	0				
骼	3453	0				
恪	3477	0				
囱	3548	0				
憤	1506	0				
腋	3586	0				
愤	1506	0				
唆	3646	0				
糞	2878	0				
酪	3659	0				
竣	3696	0				
浚	3744	0				
殺	587	0				
撂	3798	0				
杀	587	0				
璐	3801	0				
窿	3836	0				
掖	3854	0				
偏	1202	0				
铭	2057	0				
茗	4021	0				
酩	5139	0				
眳	6882	0				
銘	2057	0				
詺	8673	0				
取	323	0				
狀	624	0				
状	624	0				
稱	449	0				
實	100	0				
制	163	0				
改	350	0				
質	404	0				
嫵	4063	0				
媚	2286	0				
鱺	5536	0				
鹿	2052	0				
厂	961	0				
伊	760	0				
莎	2121	0				
佳	1581	0				
壯	1430	0				
壮	1430	0				
絲	1024	0				
丝	1024	0				
朱	1118	0				
宏	1796	0				
傣	3827	0				
頗	1558	0				
颇	1558	0				
瑪	1246	0				
玛	1246	0				
絢	3703	0				
绚	3703	0				
艷	2100	0				
艳	2100	0				
蒙	1037	0				
娜	1582	0				
鄧	1612	0				
君	983	0				
邓	1612	0				
靚	4615	0				
風	348	0				
风	348	0				
墓	1814	0				
富	732	0				
皇	758	0				
内	175	0				
婆	1345	0				
迯	6834	0				
另	489	0				
霄	3123	0				
內	175	0				
傳	332	0				
传	332	0				
匯	1185	0				
汇	1185	0				
向	146	0				
吾	1647	0				
韓	1219	0				
朝	593	0				
母	565	0				
孬	5524	0				
沟	1608	0				
似	431	0				
處	206	0				
处	206	0				
運	345	0				
运	345	0				
修	739	0				
充	689	0				
还	80	18				
把	110	24				
可	30	44				
們	13	35				
葡	2126	0				
萄	2205	0				
酉	3830	1				
梅	1157	0				
性	122	0				
好	82	408				
怎	382	16				
罗	392	4				
微	652	41				
闆	928	4				
仰	1366	0				
心	90	15				
曾	463	5				
理	89	6				
測	859	5				
驗	534	5				
虎	1081	5				
猴	2182	6				
看	76	117				
沒	72	14				
毛	623	40				
是	3	547				
孔	1287	6				
尔	220	3				
你	32	754				
裙	2426	1				
莫	953	1				
么	63	31				
今	336	15				
雀	2326	5				
我	9	567				
象	300	5				
吗	453	88				
從	98	6				
未	385	6				
何	229	6				
开	94	50				
去	64	91				
原	193	5				
始	381	6				
環	680	5				
危	824	5				
人	7	382				
迫	1004	5				
奈	1622	5				
小	83	261				
序	834	5				
放	291	12				
棄	1103	11				
\.


--
-- TOC entry 3048 (class 0 OID 16420)
-- Dependencies: 204
-- Data for Name: word; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.word (word, pinyin, translation, calls, confidence_level, tone_pair) FROM stdin;
職業	zhí yè	profissional	29	1	24
girl	gǎrl	garota	1	1	\N
空巢	kōng cháo	ninho vazio	2	1	12
中年	zhōng nián	meia-idade	2	1	12
自立	zì lì	independência	2	1	44
社交	shè jiāo	social	2	1	41
配菜	pèi cài	acompanhamento	2	1	44
方法	fāng fǎ	método	11	1	13
離家	lí jiā	sair de casa	2	1	21
宅院	zhái yuàn	mansão	1	1	24
導致	dǎo zhì	levar a	14	1	34
自尊	zì zūn	autoestima	4	1	41
失落感	shī luò gǎn	sentimento de perda	2	1	14
有用	yǒu yòng	útil	20	1	34
毒藥	dú yào	veneno	1	1	24
療法	liáo fǎ	terapia	2	1	23
不穩定	bù wěn dìng	instável	2	1	43
壽命	shòu mìng	expectativa de vida	2	1	44
替代	tì dài	substituir	5	1	44
使得	shǐ dé	faz com que	2	1	32
寂靜	jì jìng	silêncio	97	1	44
人士	rén shì	pessoa/indivíduo	12	1	24
觀眾	guān zhòng	audiência	6	1	14
自信	zì xìn	autoconfiança	4	1	44
惡化	è huà	agravamento	16	1	44
極度	jí dù	extremamente	6	1	24
綜合症	zōng hé zhèng	síndrome	3	1	12
統計學	tǒng jì xué	estatística	2	1	34
無數	wú shù	inúmeros	3	1	24
荷爾蒙	hé ěr méng	hormônio	5	1	23
這位	zhè wèi	este(a)	47	2	44
可惜	kě xī	pena	24	1	31
尾聲	wěi shēng	final	2	1	31
節目	jié mù	programa	40	1	24
提問	tí wèn	pergunta	2	1	24
低調	dī diào	discrição	4	1	14
月光	yuè guāng	luar	5	1	41
合身	hé shēn	caber/ajustar ao corpo	6	1	21
戶政事務所	hù zhèng shì wù suǒ	cartório de registro civil	0	1	44
煽風點火	shān fēng diǎn huǒ	atiçar o fogo	1	1	11
福爾摩沙	fú ěr mó shā	Formosa	5	1	23
建築材料	jiàn zhù cái liào	material de construção	0	1	44
有的是	yǒu de shì	há de sobra	0	1	35
行政管理部	xíng zhèng guǎn lǐ bù	departamento de administração	0	1	24
產前檢查	chǎn qián jiǎn chá	exames pré-natais	0	1	32
維拉坎布卡聯合隊	wéi lā kǎn bù kǎ lián hé duì	time unido de Vila Cambucá	1	1	21
熱潮	rè cháo	onda de calor/tendência quente	0	1	42
出人意料	chū rén yì liào	inesperado	1	1	12
森巴舞者	sēn bā wǔ zhě	dançarino de samba	0	1	11
福爾摩沙航空	fú ěr mó shā háng kōng	Formosa Airlines	0	1	23
意大利語	yì dà lì yǔ	italiano (idioma)	0	1	44
膠水	jiāo shuǐ	cola	0	1	13
不說話	bù shuō huà	não fala	0	1	41
輕量版	qīng liàng bǎn	edição leve	0	1	14
為人知	wéi rén zhī	ser conhecido	0	1	22
疙疙瘩瘩	gē ge dā dā	irregular/áspero (onomatopeia para textura ou fala)	0	1	15
黑色	hēi sè	preto	0	1	14
各種各樣	gè zhǒng gè yàng	todos os tipos de	0	1	43
生氣吧	shēng qì ba	fique bravo	0	1	14
蠟垢	là gòu	resíduo de cera	0	1	44
收費站	shōu fèi zhàn	posto de pedágio	0	1	14
傑維娜	Jié wéi nà	Jovina	0	1	22
啊哦	ā ó	ah oh	0	1	12
服務生	fú wù shēng	garçom	1	1	24
賦權	fù quán	empoderar	1	1	42
惡行	è xíng	maldades	1	1	42
方案	fāng àn	plano, solução	12	1	14
Gilberto	Gilberto	Gilberto	1	1	\N
店裡	diàn lǐ	loja	1	1	43
郊区	jiāo qū	subúrbio	1	1	11
令人滿意	lìng rén mǎn yì	satisfatório	1	1	42
magnificent	magnificent	magnífica	1	1	\N
星際	xīng jì	estelar	6	1	14
嘩	huá	(onomatopeia de som de água)	5	1	\N
偵察	dīng chá	espião	1	1	12
航空	háng kōng	aviação	1	1	21
瑪塔醫生	mǎ tā yī shēng	Doutora Marta	3	1	31
聽得很	tīng de hěn	ouve bem	0	1	15
傳講	chuán jiǎng	pregar	0	1	23
長期	chángqī	longo prazo	0	1	\N
斯特	sī tè	Leo	0	1	14
小花	xiǎo huā	pequena flor	0	1	31
小道	xiǎo dào	boato	0	1	34
范妮達	Fànnīdá	Fannyda	0	1	\N
蚊子	wén zi	mosquito	0	1	25
justification	justificação	justificação	0	1	\N
做什么	zuò shén me	fazer o quê	0	1	42
彪	biāo	feroz	0	1	\N
悍	hàn	forte	0	1	\N
盾牌	dùn píng	escudo	0	1	42
驅動	driven	impelido	0	1	\N
歷	lì	experiência	7	1	\N
请	qing	pedido	2	1	\N
僱用	gù yòng	empregar	4	1	44
切割	qiē gē	corte	2	1	11
穆	mù	mu	0	1	\N
22	èr shí èr	vinte e dois	4	1	42
同樣地	tóng yàng dì	da mesma forma	4	1	24
一隻	yì zhī	um	8	1	41
二十	èr shí	vinte	6	1	42
好戰	hào zhàn	belicoso	8	1	44
遊蕩	yóu dàng	vagar	2	1	24
好戰分子	hǎo zhàn fèn zǐ	belicista	2	1	34
立體	lì tǐ	tridimensional	2	1	43
惹毛	rě máo	irritar	2	1	32
說說看	shuō shuō kàn	fale sobre	2	1	11
三十歲	sān shí suì	trinta anos	5	1	12
歷史	lì shǐ	histórico	17	1	43
芭比	bā bǐ	Barbie	2	1	13
刪除	shān chú	excluir	4	1	12
四處	sì chù	todos os lugares	20	1	44
之徒	zhī tú	indivíduo	5	1	12
莎朗	Shā Lǎng	Sharon	2	1	13
並不是	bìng bú shì	não é	7	1	42
繁殖者	fán zhí zhě	criador	2	1	22
不上	bù shàng	não alcançar	2	1	44
尿	niào	uréia	0	1	\N
被害妄想症	bèi hài wàng xiǎng zhèng	paranoia de perseguição	2	1	44
誇張	kuā zhāng	exagerado	14	1	11
胸部	xiōng bù	peito, busto	7	1	14
討人厭	tǎo rén yàn	desagradável	2	1	32
等於	děng yú	equivalente a	2	1	32
不在於	bù zài yú	não está em	2	1	44
赫馬尼	hè mǎ ní	Hermani	2	1	43
檔事	dàng shì	negócio	2	1	44
克斯	kē sī	kex	0	1	11
這樣子	zhè yàng zi	desta maneira	3	1	44
斯通	Sī Tōng	Stone	2	1	11
優惠券	yōu huì quàn	cupom de desconto	0	1	14
接線生	jiē xiàn shēng	telefonista	0	1	14
嬌小	jiāo xiǎo	pequena e delicada	0	1	13
沉思	chén sī	contemplação profunda	0	1	21
babies	bàibǎi	bebês	0	1	\N
實行	shí xíng	praticar	0	1	22
循	xún	seguir	0	1	\N
而來	ér lái	vir	1	1	22
娘子	niáng zi	esposa	1	1	25
嘟嘟嘟	dū dū dū	beep-beep	1	1	11
擁護	yǒng hù	defender	1	1	34
優基	Yōujī	Yōujī	1	1	\N
最小	zuì xiǎo	menor	1	1	43
violence	violence	violência	1	1	\N
现在	xiàn zài	agora	0	1	44
難以	nán yǐ	difícil de	14	1	23
觉得	jué de	achar	1	1	25
復返	fù fǎn	retornar	1	1	43
你...你...你...你	nǐ... nǐ... nǐ... nǐ	você...	1	1	33
主義	zhǔ yì	ismo	1	1	34
序	xù	ordem	0	1	\N
buffet	buffet	bufê	1	1	\N
騰騰	téng téng	fumegante	1	1	22
的心臟	de xīnzàng	coração	1	1	51
代替	dài tì	substituir	6	1	44
標準	biān zhǔn	padrão	3	1	13
漸	jiàn	gradual	0	1	\N
五里牌村	wǔ lǐ pái cūn	cinco li aldeia	0	1	33
自信心	zì xìnxī	autoconfiança	0	1	44
吓	xià	assustar	0	1	\N
certa	duì	certo	0	1	\N
不吃驚	bù chī jīng	não surpreso	0	1	41
奔	bēn	correr	0	1	\N
馬達雷娜	Mǎ Dálèinà	Madalena	0	1	32
堡	bǎo	castelo	0	1	\N
卖  (erro de digitação, correto seria 背)	mài	trair	0	1	\N
哽	gěng	engasgar	0	1	\N
叛	pàn	trair	1	1	\N
德蕾莎	dé léi shà	Teresa	0	1	22
恨意	hèn yì	rancor	1	1	44
已经	yǐ jīng	já	0	1	31
很清楚地	hěn qīng xǐng de	claramente	0	1	31
凱哥	kǎi gē	Kai Ge	0	1	31
的概念	de gài niàn	do conceito	0	1	54
哥們	gēmen	irmãos	0	1	\N
程式	chéng shì	programa	8	1	24
應用程序	yìngyònggram	aplicativo	0	1	\N
太壞	tài huài	bad	0	1	44
只知道	zhǐ zhī dào	só sei	0	1	31
克瑟琳	kè sī lín	roxerline	0	1	41
事理	shì lǐ	razão	0	1	43
監控	jiān kòng	monitoramento	0	1	14
BARROS	BĀRÚO	BARROS	0	1	\N
守時	shǒu shí	pontual	0	1	32
自發	zì fā	espontâneos	0	1	41
瑞發	Ruì fā	Rui Fa	0	1	41
藏身	cáng shēn	esconderijo	0	1	21
瑟基絲	sè jī sī	Sersicis	0	1	41
小的	xiǎo de	pequeno	0	1	35
Osmar	Osmar	Osmar	0	1	\N
常識	cháng shi	senso comum	0	1	25
gigi	gigi	gigi	0	1	\N
辯	biàn	defender	0	1	\N
自欺欺人	zì qī qī rén	enganar a si mesmo e aos outros	1	1	41
練	liàn	treinar	2	1	\N
癲狂	diān kuáng	loucura	0	1	12
驚慌	jīng huāng	pânico	0	1	11
失措	shī cuò	desorientado	0	1	14
貓	māo	gato	17	1	\N
癌	ái	câncer	2	1	\N
幸好	xìng hǎo	felizmente	33	1	43
受不了	shòu bù liǎo	não aguentar	34	1	44
怨恨	yuàn hèn	ressentimento	4	1	44
蘇珊娜	Sū shān nà	Susana	-77	1	11
活得	huó dé	viver	5	1	22
想必	xiǎng bì	presumivelmente	3	1	34
遺棄	yí qì	abandonar	12	1	24
說到底	shuō dào dǐ	no final das contas	2	1	14
按鈕	àn niǔ	botão	4	1	43
遙遠	yáo yuǎn	distante	7	1	23
隆胸	lóng xiōng	fazer mamoplastia de aumento	2	1	21
毒害	dú hài	envenenar	0	1	24
當初	dāng chū	no início	8	1	11
劣質	liè zhì	de baixa qualidade	2	1	44
恰當	qià dàng	apropriado	2	1	44
除非	chú fēi	a menos que	24	1	21
依然	yī rán	ainda	32	1	12
老糊塗	lǎo hú tú	caduco/senil	2	1	32
擁有	yōng yǒu	possuir	80	1	13
優秀	yōu xiù	excelente	23	1	14
瘋了	fēng le	enlouqueceu	22	1	15
滿懷	mǎn huái	cheio de	2	1	32
沒錯	méi cuò	sem erro	20	1	24
世上	shì shàng	no mundo	12	1	44
落魄	luò pò	falido	2	1	44
開得	kāi dé	abrir	2	1	12
過時	guò shí	desatualizado	4	1	42
黛米·摩爾	Dài mǐ · mó ěr	Demi Moore	2	1	43
雪莉	Xuě Lì	Shirley	-88	1	34
粉絲	fěn sī	fã	4	1	31
身材	shēn cái	figura corporal	7	1	12
抽脂手術	chōu zhī shǒu shù	lipoaspiração	2	1	11
專業人士	zhuān yè rén shì	profissional	11	1	14
孕婦	yùn fù	grávida	0	1	44
電梯	diàn tī	elevador	5	1	41
躺下	tǎng xià	deitar	7	1	34
戈伊茲·德·馬塞多	Goiás de Mascarado	Goiás de Mascarado	0	1	25
VIVI	pinyin não disponível	VIVI	0	1	55
配備	pèi bèi	equipar	0	1	44
更喜歡	gèng xǐ huān	preferir	0	1	43
晃	huàng	passear	1	1	\N
E	E	E	1	1	\N
他们	tāmen	eles	2	1	\N
做過	zuò guò	fez	9	1	44
婷	tíng	elegante	1	1	\N
距	jù	distância	1	1	\N
扯	chěr	envolver	1	1	\N
交往	jiāo wǎng	se relacionar	35	1	13
blah blah blah blah blah		blah blah blah blah blah	1	1	\N
莊園	zhuāng yuán	propriedade	3	1	12
婉	wǎn	gracioso	3	1	\N
既然	jì rán	já que	42	1	42
否則	fǒu zé	caso contrário	27	1	32
咦	yí	interjeição expressando surpresa	38	1	\N
讀	dú	ler	18	1	\N
細	xì	fina	19	1	\N
舉辦	jǔ bàn	realizar	13	1	34
當日	dāng rì	do dia	5	1	14
特產	tè chǎn	especialidades	2	1	43
乳酪	rǔ lào	queijo	7	1	34
來到	lái dào	chegar a	32	1	24
新鮮的	xīn xiān de	fresco	2	1	11
共事	gòng shì	trabalhar juntos	2	1	44
性病	xìng bìng	doença sexualmente transmissível	2	1	44
記住	jì zhù	lembrar	12	1	44
迪娜	dí nà	Dina	8	1	24
受夠了	shòu gòu le	chega	4	1	44
免費	miǎn fèi	gratuito	10	1	34
目眩神迷	mù xuàn shén mí	deslumbrante e fascinante	3	1	44
不平等	bù píng děng	desigual	2	1	42
迎接	yíng jiē	receber	4	1	21
老了	lǎo le	envelhecida	2	1	35
第一天	dì yī tiān	primeiro dia	2	1	41
HERNANE	HERNANE	HERNANE	5	1	\N
節食	jié shí	dieta	3	1	22
竟敢	jìng gǎn	ousar	7	1	43
克莉絲	kè lì sī	Chris	-54	1	44
歡迎	huān yíng	bem-vinda	11	1	12
似乎	sì hū	parece	17	1	41
門鈴	mén líng	campainha	38	1	22
木瓜	mù guā	mamão	2	1	41
派對	pài duì	festa	78	1	44
心情	xīn qíng	humor	12	1	12
香腸	xiāng cháng	salsicha	4	1	12
誘人	yòu rén	atraente	7	1	42
樂觀	lè guān	otimista	5	1	41
埃爾納內	āi ěr nà nèi	Ernani	11	1	13
妳的	nǐ de	tua	8	1	35
美妙	měi miào	maravilhoso	12	1	34
不懂	bù dǒng	não entendo	4	1	43
稻	dào	arroz	2	1	\N
喝過	hē guò	bebeu	2	1	14
星期	xīng qī	semana	13	1	11
興致	xìng zhì	vontade	5	1	44
歡迎光臨	huān yíng guāng lín	bem-vindo	3	1	12
格雷	gé léi	Gray	2	1	22
生日	shēng rì	aniversário	29	1	14
一小會兒	yī xiǎo huì er	um momentinho	7	1	13
領地	lǐng dì	território	1	1	34
貝洛奧里藏特	bèi luò ào lǐ cáng tè	Belo Horizonte	5	1	44
無禮	wú lǐ	rude/desrespeitoso	4	1	23
正是	zhèng shì	exatamente	39	1	44
第一個	dì yī gè	primeiro	17	1	41
光彩照人	guāng cǎi zhào rén	deslumbrante	2	1	13
米納斯	mǐ nà sī	Minas	11	1	34
一場	yī chǎng	uma sessão/evento	36	1	13
這兒	zhè er	aqui	10	1	45
早安	zǎo ān	bom dia	70	1	31
減肥	jiǎn féi	perder peso	2	1	32
芭芭拉	bā bā lā	Bárbara	4	1	11
餐點	cān diǎn	refeição	5	1	13
蜜餞	mì jiàn	fruta cristalizada	2	1	44
牛奶糖	niú nǎi táng	leite condensado/doce de leite	3	1	23
一塊	yī kuài	um pedaço	5	1	14
煩人	fán rén	irritante	8	1	22
迷人	mí rén	fascinante	11	1	22
成年	chéng nián	maioridade	5	1	22
身份證	shēn fèn zhèng	carteira de identidade	2	1	14
地裡	dì lǐ	campo	0	1	43
完 成 (chéng)	wán	completar	0	1	\N
啄	zuó	bicar	0	1	\N
結算	jié suàn	liquidação	0	1	24
的话	huà de	palavras	0	1	45
戈伊斯德馬西多	Goiás do Mato Grosso	Goiás do Mato Grosso	0	1	25
馬克多斯	mǎ kè duō sī	McDonald's	0	1	34
奧利弗	Àolìfū	Oliver	1	1	\N
吞吞吐吐地	tūn tūn tǔ tǔ de	hesitantemente	1	1	11
草	cǎo	grama	2	1	\N
計畫	jì huà	plano	30	1	44
燃	rán	queimar	1	1	\N
多斯	duō sī	dos	0	1	11
salty	salty	salgado	1	1	\N
snacks	xiǎo xiě	petiscos	1	1	33
Neusa	Neusa	Neusa	1	1	\N
若狂	ruò kuáng	como loucura	1	1	42
瑪格達	Mǎ gé dá	Magda	1	1	32
哎	āi	ai	100	1	\N
好吃	hǎo chī	gostosas/deliciosas	7	1	31
百路斯	bǎi lù sī	Bluest	0	1	34
別這樣	bié zhèyàng	não faça isso	0	1	24
達萊娜	dá lái nà	Dalena	0	1	22
是由	shì yóu	é	0	1	42
一手	yī shǒu	com as próprias mãos	0	1	13
節日	jié rì	feriado	0	1	24
你就	nǐ jiù	você	0	1	34
meu	wǒ de	meu	0	1	35
dicionário	cí huì	dicionário	0	1	24
指著	zhǐ zhe	apontando	0	1	35
無聲	wú shēng	sem som	0	1	21
耳機	ěr jī	fone de ouvido	0	1	31
木頭	mù tóu	madeira	0	1	42
繼承	jìchéng	herdeiro	0	1	\N
同等	tóng děng	igual	0	1	23
同職位	tóng zhí wèi	mesma posição	0	1	22
企業	qǐ yè	empresa	0	1	34
導演	dǎo yǎn	diretor	0	1	33
相等	xiāng děng	igual	0	1	13
早期	zǎoqī	início	0	1	\N
Formosa	Fōmǔsà	Formosa	1	1	\N
一根	yī gēn	um	7	1	11
不育	bù yù	estéril	6	1	44
你看	nǐ kàn	veja	6	1	34
很多	hěn duō	muitos	92	3	31
大約	dà yuē	aproximadamente	27	1	41
追求者	zhuī qiú zhě	pretendente	2	1	12
精液	jīng yè	sêmen	37	1	14
過頭	guò tóu	exagerado	2	1	42
上門	shàng mén	à domicílio	3	1	42
刺激	cì jī	emocionante	4	1	41
合作夥伴	hé zuò huǒ bàn	parceiro de cooperação	3	1	24
不去	bù qù	não ir	5	1	44
世代	shì dài	gerações	6	1	44
保重	bǎo zhòng	cuidar-se	15	1	34
有害	yǒu hài	prejudicial	10	1	34
喝	hē	beber	96	3	\N
伯尼坦	Bēnìtǎn	Bernitan	1	1	\N
不客氣	bú kè qì	de nada	6	1	24
規律	guī lǜ	regular	2	1	14
知道嗎	zhī dào ma	sabe	4	1	14
西米恩	Xī mǐ ēn	Westmyn	1	1	13
衝突	chōng tū	conflito	8	1	11
你好嗎	nǐ hǎo ma	como vai você	37	1	33
老太婆	lǎo tài pó	mulher velha	4	1	34
領隊	lǐng duì	líder	2	1	34
精子	jīng zǐ	espermatozoide	11	1	13
寡婦	guǎ fù	viúvas	6	1	34
迎來	yíng lái	receber	2	1	22
生育能力	shēng yù néng lì	capacidade reprodutiva	6	1	14
鴻溝	hóng gōu	abismo	2	1	21
加入	jiā rù	juntar-se	17	1	14
伊薩麗娜	yī sà lì nà	Isalina	2	1	14
分析	fēn xī	análise	33	1	11
不分	bù fēn	não diferenciar	2	1	41
的是	de shì	é que	14	1	54
一項	yī xiàng	um item	19	1	14
最為	zuì wéi	mais	2	1	42
一年半	yī nián bàn	um ano e meio	2	1	12
很棒的	hěn bàng de	incrível	2	1	34
700	qī bǎi	setecentos	2	1	13
高喬	gāo qiáo	Gaúcho	2	1	12
哭聲	kū shēng	choro	62	1	11
四年	sì nián	quatro anos	6	1	42
樂隊	yuè duì	banda	4	1	44
吉他手	jí tā shǒu	guitarrista	2	1	21
多姆	duō mǔ	Dom	2	1	13
佩佩	pèi pèi	Pepe	2	1	44
時裝設計師	shí zhuāng shè jì shī	estilista	2	1	21
阿斯特麗德	ā sī tè lì dé	Astrid	2	1	11
馬拉尼昂	mǎ lā ní áng	Marañón	2	1	31
姓	xìng	sobrenome	1	1	\N
桶裝	tǒng zhuāng	engarrafado/em barril	2	1	31
步驟	bù zhòu	procedimento	276	1	44
糟蹋	zāo tà	desperdiçar	2	1	14
neuroza	neurológico	neuroza	1	1	\N
德芙	dé fú	DeLonghi	1	1	22
卡羅拉	kǎ luó lā	Corolla	1	1	32
好嗎	hǎo ma	está bem	207	3	35
無事	wú shì	sem incidentes	2	1	24
找尋	zhǎoxún	procurar	1	1	\N
莹如	yíng rú	jadesuave	1	1	22
DORALICE		DORALICE	1	1	\N
思維娜	sī wēi nà	pensamento ná	1	1	11
好朋友	hǎo péng yǒu	bom amigo	1	1	32
余	yú	remanescente	1	1	\N
維思	Wei Si	pensa	1	1	55
謊稱	huǎng chēng	alegar falsamente	1	1	31
命途	mìng tú	destino	1	1	42
oh	oh	oh	1	1	\N
氏	shì	clã	1	1	\N
總是	zǒng shì	sempre	86	1	34
carnival	kǎn wēi léi	carnaval	0	1	31
折	zhé	dobrar	1	1	\N
碟	dié	prato	1	1	\N
收取	shōu qǔ	cobrar/receber	4	1	13
persona	pèr sòn	persona	0	1	44
肉嘟嘟	ròu dū dū	rechonchudo	1	1	41
低聲說	dī shēng shuō	sussurrar	1	1	11
噓	xū	shh	31	1	\N
師傅	shī fù	mestre	3	1	14
許多謝	xǔ duō xiè	muito obrigado	1	1	31
監	jiān	monitorar	3	1	\N
的照片	de zhàopiàn	fotos	2	1	54
冷静	nǐng jìng	calma	2	1	34
科技	kē jì	tecnologia	0	1	14
開發	kāi fā	desenvolvimento	0	1	11
應用	yìng yòng	aplicativo	1	1	44
驗證	yàn zhèng	verificar	0	1	44
象	xiàng	parecer	0	1	\N
鄭德	Zhèng dé	Zheng De	0	1	42
維尼達	wēi ní dá	Vinida	0	1	12
sadness	sadness	tristeza	0	1	\N
NANDO	NANDO	Nando	0	1	\N
訝	yà	espanto	0	1	\N
遜	xùn	humilde	0	1	\N
优秀的	yōu xióng de	excelente	0	1	12
non	nón	não	0	1	\N
grata	guā là	grata	0	1	14
西維亞	Xī Wēi yà	Sylvia	0	1	11
大打	dà dǎ	bater fortemente	0	1	43
斥	chì	repreensão	0	1	\N
小鑫	xiǎo xīn	Xiao Xin	0	1	31
大麻	dà má	maconha	0	1	42
琦琦	Qí qí	Qiqi	0	1	22
特地	tè dì	especialmente	0	1	44
思維	sī wēi	pensamento	0	1	11
關鍵	guān jiàn	chave	27	1	14
嗑	kē	usar drogas	2	1	\N
鮮	xiān	fresco	2	1	\N
單身	dān shēn	solteiro	8	1	11
而非	ér fēi	e não	3	1	21
華夫餅	huá fū bǐng	waffle	4	1	21
大不了的	dà bù liǎo de	grande coisa	5	1	44
紐約	niǔ yuē	Nova York	11	1	31
冷靜的	lěng jìng de	calmo	2	1	34
蛋糕	dàn gāo	bolo	12	1	41
嚇到	xià dào	assustar	2	1	44
看了	kàn le	consultado	2	1	45
炒蛋	chǎo dàn	ovos mexidos	2	1	34
有所	yǒu suǒ	ter algum	13	1	33
棘手了	jí shǒu le	complicada	2	1	23
現居	xiàn jū	reside atualmente	2	1	41
弗雷德	fú léi dé	Fred	-59	1	22
自殺	zì shā	suicídio	7	1	41
沒事	méi shì	está bem	48	1	24
留下來	liú xià lái	ficar	13	1	24
果醬	guǒ jiàng	geleia	16	1	34
阿莫里	ā mò lǐ	Amory	-261	1	14
巧克力	qiǎo kè lì	chocolate	9	1	34
多蘿西	duō luó xī	Dorothy	1	1	12
舒服	shū fu	confortável	10	1	15
同住	tóng zhù	morar junto	6	1	24
15	shí wǔ	quinze	11	1	23
太太	tài tài	senhora	25	1	44
沒什麼	méi shén me	nada	18	1	22
潤滑	rùn huá	lubrificação	2	1	42
午餐	wǔ cān	almoço	17	1	31
失調	shī tiáo	desregulado	2	1	12
是啊	shì a	sim	128	3	45
避孕藥	bì yùn yào	anticoncepcional	5	1	44
整整	zhěng zhěng	inteiro	3	1	33
夫妻	fū qī	casal	8	1	11
戀情	liàn qíng	romance	16	1	42
避孕	bì yùn	contracepção	7	1	44
25	èr shí wǔ	vinte e cinco	17	1	42
氣質	qì zhì	temperamento	4	1	44
陰道	yīn dào	vagina	36	1	14
一對	yī duì	um par	4	1	14
有關	yǒu guān	relacionado	6	1	31
男朋友	nán péng yǒu	namorados	26	1	22
更年期	gēng nián qī	menopausa	9	1	12
已婚	yǐ hūn	casado	7	1	31
好啦	hǎo la	está bem	23	1	35
培根	péi gēn	bacon	2	1	21
是吧	shì ba	não é	50	2	45
黃瓜	huáng guā	pepino	12	1	21
婦科醫生	fù kē yī shēng	ginecologista	2	1	41
心急	xīn jí	impaciente	3	1	12
不孕	bú yùn	infértil	7	1	24
蜂蜜	fēng mì	mel	6	1	14
思念	sī niàn	saudade	11	1	14
夫婦	fū fù	casal	4	1	14
16	shí liù	dezesseis	2	1	24
赫爾南	hè ěr nán	Hernan	2	1	43
奶昔	nǎi xī	milkshake	2	1	31
他/她	tā	ele/ela	0	1	\N
joyce	joyce	joyce	3	1	\N
Silvinha	Silvinha	Silvinha	0	1	\N
吵	chǎo	brigar	11	1	\N
羅拉西	Luō lǎ xī	Loraxi	1	1	13
濒死	bīn sǐ	experiência de quase morte	1	1	13
屈	qū	dobrar	1	1	\N
嗡嗡聲	wēng wēng shēng	zumbido	1	1	11
壁	bì	parede	1	1	\N
遲到	chí dào	atrasar	46	1	24
列表	liè bǎi	lista	1	1	43
嗯嗯	ēn ēn	hum hum	1	1	11
珠寶	zhū bǎo	joia	1	1	13
為證	wèi zhèng	como testemunha	1	1	44
想得很	xiǎng de hěn	pensar muito	1	1	35
歇	xiē	descansar	1	1	\N
會是	huì shì	será	1	1	44
羅歇	Luò xiē	Roger	1	1	41
一天半	yī tiān bàn	um dia e meio	1	1	11
雲雀	yún què	pardal	1	1	24
啟用	qǐ yòng	ativar	1	1	34
人工	rén gōng	artificial	3	1	21
溶於一體	róng yú yī tǐ	integrados	1	1	22
雷拿托	léi nǎ tuō	Leandro	1	1	23
哽咽聲	gěng yè shēng	soluço	1	1	34
頰	jué	bochecha	1	1	\N
略	lüè	resumo	1	1	\N
復合	fù hé	reconciliou	1	1	42
child	tóng zǐ	criança	1	1	23
扮	bàn	roupa	1	1	\N
儀表	yí biǎo	painel	1	1	23
靠後	kào hòu	recue	1	1	44
開交	kāi jiāo	lidar	1	1	11
哪吒	nǎ zhā	Nezha	1	1	31
artificial	yǐ jì zhì	artificial	1	1	34
傅	fù	mestre	1	1	\N
正巧	zhèng qiǎo	por acaso	1	1	43
遊樂場	yóu lè chǎng	parque infantil	2	1	24
paranoia	pānǎo	paranoia	1	1	\N
呆	dāi	estar paralisado	1	1	\N
誠摯的	chéng zhì de	sincero	1	1	24
男孩	nán hái	menino	60	1	22
租用	zūyòng	alugar	1	1	\N
場地	chǎng dì	local	1	1	34
半	bàn	metade	38	1	\N
bastian	pinyin não disponível	batistão	1	1	55
雷霆	léi tíng	fúria	2	1	22
氣球	qì qiú	balões	1	1	42
喬瑟夫	qiáo sè fū	Joseph	1	1	24
小型	xiǎo xíng	pequeno	1	1	32
情緣	qíng yuán	laço amoroso	2	1	22
兩次	liǎng cì	duas vezes	8	1	34
燉肉	dùn ròu	carne estufada	2	1	44
是嗎	shì ma	não é	24	1	45
要不然	yào bù rán	caso contrário	3	1	44
譜	pǔ	confiável	2	1	\N
雙乳	shuāng rǔ	seios	2	1	13
乾澀	gān sè	seco	3	1	14
硬挺	yìng tǐng	rígido	2	1	43
肌	jī	músculo	0	1	\N
實在	shí zài	realmente	39	1	24
Suzana	Sū shān nà	Suzana	2	1	11
直播	zhí bō	transmissão ao vivo	5	1	21
撤下	chè xià	remover	2	1	44
滿滿的	mǎn mǎn de	cheio de	8	1	33
工作了	gōng zuò le	trabalha	2	1	14
太過分	tài guò fèn	exagerado demais	19	1	44
老女人	lǎo nǚ rén	mulher velha	2	1	33
表情	biǎo qíng	expressão	11	1	32
剖腹產	pōu fù chǎn	cesariana	63	1	14
居然	jū rán	surpreendentemente	16	1	12
浪漫	làng màn	romântico	24	1	44
太過分了	tài guò fèn le	exagerou/foi longe demais	3	1	44
遭受	zāo shòu	sofrer	10	1	14
打掃	dǎ sǎo	limpar	7	1	33
屬於	shǔ yú	pertencer a	32	1	32
的推移	de tuī yí	passagem	2	1	51
少了	shǎo le	menos	2	1	35
吱嘎	zhī gā	rangido	4	1	11
特寫	tè xiě	close-up	2	1	43
小小的	xiǎo xiǎo de	pequeno	4	1	33
國度	guó dù	nação, reino	5	1	24
搖擺不定	yáo bǎi bù dìng	indeciso	2	1	23
美女	měi nǚ	garota bonita	6	1	33
移除了	yí chú le	removi	2	1	22
廣告	guǎng gào	publicidade	11	1	34
那年	nà nián	naquele ano	2	1	42
顯然	xiǎn rán	obviamente	21	1	32
嫁	jià	casar	13	1	\N
發作	fā zuò	ter um ataque	2	1	14
個月	gè yuè	meses	11	1	44
卡門	kǎ mén	Carmen	5	1	32
雜亂無章	zá luàn wú zhāng	desorganizado e confuso	2	1	24
流產	liú chǎn	aborto	8	1	23
快要	kuài yào	quase	6	1	44
巴雷托	bā léi tuō	Barreto	5	1	12
越來越	yuè lái yuè	cada vez mais	27	1	42
十七歲	shí qī suì	dezessete anos	2	1	21
價值	jià zhí	valor	54	1	42
自由意志	zì yóu yì zhì	livre arbítrio	2	1	42
顯示	xiǎn shì	mostrar	21	1	34
前來	qián lái	vir	6	1	22
出於	chū yú	devido a	15	1	12
待會兒	dài huì er	daqui a pouco	8	1	44
豆泥	dòu ní	purê de feijão	2	1	42
停播	tíng bō	parar de transmitir	5	1	21
謀殺	móu shā	assassinato	2	1	21
離婚	lí hūn	divórcio	11	1	21
不該	bù gāi	não deveria	45	1	41
瞬間	shùn jiān	instante	2	1	41
作響	zuò xiǎng	rangendo	18	1	43
考試	kǎo shì	exame	36	1	34
Marta	Mǎ tǎ	Marta	2	1	33
阿弗拉尼奧	ā fú lā ní ào	Afrânio	-85	1	12
營業額	yíng yè é	volume de negócios	3	1	24
豬油渣	zhū yóu zhā	torresmo	2	1	12
難堪	nán kān	constrangido	6	1	21
停經	tíng jīng	menopausa	2	1	21
歧視	qí shì	discriminação	12	1	24
付錢	fù qián	pagar	13	1	42
在這裡	zài zhè lǐ	aqui	36	1	44
回事	huí shì	coisa, assunto	85	1	24
複	fù	repetir	1	1	\N
話筒	huà tǒng	microfone	1	1	43
祕密	mì mì	segredo	1	1	44
岳	yuè	montanha	1	1	\N
cas		caso	1	1	\N
口香糖	kǒu xiāng táng	chiclete	1	1	31
馮	féng	Feng	1	1	\N
尋歡作樂	xún huān zuò lè	divertir-se	1	1	21
也有	yě yǒu	também tem	1	1	33
《GERSON》	GERSON	Gerson	1	1	\N
替換	tìhuàn	substituir	1	1	\N
生畏	shēng wèi	awe-inspiring	1	1	14
蛋糕店	dànǎo diàn	loja de bolos	1	1	44
非常高	bǐyǎo gāo	muito alta	1	1	31
放進了	fàng jìn le	put in	1	1	44
食品	shí pǐn	food	1	1	23
暖柜	nuǎn guì	warming cabinet	1	1	34
扣上	kòu shàng	abotoar	1	1	44
夾克	jiā kè	jaqueta	1	1	14
粘	nián	grudento	1	1	\N
生長	shēng zhǎng	crescer	1	1	13
太多了	duō le	demais	1	1	15
遊樂	yóu lè	parque de diversões	1	1	24
desperation	desperation	desespero	1	1	\N
堅決	jiān jué	resoluto	1	1	12
悔	huǐ	arrepender	1	1	\N
創	chuàng	criar	1	1	\N
面板	miàn bǎn	painel	1	1	43
罷工	bà gōng	greve	10	1	41
增援	zēng yuàn	reforço	1	1	14
額	é	amount	1	1	\N
響亮	xiǎng liàng	alto	1	1	34
並重	bìng zhòng	igualmente importantes	2	1	44
克莉斯蒂娜	kè lì sī dì nà	Cristina	-72	1	44
習慣	xí guàn	acostumado	18	1	24
陰莖	yīn jīng	pênis	5	1	11
診斷	zhěn duàn	diagnóstico	20	1	34
阿毛里	Ā máo lǐ	Amauri	25	1	12
女性們	nǚ xìng men	mulheres	2	1	34
見過	jiàn guò	vi	34	1	44
沙拉	shā lā	salada	11	1	11
一向	yī xiàng	sempre	7	1	14
有時候	yǒu shí hòu	às vezes	28	1	32
最少	zuì shǎo	mínimo	2	1	43
趕出	gǎn chū	expulsar	2	1	31
心煩	xīn fán	aborrecido	2	1	12
一股	yī gǔ	uma onda de	6	1	13
嘿	hēi	ei	99	1	\N
搞混	gǎo hùn	confundir	3	1	34
雪上加霜	xuě shàng jiā shuāng	piorar ainda mais a situação	3	1	34
騷擾	sāo rǎo	assédio	3	1	13
翹臀	qiào tún	bunda empinada	2	1	42
可是	kě shì	mas	104	2	34
鈣	gài	cálcio	0	1	\N
指數	zhǐ shù	índice	0	1	34
準備好	zhǔn bèi hǎo	preparado	10	1	34
死定了	sǐ dìng le	morto	2	1	34
麻煩事	máfan shì	problemas	2	1	24
想辦法	xiǎng bàn fǎ	pensar em um jeito	3	1	34
觀看	guān kàn	assistir	5	1	14
射進	shè jìn	disparar dentro	2	1	44
用於	yòng yú	usado em	5	1	42
瓶子	píng zi	frasco	5	1	25
大喊	dà hǎn	gritar	41	1	43
施特勞斯	shī té láo sī	Strauss	5	1	12
變老	biàn lǎo	envelhecer	3	1	43
知識	zhī shí	conhecimento	2	1	12
下午好	xià wǔ hǎo	boa tarde	16	1	43
盡情	jìn qíng	à vontade	8	1	42
弄走	nòng zǒu	tirar/remover	2	1	43
此處	cǐ chù	aqui	4	1	34
單獨	dān dú	sozinho	18	1	12
共進	gòng jìn	compartilhar uma refeição	15	1	44
cocktail	cocktail	coquetel	0	1	\N
色情	sè qíng	pornográficos	2	1	42
玉米糊	yù mǐ hú	mingau de milho	2	1	43
瘦了	shòu le	emagreceu	3	1	45
37	sān shí qī	trinta e sete	2	1	12
合作	hé zuò	cooperar	6	1	24
美味佳餚	měi wèi jiā yáo	iguaria deliciosa	2	1	34
開胃菜	kāi wèi cài	aperitivo	3	1	14
阿夫拉尼奧	Ā fū lā ní ào	Afrânio	-221	1	11
皺紋	zhòu wén	rugas	7	1	42
太婆	tài pó	senhora idosa	2	1	42
笨笨	bèn bèn	lerdo	0	1	44
彩排	cǎi pái	ensaio	0	1	32
materialize	materialize	materializar	0	1	\N
让我	ràng wǒ	me faz	0	1	43
亡	wáng	perda	0	1	\N
體育館	tǐ yù guǎn	ginásio	0	1	34
我希望	wǒ xiǎng huì	eu espero	0	1	33
雜誌	zá zhì	revistas	10	1	24
冰箱	bīng xiāng	geladeira	8	1	11
意味著	yì wèi zhe	significa	9	1	44
端點	duān diǎn	ponto final	1	1	13
館	guǎn	restaurante	1	1	\N
aggressive	aggressive	agressivo	0	1	\N
礼物	lǐ wù	presente	2	1	34
小餐館	xiǎo cān guǎn	pequeno restaurante	0	1	31
克西	kè xī	Roxi	0	1	41
顯擺	xiǎn bǎi	exibir	1	1	33
格erson	ge rén	pessoa	0	1	52
啥	shá	o quê	5	1	\N
機器人	jī qì rén	robô	0	1	14
頁	yè	página	3	1	\N
格言	gé yán	adágio	0	1	22
的方式	de fǎ shì	maneira	0	1	53
聽到	tīng dào	ouvir	30	1	14
两个	liǎng gè	dois	0	1	34
小妻子	xiǎo qī zǐ	pequena esposa	0	1	31
借過	jièguò	com licença	48	1	\N
白天	bái tiān	dia	0	1	21
親家	qīn jiā	cunhado	0	1	11
比較	bǐ jiào	comparar	35	1	34
重點	zhòng diǎn	ponto principal	16	1	43
住客	zhù kè	hóspede	0	1	44
仇視	chóu shì	hostil	0	1	24
女友	nǚyǒu	namorada	8	1	\N
CRI	CRI	CRI	2	1	\N
廢話	fèi huà	bobagem	51	1	44
六十	liù shí	sessenta	5	1	42
不到	bù dào	não conseguir	27	1	44
談戀愛	tán liàn ài	namorar	7	1	24
舉行	jǔ xíng	realizar	6	1	32
喘氣	chuǎn qì	ofegar	4	1	34
秘方	mì fāng	receita secreta	2	1	41
全世界	quán shì jiè	mundo inteiro	33	1	24
60歲	liù shí suì	sessenta anos	2	1	42
實驗室	shí yàn shì	laboratório	13	1	24
檢測	jiǎn cè	detecção	9	1	34
陪伴	péi bàn	companhia	31	1	24
只會	zhǐ huì	apenas	8	2	34
13	shí sān	treze	2	1	21
梅西利亞諾	Méi xī lì yà nuò	Mesiliano	2	1	21
年長	nián zhǎng	mais velho	8	1	23
不一定	bù yī dìng	não necessariamente	2	1	41
北京狗	běi jīng gǒu	pequinês	2	1	31
他是誰	tā shì shéi	quem é ele	2	1	14
失控	shī kòng	descontrolado	7	1	14
有益	yǒu yì	benéfico	5	1	34
最好吃	zuì hǎo chī	mais gostoso	2	1	43
總裁	zǒng cái	presidente	2	1	32
聽筒	tīng tǒng	receptor	7	1	13
通過	tōng guò	através de	21	1	14
尷尬	gān gà	embaraçoso	10	1	14
忘掉	wàng diào	esquecer	3	1	44
脆皮	cuì pí	pele crocante	5	1	42
笨拙	bèn zhuō	desajeitado	2	1	41
整天	zhěng tiān	o dia todo	21	1	31
乳豬	rǔ zhū	leitão	5	1	31
取決於	qǔ jué yú	depende de	3	1	32
真棒	zhēn bàng	muito legal	4	1	14
去吧	qù ba	pode ir	7	1	45
貝倫酒店	bèi lún jiǔ diàn	Hotel Belém	2	1	42
小伙子	xiǎo huǒ zi	rapaz	13	1	33
幹嘛	gàn má	para quê	14	1	42
顺便	biànshǒu	por conveniência	0	1	\N
掛好	guà hǎo	desligado corretamente	7	1	43
做些什麼	zuò xiē shén me	fazer o quê	2	1	41
實話	shí huà	verdade	8	1	24
主意	zhǔ yì	ideia	28	1	34
回歸	huí guī	retornar	5	1	21
拉鍊	lā liàn	zíper	2	1	14
劉	liú	liu	0	1	\N
親切	qīn qiè	amigável	12	1	14
沒問題	méi wèn tí	sem problemas	56	1	24
固執己見	gù zhí jǐ jiàn	teimoso	3	1	42
大夥兒	dà huǒ er	pessoal	6	1	43
手淫	shǒu yín	masturbação	2	1	32
改正	gǎi zhèng	corrigir	2	1	34
補充	bǔ chōng	reposição	9	1	31
高亢的聲音	gāo kàng de shēng yīn	voz alta e sonora	2	1	14
最美的	zuì měi de	mais bonita	2	1	43
打呼嚕	dǎ hū lu	roncando	2	1	31
胡鬧	hú nào	fazer bagunça	4	1	24
採集	cǎi jí	coletar	15	1	32
引起	yǐn qǐ	causado por	5	1	33
補貼	bǔ tì	subsídio	0	1	34
肅	sù	sério	0	1	\N
試用	shì yòng	teste	0	1	44
寶石	bǎo shí	joia	2	1	32
欸	ēi	ei	3	1	\N
無聊	wú liáo	chato	10	1	22
呼喚	hū huàn	chamar	5	1	14
媒体	méiti	mídia	0	1	\N
孩子們	háizi men	crianças	28	1	25
聾	luō	surdo	1	1	\N
星河	xīng hé	rio estelar	1	1	12
珠	zhū	pérola	0	1	\N
合夥人	hé huǒ rén	sócio	2	1	23
舒歎	shū tǎn	suspiro	0	1	13
小助手	xiǎo zhù shǒu	pequeno assistente	0	1	34
[羅歇爾]	Luò xiē'ěr	[Rochelle]	0	1	41
標	biāo	placa	0	1	\N
劉娜	liú nà	Liu Na	0	1	24
烤	kǎo	assado	12	1	\N
所有者	suǒ yǒu zhě	proprietário	0	1	33
拽	zhuài	arrogante	0	1	\N
有很多	yǒu hěn duō	há muitos	0	1	33
更正	gēng zhèng	corrigir	0	1	14
框架	kuàng jia	estrutura	0	1	45
製造	zhìzào	fabricar	8	1	\N
BACELAR	BACELAR	Bacelar	0	1	\N
出售	chū shòu	vender	0	1	14
穩	wěn	estável	8	1	\N
徵	zhēng	recrutar	0	1	\N
召	zhào	convocar	0	1	\N
抗議	kàng yì	protesto	0	1	44
的原因	de yuàn yí	razão	0	1	54
给他们	gěi tāmen	para eles	0	1	31
了一定的	le yī dìng de	algum	0	1	51
封口費	fēng kǒu fèi	suborno	0	1	13
董事長	dí máng zhǎng	presidente	0	1	22
經費	jīng fèi	fundos	1	1	14
譞	yuàn	nome próprio	0	1	\N
趁	chèn	aproveitar	6	1	\N
喲	yō	expressão de surpresa	5	1	\N
病歷	bìng lì	histórico médico	2	1	44
事先	shì xiān	antecipadamente	5	1	41
寄來	jì lái	enviar	2	1	42
瞧瞧	qiáo qiao	olhe só	4	1	25
前夕	qián xī	véspera	3	1	21
不一樣	bù yī yàng	diferente	9	1	41
留言	liú yán	deixar mensagem	14	1	22
幹了	gàn le	fez	7	1	45
拋棄	pāo qì	abandonou	17	1	14
接聽	jiē tīng	atender	22	1	11
酒吧	jiǔ bā	bar	18	1	31
打牌	dǎ pái	jogar cartas	2	1	32
做事	zuò shì	fazer coisas	2	1	44
搏鬥	bó dòu	luta	2	1	24
徵求	zhēng qiú	solicitar	3	1	12
筋疲力盡	jīn pí lì jìn	exausto	7	1	12
改	gǎi	mudar	30	1	\N
塌了	tā le	desmoronar	2	1	15
甜言蜜語	tián yán mì yǔ	palavras doces e melífluas	2	1	22
還會	hái huì	ainda vou	10	1	24
海浪	hǎi làng	onda do mar	4	1	34
喜不喜歡	xǐ bù xǐhuān	gosta ou não	3	1	34
在這	zài zhè	nisso	8	1	44
收音機	shōu yīn jī	rádio	5	1	11
神魂顛倒	shén hún diān dǎo	enfeitiçar, fascinar	2	1	22
拿去	ná qù	levar embora	2	1	24
強壯	qiáng zhuàng	forte	5	1	24
晶體管	jīng tǐ guǎn	transistor	2	1	13
加冕	jiā miǎn	coroação	2	1	13
更好的	gèng hǎo de	melhor	6	1	43
傑曼諾	jié màn nuò	Germano	2	1	24
走吧	zǒu ba	vamos	43	1	35
帶給	dài gěi	trazer	3	1	43
收視率	shōu shì lǜ	audiência	2	1	14
一模一樣	yī mú yī yàng	exatamente igual	8	1	12
嚇到了	xià dào le	assustado	3	1	44
濃度	nóng dù	concentração	2	1	24
32歲	sān shí èr suì	32 anos	2	1	12
門診	mén zhěn	ambulatório	31	1	23
加勒比海	jiā lè bǐ hǎi	Mar do Caribe	2	1	14
安娜伊爾	ān nà yī ěr	Anaelle	21	1	14
樂意	lè yì	feliz, disposto	16	1	44
阿爾梅達	Ā ěr méi dá	Almeida	7	1	13
31歲	sān shí yī suì	31 anos	2	1	12
40歲	sì shí suì	40 anos	2	1	42
50歲	wǔ shí suì	50 anos	4	1	32
數百	shù bǎi	centenas	2	1	43
蠢事	chǔn shì	besteira	15	1	34
改不了	gǎi bù liǎo	não conseguir mudar	2	1	34
答應	dā yìng	concordar	21	1	14
育婴室	yù yīng shì	berçário	2	1	41
明信片	míng xìn piàn	cartão postal	2	1	24
活動力	huó dòng lì	mobilidade	2	1	24
黏度	nián dù	viscosidade	2	1	24
下一步	xià yī bù	próximo passo	5	1	41
里約熱內盧	lǐ yuē rè nèi lú	Rio de Janeiro	19	1	31
浴袍	yù páo	roupão de banho	2	1	42
看來	kàn lái	parece que	36	1	42
以後	yǐ hòu	no futuro	12	1	34
知道了	zhī dào le	entendido	8	1	14
埃爾南	āi ěr nán	Hernán	2	1	13
做得出來	zuò de chū lái	capaz de fazer	2	1	45
迷住	mí zhù	fascinar	2	1	24
帶了	dài le	trouxe	13	1	45
一小時	yī xiǎo shí	uma hora	0	1	13
得到了	dé dào le	obteve	0	1	24
公司的	gōng sī de	da empresa	0	1	11
浮	fú	flutuar	0	1	\N
完 成  (wán)	chéng	completar	0	1	\N
很重要	hěn zhòng yào	muito importante	0	1	34
建立	jiàn lì	estabelecer	13	1	44
辩护	bǎo hù	defender	0	1	34
不管	bùguǎn	não importa	24	1	\N
骗子	piàn zi	mentiroso	0	1	45
走了	zǒu le	ir embora	32	1	35
咖啡	kā fēi	café	98	2	11
卡斯提爾	Kǎ sī tī ěr	Castela	0	1	31
继承人	chéng jì rén	herdeiro	0	1	24
我把	wǒ bǎ	eu coloco	0	1	33
disposal	dispōsuō	à disposição	0	1	\N
CAMPANHA	CAMPANHA	campanha	2	1	\N
休	xiū	descansar	27	1	\N
氣喘吁吁	qì chuǎn xū xū	ofegante	99	1	43
眾人	zhòng rén	todos	6	1	42
作業	zuò yè	tarefa	15	1	44
致詞	zhì cí	discurso	3	1	42
黃色	huáng sè	amarelo	5	1	24
犧牲	xī shēng	sacrifício	10	1	11
仔細	zǐ xì	cuidadosamente	26	1	34
言	yán	dizer	70	1	\N
登場	dēng chǎng	entrar em cena	2	1	13
合約	hé yuē	contrato	3	1	21
什麼意思	shén me yì si	que significa	6	1	25
製作人	zhì zuò rén	produtor	2	1	44
睜	zhēng	abertos	2	1	\N
無論	wú lùn	independentemente	28	1	24
與否	yǔ fǒu	ou não	2	1	33
品牌	pǐn pái	marca	2	1	32
允許	yǔn xǔ	permitir	30	1	33
會不會	huì bú huì	irá ou não	17	1	42
針對	zhēn duì	visar	20	1	14
歡呼	huān hū	aclamação	6	1	11
演說	yǎn shuō	discurso	2	1	31
該死	gāi sǐ	maldito	30	1	13
確認	què rèn	confirmar	24	1	44
眼睛	yǎn jīng	olhos	23	1	31
發言	fā yán	discursar	2	1	12
阿弗朗尼奧	ā fú lǎng ní ào	Afrânio	2	1	12
完了	wán le	acabado	12	1	25
卑鄙	bēi bǐ	desprezível	9	1	13
清醒	qīng xǐng	lúcido	8	1	13
熱戀	rè liàn	apaixonado	3	1	44
欺騙	qī piàn	enganar	10	1	14
突擊	tū jī	surpresa	2	1	11
輸卵管	shū luǎn guǎn	trompas de falópio	8	1	13
更不用說	gèng bú yòng shuō	muito menos	6	1	42
弗里達	fú lǐ dá	Frida	2	1	23
CD	CD	CD	5	1	\N
皆	jiē	todos	87	2	\N
！	！	!	9	1	\N
訂	dìng	encomendar	13	1	\N
積極	jī jí	positivo	6	1	12
美好	měi hǎo	belo/bom	45	1	33
蠟燭	là zhú	vela	6	1	42
紙張	zhǐ zhāng	papel	23	1	31
就算	jiù suàn	mesmo que	26	1	44
反正	fǎn zhèng	de qualquer jeito	4	1	34
一團糟	yī tuán zāo	uma bagunça	9	1	12
開門	kāi mén	abrir a porta	6	1	12
得以	dé yǐ	conseguir	5	1	23
低語	dī yǔ	sussurro	22	1	13
安娜爾	ān nà ěr	Anar	10	1	14
犯錯	fàn cuò	cometer erros	27	1	44
太大	tài dà	muito grande	4	1	44
墮胎	duò tāi	aborto	23	1	41
趁機	chèn jī	aproveitar a oportunidade	12	1	41
顯然地	xiǎn rán dì	evidentemente	2	1	32
安娜伊尔	ān nà yī ěr	Anna Eel	2	1	14
議題	yì tí	tópico	4	1	42
賓客	bīn kè	convidados	2	1	14
警笛	jǐng dí	sirene	18	1	32
健身	jiàn shēn	fitness	2	1	41
結紮	jié zā	laqueadas	8	1	21
自主權	zì zhǔ quán	autonomia	2	1	43
源頭	yuán tóu	fonte	2	1	22
無傷大雅	wú shāng dà yǎ	não é grande coisa	2	1	21
面對	miàn duì	enfrentar	19	1	44
凝固	níng gù	solidificar	2	1	24
立刻	lì kè	imediatamente	22	1	44
放進	fàng jìn	inserir	10	1	44
反向	fǎn xiàng	reverso	2	1	34
接到	jiē dào	receber	4	1	14
痠痛	suān tòng	dor	2	1	14
阿福	ā fú	A Fu	2	1	12
航行	háng xíng	navegar	10	1	22
羊水	yáng shuǐ	líquido amniótico	4	1	23
遲早	chí zǎo	mais cedo ou mais tarde	7	1	23
青春期	qīng chūn qī	adolescência	2	1	11
要命	yào mìng	terrivelmente	10	1	44
不適合	bù shì hé	não é adequado	2	1	44
一通	yī tōng	uma ligação	3	1	11
香蕉	xiāng jiāo	banana	4	1	11
四十	sì shí	quarenta	19	1	42
坦然	tǎn rán	tranquila/despreocupada	2	1	32
蝴蝶結	hú dié jié	laço	2	1	22
救護車	jiù hù chē	ambulância	20	1	44
胡蘿蔔	hú luó bo	cenoura	2	1	22
第二次	dì èr cì	segunda vez	5	1	44
垮掉	kuǎ diào	desmoronar	2	1	34
恢復	huī fù	recuperar	23	1	14
太棒了	tài bàng le	maravilhoso	32	1	44
耶	yē	aleluia	36	1	\N
參加	cān jiā	participar	30	1	11
習慣於	xí guàn yú	acostumar-se a	2	1	24
阿奈爾	ā nài ěr	Anel	19	1	14
短暫	duǎn zàn	breve	18	1	34
伊爾	yī ěr	Il	14	1	13
角色	jué sè	papel	11	1	24
來過	lái guò	veio	6	1	24
心中	xīn zhōng	coração	17	1	11
母亲	mǔ qīn	mãe	3	1	31
意味	yì wèi	significar	9	1	44
空氣	kōng qì	ar	4	1	14
名單	míng dān	lista	5	1	21
蠢	chǔn	estúpido	19	1	\N
體	tǐ	corpo	21	1	\N
死了	sǐ le	morto	8	1	35
激進	jī jìn	radical	2	1	14
內部	nèi bù	interno	2	1	44
都要	dōu yào	devo	2	1	14
驚奇	jīng qí	maravilhar-se	2	1	12
交流	jiāo liú	comunicação	6	1	12
下午	xià wǔ	tarde	38	2	43
無論如何	wú lùn rú hé	de qualquer maneira	19	1	24
生下	shēng xià	dar à luz	4	1	14
如今	rú jīn	hoje em dia	2	1	21
女孩子	nǚ hái zi	garota	10	1	32
上來	shàng lái	subir	3	1	42
十二	shí èr	doze	2	1	24
20	èr shí	vinte	11	1	42
重聽	chóng tīng	ouvir novamente	2	1	21
嫁給	jià gěi	casar com	4	1	43
你媽	nǐ mā	sua mãe	5	1	31
退下	tuì xià	recuar	2	1	44
阿弗拉尼紐	Ā Fú Lā Ní Niǔ	Afranio	4	1	12
收縮	shōu suō	contrair	2	1	11
節奏	jié zòu	ritmo	5	1	24
滴答	dī dā	tique-taque	4	1	11
綁架	bǎng jià	sequestrar	6	1	34
亞索普	yà suǒ pǔ	Yasopp	2	1	43
分鐘	fēn zhōng	minutos	37	1	11
等到	děng dào	esperar até	15	1	34
有料	yǒu liào	interessante/impressionante	2	1	34
吸毒者	xī dú zhě	viciados em drogas	2	1	12
子女	zǐ nǚ	filhos	5	1	33
不負責任	bù fù zé rèn	irresponsável	4	1	44
奇	qí	curioso	94	1	\N
付	fù	pagar	35	1	\N
信心	xìn xīn	confiança	5	1	41
智慧	zhì huì	sabedoria	129	2	44
挺	tǐng	bastante	46	1	\N
除	chú	eliminar	14	1	\N
幹什麼	gàn shén me	fazer o quê	3	1	42
不然	bù rán	caso contrário	16	1	42
那样	nà yàng	desse jeito	3	1	44
遠播	yuǎn bō	difundir-se longe	7	1	31
飲食	yǐn shí	dieta	18	1	32
阿莫林	ā mò lín	Amorim	33	1	14
美好的	měi hǎo de	bonitas	5	1	33
不敢	bù gǎn	não ousar	32	1	43
西裝	xī zhuāng	terno	2	1	11
紙條	zhǐ tiáo	bilhete	23	1	32
豈敢	qǐ gǎn	como ousar	7	1	33
布蘭當	Bù lán dāng	Brandon	19	1	42
保險套	bǎo xiǎn tào	camisinha	7	1	33
利益	lì yì	interesse	3	1	44
良醫	liáng yī	bom médico	7	1	21
17	shí qī	dezessete	7	1	21
討喜	tǎo xǐ	agradável	7	1	33
在即	zài jí	iminente	9	1	42
卡羅琳娜	kǎ luó lín nà	Carolina	34	1	32
產前	chǎn qián	pré-natal	11	1	32
一起來	yì qǐ lái	vamos juntos	2	1	43
親吻聲	qīn wěn shēng	som de beijo	53	1	13
或許	huò xǔ	talvez	28	1	43
臨盆	lín pén	parto	9	1	22
卡蘿	kǎ luó	Carol	-100	1	32
來吧	lái ba	vamos	71	2	25
每晚	měi wǎn	toda noite	2	1	33
授權	shòu quán	autorizou	6	1	42
聲名	shēng míng	reputação	7	1	12
惡劣	è liè	ruim/terrível	8	1	44
吹響	chuī xiǎng	soar (soprando)	2	1	13
臉皮	liǎn pí	pele do rosto	8	1	32
好運	hǎo yùn	boa sorte	30	1	34
正面	zhèng miàn	lado positivo	9	1	44
獎章	jiǎng zhāng	medalha	6	1	31
陽性	yáng xìng	positivo	8	1	24
花了	huā le	gastaram	8	1	15
對講機	duì jiǎng jī	intercomunicador	2	1	43
諂媚	chǎn mèi	adulação	7	1	34
討人喜歡	tǎo rén xǐ huān	agradável	9	1	32
離家出走	lí jiā chū zǒu	fugir de casa	3	1	21
停車	tíng chē	estacionar carro	8	1	21
無比	wú bǐ	extremamente	7	1	23
語音	yǔ yīn	voz	24	1	31
很少	hěn shǎo	raramente	9	1	33
聽取	tīng qǔ	ouvir e considerar	8	1	13
聽著	tīng zhe	ouça	11	1	15
複雜	fù zá	complicado	30	1	42
33	sān shí sān	trinta e três	7	1	12
那麼多	nà me duō	tantos	3	1	45
叫人	jiào rén	mandar alguém	2	1	42
同眠	tóng mián	dormir junto	2	1	22
一開始	yī kāi shǐ	desde o início	11	1	11
自從	zì cóng	desde	15	1	42
接待	jiē dài	receber	46	1	14
對話	duì huà	diálogo	37	1	44
髒了	zāng le	sujo	4	1	15
暴雨	bào yǔ	tempestade	5	1	43
號角	hào jiǎo	trombeta/corno	2	1	43
没有	méi yǒu	não ter	2	1	23
滿了	mǎn le	cheio	6	1	35
尊姓大名	zūn xìng dà míng	seu respeitável sobrenome e grande nome	7	1	14
瘋子	fēng zǐ	louco	28	1	13
重複	chóng fù	repetir	5	1	24
壞事	huài shì	coisas ruins	8	1	44
擋	dǎng	bloquear	9	1	\N
壓力	yā lì	pressão	47	1	14
厚	hòu	grossa	8	1	\N
戴	dài	usar	10	1	\N
券	quàn	vale	7	1	\N
很高興	hěn gāo xìng	muito prazer	19	1	31
前幾天	qián jǐ tiān	alguns dias atrás	10	1	23
佔便宜	zhàn pián yí	levar vantagem	6	1	42
發瘋	fā fēng	enlouquecer	10	1	11
冒犯	mào fàn	ofender	11	1	44
夢見	mèng jiàn	sonhei com	7	1	44
錯了	cuò le	errou	12	1	45
當局	dāng jú	autoridades	8	1	12
聽聽	tīng tīng	ouça	11	1	11
法國	fǎ guó	França	11	1	32
憑藉	píng jiè	contar com	9	1	24
榮幸	róng xìng	honra	12	1	24
玩意兒	wán yìr	coisa	10	1	24
國外	guó wài	exterior	12	1	24
一頓	yí dùn	uma vez	17	1	24
懶惰	lǎn duò	preguiça	11	1	34
打給	dǎ gěi	liguei para	14	1	33
便條	biàn tiáo	nota	6	1	42
利用	lì yòng	aproveitar	16	1	44
讀到	dú dào	li/encontrei na leitura	6	1	24
7%	qī bǎi fēn zhī	7%	6	1	13
交談	jiāo tán	conversar	20	1	12
懂嗎	dǒng ma	entende	22	1	35
訂了婚	dìng le hūn	noivamos	6	1	45
喝杯	hē bēi	tomar um copo de	7	1	11
敬佩	jìng pèi	admirar	6	1	44
說過	shuō guò	disse	14	1	14
社團主義	shè tuán zhǔ yì	corporativismo	6	1	42
產科	chǎn kē	obstetrícia	6	1	31
狠狠	hěn hěn	severamente	10	1	33
很大	hěn dà	muito grande	19	1	34
相遇	xiāng yù	encontro	8	1	14
別人的	bié rén de	de outra pessoa	10	1	22
了結	liǎo jié	encerrar	6	1	32
幾天	jǐ tiān	alguns dias	11	1	31
芭蕾	bā lěi	balé	6	1	13
一行	yī háng	linha/profissão	6	1	12
交給	jiāo gěi	entregar a	27	1	13
不同的	bù tóng de	diferente	8	1	42
介入	jiè rù	intervir	11	1	44
驚訝	jīng yà	surpreender	13	1	14
日期	rì qī	data	53	1	41
撰寫	zhuàn xiě	escreveu	6	1	43
48	sì shí bā	48	7	1	42
您們	nín men	vocês	10	1	25
誤會	wù huì	mal-entendido	28	1	44
必要性	bì yào xìng	necessidade	14	1	44
自然分娩	zì rán fēn miǎn	parto natural	6	1	42
累了	lèi le	cansados	8	1	45
漫長	màn cháng	longo	18	1	42
親吻	qīn wěn	beijo	25	1	13
假的	jiǎ de	brincadeira	6	1	35
愛上	ài shàng	apaixonar-se por	17	1	44
醫學院	yī xué yuàn	faculdade de medicina	6	1	12
古典	gǔ diǎn	clássico	6	1	33
國	guó	país	64	3	\N
省	shěng	economizei	14	1	\N
世家	shì jiā	família tradicional	6	1	41
另一種	lìng yī zhǒng	outro tipo	6	1	41
正好	zhèng hǎo	exatamente certo	18	1	43
沒人	méi rén	ninguém	18	1	22
事務	shì wù	coisas/assuntos	15	1	44
說得對	shuō dé duì	está certa	16	1	12
這次	zhè cì	desta vez	58	2	44
提出	tí chū	propor	24	1	21
最高	zuì gāo	mais alto	9	1	41
經理	jīng lǐ	gerente	16	1	13
見到	jiàn dào	ver	62	2	44
裝飾	zhuāng shì	decorar	36	1	14
老師	lǎo shī	professor	21	1	31
其實	qí shí	na verdade	35	1	22
YES	YES	sim	6	1	\N
MAURÍCIO	MAURÍCIO	Maurício	6	1	\N
罵	mà	xingar	17	1	\N
抱負	bào fù	ambição	6	1	44
挽回	wǎn huí	recuperar	7	1	32
350	sān bǎi wǔ shí	trezentos e cinquenta	6	1	13
未曾	wèi céng	nunca	6	1	42
社會	shè huì	sociedade	22	1	44
大學	dà xué	universidade	26	1	42
值得	zhí dé	valer a pena	53	1	22
隨便	suí biàn	qualquer	23	1	24
商榷	shāng què	discutir	6	1	14
重視	zhòng shì	importância	8	1	44
留著	liú zhe	guardar	10	1	25
表達了	biǎo dá le	expressou	6	1	32
牆上	qiáng shàng	na parede	6	1	24
分娩	fēn miǎn	parto	46	1	13
就診	jiù zhěn	consulta médica	6	1	43
媽咪	mā mī	mamãe	7	1	11
店員	diàn yuán	funcionário da loja	9	1	42
道別	dào bié	dizer adeus	8	1	42
主管	zhǔ guǎn	supervisor	7	1	33
不道德	bù dào dé	antiético	13	1	44
看不到	kàn bù dào	não consigo ver	6	1	44
售貨員	shòu huò yuán	vendedor	6	1	44
雷亞爾	léi yà ěr	reais	12	1	24
管理員	guǎn lǐ yuán	administrador	6	1	33
培訓	péi xùn	treinamento	6	1	24
著名	zhù míng	famoso	7	1	42
伊爾達	Yī ěr dá	Hilda	6	1	13
來電	lái diàn	chamada telefônica	12	1	24
不久	bù jiǔ	em breve	14	1	43
線路	xiàn lù	linha	20	1	44
不是嗎	bú shì ma	não é	36	1	24
骨盆	gǔ pén	pélvis	20	1	32
諮詢費	zī xún fèi	taxa de consulta	6	1	12
講究	jiǎng jiu	ser meticuloso com	8	1	35
那是	nà shì	isso é	33	1	44
閱讀	yuè dú	leitura	8	1	42
階層	jiē céng	camada/classe social	6	1	12
下面	xià miàn	embaixo	19	1	44
五百	wǔ bǎi	quinhentos	7	1	33
塊錢	kuài qián	dólares	6	1	42
無緣無故	wú yuán wú gù	sem motivo algum	6	1	22
搶走	qiǎng zǒu	roubar	6	1	33
不成熟	bù chéng shú	imaturo	6	1	42
偏執	piān zhí	paranóico	7	1	12
別無選擇	bié wú xuǎn zé	não ter escolha	11	1	22
強制性	qiáng zhì xìng	obrigatório	6	1	24
成熟	chéng shú	madura	8	1	22
熱情	rè qíng	paixão	13	1	42
支配	zhī pèi	controlado	6	1	14
所謂的	suǒ wèi de	chamado	15	1	34
首選	shǒu xuǎn	primeira escolha	6	1	33
規定	guī dìng	regra	14	1	14
一件	yī jiàn	uma coisa	61	2	14
黑板	hēi bǎn	quadro negro	7	1	13
性命	xìng mìng	vida	6	1	44
牽連	qiān lián	envolver	8	1	12
哪位	nǎ wèi	qual	6	1	34
有多	yǒu duō	quão	6	1	31
擔保	dān bǎo	garantir	7	1	13
路西	lù xī	Lucy	6	1	41
知情	zhī qíng	ter conhecimento	10	1	12
去世了	qù shì le	faleceu	6	1	44
去年	qù nián	ano passado	7	1	42
而言	ér yán	falando	13	1	22
好看	hǎo kàn	bonito	12	1	34
藥品	yào pǐn	medicamentos	8	1	43
盆	pén	bacia	13	1	\N
窄	zhǎi	estreito	20	1	\N
醒	xǐng	acordar	57	1	\N
懶	lǎn	preguiçosos	6	1	\N
吉他	jí tā	guitarra	7	1	21
偏好	piān hào	preferência	13	1	14
醒醒	xǐng xǐng	acorde	13	1	33
科雷亞	kē léi yà	Correia	12	1	12
總不能	zǒng bù néng	não pode simplesmente	6	1	34
省錢	shěng qián	economizar dinheiro	6	1	32
處境	chǔ jìng	situação	14	1	34
一千	yī qiān	mil	9	1	11
媽呀	mā ya	mãe	8	1	15
嘗試	cháng shì	tentar	36	1	24
女子	nǚ zǐ	mulher	23	1	33
可笑	kě xiào	ridículo	6	1	34
診室	zhěn shì	consultório	6	1	34
誤解	wù jiě	mal-entendido	6	1	43
懦弱	nuò ruò	covarde	11	1	44
發抖	fā dǒu	tremendo	7	1	13
一日	yī rì	primeiro dia	8	1	14
課程	kè chéng	curso	24	1	42
寬限期	kuān xiàn qī	prazo de carência	6	1	14
修好	xiū hǎo	consertar	10	1	13
進度	jìn dù	progresso	6	1	44
最棒	zuì bàng	mais incrível	12	1	44
下個月	xià gè yuè	próximo mês	8	1	44
劈啪聲	pī pā shēng	estalido	9	1	11
十一月	shí yī yuè	novembro	6	1	21
試著	shì zhe	tentar	28	1	45
聲音哽咽	shēngyīn gěngyè	voz embargada	6	1	13
不可能	bù kě néng	impossível	44	1	43
之一	zhī yī	um dos	13	1	11
國家	guó jiā	país	37	1	21
菲略	fēi lüè	Filho	6	1	14
史蒂文	shǐ dì wén	Steven	-219	1	34
澄清	chéng qīng	esclarecer	7	1	21
倍	bèi	vezes	14	1	\N
薇拉	wēi lā	Vera	-112	1	11
拍手	pāi shǒu	bater palmas	6	1	13
懷有	huái yǒu	estar grávida de	10	1	23
教母	jiào mǔ	madrinha	11	1	43
高中	gāo zhōng	ensino médio	7	1	11
時期	shí qī	período	20	1	21
三十	sān shí	trinta	8	1	12
遇過	yù guò	encontrei	6	1	44
看法	kàn fǎ	opinião	16	1	43
學校	xué xiào	escola	52	1	24
櫃檯人員	guì tái rén yuán	recepcionista	6	1	42
拖慢	tuō màn	atrasar	6	1	14
深不可測	shēn bù kě cè	insondável	6	1	14
預計	yù jì	prever	6	1	44
令	lìng	fazer	25	1	\N
跟進	gēn jìn	acompanhar	7	1	14
達馬塞諾	dá mǎ sāi nuò	Damaceno	6	1	23
質疑	zhì yí	questionou	14	1	42
麻煩您	má fan nín	por favor/solicito a você	6	1	25
看上	kàn shàng	se interessar por	6	1	44
不敢相信	bù gǎn xiāng xìn	não acreditar	28	1	43
氣喘吁吁地	qì chuǎn xū xū de	ofegante	12	1	43
毫無疑問	háo wú yí wèn	sem dúvida alguma	8	1	22
冷漠	lěng mò	indiferente	6	1	34
身孕	shēn yùn	gravidez	6	1	14
換人	huàn rén	substituição	6	1	42
埃斯特旺	āi sī tè wàng	Estevão	-63	1	11
詢問	xún wèn	perguntar	14	1	24
八	bā	oito	28	1	\N
拍照	pāi zhào	tirar foto	8	1	14
遺忘	yí wàng	esquecido	11	1	24
課	kè	aula	61	1	\N
避免	bì miǎn	evitar	22	1	43
薪水	xīn shuǐ	salário	41	1	13
骨頭	gǔ tóu	osso	8	1	32
一如既往	yī rú jì wǎng	como sempre	9	1	12
填寫	tián xiě	preencher	7	1	23
小妹	xiǎo mèi	irmã mais nova	9	1	34
飛行	fēi xíng	voo	6	1	12
乾淨	gān jìng	limpo	10	1	14
瑪麗亞	mǎ lì yà	Maria	23	1	34
促銷	cù xiāo	promoção	7	1	41
絕不	jué bù	absolutamente não	19	1	24
效果	xiào guǒ	efeito	7	1	43
花瓶	huā píng	vaso	6	1	12
一提	yī tí	mencionar	6	1	12
不肯	bù kěn	recusar-se a	10	1	43
看到了嗎	kàn dào le ma	viu	17	1	44
啟示	qǐ shì	revelações	10	1	34
因素	yīn sù	fator	8	1	14
只要	zhǐ yào	desde que	40	2	34
放在	fàng zài	colocar em	21	1	44
1月	yī yuè	janeiro	13	1	14
人手	rén shǒu	pessoal	6	1	23
款項	kuǎn xiàng	fundos	9	1	34
說明	shuō míng	explicar	9	1	12
不佳	bù jiā	não é bom	6	1	41
買通	mǎi tōng	subornar	6	1	31
再也	zài yě	nunca mais	51	1	43
打了	dǎ le	liguei	11	1	35
遲到了	chí dào le	atrasado	16	1	24
辦了	bàn le	realizou	7	1	45
腦子	nǎo zi	cérebro	29	1	35
25日	èr shí wǔ rì	dia 25	13	1	42
傻住	shǎ zhù	paralisado de espanto	6	1	34
粉紅	fěn hóng	rosa	7	1	32
門診部	mén zhěn bù	ambulatório	39	1	23
哼唱著	hēng chàng zhe	cantarolando	7	1	14
上次	shàng cì	da última vez	7	1	44
機靈	jī líng	esperto	7	1	12
聊聊	liáo liáo	conversar	10	1	22
完畢	wán bì	conclusão	8	1	24
良知	liáng zhī	consciência	6	1	21
遇到	yù dào	encontrar	27	1	44
提議	tí yì	proposta	17	1	24
疑問	yí wèn	dúvida	9	1	24
艾斯蒂旺	Ài sī dì wàng	Estevão	6	1	41
退出	tuì chū	sair	9	1	41
太好了	tài hǎo le	ótimo	51	2	43
往上	wǎng shàng	para cima	9	1	34
更別說	gèng bié shuō	muito menos	6	1	42
古怪	gǔ guài	excêntrica	9	1	34
訪談	fǎng tán	entrevista	6	1	32
豬	zhū	porco	6	1	\N
到頭來	dào tóu lái	no final das contas	7	1	42
這家	zhè jiā	esta empresa	8	1	41
得著	dé zháo	conseguir	6	1	22
機票	jī piào	passagem aérea	12	1	14
想著	xiǎng zhe	pensando em	12	1	35
經過	jīng guò	passar por	16	1	14
缺了	quē le	falta	6	1	15
呃	è	hum	31	1	\N
哪怕	nǎ pà	mesmo que	6	1	34
離職	lí zhí	deixar o emprego	6	1	22
爭辯	zhēng biàn	argumentar	8	1	14
空腹	kōng fù	estômago vazio	6	1	14
掏	tāo	tirar	6	1	\N
違背	wéi bèi	violar	10	1	24
搞錯了	gǎo cuò le	cometeu um erro	9	1	34
抗爭	kàng zhēng	resistir	10	1	41
一趟	yī tàng	uma visita	11	1	14
整潔	zhěng jié	arrumado	6	1	32
難過	nán guò	triste	40	1	24
說不定	shuō bù dìng	talvez	10	1	14
對象	duì xiàng	objeto/alvo	8	1	44
報紙	bào zhǐ	jornal	15	1	43
她的	tā de	dela	44	1	15
預算	yù suàn	orçamento	8	1	44
編	biān	inventar	11	1	\N
一杯	yī bēi	um copo	20	1	11
酷	kù	legal	29	1	\N
取代	qǔ dài	substituir	11	1	34
VLADIMIR	VLADIMIR	VLADIMIR	6	1	\N
搞定	gǎo dìng	resolver	17	1	34
閉上	bì shàng	fechar	9	1	44
運輸用	yùn shū yòng	para transporte	5	1	41
那樣的	nà yàng de	desse jeito	9	1	44
嗶嗶聲	bì bì shēng	som de bipe	57	1	44
溫度	wēn dù	temperatura	5	1	14
齊聲	qí shēng	em uníssono	10	1	21
一百	yī bǎi	cem	9	1	13
心率	xīn lǜ	frequência cardíaca	5	1	14
保暖	bǎo nuǎn	manter aquecido	11	1	33
成套	chéng tào	conjunto	5	1	24
八點	bā diǎn	oito horas	8	1	13
15日	shí wǔ rì	dia 15	6	1	23
帳號	zhàng hào	conta	8	1	44
吶喊	nà hǎn	gritar	13	1	43
填	tián	preencher	6	1	\N
暴躁	bào zào	irritadiço	6	1	44
金額	jīn é	valor, quantia	20	1	12
護士	hù shì	enfermeiro	34	1	44
咿呀	yī yā	balbucio	17	1	11
應付	yìng fù	lidar	11	1	44
輸了	shū le	perdeu	7	1	15
明白了	míng bái le	entendeu	15	1	22
喝醉	hē zuì	bêbado	8	1	14
這一切	zhè yī qiè	tudo isso	8	1	41
別管	bié guǎn	não se importe	6	1	23
失手	shī shǒu	cometer um erro	7	1	13
結結巴巴	jié jié bā bā	gaguejando	7	1	22
再次	zài cì	novamente	35	1	44
放學後	fàng xué hòu	depois da escola	5	1	42
動手術	dòng shǒu shù	realizar cirurgia	11	1	43
拿回	ná huí	recuperar	5	1	22
一下下	yī xià xià	um pouquinho	9	1	14
克服	kè fú	superar	12	1	42
頂級	dǐng jí	de alto nível	16	1	32
手勢	shǒu shì	gesto	5	1	34
會兒	huì er	momento	9	1	45
行事曆	xíng shì lì	agenda	6	1	24
保溫箱	bǎo wēn xiāng	caixa térmica	15	1	31
这么	zhè me	assim	6	1	45
说	shuō	dizer	11	1	\N
小可愛	xiǎo kě ài	fofo	6	1	33
一台	yī tái	uma unidade	6	1	12
恭候	gōng hòu	aguardar respeitosamente	7	1	14
差得遠	chà dé yuǎn	está longe	12	1	42
爛人	làn rén	pessoa horrível/pessoa nojenta	6	1	42
關進	guān jìn	trancar em	7	1	14
老公	lǎo gōng	marido	8	1	31
配合	pèi hé	cooperar	5	1	42
11月	shí yī yuè	novembro	6	1	21
註冊	zhù cè	registrar	10	1	44
38	sān shí bā	trinta e oito	5	1	12
真是的	zhēn shì de	sério	9	1	14
不行	bù xíng	não pode	117	2	42
地址	dì zhǐ	endereço	14	1	43
諮詢	zī xún	consulta	12	1	12
包裹	bāo guǒ	pacote	7	1	13
給你	gěi nǐ	para você	8	1	33
郵箱	yóu xiāng	caixa de correio	13	1	21
監測器	jiān cè qì	monitor	27	1	14
真美	zhēn měi	tão bonitas	6	1	13
羊毛	yáng máo	lã	11	1	22
亂	luàn	confusa	13	1	\N
嘴	zuǐ	boca	12	1	\N
參與	cān yù	participar	48	1	14
表演	biǎo yǎn	performance	17	1	33
乎	hū	partícula interrogativa	15	1	\N
和平	hé píng	paz	23	1	22
秒	miǎo	segundo	27	1	\N
JAQUELINE	JAQUELINE	JAQUELINE	6	1	\N
結巴	jiē bā	gaguejar	6	1	11
暖和	nuǎn huo	quente	11	1	35
行徑	xíng jìng	comportamento	9	1	24
瑪努埃拉	Mǎ nǔ āi lā	Manuela	5	1	33
才對	cái duì	é que certo	8	1	24
之上	zhī shàng	acima	17	1	14
動不動	dòng bu dòng	com frequência	7	1	45
以此	yǐ cǐ	desta forma	9	2	33
過量	guò liàng	excesso	6	1	44
剝離	bō lí	descolamento	5	1	12
桃紅色	táo hóng sè	cor de pêssego	6	1	22
這幫	zhè bāng	este bando	5	1	41
對的	duì de	correto	6	1	45
章程	zhāng chéng	estatutos	6	1	12
嚇壞了	xià huài le	assustado	7	1	44
凌駕	líng jià	estar acima	5	1	24
誓言	shì yán	juramento	16	1	42
烏合之眾	wū hé zhī zhòng	multidão desorganizada	5	1	12
一句話	yī jù huà	uma palavra	8	1	14
警笛聲	jǐng dí shēng	som de sirene	25	1	32
期間	qī jiān	período	8	1	11
衣物	yī wù	roupas	5	1	14
莫里西奧	mò lǐ xī ào	Maurício	-85	1	43
野蠻	yě mán	bárbaro	6	1	32
懷孕的	huái yùn de	grávida	6	1	24
吃飯	chī fàn	comer	11	1	14
所作所為	suǒ zuò suǒ wéi	ações	8	1	34
日程本	rì chéng běn	agenda	6	1	42
虛榮	xū róng	vaidade	7	1	12
無瑕	wú xiá	impecável	7	1	22
舉動	jǔ dòng	ações	6	1	34
住手	zhù shǒu	parar as mãos	25	1	43
產後抑鬱症	chǎn hòu yì yù zhèng	depressão pós-parto	5	1	34
真正的	zhēn zhèng de	verdadeiro/genuíno	6	1	14
坐吧	zuò ba	sentem-se	6	1	45
還要	hái yào	ainda precisa	32	1	24
真心	zhēn xīn	sinceramente	12	1	11
面前	miàn qián	frente	32	1	42
請進	qǐng jìn	entrem por favor	8	1	34
每位	měi wèi	cada	7	2	34
未經	wèi jīng	não	8	1	41
無權	wú quán	não ter o direito	6	1	22
身上	shēn shàng	corpo/sobre	44	1	14
毀了	huǐ le	arruinou	7	1	35
怎麼辦	zěn me bàn	o que fazer	53	2	35
理智	lǐ zhì	racionais	12	1	34
捐贈	juān zèng	doar	11	1	14
怎麼樣了	zěn me yàng le	como está	5	1	35
暱稱	nì chēng	apelido	5	1	41
牙牙	yá yá	balbuciar	8	1	22
馬拉松	mǎ lā sōng	maratona	6	1	31
漆成	qī chéng	pintar de	6	1	12
求助	qiú zhù	pedir ajuda	7	1	24
不適感	bù shì gǎn	desconforto	5	1	44
飲酒	yǐn jiǔ	beber álcool	6	1	33
不好好	bù hǎo hǎo	não adequadamente	6	1	43
學語	xué yǔ	aprender a falar	8	1	23
胎盤	tāi pán	placenta	5	1	12
呼之	hū zhī	chamado	5	1	11
給過	gěi guò	dei	7	1	34
去哪了	qù nǎ le	para onde foram	5	1	43
完美	wán měi	perfeito	19	1	23
保持	bǎo chí	manter	70	1	32
同事	tóng shì	colegas	18	1	24
消除	xiāo chú	eliminar	12	1	12
掛	guà	pendurar	9	1	\N
播放	bō fàng	tocar	13	1	14
蘿	luó	nabo	19	1	\N
濃	nóng	forte/espesso	26	1	\N
長髮	cháng fǎ	cabelos longos	5	1	23
出醜	chū chǒu	passar vergonha	5	1	13
治療師	zhì liáo shī	terapeuta	9	1	42
踢了	tī le	chutou	5	1	15
律師	lǜ shī	advogado	18	1	41
我不敢相信	wǒ bù gǎn xiāng xìn	eu não acredito	5	1	34
什麼時候	shén me shí hòu	quando	22	1	25
贊成	zàn chéng	aprovar	12	1	42
暫時	zàn shí	temporariamente	26	1	42
月經	yuè jīng	menstruação	23	1	41
開著	kāi zhe	manter aberta	5	1	15
禮遇	lǐ yù	tratamento cortês	5	1	34
沙沙聲	shā shā shēng	som de farfalhar	5	1	11
手術刀	shǒu shù dāo	bisturi	8	1	34
血壓	xuè yā	pressão arterial	17	1	41
糊塗	hú tu	confuso	8	1	25
小狗	xiǎo gǒu	cachorrinho	5	1	33
設法	shè fǎ	tentar	6	1	43
超聲波	chāo shēng bō	ultrassom	5	1	11
失業	shī yè	desempregado	8	1	14
大廳	dà tīng	saguão	5	1	41
水裡	shuǐ lǐ	água	5	1	33
低血壓	dī xuè yā	hipotensão	5	1	14
沒事了	méi shì le	estou bem	7	1	24
抵達	dǐ dá	chegar	16	1	32
費用	fèi yòng	custo	22	1	44
傲慢的	ào màn de	arrogantes	5	1	44
自稱是	zì chēng shì	autodenominam-se	5	1	41
沒有人	méi yǒu rén	ninguém	13	3	23
出血	chū xiě	sangramento	42	1	13
嚇死	xià sǐ	assustar muito	9	1	43
懷中	huái zhōng	colo	8	1	21
絕不應	jué bù yīng	nunca deve	5	1	24
教授	jiào shòu	professor	13	1	44
點點	diǎn diǎn	pouquinho	6	1	33
合理	hé lǐ	razoável	13	1	23
相處	xiāng chǔ	nos dar bem	22	1	13
抽根菸	chōu gēn yān	fumar um cigarro	5	1	11
小女孩	xiǎo nǚ hái	menininha	8	1	33
急性	jí xìng	agudo	9	1	24
寧可	nìng kě	preferir	20	1	43
受人尊敬的	shòu rén zūn jìng de	respeitado	6	1	42
不適	bù shì	indisposto	8	1	44
醫務室	yī wù shì	posto médico	5	1	14
難受	nán shòu	mal/desconfortável	10	1	24
做得對	zuò dé duì	fez certo	5	1	42
正處於	zhèng chǔ yú	está em	5	1	43
捐款	juān kuǎn	doação	12	1	13
見面	jiàn miàn	nos encontramos	25	1	44
口信	kǒu xìn	recado	7	1	34
修理	xiū lǐ	consertar	9	1	13
操縱	cāo zòng	manipular	7	1	14
睜大	zhēng dà	abrir bem	5	1	14
剖腹生產	pōu fù shēng chǎn	parto cesáreo	6	1	14
神聖	shén shèng	sagrado	8	1	24
虛榮心	xū róng xīn	vaidade	5	1	12
地步	dì bù	ponto/extremo	8	1	44
93	jiǔ sān	noventa e três	5	1	31
信號	xìn hào	sinal	5	1	44
就範	jiù fàn	obedecer	7	1	44
秩序	zhì xù	ordem	5	1	44
2月8日	2 yuè 8 rì	8 de fevereiro	6	1	54
步行	bù xíng	caminhar	5	1	42
使命	shǐ mìng	missão	6	1	34
慷慨	kāng kǎi	generosa	10	1	13
一腳	yī jiǎo	um chute	5	1	13
出馬	chū mǎ	tomar parte	6	1	13
樓梯	lóu tī	escada	14	1	21
放心	fàng xīn	fique tranquilo	37	1	41
介意	jiè yì	se importar	18	1	44
趕快	gǎnkuài	rapidamente	9	1	\N
更何況	gèng hé kuàng	ainda mais	9	1	42
瘋狂的	fēng kuáng de	louco/louca	9	1	12
監護儀	jiān hù yí	monitor	11	1	14
跑來	pǎo lái	vir correndo	6	1	32
比如說	bǐ rú shuō	por exemplo	6	1	32
毛里西奧	Máo lǐ xī ào	Maurício	34	1	23
假裝	jiǎ zhuāng	fingir	22	1	31
一瓶	yī píng	uma garrafa	3	1	12
料理	liào lǐ	culinária	5	1	43
好轉	hǎo zhuǎn	melhorar	4	1	33
接待員	jiē dài yuán	recepcionista	16	1	14
令人失望	lìng rén shī wàng	decepcionante	6	1	42
看診	kàn zhěn	atendendo	9	1	43
徹頭徹尾	chè tóu chè wěi	completo, absoluto	5	1	42
安格拉	ān gé lā	Angra	6	1	12
克里斯蒂娜·布蘭當	kè lǐ sī dì nà · bù lán dāng	Cristina Brandão	6	1	43
付諸東流	fù zhū dōng liú	desperdiçado, perdido	6	1	41
改天	gǎi tiān	outro dia	7	1	31
統計數據	tǒng jì shù jù	dados estatísticos	6	1	34
動搖了	dòng yáo le	vacilou, abalou	5	1	42
歸根結底	guī gēn jié dǐ	no final das contas	5	1	11
累死了	lèi sǐ le	exausto	5	1	43
眼鏡	yǎn jìng	óculos	6	1	34
從天而降	cóng tiān ér jiàng	cair do céu	6	1	21
一所	yī suǒ	um/uma (classificador para instituições)	6	1	13
售貨亭	shòu huò tíng	quiosque	3	1	44
馬塞洛	mǎ sāi luò	Marcelo	11	1	31
我的天啊	wǒ de tiān a	Meu Deus	28	1	35
整件事	zhěng jiàn shì	a coisa toda	5	1	34
退去	tuì qù	recuar	3	1	44
危險性	wēi xiǎn xìng	perigo	7	1	13
半路上	bàn lù shàng	no meio do caminho	3	1	44
貝特	bèi tè	Bett	11	1	44
最酷的	zuì kù de	mais legal	5	1	44
終將	zhōng jiāng	eventualmente	3	1	11
日本	rì běn	Japão	5	1	43
兒科醫生	ér kē yī shēng	pediatra	5	1	21
當兵	dāng bīng	alistar-se no exército	5	1	11
以斯帖	Yǐ sī tiē	Ester	23	1	31
弗拉基米爾	fú lā jī mǐ ěr	Vladimir	-104	1	21
打火機	dǎ huǒ jī	isqueiro	6	1	33
倒楣	dǎo méi	azarado	4	1	32
那時	nà shí	naquela época	18	1	42
才華橫溢	cái huá héng yì	talentoso	6	1	22
翻臉	fān liǎn	ficar com raiva	6	1	13
費利佩	fèi lì pèi	Filipe	27	1	44
一大早	yī dà zǎo	de manhã cedo	5	1	14
哪個	nǎ ge	qual	12	1	35
打字	dǎ zì	digitar	3	1	34
有條件	yǒu tiáo jiàn	tem condições	6	1	32
大不了	dà bu liǎo	grande coisa	3	1	45
盧西	lú xī	Luci	5	1	21
手術室	shǒu shù shì	sala de cirurgia	3	1	34
汽車發動	qì chē fā dòng	carro liga	7	1	41
早餐	zǎo cān	café da manhã	16	1	31
激動	jī dòng	emocionada	13	1	14
點火	diǎn huǒ	acender	7	1	33
能否	néng fǒu	se pode	13	1	23
掌控	zhǎng kòng	controle	7	1	34
購買	gòu mǎi	comprar	13	1	43
安東尼	ān dōng ní	Antônio	11	1	11
慘	cǎn	terrível	6	1	\N
唧唧	jī jī	trinar	12	1	11
快點	kuài diǎn	depressa	87	1	43
天翻地覆	tiān fān dì fù	virada de cabeça para baixo	5	1	11
壞蛋	huài dàn	canalha, vilão	5	1	44
真的是	zhēn de shì	realmente é	5	1	15
沒戴	méi dài	não está usando	3	1	24
嘔吐	ǒu tù	vômito	7	1	34
值班	zhí bān	plantão	27	1	21
報到	bào dào	registrar-se	16	1	44
娜丁	nà dīng	Nadine	7	1	41
某個	mǒu gè	algum	14	1	34
錯過	cuò guò	perder	12	1	44
燈	dēng	lâmpada	25	1	\N
認真	rèn zhēn	sério	25	1	41
揉	róu	amassar	4	1	\N
NADINE	Nadine	Nadine	3	1	\N
初	chū	no início	4	1	\N
分離	fēn lí	separação	6	1	12
天主	tiān zhǔ	Deus	3	1	13
流程	liú chéng	fluxo/processo	4	1	22
不簡單	bù jiǎn dān	não é simples	3	1	43
出門	chū mén	sair	21	1	12
治癒	zhì yù	curar	9	1	44
吉奧瑪爾	jí ào mǎ ěr	Guiomar	3	1	24
藥單	yào dān	receita médica	3	1	41
植入	zhí rù	implantar	3	1	24
降福	jiàng fú	abençoar	4	1	42
強效	qiáng xiào	potente	3	1	24
暈倒	yūn dǎo	desmaiar	5	1	13
沒變	méi biàn	não mudou	4	1	24
同在	tóng zài	estar com	10	1	24
少女	shào nǚ	jovem garota	11	1	43
早晨	zǎo chén	manhã	10	1	32
放置	fàng zhì	colocar	5	1	44
好幾天	hǎo jǐ tiān	vários dias	3	1	33
持續	chí xù	contínuo	13	1	24
咕噥	gū nóng	murmurar	7	1	12
泰爾瑪	tài ěr mǎ	Thelma	41	1	43
床上	chuáng shàng	na cama	19	1	24
疑心	yí xīn	suspeita	4	1	21
容量	róng liàng	volume	3	1	24
昨日	zuó rì	ontem	3	1	24
腹症	fù zhèng	abdome/condição abdominal	3	1	44
全能	quán néng	onipotente	3	1	22
瑪西亞	mǎ xī yà	Márcia	36	1	31
中途	zhōng tú	no meio do caminho	6	1	12
究竟	jiū jìng	afinal	31	1	14
紙上	zhǐ shàng	no papel	4	1	34
今年	jīn nián	este ano	13	3	12
一小片	yī xiǎo piàn	um pequeno pedaço	3	1	13
非得	fēi děi	tem que	5	1	13
填補	tián bǔ	preencher	3	1	23
一到	yī dào	assim que chegar	3	1	14
刮宮手術	guā gōng shǒu shù	curetagem	3	1	11
每個月	měi gè yuè	todo mês	3	1	34
桑德拉	sāng dé lā	Sandra	3	1	12
多個	duō gè	múltiplos	5	1	14
不算	bú suàn	não contar	5	1	24
哽咽地	gěng yè dì	com voz embargada	3	1	34
外科醫生	wài kē yī shēng	cirurgião	8	1	41
贏回	yíng huí	recuperar	5	1	22
等一下	děng yī xià	espere um pouco	60	3	31
人工流產	rén gōng liú chǎn	aborto induzido	3	1	21
包包	bāo bāo	bolsa	12	1	11
是因為	shì yīn wèi	é porque	25	1	41
壞了	huài le	quebrou	5	1	45
就會	jiù huì	vai	16	1	44
值班人員	zhí bān rén yuán	pessoal de plantão	3	1	21
每當	měi dāng	sempre que	6	1	31
躺在	tǎng zài	deitado em	3	1	34
鎮靜劑	zhèn jìng jì	sedativo	9	1	44
變了	biàn le	mudei	12	1	45
破裂	pò liè	ruptura	3	1	44
呻吟	shēn yín	gemido	27	1	12
切除術	qiē chú shù	mastectomia	3	1	12
開玩笑	kāi wán xiào	brincar	33	1	12
遞交	dì jiāo	entregar	10	1	41
幾歲	jǐ suì	quantos anos	3	1	34
滑動	huá dòng	deslizar	3	1	24
證書	zhèng shū	certificado	5	1	41
此刻	cǐ kè	neste momento	17	1	34
想過	xiǎng guò	pensei	41	1	34
艱難	jiān nán	difícil	12	1	12
黏合	nián hé	aderir	3	1	22
戰勝了	zhàn shèng le	venceu	3	1	44
牙腔	yá qiāng	cavidade dentária	3	1	21
沒關係	méi guān xì	não tem problema	27	1	21
RAFI	RAFI	RAFI	3	1	\N
胃	wèi	estômago	15	1	\N
AMARY	AMAURY	AMAURY	3	1	\N
丟掉	diū diào	jogar fora/descartar	6	1	14
打斷	dǎ duàn	interromper	3	1	34
盡力	jìn lì	fazer o melhor possível	13	1	44
消化系統	xiāo huà xì tǒng	sistema digestivo	3	1	14
膿腫	nóng zhǒng	abscesso	3	1	23
運氣不好	yùn qì bù hǎo	azar	3	1	44
脾臟	pí zàng	baço	7	1	24
照片	zhào piàn	fotografia	40	1	44
喜愛	xǐ ài	afeição	6	1	34
小姑娘	xiǎo gū niang	garotinha	5	1	31
袋子	dài zi	sacola	9	1	45
18	shí bā	dezoito	4	1	21
羞愧	xiū kuì	vergonha	8	1	14
想起來	xiǎng qǐ lái	lembrar-se	3	1	33
打人	dǎ rén	bater em alguém	3	1	32
結結巴巴地說	jié jié bā bā de shuō	gaguejar	3	1	22
挑剔	tiāo tī	exigente	3	1	11
藉口	jiè kǒu	desculpa	6	1	43
沸沸揚揚	fèi fèi yáng yáng	alvoroço	8	1	44
鐘聲	zhōng shēng	som de sino	5	1	11
檔	dàng	batente	3	1	\N
昏迷	hūn mí	coma	7	1	12
不好	bù hǎo	não boa	16	3	43
背景	bèi jǐng	fundo	34	1	43
方向盤	fāng xiàng pán	volante	10	1	14
乳房	rǔ fáng	seios	12	1	32
下方	xià fāng	abaixo	5	1	41
鼻子	bí zi	nariz	8	1	25
一面	yī miàn	lado	5	1	14
傾向	qīng xiàng	inclinar	4	1	14
紀念日	jì niàn rì	aniversário	3	1	44
我覺得	wǒ jué dé	eu acho	3	1	32
無比的	wú bǐ de	incomparável	3	1	23
頭髮	tóu fǎ	cabelo	15	1	23
按壓	àn yā	pressionar	3	1	41
突然間	tū rán jiān	de repente	19	1	12
猜對了	cāi duì le	adivinhou certo	3	1	14
運氣	yùn qì	sorte	13	1	44
腹部	fù bù	abdômen	15	1	44
唱片	chàng piàn	disco (fonográfico)	4	1	44
乳房切除術	rǔ fáng qiē chú shù	mastectomia	3	1	32
保住	bǎo zhù	preservar	3	1	34
就是這樣	jiù shì zhè yàng	é assim	8	1	44
這輩子	zhè bèi zi	esta vida	7	1	44
這方面	zhè fāng miàn	este aspecto	3	1	41
干預	gān yù	intervenção	9	1	14
親親	qīn qīn	beijinho	11	1	11
擺動	bǎi dòng	balançar	3	1	34
丟臉	diū liǎn	vergonhoso	12	1	13
關聯	guān lián	relação	3	1	12
稱呼	chēng hū	chamar	8	1	11
縫合線	fèng hé xiàn	sutura	3	1	42
差	chà	faltar	16	1	\N
撒謊	sā huǎng	mentir	12	1	13
彌撒	mí sa	missa	12	1	25
胖	pàng	gordo	16	1	\N
啤酒	pí jiǔ	cerveja	17	1	23
去了	qù le	fui	17	1	45
醜	chǒu	feio	17	1	\N
6	liù	seis	5	1	\N
3	sān	três	4	1	\N
髒	zāng	sujo	20	1	\N
？	？	?	13	1	\N
崩潰	bēng kuì	entrar em colapso	9	1	14
侏羅紀	zhū luó jì	Jurássico	3	1	12
暫時性	zàn shí xìng	temporário	3	1	42
足球	zú qiú	futebol	15	1	22
空虛	kōng xū	vazio	30	1	11
研究生	yán jiū shēng	pós-graduação	3	1	21
前行	qián xíng	avançar	11	1	22
氣瘋了	qì fēng le	ficou furiosa	3	1	41
帳戶	zhàng hù	conta	17	1	44
假牙	jiǎ yá	dentadura	3	1	32
住在	zhù zài	mora em	24	1	44
殘缺	cán quē	deficiente	3	1	21
傻瓜	shǎ guā	tolo	17	1	31
而是	ér shì	mas sim	34	1	24
注意到	zhù yì dào	notado	13	1	44
但丁	Dàn dīng	Dante	3	1	41
是誰	shì shéi	quem é	19	1	42
包括	bāo kuò	incluir	25	1	14
整形手術	zhěng xíng shǒu shù	cirurgia plástica	7	1	32
失控了	shī kòng le	perdeu o controle	3	1	14
佔線	zhàn xiàn	ocupado	3	1	44
事故	shì gù	acidente	8	1	44
瓷器	cí qì	porcelana	7	1	24
半小時	bàn xiǎo shí	meia hora	6	1	43
抗抑鬱藥	kàng yì yù yào	antidepressivo	3	1	44
呼叫器	hū jiào qì	pager	3	1	14
教練	jiào liàn	treinador	5	1	44
響過了	xiǎng guò le	tocou	3	1	34
一片	yī piàn	uma extensão de	4	1	14
分居	fēn jū	separação	3	1	11
開車	kāi chē	dirigir	10	1	11
部位	bù wèi	área	7	1	44
胃痛	wèi tòng	dor de estômago	3	1	44
搞砸	gǎo zá	estragar	10	1	32
開槍	kāi qiāng	atirar	27	1	11
行不通	xíng bù tōng	não vai funcionar	6	1	24
倫敦	lún dūn	Londres	5	1	21
存入	cún rù	depositado	7	1	24
母性	mǔ xìng	maternal	3	1	34
轉交	zhuǎn jiāo	entregar/transmitir	5	1	31
想起	xiǎng qǐ	lembro	8	1	33
進來了	jìn lái le	entrou	4	1	42
埃斯特	āi sī tè	Este	3	1	11
憑空	píng kōng	do nada	3	1	21
動了	dòng le	fez/submeteu-se a	3	1	45
吉奧瑪	jí ào mǎ	Joma	31	1	24
21	èr shí yī	vinte e um	8	1	42
及時	jí shí	a tempo	3	1	22
雜音	zá yīn	ruído	3	1	21
工程師	gōng chéng shī	engenheiro	3	1	12
有名	yǒu míng	famoso	9	1	32
一絲不掛	yī sī bù guà	completamente nu	3	1	11
擊中	jī zhòng	atingir	10	1	14
負責人	fù zé rén	responsável	3	1	42
契約	qì yuē	contrato	4	1	41
更加	gèng jiā	mais	17	1	41
脫掉	tuō diào	tirar	4	1	14
在內	zài nèi	incluído	8	1	44
提到	tí dào	mencionou	15	1	24
不住	bú zhù	não mora	8	1	24
撞到了	zhuàng dào le	bateu/colidiu	3	1	44
試了	shì le	tentei	3	1	45
沒用	méi yòng	inútil	9	1	24
特蘭科索	tè lán kē suǒ	Trancoso	3	1	42
保險箱	bǎo xiǎn xiāng	cofre	3	1	33
劈啪	pī pā	estalando	3	1	11
填充	tián chōng	preenchimento	3	1	21
裝上	zhuāng shàng	colocar	3	1	14
叮噹聲	dīng dāng shēng	tilintar	18	1	11
菲利普	fēi lì pǔ	Filipe	12	1	14
麻醉劑	má zuì jì	anestésico	3	1	24
意外	yì wài	acidente	18	1	44
在行	zài háng	ser bom em	10	1	42
迷茫	mí máng	confuso	4	1	22
夢想著	mèng xiǎng zhe	sonhando com	4	1	43
強大	qiáng dà	fortes/poderosos	7	1	24
好好的	hǎo hǎo de	bem	8	1	33
行行好	xíng xíng hǎo	fazer um favor	3	1	22
明明	míng míng	obviamente	3	1	22
平安	píng ān	paz	10	1	21
表現	biǎo xiàn	me comportar	21	1	34
相同	xiāng tóng	mesmo	11	1	12
另一個	lìng yī gè	outro	53	2	41
脆弱	cuì ruò	frágeis	9	1	44
鳥	niǎo	pássaro	11	1	\N
吉	jí	auspicioso	12	1	\N
好處	hǎo chù	benefício	19	1	34
擴展	kuò zhǎn	expandir	3	1	43
你還好嗎	nǐ hái hǎo ma	Você está bem?	4	1	32
建造	jiàn zào	construir	11	1	44
毆打	ōu dǎ	espancado	4	1	13
假體	jiǎ tǐ	prótese	19	1	33
重建	chóng jiàn	reconstruir	5	1	24
打手	dǎ shǒu	capangas	24	1	33
乳頭	rǔ tóu	mamilo	4	1	32
說了	shuō le	disse	18	1	15
之地	zhī dì	lugar	4	1	14
聰明	cōng míng	inteligente	45	1	12
全都	quán dōu	todos	20	1	21
直面	zhí miàn	enfrentar diretamente	6	1	24
眼前	yǎn qián	diante dos olhos	3	1	32
以便	yǐ biàn	para	11	1	34
絕對的	jué duì de	absolutamente	4	1	24
成功的	chéng gōng de	ter sucesso	3	1	21
理想	lǐ xiǎng	ideal	21	1	33
併發症	bìng fā zhèng	complicação	4	1	41
較晚	jiào wǎn	relativamente tarde	3	1	43
成年人	chéng nián rén	adulto	11	1	22
兩位	liǎng wèi	dois (pessoas)	4	1	34
咂嘴	zā zuǐ	estalar a língua	3	1	13
一系列	yī xì liè	uma série	4	1	14
虛無	xū wú	nada, vazio	5	1	12
補償	bǔ cháng	compensar	8	1	32
它們	tā men	eles/elas	30	1	15
看一看	kàn yī kàn	dar uma olhada	3	1	41
曾經	céng jīng	já	61	1	21
浮現	fú xiàn	surgir	3	1	24
長大了	zhǎng dà le	cresceu	5	1	34
始	shǐ	começar	40	1	\N
訴說	sù shuō	narrar	14	1	41
豪爾赫	háo ěr huò	Jorge	22	1	23
從不	cóng bù	nunca	13	1	24
藍圖	lán tú	planta/plano	4	1	22
9	jiǔ	nove	3	1	\N
小憩	xiǎo qì	cochilo	3	1	34
櫥窗	chú chuāng	vitrine	3	1	21
聽清楚	tīng qīng chǔ	ouvir claramente	5	1	11
二十五	èr shí wǔ	vinte e cinco	4	1	42
風趣	fēng qù	engraçado	4	1	14
薩帕約	sà pà yuē	Sapateiro	3	1	44
論證	lùn zhèng	argumentar	0	1	44
現今	xiàn jīn	atualmente	8	1	41
一點點	yī diǎn diǎn	um pouquinho	21	1	13
空間	kōng jiān	espaço	11	1	11
容納	róng nà	acomodar	3	1	24
本事	běn shì	habilidade	9	1	34
某樣	mǒu yàng	de algo	3	1	34
別無	bié wú	não ter outra	8	1	22
移植	yí zhí	transplante	8	1	22
索	suǒ	corda	16	1	\N
憤怒	fèn nù	furiosa	6	1	44
要麼	yào me	ou	6	1	45
說出來	shuō chū lái	dizer	4	1	11
瑪莎	mǎ shā	Martha	3	1	31
換作	huàn zuò	trocar por	4	1	44
好奇	hào qí	curioso	12	1	42
剩下	shèng xià	restante	11	1	44
多少	duō shǎo	quanto	79	1	13
黏膜	nián mó	mucosa	3	1	22
現如今	xiàn rú jīn	atualmente	3	1	42
朵拉	duǒ lā	Dora	8	1	31
夜店	yè diàn	clube noturno	0	1	44
這招	zhè zhāo	este golpe/truque	3	1	41
擺脫	bǎi tuō	livrar-se	26	1	31
負義	fù yì	ingrato	0	1	44
撐	chēng	aguentar	11	1	\N
也許	yě xǔ	talvez	55	1	33
婭	yà	(parte do nome)	0	1	\N
難熬	nán áo	difícil de suportar	11	1	22
我不小心	wǒ bù xiǎo xīn	eu sem querer	3	1	34
還好	hái hǎo	estou bem	12	1	23
圓滿	yuán mǎn	satisfatório	15	1	23
在哪裡	zài nǎ lǐ	onde está	9	1	43
專心	zhuān xīn	focado	12	1	11
談到	tán dào	falar sobre	10	1	24
完美無缺	wán měi wú quē	perfeito e impecável	3	1	23
索拉婭	suǒ lā yà	Soraya	3	1	31
娜迪娜	nà dí nà	Nadina	3	1	42
瑪西婭	mǎ xī yà	Márcia	3	1	31
進步了	jìn bù le	progrediu	3	1	44
淑女	shū nǚ	dama	3	1	13
待在	dāi zài	ficar	5	1	14
伊朗人	yī lǎng rén	iraniano	1	1	13
訂婚	dìng hūn	noivar	1	1	41
保險單	bǎo xiǎn dān	apólice de seguro	3	1	33
白色	bái sè	branco	11	1	24
一時	yī shí	momentâneo	3	1	12
之類	zhī lèi	e assim por diante	5	1	14
不下	bù xià	não descer	5	1	44
請您	qǐng nín	por favor	3	1	32
歸還	guī huán	devolver	8	1	12
與眾不同	yǔ zhòng bù tóng	excepcional	6	1	34
豐盛	fēng shèng	farta	3	1	14
詳細	xiáng xì	detalhado	5	1	24
另一場	lìng yī chǎng	outra	3	1	41
孩子氣	hái zi qì	infantil	1	1	25
桑帕約	sāng pà yuē	Sampaio	3	1	14
笨	bèn	tolo	8	1	\N
醒了	xǐng le	acordou	4	1	35
生下了	shēng xià le	deu à luz	3	1	14
禁食	jìn shí	jejuar	4	1	42
不夠	bú gòu	não suficiente	11	1	24
結局	jié jú	final	6	1	22
變出	biàn chū	produzir	3	1	41
私人	sī rén	privado	8	1	12
薩達夫	sà dá fū	Sadaf	9	1	42
東北	dōng běi	nordeste	3	1	13
呼叫	hū jiào	chamando	20	1	14
接著	jiē zhe	em seguida	4	1	15
抹去了	mǒ qù le	apagou	3	1	34
可悲	kě bēi	lamentável	9	1	31
協助	xié zhù	assistir	9	1	24
犯傻	fàn shǎ	agir como tolo	3	1	43
整形外科	zhěng xíng wài kē	cirurgia plástica	3	1	32
預定	yù dìng	agendar	3	1	44
麵條	miàn tiáo	macarrão	4	1	42
我不想	wǒ bù xiǎng	eu não quero	3	1	34
忍不住	rěn bú zhù	não aguentar	7	1	32
鬆了一口氣	sōng le yī kǒu qì	aliviei-me	4	1	15
瑪諾埃拉	mǎ nuò āi lā	Manoela	3	1	34
登船	dēng chuán	embarcar	3	1	12
罕見	hǎn jiàn	raro	3	1	34
隨地	suí dì	em qualquer lugar	3	1	24
嗶嗶	bī bī	bipe	16	1	11
撥號	bō hào	discar	13	1	14
望著	wàng zhe	olhando fixamente	3	1	45
移除	yí chú	remover	3	1	22
未婚夫	wèi hūn fū	noivo	10	1	41
加護病房	jiā hù bìng fáng	UTI	7	1	14
索拉雅	suǒ lā yǎ	Soraya	3	1	31
一盞燈	yī zhǎn dēng	uma lâmpada	3	1	13
幼稚	yòu zhì	imaturo	4	1	44
康復	kāng fù	recuperação	11	1	14
監護	jiān hù	monitoramento	15	1	14
本分	běn fèn	dever	21	1	34
教堂	jiào táng	capela	23	1	42
盡了	jìn le	cumpri totalmente	10	1	45
體外受精	tǐ wài shòu jīng	fertilização in vitro	3	1	34
遠處	yuǎn chù	distante	3	1	34
筆尖	bǐ jiān	ponta da caneta	3	1	31
哽咽的聲音	gěng yè de shēng yīn	voz embargada	7	1	34
怎麼會	zěn me huì	como pode	18	1	35
儀	yí	instrumento	13	1	\N
一人	yī rén	uma pessoa	12	1	12
一段時間	yī duàn shí jiān	um período de tempo	9	1	14
傳統	chuán tǒng	tradicional	16	1	23
活動	huó dòng	campanha	29	1	24
存款	cún kuǎn	depósito	5	1	23
討	tǎo	pedir	15	1	\N
置於	zhìyú	colocar em	4	1	\N
安德蕾雅	ān dé lěi yǎ	Andrea	3	1	12
氧氣	yǎng qì	oxigênio	3	1	34
罪犯	zuì fàn	criminoso	5	1	44
折扣	zhé kòu	desconto	6	1	24
插管	chā guǎn	intubar	1	1	13
為何	wèi hé	por que	6	1	42
阿熱諾爾	ā rè nuò ěr	Agenor	3	1	14
一層	yī céng	uma camada	5	1	12
山頭	shān tóu	montanha	1	1	12
耽擱	dān ge	atrasar	3	1	15
莫哈馬德	mò hā mǎ dé	Mohammad	1	1	41
關掉	guān diào	desligar	14	1	14
呻吟聲	shēn yín shēng	gemido	4	1	12
搞砸了	gǎo zá le	estragar	3	1	32
羅薩斯	Luó sà sī	Rosas	5	1	24
贊同	zàn tóng	aprovar	1	1	42
處事方式	chǔ shì fāng shì	maneira de lidar com as coisas	1	1	34
看著	kàn zhe	olhe para	30	1	45
快走	kuài zǒu	saia rápido	9	1	43
包圍	bāo wéi	cercado	3	1	12
坐下	zuò xià	sentar	7	1	44
每個人	měi gè rén	cada pessoa	10	1	34
安德烈婭	ān dé liè yǎ	Andréa	1	1	12
鄉下	xiāng xià	interior	1	1	14
大小	dà xiǎo	tamanho	2	1	43
免得	miǎn dé	evitar	5	1	32
給我	gěi wǒ	para mim	3	1	33
防衛	fáng wèi	defesa	1	1	24
太久	tài jiǔ	muito tempo	3	1	43
南國	nán guó	sul do país	1	1	22
槍支	qiāng zhī	arma de fogo	3	1	11
貧困	pín kùn	pobreza	1	1	24
公分	gōng fēn	centímetros	6	1	11
臍帶	qí dài	cordão umbilical	1	1	24
滅了	miè le	eliminar	1	1	45
教室	jiào shì	sala de aula	5	1	44
擴張	kuò zhāng	dilatação	13	1	41
揚聲器	yáng shēng qì	alto-falante	7	1	21
好起來	hǎo qǐ lái	melhorar	8	1	33
又是	yòu shì	novamente	3	1	44
來不及	lái bu jí	não ter tempo suficiente	2	1	25
茅屋	máo wū	cabana de palha	1	1	21
阿熱諾	ā rè nuò	Arenor	1	1	14
大聲喊叫	dà shēng hǎn jiào	gritar em voz alta	4	1	41
產科醫生	chǎn kē yī shēng	médico obstetra	1	1	31
薄膜	bó mó	membrana	1	1	22
變成	biàn chéng	tornar-se	16	1	42
阿拉伯語	ā lā bó yǔ	árabe (idioma)	5	1	11
土包子	tǔ bāo zi	caipira	1	1	31
煮	zhǔ	ferver	6	1	\N
剛好	gāng hǎo	justamente	2	1	13
毒品	dú pǐn	drogas	2	1	23
應有	yīng yǒu	deveria ter	2	1	13
稀有	xī yǒu	raro	1	1	13
小神	xiǎo shén	pequeno deus	5	1	32
投降	tóu xiáng	se render	8	1	22
滴	dī	pingar	3	1	\N
臀位	tún wèi	pélvica	1	1	24
朝下	cháo xià	virado para baixo	1	1	24
真絲	zhēn sī	seda pura	1	1	11
掛鉤	guà gōu	gancho	1	1	41
缺氧	quē yǎng	falta de oxigênio	3	1	13
交易	jiāo yì	transação	7	1	14
走著瞧	zǒu zhe qiáo	veremos	2	1	35
離開了	lí kāi le	deixou	5	1	21
逃離	táo lí	escapar	9	1	22
聽懂了嗎	tīng dǒng le ma	entendeu	1	1	13
子宮頸	zǐ gōng jǐng	colo do útero	6	1	31
沙漠	shā mò	deserto	3	1	14
前面	qián miàn	frente	26	1	24
同志	tóng zhì	camarada	7	1	24
藝術品	yì shù pǐn	obra de arte	1	1	44
哈努米	hā nǔ mǐ	Hanumi	3	1	13
吃盡	chī jìn	sofrer completamente	1	1	14
這份	zhè fèn	este	7	1	44
苦頭	kǔ tóu	dificuldades	1	1	32
射擊	shè jī	tiro	2	1	41
花招	huā zhāo	truques	3	1	11
耍	shuǎ	fazer	15	1	\N
庫卡	kù kǎ	Kuka	3	1	43
代表	dài biǎo	representante	9	1	43
趕緊	gǎn jǐn	rapidamente	2	1	33
座	zuò	(classificador)	27	1	\N
帶走	dài zǒu	levar embora	21	1	43
住院	zhù yuàn	hospitalização	4	1	44
CB	CB	CB	11	1	\N
巴托朗	Bā tuō lǎng	Bartolone	1	1	11
相符	xiāng fú	corresponder	2	1	12
資源	zī yuán	recursos	8	1	12
淘氣	táo qì	travesso	4	1	24
特爾瑪	tè ěr mǎ	Thelma	2	1	43
現有的	xiàn yǒu de	existentes	1	1	43
同一個	tóng yī gè	o mesmo	2	1	21
卡拉卡	kǎ lā kǎ	Kalaka	3	1	31
一名	yī míng	um	12	1	12
女王	nǚ wáng	rainha	17	1	32
不帶	bù dài	não portar	1	1	44
守衛	shǒu wèi	guardas	1	1	34
曾是	céng shì	já foi	2	1	24
擴音器	kuò yīn qì	alto-falante	1	1	41
衛生	wèi shēng	condições sanitárias	3	1	41
逃竄	táo cuàn	fugir	1	1	24
老大	lǎo dà	chefe	4	1	34
圍困	wéi kùn	cercar/assediar	1	1	24
人家	rén jiā	outra família	2	1	21
高舉	gāo jǔ	levantar alto	3	1	13
野獸	yě shòu	fera	4	1	34
工作者	gōng zuò zhě	trabalhador	1	1	14
接管	jiē guǎn	assumir o controle	2	1	13
巢穴	cháo xué	ninho	1	1	22
搶了	qiǎng le	roubou	1	1	35
歹徒	dǎi tú	bandidos	8	1	32
黑鬼	hēi guǐ	negro (termo pejorativo)	3	1	13
就已經	jiù yǐ jīng	já	2	1	43
24小時	24 xiǎo shí	24 horas	7	1	53
發威	fā wēi	demonstrar poder	1	1	11
病因	bìng yīn	causa da doença	1	1	41
他自己	tā zì jǐ	ele mesmo	1	1	14
夥計	huǒ jì	parceiro	4	1	34
蘇拉雅	sū lā yǎ	Suraya (nome próprio)	1	1	11
薩達芙	Sà dá fú	Sadaf	1	1	42
接住	jiē zhù	pegar	2	1	14
許配	xǔ pèi	prometer em casamento	1	1	34
午飯	wǔ fàn	almoço	2	1	34
區別	qū bié	diferença	7	1	12
教好	jiāo hǎo	ensinar bem	1	1	13
黑幫	hēi bāng	máfia	1	1	11
犯了	fàn le	cometeu	2	1	45
雙手	shuāng shǒu	ambas as mãos	5	1	13
自由	zì yóu	livre	19	1	42
德齊尼亞	dé qí ní yà	Dezinia	1	1	22
小女神	xiǎo nǚ shén	pequena deusa	1	1	33
井中	jǐng zhōng	no poço	1	1	31
已被	yǐ bèi	já foi	1	1	34
污染	wū rǎn	poluída	2	1	13
此時	cǐ shí	neste momento	2	1	32
童年	tóng nián	infância	2	1	22
信息	xìn xī	informação	3	1	41
治療方法	zhì liáo fāng fǎ	método de tratamento	1	1	42
極差	jí chà	extremamente ruins	4	1	24
持槍	chí qiāng	empunhando armas	1	1	21
新郎	xīn láng	noivo	2	1	12
牛頭	niú tóu	cabeça de boi	5	1	22
天生	tiān shēng	nascido	4	1	11
文法	wén fǎ	gramática	1	1	23
奧馬爾	Ào mǎ ěr	Omar	1	1	43
奧斯馬雷斯	ào sī mǎ léi sī	Osmarras	1	1	41
複數形式	fù shù xíng shì	forma plural	1	1	44
血脈	xuè mài	linhagem	1	1	44
純正	chún zhèng	puro	1	1	24
驚恐	jīng kǒng	aterrorizado	1	1	13
脫離	tuō lí	sair de	4	1	12
槍擊	qiāng jī	baleado	20	1	11
氯	lǜ	cloro	1	1	\N
殺人	shā rén	matar pessoas	2	1	12
南方	nán fāng	sul	9	1	21
定性	dìng xìng	classificar	1	1	44
公子哥	gōng zǐ gē	playboy	1	1	13
集合	jí hé	reunir	1	1	22
實現	shí xiàn	realizar	8	1	24
冷靜點	lěng jìng diǎn	acalme-se	3	1	34
差錯	chā cuò	erro	3	1	14
光是	guāng shì	apenas	2	1	14
布里佐拉	Bù lǐ zuǒ lā	Brizola	5	1	43
太遲	tài chí	muito tarde	3	1	42
爬	pá	subir	4	1	\N
放過	fàng guò	perdoar	6	1	44
毒窟	dú kū	antro de drogas	1	1	21
聽懂了	tīng dǒng le	entenderam	1	1	13
天使	tiān shǐ	anjo	11	1	13
這麼多	zhè me duō	tantos	10	1	45
尖叫	jiān jiào	gritar	24	1	14
槍	qiāng	tiros	21	1	\N
基於	jī yú	baseado em	3	1	12
過多	guò duō	excessivo	1	1	41
最愛	zuì ài	mais amada	3	1	44
所要求的	suǒ yāo qiú de	solicitado	1	1	31
局部	jú bù	local	1	1	24
重病	zhòng bìng	doença grave	1	1	44
貧民窟	pín mín kū	favela	2	1	22
豪門	háo mén	família rica	1	1	22
法蒂瑪	fǎ dì mǎ	Fátima	21	1	34
椅子	yǐ zi	cadeira	9	1	35
舒適	shū shì	confortável	12	1	14
初產婦	chū chǎn fù	primípara	1	1	13
膠帶	jiāo dài	fita adesiva	5	1	14
拖動	tuō dòng	arrastar	1	1	14
液體	yè tǐ	líquido	7	1	43
行駛	xíng shǐ	dirigir	13	1	23
產鉗	chǎn qián	fórceps	1	1	32
警惕	jǐng tì	vigilância	7	1	34
博塔弗戈	bó tǎ fú gē	Botafogo	4	1	23
輪子	lún zi	roda	2	1	25
難產	nán chǎn	parto difícil	1	1	23
等候	děng hòu	aguardar	3	1	34
用量	yòng liàng	quantidade utilizada	1	1	44
撐得住	chēng dé zhù	aguentar	1	1	12
右翼	yòu yì	direita	1	1	44
向上帝	xiàng shàng dì	a Deus	2	1	44
下棋	xià qí	jogar xadrez	1	1	42
止痛藥	zhǐ tòng yào	analgésico	1	1	34
觀察	guān chá	observar	8	1	12
今日	jīn rì	hoje	12	1	14
金髮	jīn fǎ	cabelos loiros	3	1	13
教會	jiào huì	igreja	7	1	44
發紫	fā zǐ	ficar roxo/arroxeado	1	1	13
哪有	nǎ yǒu	como posso ter	1	1	33
器械	qì xiè	instrumentos	1	1	44
急救箱	jí jiù xiāng	kit de primeiros socorros	1	1	24
人質	rén zhì	refém	12	1	24
昏倒	hūn dǎo	desmaiar	16	1	13
剪短	jiǎn duǎn	cortar curto	1	1	33
手上	shǒu shàng	na mão	5	1	34
救出	jiù chū	resgatar	2	1	41
撕裂傷	sī liè shāng	laceração	1	1	14
麻醉藥	má zuì yào	anestésico	1	1	24
剪刀	jiǎn dāo	tesoura	1	1	31
會陰切開術	huì yīn qiē kāi shù	episiotomia	1	1	41
南區	nán qū	região sul	3	1	21
幾塊	jǐ kuài	algumas peças	1	1	34
紗布	shā bù	gaze	1	1	14
挨了	ái le	sofreu	2	1	25
小混混	xiǎo hùn hùn	pivete	4	1	34
牛頭人	niú tóu rén	minotauro	3	1	22
不足	bù zú	insuficiente	2	1	42
會陰	huì yīn	períneo	6	1	41
閉嘴	bì zuǐ	calar a boca	11	1	43
縫合了	féng hé le	suturou	1	1	22
輸血	shū xiě	transfusão de sangue	2	1	13
溝通	gōu tōng	comunicação	3	1	11
山丘	shān qiū	colina	1	1	11
千金	qiān jīn	jovem senhora	1	1	11
留院	liú yuàn	permanecer no hospital	1	1	24
灑	sǎ	derramar	5	1	\N
國王	guó wáng	rei	1	1	22
結構化	jié gòu huà	estruturação	1	1	24
頭上	tóu shàng	em cima da cabeça	1	1	24
撒野	sā yě	agir de forma selvagem/insolente	1	1	13
頭香	tóu xiāng	primeiro incenso	1	1	21
哈努梅	hā nǔ méi	Hanume	5	1	13
水分	shuǐ fèn	líquidos	3	1	34
喏	nuò	aqui está	4	1	\N
前進	qián jìn	avançar	7	1	24
OSMAR	OSMAR	OSMAR	4	1	\N
Sadaf	Sadaf	Sadaf	1	1	\N
低吼聲	dī hǒu shēng	rosnado baixo	3	1	13
不許	bù xǔ	não permitir	5	1	43
傳	chuán	passar	35	1	\N
防彈	fáng dàn	à prova de balas	1	1	24
各位	gè wèi	todos	46	2	44
燈光	dēng guāng	luzes	3	1	11
受人	shòu rén	receber pessoas	1	1	42
南戈蘇爾	Nán gē sū ěr	Nangorsur	3	1	21
重擊	zhòng jī	golpe pesado	4	1	41
答覆	dá fù	resposta	1	1	24
生來	shēng lái	nasceram	3	1	12
帥哥	shuài gē	bonitão	5	1	41
起飛	qǐ fēi	decolar	2	1	31
傻逼	shǎ bī	idiota	1	1	31
蠢貨	chǔn huò	imbecil	4	1	34
帶到	dài dào	trazer para	5	1	44
輪到	lún dào	vez de	8	1	24
傳球	chuán qiú	passe a bola	1	1	22
同志們	tóng zhì men	camaradas	1	1	24
阿倫卡爾	ā lún kǎ ěr	Alencar	3	1	12
小夥子	xiǎo huǒ zi	rapaz	10	1	33
自負	zì fù	ser responsável por	1	1	44
嚇得	xià dé	assustado	1	1	42
誠意	chéng yì	boa-fé	1	1	24
指向	zhǐ xiàng	apontar para	1	1	34
分不清	fēn bù qīng	não consegue distinguir	1	1	14
毒販	dú fàn	traficante de drogas	1	1	24
渡過	dù guò	superar	1	1	44
槍子	qiāng zǐ	tiro	1	1	13
一記	yī jì	um golpe	1	1	14
匪徒	fěi tú	bandidos	5	1	32
全速	quán sù	velocidade total	1	1	24
上去	shàng qù	subir	3	1	44
警官	jǐng guān	oficial de polícia	6	1	31
咳嗽	ké sou	tosse	17	1	25
阿西斯	ā xī sī	Assis	3	1	11
頭槌	tóu chuí	cabeçada	1	1	22
解放	jiě fàng	libertadas	1	1	34
接下來	jiē xià lái	a seguir	5	1	14
無辜者	wú gū zhě	inocente	2	1	21
上膛的	shàng táng de	carregada	1	1	42
大意	dà yì	descuidado	2	1	44
恐龍	kǒng lóng	dinossauro	1	1	32
難關	nán guān	dificuldade	1	1	21
奴隸	nú lì	escravo	1	1	24
也好	yě hǎo	também é bom	4	1	33
遭到	zāo dào	sofreu	2	1	14
綁匪	bǎng fěi	sequestrador	1	1	33
畏	wèi	medo	1	1	\N
搶匪	qiǎng fěi	assaltante	1	1	33
屋頂	wū dǐng	telhado	1	1	13
善意	shàn yì	boa vontade	10	1	44
屁滾尿流	pì gǔn niào liú	mijando nas calças de medo	1	1	43
養大	yǎng dà	criar	2	1	34
緊緊地	jǐn jǐn de	firmemente	1	1	33
接收	jiē shōu	receber	4	1	11
不用了	bú yòng le	não precisa	2	1	24
猶豫	yóu yù	hesitar	2	1	24
妥協	tuǒ xié	compromisso	2	1	32
哎呀呀	āi yā yā	ai ai ai	1	1	11
警方	jǐng fāng	polícia	2	1	31
種族	zhǒng zú	raça	6	1	32
獲釋者	huò shì zhě	liberto	1	1	44
彩票	cǎi piào	loteria	9	1	34
贏了	yíng le	ganharam	5	1	25
旁	páng	lado	3	1	\N
不准	bù zhǔn	não permitido	14	1	43
裝置	zhuāng zhì	dispositivo	1	1	14
厲害	lì hài	incrível	22	1	44
指令	zhǐ lìng	instrução	1	1	34
他媽的	tā mā de	porra	8	1	11
監聽	jiān tīng	grampear	1	1	11
發現了	fā xiàn le	descobriram	4	1	14
通話	tōng huà	chamada	4	1	14
站住	zhàn zhù	pare	1	1	44
打交道	dǎ jiāo dào	lidar	1	1	31
快跑	kuài pǎo	correr rápido	6	1	43
背心	bèi xīn	colete	1	1	41
令人難以置信	lìng rén nán yǐ zhì xìn	incrível	1	1	42
專注	zhuān zhù	focar	4	1	14
冒	mào	correr	15	1	\N
慢慢地	màn màn de	devagar	3	1	44
耳	ěr	ouvido	1	1	\N
州	zhōu	estado	1	1	\N
赫	hè	proeminente	3	1	\N
護理人員	hù lǐ rén yuán	profissional de enfermagem	1	1	43
事關	shì guān	diz respeito a	1	1	41
醫學界	yī xué jiè	mundo médico	1	1	12
肌肉	jī ròu	músculos	3	1	14
據稱	jù chēng	supostamente	1	1	41
遇見	yù jiàn	encontrar	19	1	44
災難	zāi nàn	desastre	2	1	14
奧斯瑪爾	Ào sī mǎ ěr	Osmã	1	1	41
養得	yǎng dé	criar de forma	1	1	32
小夥子們	xiǎo huǒ zi men	rapazes	1	1	33
堪憂	kān yōu	preocupante	1	1	11
進出	jìn chū	entrar e sair	3	1	41
符合	fú hé	atender/atender a	1	1	22
幫派	bāng pài	gangue	1	1	14
玫瑰	méi guī	rosa	65	1	21
車廂	chē xiāng	vagão	4	1	11
任何人	rèn hé rén	qualquer pessoa	8	1	42
規規矩矩	guī guī jǔ jǔ	bem-comportado	1	1	11
破了	pò le	rompeu	1	1	45
鼻青臉腫	bí qīng liǎn zhǒng	nariz inchado e rosto machucado	1	1	21
拿出來	ná chū lái	tirar	1	1	21
尚	shàng	ainda	1	1	\N
一文不值	yī wén bù zhí	não valer um tostão	1	1	12
生死	shēng sǐ	vida ou morte	5	1	13
槍口	qiāng kǒu	mira da arma	1	1	13
局長	jú zhǎng	diretor	1	1	23
飛行員	fēi xíng yuán	piloto	2	1	12
飛機	fēi jī	avião	4	1	11
地點	dì diǎn	local	1	1	43
小子	xiǎo zi	garoto	12	1	35
不得	bù dé	não pode	20	1	42
聖母	shèng mǔ	santa mãe	9	1	43
架	jià	(classificador para aeronaves)	3	1	\N
馬查多·德·阿倫卡爾	mǎ chá duō · dé · ā lún kǎ ěr	Machado de Assis	1	1	32
被困	bèi kùn	estar preso/aprisionado	1	1	44
活捉	huó zhuō	capturar vivo	1	1	21
車窗	chē chuāng	janela do carro	1	1	11
撕裂	sī liè	rasgar	1	1	14
瑪利亞	mǎ lì yà	Maria	3	1	34
有素	yǒu sù	disciplinado	1	1	34
MARIA JOANA	MARIA JOANA	MARIA JOANA	1	1	55
佔據	zhàn jù	ocupar	2	1	44
淨化	jìng huà	purificação	1	1	44
末日	mò rì	fim do mundo	2	1	44
阿爾坎塔拉	ā ěr kǎn tǎ lā	Alcântara	1	1	13
槍械	qiāng xiè	arma de fogo	9	1	14
適當	shì dàng	apropriado	1	1	44
州長	zhōu zhǎng	governador	1	1	13
闖進	chuǎng jìn	invadir	1	1	34
哪些	nǎ xiē	quais	3	1	31
扳機	bān jī	gatilho	11	1	11
邪門	xié mén	estranho	1	1	22
巨大的	jùdě	enorme	6	1	\N
人世	rén shì	mundo	18	1	24
咕噥聲	gū nóng shēng	murmúrio	6	1	12
一節	yī jié	um vagão	1	1	12
之時	zhī shí	momento	2	1	12
舉起	jǔ qǐ	levantar	5	1	33
眾生	zhòng shēng	todos os seres vivos	18	1	41
之下	zhī xià	sob	3	1	14
死掉	sǐ diào	morrer	4	1	34
排隊	pái duì	fazer fila	2	1	24
奪走	duó zǒu	tirar	7	1	23
對待	duì dài	tratar	23	1	44
均	jūn	ambos	1	1	\N
組織	zǔ zhī	organização	22	1	31
暗	àn	escuro	1	1	\N
封	fēng	selado	4	1	\N
通道	tōng dào	passagem	1	1	14
南邊	nán biān	sul	1	1	21
哎喲	āi yō	ai	6	1	11
這下	zhè xià	agora	7	1	44
怎麼啦	zěn me la	O que houve	2	1	35
還沒	hái méi	ainda não	22	1	22
留情	liú qíng	ser misericordioso	1	1	22
馮加達	féng jiā dá	(transcrição fonética)	1	1	21
獲釋	huò shì	ser liberado	1	1	44
奧斯馬爾·布里佐拉	Ào sī mǎ ěr·Bù lǐ zuǒ lā	Osmar Brisola	1	1	41
亞索普羅	yà suǒ pǔ luó	Yasopro	1	1	43
前科	qián kē	antecedentes criminais	1	1	21
交換	jiāo huàn	trocar	12	1	14
搞不懂	gǎo bù dǒng	não entendo	7	1	34
額頭	é tóu	testa	1	1	22
談判	tán pàn	negociação	7	1	24
快來	kuài lái	vem rápido	2	1	42
人數	rén shù	número de pessoas	1	1	24
倒霉	dǎo méi	ter azar	1	1	32
警員	jǐng yuán	policial	1	1	32
螺旋槳	luó xuán jiǎng	hélice	7	1	22
產房	chǎn fáng	sala de parto	2	1	32
就醫	jiù yī	procurar atendimento médico	1	1	41
平面圖	píng miàn tú	planta baixa	1	1	24
好幾	hǎo jǐ	vários	1	1	33
走開	zǒu kāi	saia	5	1	31
茁壯	zhuó zhuàng	robusto	1	1	24
X光片	X guāng piàn	radiografia	1	1	51
掛靴	guà xuē	pendurar as chuteiras	1	1	41
突破	tū pò	romper	2	1	14
無邪	wú xié	inocentes	1	1	22
幸運地	xìng yùn de	felizmente	2	1	44
魔鬼	mó guǐ	diabo	4	1	23
報導	bào dǎo	reportagem	10	1	43
玻利維亞	bō lì wéi yà	Bolívia	1	1	14
陷阱	xiàn jǐng	armadilha	3	1	43
路上	lù shang	caminho	4	1	45
成長	chéng zhǎng	crescer	4	1	23
手下	shǒu xià	subordinados	4	1	34
露西安娜·赫費萊	lù xī ān nà · hè fèi lái	Luciana Heffel	1	1	41
履行	lǚ xíng	cumprir	8	1	32
狙擊手	jū jī shǒu	atirador de elite	1	1	11
B	bì	B	4	1	\N
橄欖	gǎn lǎn	azeitona	2	1	33
挑選	tiāo xuǎn	escolher	6	1	13
輪胎	lún tāi	pneu	8	1	21
暫時的	zàn shí de	temporário	1	1	42
案	àn	caso	7	1	\N
長官	zhǎng guān	oficial, chefe	5	1	31
告別	gào bié	despedida	5	1	42
一顆	yī kē	um (para objetos pequenos e redondos)	2	1	11
高抬	gāo tái	levantar alto	1	1	12
貴手	guì shǒu	sua mão preciosa	1	1	43
固執	gù zhí	teimosia	1	1	42
現場	xiàn chǎng	ao vivo	5	1	43
線	xiàn	linha	4	1	\N
輩子	bèi zi	vida	12	1	45
竊聽器	qiè tīng qì	grampo	1	1	41
刑罰	xíng fá	punição	1	1	22
聽到了	tīng dào le	ouviram	5	1	14
打滑	dǎ huá	derrapar	6	1	32
減輕	jiǎn qīng	reduzir	3	1	31
養育	yǎng yù	criação	7	1	34
賺取	zhuàn qǔ	ganhar	2	1	43
瞄準	miáo zhǔn	mirar	1	1	23
直升機	zhí shēng jī	helicóptero	7	1	21
冷卻	lěng què	esfriar	1	1	34
都搞定了	dōu gǎo dìng le	está tudo resolvido	1	1	13
確切	què qiè	exato	3	1	44
槍聲	qiāng shēng	som de tiro	12	1	11
隨他去吧	suí tā qù ba	deixe-o ir	1	1	21
穿過	chuān guò	atravessar	2	1	14
都乾淨了	dōu gān jìng le	está tudo limpo	1	1	11
協商	xié shāng	consultar	2	1	21
一張	yī zhāng	uma	9	1	11
祈禱	qí dǎo	rezar	19	1	23
手指	shǒu zhǐ	dedo	7	1	33
活下來	huó xià lái	sobreviver	2	1	24
C	sèi	C	2	1	\N
子彈	zǐ dàn	bala	14	1	34
拍	pāi	tirar	17	1	\N
戒	jiè	alerta	5	1	\N
右	yòu	direita	4	1	\N
BRIZOLA	BRIZOLA	Brizo	1	1	\N
派翠西亞	Pài cuì xī yà	Patrícia	9	1	44
趕時間	gǎn shí jiān	estar com pressa	6	1	32
奧瓦爾多	ào wǎ ěr duō	Owaldo	33	1	43
同班	tóng bān	mesma turma	4	1	21
堅持著	jiān chí zhe	persistindo	4	1	12
書呆子	shū dāi zi	nerd, cdf	4	1	11
瓶	píng	garrafa	11	1	\N
計程車	jì chéng chē	táxi	8	1	42
過敏	guò mǐn	alérgico	5	1	43
缺少	quē shǎo	faltar	11	1	13
充實	chōng shí	produtivo	4	1	12
帕切科	pà qiē kē	Pacheco	4	1	41
一度	yī dù	uma vez	4	1	14
驗孕棒	yàn yùn bàng	teste de gravidez	4	1	44
救護員	jiù hù yuán	socorrista	4	1	44
房租	fáng zū	aluguel	4	1	21
擺飾	bǎi shì	enfeite	4	1	34
辛苦	xīn kǔ	duro/difícil	13	1	13
接生	jiē shēng	parto	4	1	11
摳	kōu	chamar	4	1	\N
泡沫	pào mò	bolha	6	1	44
催產素	cuī chǎn sù	ocitocina	4	1	13
付了	fù le	paguei	4	1	45
桌上	zhuō shàng	sobre a mesa	4	1	14
陰性	yīn xìng	negativo	4	1	14
租金	zū jīn	aluguel	4	1	11
急需	jí xū	urgentemente necessário	10	1	21
嘴巴	zuǐ ba	boca	7	1	35
這個月	zhè ge yuè	este mês	4	1	45
休假	xiū jià	de férias	13	1	14
失言	shī yán	lapso de linguagem	4	1	12
比賽	bǐ sài	competição	11	1	34
喬安娜	qiáo ān nà	Joana	4	1	21
布料	bù liào	tecido	5	1	44
用藥	yòng yào	medicamento	4	1	44
老闆娘	lǎo bǎn niáng	patroa	13	1	33
到期	dào qī	expirar	6	1	41
逾期	yú qī	atrasado	4	1	21
格洛里亞	gé luò lǐ yà	Glória	4	1	24
點滴	diǎn dī	gota a gota	4	1	31
多年	duō nián	muitos anos	8	1	12
第一位	dì yī wèi	primeiro	4	1	41
護髮	hù fǎ	cuidado capilar	4	1	43
保養	bǎo yǎng	tratamento	8	1	33
電解質	diàn jiě zhì	eletrólito	4	1	43
馬格諾	mǎ gé nuò	Magno	4	1	32
長時間	cháng shí jiān	longo tempo	4	1	22
瓦爾迪內內	wǎ ěr dí nèi nèi	Valdinenei	4	1	33
塗抹	tú mǒ	aplicar	5	1	23
達利	dá lì	Dalí	5	1	24
歡樂	huān lè	alegria	5	1	14
回覆	huí fù	resposta	10	1	24
撞擊	zhuàng jī	impacto	6	1	41
木	mù	madeira	4	1	\N
紊亂	wěn luàn	desordem	4	1	34
含量	hán liàng	conteúdo	5	1	24
體重	tǐ zhòng	peso corporal	16	1	34
克里	kè lǐ	Chris	4	1	43
幸會	xìng huì	prazer em conhecê-la	7	1	44
張開	zhāng kāi	abrir	4	1	11
黯淡	àn dàn	escuro/sem brilho	4	1	44
營養不良	yíng yǎng bù liáng	desnutrição	4	1	23
打狗	dǎ gǒu	bater em cachorro	4	1	33
瓦爾迪雷內	Wǎ ěr dí léi nèi	Valdirene	-162	1	33
提取	tí qǔ	extrair	4	1	23
桌面	zhuō miàn	superfície da mesa	5	1	14
九	jiǔ	nove	16	1	\N
班	bān	Band	30	1	\N
庫	kù	depósito	7	1	\N
丹	dān	-an	5	1	\N
簾	lián	cortina	4	1	\N
輕	qīng	leve	40	1	\N
操	cāo	operar	4	1	\N
欠	qiàn	dever	11	1	\N
鉀	jiǎ	potássio	4	1	\N
恕	shù	perdoar	4	1	\N
停泊	tíng bó	atracado	3	1	22
蒼白	cāng bái	pálido	5	1	12
負面	fù miàn	negativo	3	1	44
別擔心	bié dān xīn	não se preocupe	4	1	21
念頭	niàn tóu	pensamento	14	1	42
自慰	zì wèi	masturbar	4	1	44
肝臟	gān zàng	fígado	3	1	14
鄰居	lín jū	vizinho	13	1	21
讓步	ràng bù	ceder	4	1	44
敬意	jìng yì	respeito	4	1	44
美人	měi rén	beleza	7	1	32
瓦爾迪雷妮	wǎ ěr dí léi nī	Valdirene	7	1	33
噁心	ě xīn	nojento	22	1	31
不可抗力	bù kě kàng lì	força maior	7	1	43
審議	shěn yì	deliberação	3	1	34
轉診	zhuǎn zhěn	transferir paciente	3	1	33
花草茶	huā cǎo chá	chá de ervas	8	1	13
乞討	qǐ tǎo	mendigar	4	1	33
婊子	biǎo zi	puta	3	1	35
自卑感	zì bēi gǎn	complexo de inferioridade	3	1	41
不相干	bù xiāng gān	irrelevante	4	1	41
就業	jiù yè	emprego	4	1	44
晚安	wǎn ān	boa noite	46	1	31
人性	rén xìng	natureza humana	3	1	24
長了	zhǎng le	tem	3	1	35
你在	nǐ zài	você está	4	1	34
輸掉	shū diào	perder	4	1	14
你還	nǐ hái	você ainda	3	1	32
第三場	dì sān chǎng	terceira partida	3	1	41
人文	rén wén	humanidades	3	1	22
走動	zǒu dòng	andar/circular	4	1	34
無論是	wú lùn shì	seja	4	1	24
響起	xiǎng qǐ	tocar	11	1	33
幸運	xìng yùn	sortudo	6	1	44
棒的	bàng de	incrível	3	1	45
假設	jiǎ shè	hipótese	6	1	34
綠帽臉	lǜ mào liǎn	rosto de corno	3	1	44
亂七八糟	luàn qī bā zāo	bagunçado	7	1	41
出問題	chū wèn tí	dar problema	4	1	14
抽血	chōu xiě	coletar sangue	3	1	13
拿開	ná kāi	tirar	10	1	21
盤點	pán diǎn	inventariar	3	1	23
帳單	zhàng dān	conta	13	1	41
行政	xíng zhèng	administrativo	4	1	24
做什麼	zuò shén me	fazendo o quê	7	1	42
老友	lǎo yǒu	velho amigo	3	1	33
送檢	sòng jiǎn	enviar para exame	3	1	43
帆船	fān chuán	veleiro	3	1	12
信得過	xìn dé guò	confiar	4	1	42
拜託了	bài tuō le	por favor	3	1	41
奧多西奧	ào duō xī ào	Audociao	11	1	41
自卑	zì bēi	inferioridade	3	1	41
非凡	fēi fán	extraordinário	4	1	12
真會	zhēn huì	realmente sabe	3	1	14
放輕鬆	fàng qīng sōng	relaxe	4	1	41
奧斯瓦多	ào sī wǎ duō	Osvaldo	3	1	41
塞繆爾	sāi mó ěr	Samuel	3	1	12
瓦拉達德	wǎ lā dá dé	Valadade	3	1	31
臉色	liǎn sè	aparência do rosto	7	1	34
沒事的	méi shì de	tudo bem	16	1	24
債務	zhài wù	dívida	26	1	44
天生的	tiān shēng de	natural	3	1	11
毛頭	máo tóu	cabeça de penugem / inexperiente	3	1	22
蕩婦	dàng fù	vagabunda	7	1	44
瓦爾德內爾	Wǎ ěr dé nèi ěr	Waldner	3	1	33
極少	jí shǎo	muito pouco	6	1	23
趕出去	gǎn chū qù	expulsar	4	1	31
嚴厲	yán lì	severo	5	1	24
找不到	zhǎo bù dào	não conseguir encontrar	3	1	34
嘟囔	dū nāng	resmungar	4	1	11
400	sì bǎi	400	3	1	43
泡	pào	preparar (chá/café)	25	1	\N
末期	mò qī	estágio final	3	1	41
自殺者	zì shā zhě	suicida	3	1	41
好兆頭	hǎo zhào tóu	bom presságio	4	1	34
照亮	zhào liàng	iluminar	3	1	44
收入	shōu rù	renda	10	1	14
黑	hēi	preto	13	1	\N
設備	shè bèi	equipamento	9	1	44
台	tái	unidade/medida para máquinas	10	1	\N
船	chuán	barco	7	1	\N
爹	diē	pai	3	1	\N
咧	lie	partícula modal	3	1	\N
甘蔗酒	gān zhe jiǔ	rum	5	1	15
埃爾尼尼	āi ěr ní ní	Elnini	3	1	13
請了	qǐng le	chamei	3	1	35
熬夜	áo yè	passar a noite em claro	3	1	24
這回	zhè huí	desta vez	3	1	42
概念	gài niàn	conceito	6	1	44
親手	qīn shǒu	pessoalmente	6	1	13
句點	jù diǎn	ponto final	4	1	43
最大	zuì dà	máximo	17	1	44
脈搏	mài bó	pulso	6	1	42
胃酸	wèi suān	ácido gástrico	3	1	41
別動	bié dòng	não se mexa	3	1	24
腸胃科醫生	cháng wèi kē yī shēng	gastroenterologista	3	1	24
軟腳蝦	ruǎn jiǎo xiā	pessoa fraca	3	1	33
毀掉	huǐ diào	destruir	5	1	34
一直以來	yī zhí yǐ lái	desde sempre	3	1	12
五十	wǔ shí	cinquenta	4	1	32
十足	shí zú	completo	13	1	22
牙齒	yá chǐ	dentes	3	1	23
火箭	huǒ jiàn	foguete	4	1	34
回報	huí bào	retorno	4	1	24
瓦爾迪內	wǎ ěr dí nèi	Valdine	3	1	33
24	èr shí sì	vinte e quatro	7	1	42
一堆	yī duī	um monte	5	1	11
洗手間	xǐ shǒu jiān	banheiro	4	1	33
印第安人	yìn dì ān rén	indígenas	3	1	44
嗶噗	bì pū	bip	12	1	41
神父	shén fù	padre	8	1	24
劃上	huà shàng	traçar	3	1	44
亢奮	kàng fèn	excitado	3	1	44
奧多	ào duō	Audo	3	1	41
瞳孔	tóng kǒng	pupila	5	1	23
夠嗆	gòu qiàng	insuportável/difícil de aguentar	5	1	44
同行	tóng xíng	caminhar juntos	22	1	22
暴食症	bào shí zhèng	transtorno de compulsão alimentar	3	1	42
心裡	xīn lǐ	no coração	7	1	13
問問	wèn wèn	perguntar	5	1	44
腎臟	shèn zàng	rins	3	1	44
預訂	yù dìng	reservar	3	1	44
下載	xià zǎi	baixar	4	1	43
腳下	jiǎo xià	sob os pés	6	1	34
50	wǔ shí	cinquenta	6	1	32
主持	zhǔ chí	presidir	4	1	32
心理治療師	xīn lǐ zhì liáo shī	psicoterapeuta	3	1	13
此外	cǐ wài	além disso	5	1	34
正義	zhèng yì	justiça	9	1	44
撞球	zhuàng qiú	bilhar	5	1	42
謝了	xiè le	obrigado	11	1	45
請假	qǐng jià	pedir licença	3	1	34
威力	wēi lì	poder	3	1	14
計數	jì shù	contagem	3	1	44
採集室	cǎi jí shì	sala de coleta	3	1	32
劑量	jì liàng	dose	4	1	44
藥片	yào piàn	comprimido	6	1	44
收到	shōu dào	receber	21	1	14
偉大	wěi dà	grande	22	1	34
公升	gōng shēng	litro	3	1	11
內視鏡	nèi shì jìng	endoscópio	3	1	44
輪班制	lún bān zhì	sistema de turnos	3	1	21
閃過	shǎn guò	passar rapidamente	3	1	34
之外	zhī wài	além	20	1	14
從事	cóng shì	engajar-se	4	1	24
安非他命	ān fēi tā mìng	anfetamina	3	1	11
放大	fàng dà	dilatada	41	1	44
不起來	bù qǐ lái	não conseguir (fazer algo)	3	1	43
卡拉穆魯	kǎ lā mù lǔ	Caramuru	3	1	31
疙瘩	gē da	nó/ranhura	4	1	15
沒用的	méi yòng de	inútil	14	1	24
馬桶	mǎ tǒng	vaso sanitário	3	1	33
生育	shēng yù	procriar	3	1	14
轉動	zhuǎn dòng	girando	5	1	34
小聲點	xiǎo shēng diǎn	mais baixo	8	1	31
貝爾福羅克索	bèi ěr fú luó kè suǒ	Belfour Roxo	3	1	43
好樣	hǎo yàng	bom exemplo	3	1	34
德德烏	Dé dé wū	Dedéu	3	1	22
純爺們	chún yé men	homem de verdade	3	1	22
病患	bìng huàn	paciente	8	1	44
微弱	wēi ruò	fraco	3	1	14
大腦	dà nǎo	cérebro	3	1	43
事後避孕	shì hòu bì yùn	contracepção de emergência	3	1	44
要不	yào bù	ou então	3	1	44
班上	bān shàng	na classe	5	1	14
誘惑	yòu huò	tentação	9	1	44
久等了	jiǔ děng le	esperou muito	3	1	33
一談	yī tán	conversar um pouco	4	1	12
為您	wèi nín	para você	4	1	42
寄	jì	enviar	33	1	\N
泰雅	Tài yǎ	Taia	3	1	43
歷過	lì guò	passar por	3	1	44
效勞	xiào láo	servir	5	1	42
50%	wǔ shí bǎi fēn bǐ	50%	3	1	32
盡頭	jìn tóu	fim	6	1	42
每天	měi tiān	todos os dias	22	1	31
顆	kē	unidade para comprimidos	30	1	\N
性能	xìng néng	desempenho	3	1	42
害死	hài sǐ	matar	4	1	43
餐桌	cān zhuō	mesa de jantar	4	1	11
可靠	kě kào	confiável	4	1	34
這項	zhè xiàng	este	9	1	44
腐蝕	fǔ shí	corroer	7	1	32
隔間	gé jiān	cubículo	4	1	21
營業	yíng yè	operação comercial	3	1	24
做不到	zuò bù dào	incapaz de fazer	11	1	44
你會	nǐ huì	você vai	4	1	34
瓦爾德內里	wǎ ěr dé nèi lǐ	Valdenere	3	1	33
拍桌	pāi zhuō	bater na mesa	4	1	11
穿孔	chuān kǒng	perfuração	3	1	13
碰巧	pèng qiǎo	por acaso	4	1	43
下了	xià le	fizemos	3	1	45
萬歲	wàn suì	viva	5	1	44
葬禮	zàng lǐ	funeral	5	1	43
貴公司	guì gōng sī	sua empresa	3	1	41
前程	qián chéng	futuro promissor	3	1	22
現實	xiàn shí	realidade	21	1	42
踩	cǎi	pisar	8	1	\N
暫停	zàn tíng	pausar	3	1	42
悶悶不樂	mèn mèn bú lè	desanimado/abatido	3	1	44
電腦	diàn nǎo	computador	5	1	43
本身	běn shēn	em si	51	1	31
不對勁	bù duì jìn	errado	7	1	44
身旁	shēn páng	ao lado	6	1	12
瓦爾德麗內	wǎ ěr dé lì nèi	Valdrine	3	1	33
船上	chuán shàng	no barco	3	1	24
不幹	bù gàn	não fazer	3	1	44
硬度	yìng dù	dureza	3	1	44
失禮了	shī lǐ le	desculpe a falta de educação	3	1	13
反駁	fǎn bó	refutar	3	1	32
黑暗	hēi àn	escuridão	9	1	14
工會	gōng huì	sindicato	3	1	14
才是	cái shì	somos exatamente	25	1	24
撇下	piē xià	abandonar	3	1	14
毛里	máo lǐ	Maoli	3	1	23
兆頭	zhào tóu	presságio	4	1	42
奧馬利	ào mǎ lì	O'Malley	3	1	43
球場	qiú chǎng	campo de esportes	3	1	23
賭注	dǔ zhù	aposta	3	1	34
巴庫里諾	bā kù lǐ nuò	Bakunino	3	1	14
開立	kāi lì	abrir	3	1	14
急診室	jí zhěn shì	pronto-socorro	6	1	23
我會	wǒ huì	eu vou	11	1	34
飲料	yǐn liào	bebida	17	1	34
潰瘍	kuì yáng	úlcera	3	1	42
基金	jī jīn	fundo	4	1	11
丟下	diū xià	abandonar	4	1	14
心扉	xīn fēi	coração/mente	16	1	11
不幸	bù xìng	infelizmente	9	1	44
瓦爾迪雷娜	wǎ ěr dí léi nà	Valdirene	3	1	33
蜘蛛	zhī zhū	aranha	3	1	11
彈藥	dàn yào	munição	3	1	44
垂聽	chuí tīng	ouvir	3	1	21
你得	nǐ dé	você deve	4	1	32
精子庫	jīng zǐ kù	banco de esperma	3	1	13
天哪	tiān nǎ	oh meu Deus	29	1	13
男子漢	nán zǐ hàn	homem de verdade	27	1	23
牙釉質	yá yòu zhí	esmalte dentário	3	1	24
胃腸科	wèi cháng kē	gastroenterologia	3	1	42
方面	fāng miàn	aspectos	20	1	14
聽過	tīng guò	ouvi	7	1	14
旅遊	lǚ yóu	viagem	4	1	32
低落	dī luò	baixo	4	1	14
光芒	guāng máng	brilho	8	1	12
名義	míng yì	nome	8	1	24
永恆	yǒng héng	eterno	13	1	32
報告	bào gào	relatório	15	1	44
一代	yī dài	geração	3	1	14
尼洛	ní luò	Nilo	16	1	24
事後避孕藥	shì hòu bì yùn yào	pílula do dia seguinte	7	1	44
域	yù	área	4	1	\N
空蕩蕩	kōng dàng dàng	vazio	3	1	14
填滿	tián mǎn	preencher	4	1	23
斷層掃描儀	duàn céng sǎo miáo yí	tomógrafo	3	1	42
著急	zháo jí	ansioso	7	1	22
厭惡	yàn wù	aversão	7	1	44
陽痿	yáng wěi	impotência	5	1	23
執迷不悟	zhí mí bù wù	teimoso/obstinado	3	1	22
羊肉	yáng ròu	carne de carneiro	3	1	24
賺	zhuàn	ganhar	44	1	\N
最新	zuì xīn	mais recente	7	1	41
解脫	jiě tuō	libertar-se	6	1	31
泰	tài	Thai	5	1	\N
吸	xī	fumar	5	1	\N
串	chuàn	espeto	3	1	\N
熬	áo	aguentar	4	1	\N
菊花	jú huā	crisântemo	1	1	21
的故事	de gù shì	história	1	1	54
窗簾	chuāng lián	cortinas	1	1	12
喝酒	hē jiǔ	beber	6	1	13
小聚	xiǎo jù	pequeno encontro	2	1	34
當作	dàng zuò	considerar como	1	1	44
沒有用	méi yǒu yòng	não adianta	3	1	23
也沒有用	yě méi yǒu yòng	também não adianta	3	1	32
聊了	liáo le	conversamos	3	1	25
每週	měi zhōu	toda semana	4	1	31
營養師	yíng yǎng shī	nutricionista	3	1	23
大卡	dà kǎ	quilocaloria	3	1	43
兩千	liǎng qiān	dois mil	7	1	31
卡路里	kǎ lù lǐ	caloria	3	1	34
蜘蛛網	zhī zhū wǎng	teia de aranha	3	1	11
影響力	yǐng xiǎng lì	influência	5	1	33
更是	gèng shì	ainda mais	4	1	44
70%	qī shí bǎi fēn bǐ	setenta por cento	3	1	12
絕望	jué wàng	desespero	7	1	24
暈頭轉向	yūn tóu zhuǎn xiàng	tonto/confuso	3	1	12
無用	wú yòng	inútil	3	1	24
同感	tóng gǎn	mesma sensação	3	1	23
弱點	ruò diǎn	fraqueza	3	1	43
了不起了	liǎo bù qǐ le	incrível	3	1	34
諾亞諾亞	nuò yà nuò yà	Noa Noa	3	1	44
大溪地	dà xī dì	Taiti	3	1	41
帕果帕果	pà guǒ pà guǒ	Pago Pago	3	1	43
南太平洋	nán tài píng yáng	Pacífico Sul	3	1	24
工作狂	gōng zuò kuáng	workaholic	3	1	14
樂趣	lè qù	prazeres	7	1	44
英國人	yīng guó rén	britânico	3	1	12
正如	zhèng rú	exatamente como	19	1	42
D日	D rì	Dia D	3	1	54
所說	suǒ shuō	dizer	10	1	31
H時	H shí	Hora H	3	1	52
今晚	jīn wǎn	esta noite	18	1	13
煙火	yān huǒ	fogos de artifício	5	1	13
天大的	tiān dà de	enorme	5	1	14
好消息	hǎo xiāo xī	boa notícia	4	1	31
孤獨	gū dú	solidão	12	1	12
認得	rèn dé	reconhecer	6	1	42
睿智	ruì zhì	sábia	18	1	44
自責	zì zé	culpar-se	12	1	42
某些	mǒu xiē	certos	13	1	31
運作	yùn zuò	funcionar	6	1	44
耳光	ěr guāng	tapa na cara	1	1	31
挨	ái	levar	3	1	\N
令人驚訝	lìng rén jīng yà	surpreendentemente	0	1	42
弄到	nòng dào	conseguir	0	1	44
伶俐	líng lì	esperto	0	1	24
學學	xué xué	aprenda com	0	1	22
控制權	kòng zhì quán	controle	0	1	44
辨認出	biàn rèn chū	identificar	0	1	44
獨立日	dú lì rì	dia da independência	0	1	24
愛意	ài yì	amor	1	1	44
寵壞	chǒng huài	mimar demais	0	1	34
等著瞧	děng zhe qiáo	espere para ver	0	1	35
卡斯蒂略	kǎ sī dì lüè	Castillo	7	1	31
自我介紹	zì wǒ jiè shào	me apresentei	0	1	43
70	qī shí	setenta	0	1	12
公證處	gōng zhèng chù	cartório	3	1	14
拉莫斯	lā mò sī	Ramos	1	1	14
妳好嗎	nǐ hǎo ma	como você está	0	1	33
只需	zhǐ xū	apenas	2	1	31
可不是	kě bú shì	não é mesmo	8	1	32
氣色	qì sè	aparência	0	1	44
捐贈者	juān zèng zhě	doador	0	1	14
小心心	xiǎo xīn xīn	coraçãozinho	0	1	31
顺利	shùn lì	suave	0	1	44
靠着	kào zhe	contando com	0	1	45
圣乔治	shèng qiáo zhì	São Jorge	0	1	42
出生地	chū shēng dì	local de nascimento	0	1	11
獨處	dú chǔ	ficar sozinho	1	1	23
取決	qǔ jué	depender	3	1	32
奧斯瓦爾多先生	Ào sī wǎ ěr duō xiān shēng	Senhor Osvaldo	3	1	41
猜到	cāi dào	adivinhar	1	1	14
恩典	ēn diǎn	graça	45	1	13
瑪達	Mǎ dá	Mada	-63	1	32
妥當	tuǒ dàng	resolvido	6	1	34
即可	jí kě	então	2	1	23
拜訪	bài fǎng	visita	3	1	43
掌握	zhǎng wò	controlar	22	1	34
咱們	zán men	nós	4	1	25
自來水	zì lái shuǐ	água encanada	27	2	42
常常	cháng cháng	frequentemente	1	1	22
諾薩太太	Nuò sà tài tai	Senhora Nosa	2	1	44
簽名	qiān míng	assinatura	8	1	12
傑森	jié sēn	Jason	18	1	21
賭場	dǔ chǎng	cassino	3	1	33
紫羅蘭	zǐ luó lán	violeta	64	1	32
朵	duǒ	(classificador para flores)	3	1	\N
維奧萊塔	wéi ào lái tǎ	Violeta	-62	1	24
有點	yǒu diǎn	um pouco	116	2	33
一番	yī fān	uma vez	5	1	11
是的	shì de	sim	251	3	45
也是	yě shì	também	46	3	34
若昂	Ruò áng	João	-52	1	42
合同	hé tóng	contrato	5	1	22
祂	tā	Ele	2	1	\N
財產	cáichǎn	propriedade	7	1	\N
餓	è	fome	5	1	\N
對峙	duì zhì	confronto	0	1	44
回音	huí yīn	eco	48	1	21
檸檬草	níng méng cǎo	capim-limão	0	1	22
羅浮宮	luó fú gōng	Louvre	0	1	22
不愧	bù kuì	digno de	0	1	44
乖乖	guāi guāi	obediente	4	1	11
不放	bù fàng	não parar	0	1	44
貝爾納多	bèi ěr nà duō	Bernardo	3	1	43
博物館	bó wù guǎn	museu	1	1	24
聯盟	lián méng	aliança	0	1	22
孕期	yùn qī	gravidez	0	1	41
漩渦	xuán wō	redemoinho	0	1	21
手裡	shǒu lǐ	na mão	1	1	33
沉淪	chén lún	afundar	0	1	22
希薇妮雅	Xī wēi ní yǎ	Silvania	0	1	11
嘟嘴	dū zuǐ	beicinho	0	1	13
心底	xīn dǐ	fundo do coração	0	1	13
兩國	liǎng guó	dois países	0	1	32
新奇的是	xīn qí de shì	O que é novidade é	0	1	12
新手	xīn shǒu	novato	0	1	13
氣人	qì rén	irritante	0	1	42
慢慢來	màn màn lái	vá devagar	7	1	44
來得正好	lái dé zhèng hǎo	Chegou na hora certa	0	1	22
邪惡	xié è	mal	1	1	24
紐薩	niǔ sà	Nova	11	1	34
放馬	fàng mǎ	soltar o cavalo	0	1	43
不安	bù ān	inquieto	6	1	41
偏偏	piān piān	justamente	4	1	11
訊息	xùn xī	mensagem	15	1	41
家鄉	jiā xiāng	terra natal	0	1	11
前鋒	qián fēng	atacante	0	1	21
送來	sòng lái	enviado	0	1	42
美食	měi shí	comida deliciosa	3	1	32
羅多福	Luó duō fú	Rodolfo	11	1	21
房客	fáng kè	hóspede	0	1	24
離去	lí qù	partida	2	1	24
本地	běn dì	locais	0	1	34
登記處	dēng jì chù	cartório	2	1	14
咖啡廳	kā fēi tīng	cafeteria	0	1	11
貝納多	bèi nà duō	Bernardo	3	1	44
說啊	shuō a	fala	0	1	15
普雷塔	pǔ léi tǎ	Preta	0	1	32
蕾娜塔	Lěi nà tǎ	Renata	0	1	34
瑪格麗塔	mǎ gé lì tǎ	Margarita	0	1	32
藝術家	yì shù jiā	artistas	3	1	44
訂了	dìng le	reservado	0	1	45
脂肪囊	zhī fáng náng	bolsas de gordura	0	1	12
針頭	zhēn tóu	agulha	0	1	12
飯局	fàn jú	jantar social	0	1	42
燒灼器	shāo zhuó qì	cauterizador	0	1	12
應酬	yìng chóu	socializar	0	1	42
自找	zì zhǎo	procurando	0	1	43
比佛利山莊	Bǐ fó lì shān zhuāng	Beverly Hills	0	1	32
巴西人	bā xī rén	brasileiro	2	1	11
源自	yuán zì	originado de	2	1	24
想想	xiǎng xiǎng	pensar	13	1	33
求婚	qiú hūn	pedir em casamento	6	1	21
對不對	duì bù duì	certo ou não	3	1	44
向我	xiàng wǒ	para mim	1	1	43
麵包	miàn bāo	pão	20	1	41
狂歡節	kuáng huān jié	carnaval	30	1	21
貝麗莎	Bèi lì shā	Belisa	19	1	44
模特兒	mó tè ér	modelo	1	1	24
吉吉	jí jí	Jiji	14	1	22
狂歡	kuáng huān	festa	4	1	21
安全感	ān quán gǎn	sensação de segurança	2	1	12
球員	qiú yuán	jogador	1	1	22
番茄	fān qié	tomate	2	1	12
壓抑	yā yì	reprimir	4	1	14
琪琪	qí qí	Qiqi	5	1	22
拒絕	jù jué	recusar	7	1	42
老天	lǎo tiān	céus	3	1	31
艾迪琳	ài dí lín	Adeline	3	1	42
埃迪萊內	āi dí lái nèi	Edilene	3	1	12
艾德森	ài dé sēn	Edson	48	1	42
伯納多	bó nà duō	Bernardo	26	1	24
由紀	yóu jì	Yuki	8	1	24
CACÁ	CACÁ	CACÁ	4	1	\N
SIDNEY	SIDNEY	Sidney	6	1	\N
新鮮	xīn xiān	fresco	5	1	11
打擊	dǎ jī	golpe	9	1	31
盧卡斯	Lú kǎ sī	Lucas	11	1	23
有生之年	yǒu shēng zhī nián	durante a vida	0	1	31
立下	lì xià	fazer	2	1	44
一筆債	yī bǐ zhài	uma dívida	0	1	13
現成	xiàn chéng	pronto	0	1	42
攪亂	jiǎo luàn	agitar	0	1	34
剪輯島	jiǎn jí dǎo	Ilha da Edição	0	1	32
情侶	qíng lǚ	casal	1	1	23
站出來	zhàn chū lái	dar um passo à frente	0	1	41
這些年來	zhè xiē nián lái	todos esses anos	0	1	41
高檔貨	gāo dàng huò	produtos de alta qualidade	0	1	14
套餐	tào cān	pacote	0	1	41
創意	chuàng yì	criatividade	0	1	44
上線了	shàng xiàn le	Está online	0	1	44
說好	shuō hǎo	combinado	0	1	13
一輪	yī lún	uma rodada	0	1	12
趟	tàng	vez	6	1	\N
遇襲	yù xí	ser atacado	0	1	42
正視	zhèng shì	encarar	0	1	44
深受	shēn shòu	profundamente afetado	0	1	14
兩樣	liǎng yàng	Dois tipos	0	1	34
剛出爐	gāng chū lú	Acabados de sair do forno	0	1	11
厭	yàn	detestar	13	1	\N
另一回事	lìng yī huí shì	outra questão	0	1	41
明知道	míng zhī dào	sabe muito bem	0	1	21
淚水	lèi shuǐ	lágrimas	1	1	43
心坎	xīn kǎn	fundo do coração	0	1	13
肝	gān	fígado	0	1	\N
CIDOCA	CIDOCA	CIDOCA	0	1	\N
瑪達肋納	mǎ dá lèi nà	Madalena	2	1	32
殺死	shā sǐ	matar	4	1	13
尤其是	yóu qí shì	especialmente	0	1	22
某種	mǒu zhǒng	algum tipo	7	1	33
抱有	bào yǒu	manter	1	1	43
無可救藥	wú kě jiù yào	irremediável	1	1	23
談成	tán chéng	negociar com sucesso	0	1	22
相異	xiāng yì	diferentes	0	1	14
胸膛	xiōng táng	peito	0	1	12
沒看過	méi kàn guò	não vi	0	1	24
敏智	mǐn zhì	Minji	18	1	34
眼光	yǎn guāng	olhar, perspectiva	38	1	31
羅德福	luó dé fú	Roderick	0	1	22
令下	lìng xià	dar ordem	0	1	44
形式	xíng shì	forma	5	1	24
出爐	chū lú	sair do forno	2	1	12
結構	jié gòu	estrutura	2	1	24
盧金哈斯	Lú jīn hā sī	Lú jīn hā sī	1	1	21
聽說	tīng shuō	ouvir dizer	16	1	11
結論	jié lùn	conclusão	1	1	24
不只是	bù zhǐ shì	não apenas	5	1	43
塔蒂亞娜	tǎ dì yà nà	Tatiana	6	1	34
西爾維婭	Xī ěr wéi yǎ	Silvia	6	1	13
眼神	yǎn shén	olhar	1	1	32
諾伊莎	Nuò yī shā	Noisa	1	1	41
看待	kàn dài	ver, considerar	1	1	44
原本	yuán běn	originalmente	6	1	23
一刻	yī kè	momento	13	1	14
剪輯	jiǎn jí	editando	2	1	32
裁縫師	cái féng shī	alfaiate	2	1	22
阿爾貝托	Ā'ěrbèituō	Alberto	41	1	\N
掌聲	zhǎng shēng	aplausos	7	1	31
孫子	sūn zi	neto	45	1	15
復	fù	novamente	5	1	\N
獲得	huò dé	obter	7	1	42
忠誠	zhōng chéng	leal	9	1	12
不用說	bú yòng shuō	sem mencionar	1	1	24
密碼	mì mǎ	senhas	6	1	43
零分	líng fēn	nota zero	2	1	21
塔蒂安娜	tǎ dì ān nà	Tatiana	20	1	34
意識到	yì shí dào	perceber	6	1	42
類固醇	lèi gù chún	esteroides	1	1	44
瑪達萊娜	mǎ dá lái nà	Madalena	-68	1	32
羅克塞爾	luó kè sāi ěr	Roxell	27	1	24
道允	dào yǔn	Daoyun	3	1	43
再來	zài lái	mais uma vez	3	1	42
魅力	mèi lì	charme	6	1	44
帳目	zhàng mù	contas	1	1	44
阿強	ā qiáng	A-Qiang	2	1	12
觸動	chù dòng	comovido	3	1	44
三個	sān gè	três	15	1	14
巴士	bā shì	ônibus	3	1	14
哭了	kū le	chore	1	1	15
羅道夫	Luō dào fū	Rodolfo	21	1	14
標記	biāo jì	marcar	4	1	14
南多	nán duō	Nando	28	1	21
身份	shēn fèn	identidade	10	1	14
義	yì	sentido	165	1	\N
娶	qǔ	casar com	3	1	\N
含	hán	conter	9	1	\N
……	……	reticências	1	1	\N
日	rì	dia	60	3	\N
凝聚	níng jù	condensar	0	1	24
極限	jí xiàn	limite	0	1	24
工作量	gōng zuò liàng	carga de trabalho	0	1	14
存活	cún huó	sobreviver	2	1	22
時隔	shí gé	depois de tanto tempo	0	1	22
馬蒂亞斯	mǎ dì yà sī	Matthias	26	1	34
眉來眼去	méi lái yǎn qù	flertando	0	1	22
停了	tíng le	parar	0	1	25
圍	wéi	cercar	12	1	\N
所犯	suǒ fàn	cometido	0	1	34
小聰明	xiǎo cōng míng	esperteza	0	1	31
調和	tiáo hé	harmonizar	0	1	22
紀錄片	jì lù piàn	documentário	7	1	44
發洩	fā xiè	desabafar	0	1	14
怒氣	nù qì	raiva	0	1	44
彆扭	biè niǔ	desconforto/contrariedade	0	1	43
迷戀	mí liàn	obcecado	0	1	24
潑婦	pō fù	mulher mal-humorada	0	1	14
毫	háo	mínimo	2	1	\N
罵街	mà jiē	brigar em público	0	1	41
場景	chǎng jǐng	cenas	1	1	33
好意	hǎo yì	gentileza	1	1	34
共同點	gòng tóng diǎn	pontos em comum	1	1	42
好幾家	hǎo jǐ jiā	várias	0	1	33
一輩子	yī bèi zi	a vida toda	7	1	14
閨蜜	guī mì	melhor amiga	1	1	14
例如	lì rú	por exemplo	8	1	42
喬伊夫人	qiáo yī fū rén	Senhora Joyce	0	1	21
公車	gōng chē	ônibus	4	1	11
結清	jié qīng	quitar	0	1	21
多餘	duō yú	desnecessário	0	1	12
指望	zhǐ wàng	contar com	4	1	34
顯而易見	xiǎn ér yì jiàn	óbvia	0	1	32
急性子	jí xìng zi	impaciente	0	1	24
說吧	shuō ba	fale	4	1	15
朋友們	péng yǒu men	amigos	3	1	23
喬恩	qiáo ēn	Jon	1	1	21
旅行社	lǚ xíng shè	agência de viagens	5	1	32
微妙	wēi miào	sutil	1	1	14
YUKI	YUKI	YUKI	5	1	\N
我想	wǒ xiǎng	eu acho	1	1	33
龍	lóng	dragão	26	1	\N
西爾維娜	xī ěr wéi nà	Silvina	5	1	13
戲劇性	xì jù xìng	dramático	3	1	44
父子	fù zǐ	pai e filho	2	1	43
複習	fù xí	revisar	1	1	42
小吃店	xiǎo chī diàn	lanchonete	3	1	31
相愛	xiāng ài	se amam	4	1	14
壓根兒	yā gēn er	de jeito nenhum	1	1	11
造型	zào xíng	visual/aparência	1	1	42
進展	jìn zhǎn	progresso	8	1	43
敲門聲	qiāo mén shēng	som de batida na porta	14	1	12
境地	jìng dì	situação	0	1	44
勝利	shèng lì	vitória	7	1	44
同理心	tóng lǐ xīn	empatia	1	1	23
陷入	xiàn rù	cair em	35	1	44
你自己	nǐ zì jǐ	você mesmo	9	1	34
希達	xī dá	Doralice	15	1	12
太棒	tài bàng	fantástico	7	1	44
情感	qíng gǎn	emoção	9	1	23
郊區	jiāo qū	subúrbio	32	1	11
關愛	guān ài	cuidado amoroso	7	1	14
格爾森	gé ěr sēn	Gelsen	6	1	23
Gigi	Gigi	Gigi	13	1	\N
會面	huì miàn	reunião	5	1	44
婚姻	hūn yīn	casamento	16	1	11
可能性	kě néng xìng	possibilidade	6	1	32
迷路	mí lù	perder-se	4	1	24
電視	diàn shì	televisão	41	1	44
聯繫	lián xì	conexão	21	1	24
欲	yù	desejo	43	1	\N
年度	nián dù	anual	0	1	24
盛事	shèng shì	grande evento	0	1	44
放進去	fàng jìn qù	colocar dentro	0	1	44
不已	bù yǐ	sem parar	0	1	43
文章	wén zhāng	artigo	5	1	21
問好	wèn hǎo	cumprimentar	0	1	43
說定了	shuō dìng le	combinado	3	1	14
探望	tàn wàng	visitar	7	1	44
祖先	zǔ xiān	ancestrais	0	1	31
演藝圈	yǎn yì quān	círculo artístico	1	1	34
規劃	guī huà	planejar	26	1	14
必要時	bì yào shí	quando necessário	0	1	44
學院	xué yuàn	faculdade	0	1	24
席爾維亞	Xí ěr wéi yà	Silvia	4	1	23
大樓	dà lóu	edifício	4	1	42
而起的	ér qǐ de	que surgiu	0	1	23
來訪	lái fǎng	visita	1	1	23
強哥	qiáng gē	Strong (apelido)	0	1	21
好心腸	hǎo xīn cháng	bom coração	0	1	31
矮子	ǎi zi	anão	0	1	35
壯	zhuàng	Zhuang	0	1	\N
四射	sì shè	irradiando	0	1	44
用完	yòng wán	acabar de usar	1	1	42
互補	hù bǔ	complementares	0	1	43
演	yǎn	atuar	2	1	\N
首	shǒu	classificador para canções	34	1	\N
棒極了	bàng jí le	excelente	0	1	42
餘額	yú é	saldo	0	1	22
讀過	dú guò	li	0	1	24
載歌載舞	zài gē zài wǔ	cantando e dançando	0	1	41
代理機構	dài lǐ jī gòu	agência	0	1	43
672128	liù qī èr yī èr bā	672128	0	1	41
狄	dí	Di	4	1	\N
28	èr shí bā	vinte e oito	0	1	42
-真	zhēn	verdadeiro	0	1	\N
情結	qíng jié	complexo	1	1	22
訂下	dìng xià	marcar	0	1	44
母子	mǔ zǐ	mãe e filho	0	1	33
心理學家	xīn lǐ xué jiā	psicólogo	1	1	13
接手	jiē shǒu	assumir	1	1	13
無足輕重	wú zú qīng zhòng	insignificante	1	1	22
所在	suǒ zài	localização	5	1	34
-	-	-	11	1	\N
一家人	yī jiā rén	família	3	1	11
高雅	gāo yǎ	elegante	1	1	13
新人	xīn rén	recém-casados	1	1	12
糾紛	jiū fēn	disputa	1	1	11
榜樣	bǎng yàng	exemplo	5	1	34
好久	hǎo jiǔ	muito tempo	3	1	33
糟透了	zāo tòu le	terrível	10	1	14
力氣	lì qì	força	1	1	44
成了	chéng le	tornar-se	4	1	25
結婚了	jié hūn le	casou-se	1	1	21
掌管	zhǎng guǎn	administrar	1	1	33
一副	yī fù	um par	1	1	14
海梅	hǎi méi	Jaime	2	1	32
焦點	jiāo diǎn	ponto central	1	1	13
野蠻人	yě mán rén	bárbaro	6	1	32
客人	kè rén	convidado	7	1	42
歌迷	gē mí	fã	1	1	12
新娘	xīn niáng	noiva	4	1	12
叫做	jiào zuò	chamado	1	1	44
不相信	bù xiāng xìn	não acredito	0	1	41
不見了	bù jiàn le	não ver	1	1	44
蒂茹卡	dì rú kǎ	Tijuca	3	1	42
那個人	nà ge rén	aquela pessoa	3	1	45
曲子	qǔ zi	melodia	1	1	35
旅館	lǚ guǎn	hotel	3	1	33
席爾瓦	xí ěr wǎ	Silva	3	1	23
韓國	hán guó	Coreia	3	1	22
來看	lái kàn	do ponto de vista	2	1	24
纏著	chán zhe	importunar	5	1	25
作家	zuò jiā	escritor/escritora	0	1	41
結合	jié hé	unir	1	1	22
做完	zuò wán	terminei	1	1	42
多虧	duō kuī	graças a	2	1	11
婚期	hūn qī	data do casamento	0	1	11
西爾維尼婭	Xī ěr wéi ní yǎ	Silvínia	6	1	13
席維尼亞	Xí wéi ní yà	Sivinia	11	1	22
管好	guǎn hǎo	cuidar bem	1	1	33
韓劇	hán jù	drama coreano	6	1	24
有錢	yǒu qián	rico	1	1	32
全力	quán lì	total	2	1	24
長得	zhǎng dé	crescer	1	1	32
角度	jiǎo dù	perspectiva	2	1	34
你知道嗎	nǐ zhī dào ma	você sabia	5	1	31
泰瑞莎	Tài ruì shā	Teresa	16	1	44
哇塞	wā sāi	uau	2	1	11
施加	shī jiā	exercer	4	1	11
中國	zhōng guó	China	2	1	12
兩人	liǎng rén	duas pessoas	4	1	32
天才	tiān cái	gênio	11	1	12
絕佳	jué jiā	excelente	3	1	21
蜜月	mì yuè	lua de mel	7	1	44
吸收	xī shōu	absorver	2	1	11
重返	chóng fǎn	retornar	7	1	23
林	lín	floresta	10	1	\N
歌舞	gē wǔ	canto e dança	0	1	13
搗鬼	dǎo guǐ	pregar peças	0	1	33
夜鶯	yè yīng	Rouxinol	1	1	41
疤痕	bā hén	cicatriz	0	1	12
海倫	Hǎilún	Helen	14	1	\N
主演	zhǔ yǎn	atua como protagonista	1	1	33
很早	hěn zǎo	muito cedo	0	1	33
.	.	.	0	1	\N
-他	tā	ele	0	1	\N
維安	wéi ān	Weian	0	1	21
甜蜜	tián mì	doce	3	1	24
謙虛	qiān xū	ser humilde	0	1	11
夏普	Xiàpǔ	Sharp	3	1	\N
姑媽	gū mā	tia	0	1	11
十八	shí bā	dezoito	0	1	21
孟	mèng	(parte do nome)	8	1	\N
晚會	wǎn huì	festa noturna	1	1	34
血漿	xuè jiāng	plasma	0	1	41
磨光	mó guāng	polir	1	1	21
假人	jiǎ rén	manequim	0	1	32
顏料	yán liào	pigmento	13	1	24
造訪者	zào fǎng zhě	visitante	0	1	43
煩透	fán tòu	extremamente incomodado	0	1	24
整容	zhěng róng	cirurgia plástica	0	1	32
肌理	jī lǐ	textura da pele	0	1	13
雇	gù	contratou	0	1	\N
頰骨	jiá gǔ	maçãs do rosto	0	1	23
打招呼	dǎ zhāo hū	cumprimentar	0	1	31
顯出來	xiǎn chū lái	aparecer	0	1	31
極為	jí wéi	extremamente	3	1	22
出席	chū xí	comparecer	1	1	12
講過	jiǎng guò	falou	1	1	34
版	bǎn	versão	1	1	\N
千萬	qiān wàn	absolutamente	5	1	14
-我給你	-wǒ gěi nǐ	-Eu te dou...	0	1	33
房東	fáng dōng	proprietário	0	1	21
埋葬	mái zàng	enterrar	0	1	24
稍候	shāo hòu	aguardar um momento	0	1	14
過獎	guò jiǎng	exagerar elogios	0	1	43
絕妙	jué miào	absolutamente maravilhoso	1	1	24
美狄	měi dí	Meidi	1	1	32
孟維	mèng wéi	Meng Wei	8	1	42
門票	mén piào	ingresso	1	1	24
愛尼	ài ní	Aini	24	1	42
噴漆	pēn qī	tinta spray	0	1	11
五金店	wǔ jīn diàn	loja de ferragens	1	1	31
平常	píng cháng	comum	1	1	22
腳步	jiǎo bù	passos	1	1	34
紐瓦克	niǔ wǎ kè	Newark	0	1	33
驅逐	qū zhú	expulsão	1	1	12
12	shí èr	doze	2	1	24
年歲	nián suì	idade	0	1	24
一群	yī qún	um grupo	6	1	12
演出	yǎnchū	apresentação	3	1	\N
秘訣	mì jué	segredo	4	1	42
具有	jù yǒu	possuir	2	1	43
漆	qī	tinta	2	1	\N
曼	màn	gracioso	1	1	\N
合適	hé shì	apropriado	4	1	24
出面	chū miàn	aparecer	1	1	14
死人	sǐ rén	pessoa morta	2	1	32
毛孔	máo kǒng	poros	0	1	23
調	tiáo	ajustar	2	1	\N
追隨	zhuī suí	seguir	17	1	12
謹慎	jǐn shèn	cauteloso	4	1	34
書名	shū míng	título do livro	0	1	12
感興趣	gǎn xìng qù	interessado	11	1	34
癡肥	chī féi	obeso	0	1	12
多大	duō dà	quantos anos	5	1	14
座次	zuò cì	lugares/assentos	0	1	44
床鋪	chuáng pù	cama	0	1	24
海獺	hǎi tǎ	lontra marinha	0	1	33
牠們	tā men	eles/elas (animais)	0	1	15
囓齒類	niè chǐ lèi	roedor	0	1	43
快些	kuài xiē	mais rápido	0	1	41
磨碎	mó suì	triturar	0	1	24
注入	zhù rù	injetar	0	1	44
臭事	chòu shì	coisas fedorentas/desagradáveis	0	1	44
傳呼機	chuán hū jī	pager	0	1	21
響過	xiǎng guò	tocou	0	1	34
佛蘭克	Fó lán kè	Frank	0	1	22
解雇	jiě gù	demitir	2	1	34
古巴	gǔ bā	cubano	0	1	31
歪歪	wāi wāi	torto/torto	0	1	11
遺容	yí róng	aparência póstuma	0	1	22
突發奇想	tū fā qí xiǎng	ter uma ideia repentina	0	1	11
最美麗	zuì měi lì	mais bonito	3	1	43
分離術	fēn lí shù	aférese	0	1	12
損傷	sǔn shāng	danificar	0	1	31
施術	shī shù	procedimento	0	1	14
間隔	jiàn gé	intervalo	0	1	42
少於	shǎo yú	menos de	0	1	32
纖維蛋白	xiān wéi dàn bái	fibra de proteína	1	1	12
誇獎	kuā jiǎng	elogio	1	1	13
晚上好	wǎn shàng hǎo	boa noite	4	1	34
膚色	fū sè	tom de pele	1	1	14
殯儀員	bìn yí yuán	agente funerário	1	1	42
-你給我	-nǐ gěi wǒ	-Você me dá	0	1	33
我給你	wǒ gěi nǐ	eu te dou	0	1	33
滑稽	huá jī	ridículo	0	1	21
愛頓	Ài dùn	Edon	12	1	44
銀幕	yín mù	tela	0	1	24
美狄蘭	Měi dí lán	Madeleine	29	1	32
偷聽	tōu tīng	escutar escondido	0	1	11
路曼	lù màn	Luman	0	1	44
走向	zǒu xiàng	caminhar em direção a	1	1	34
化妝品	huà zhuāng pǐn	maquiagem	3	1	41
眼瞼	yǎn jiǎn	pálpebra	2	1	33
只不過是	zhǐ bù guò shì	apenas/somente	0	1	34
奪過	duó guò	tomou	0	1	24
-你	nǐ	você	0	1	\N
艷光四射	yàn guāng sì shè	deslumbrante	0	1	41
長生不老	cháng shēng bù lǎo	imortalidade	2	1	21
俘擄	fú lǔ	capturados	0	1	23
泳	yǒng	natação	7	1	\N
破門	pò mén	arrombar a porta	0	1	42
破門而入	pò mén ér rù	arrombar a porta e entrar	0	1	42
伸	shēn	estender	1	1	\N
抹掉	mǒ diào	apagar	0	1	34
不如	bù rú	não é tão bom quanto	4	1	42
磅	bàng	libra	1	1	\N
快遞	kuài dì	entrega expressa	0	1	44
星期四	xīng qī sì	quinta-feira	0	1	11
梵	fàn	Van	1	1	\N
高級	gāo jí	alto nível	2	1	12
額外	é wài	extra	1	1	24
偶像	ǒu xiàng	ídolo	3	1	34
一早	yī zǎo	cedo	0	1	13
延	yán	estender	2	1	\N
伏特加	fú tè jiā	vodca	0	1	24
瞭解	liǎo jiě	compreender	5	1	33
羅絲	luó sī	Rose	2	1	21
堅如磐石	jiān rú pán shí	firme como uma rocha	0	1	12
莎賓	Shābīn	Sabina	1	1	\N
整齊	zhěng qí	arrumado	0	1	32
警告	jǐng gào	avisar	11	1	34
食屍鬼	shí shī guǐ	ghoul	0	1	21
認同	rèn tóng	concordar, aprovar	6	1	42
謝地	xiè dì	agradecer à terra	0	1	44
很抱歉	hěn bào qiàn	muito desculpe	0	1	34
職員	zhí yuán	funcionários	0	1	22
Cambucá	kǎn bù cà	Cambucá	10	1	34
牠	tā	ele/ela (para animais)	2	1	\N
夜	yè	noite	26	1	\N
淹死	yān sǐ	afogar-se	0	1	13
腦袋	nǎo dài	cabeça	23	1	34
腫脹	zhǒng zhàng	inchado	0	1	34
不堪	bù kān	insuportável	0	1	41
再也不	zài yě bù	nunca mais	0	1	43
嬌嫩	jiāo nèn	macia	0	1	14
肌膚	jī fū	pele	0	1	11
沙高	shā gāo	Shā Gāo	0	1	11
開口	kāi kǒu	falar	3	1	13
二十八	èr shí bā	vinte e oito	0	1	42
人體	rén tǐ	corpo humano	0	1	23
老化	lǎo huà	envelhecimento	0	1	34
不服	bù fú	não aceitar	0	1	42
墳墓	fén mù	túmulo	0	1	24
價錢	jià qián	preço	1	1	42
市內	shì nèi	dentro da cidade	0	1	44
至遲	zhì chí	no máximo	0	1	42
麗索	lì suǒ	Liso	4	1	43
化妝	huà zhuāng	maquiar	1	1	41
婚前	hūn qián	pré-casamento	4	1	12
屍體	shī tǐ	cadáver	5	1	13
星期二	xīng qī èr	terça-feira	1	1	11
盡管	jǐn guǎn	embora	2	1	33
星期一	xīng qī yī	segunda-feira	1	1	11
巫婆	wū pó	bruxa	1	1	12
演員	yǎn yuán	ator	2	1	32
擺出	bǎi chū	exibir	1	1	31
穿戴	chuān dài	vestir	1	1	14
切口	qiē kǒu	incisão	2	1	13
聽說過	tīng shuō guò	ouviu falar	3	1	11
出版	chū bǎn	publicação	0	1	13
七年	qī nián	sete anos	0	1	12
出版會	chū bǎn huì	evento de publicação	0	1	13
鎮靜	zhèn jìng	calma	3	1	44
佛南多	fó nán duō	Fernando	0	1	22
深度	shēn dù	profundidade	1	1	14
點鐘	diǎn zhōng	horas	0	1	31
新書	xīn shū	novo livro	1	1	11
一死	yì sǐ	morrer	1	1	43
瑞渥	ruì wò	Rio	0	1	44
新任	xīn rèn	novo	0	1	14
孟維醫生	mèng wéi yī shēng	Doutor Meng Wei	0	1	42
給他	gěi tā	dar a ele	0	1	31
乾燥	gān zào	secos	0	1	14
性格	xìng gé	personalidade	1	1	42
明文	míng wén	texto claro/escrito	0	1	22
纖	xiān	fino	0	1	\N
洗面皂	xǐ miàn zào	sabonete facial	0	1	34
完完全全	wán wán quán quán	completamente	1	1	22
洗洗	xǐ xǐ	lavar	0	1	33
賤骨頭	jiàn gǔ tou	miserável/desprezível	0	1	43
堅實	jiān shí	firme	0	1	12
臉紅	liǎn hóng	corar	0	1	32
迷信	mí xìn	superstição	0	1	24
笑話	xiào huà	piada	0	1	44
感觸	gǎn chù	empatia	0	1	34
不免	bù miǎn	inevitavelmente	0	1	43
臨時演員	lín shí yǎn yuán	ator temporário	0	1	22
礦泉水	kuàng quán shuǐ	água mineral	0	1	42
生存	shēng cún	sobreviver	16	1	12
公佈	gōng bù	divulgar	0	1	14
加州	jiā zhōu	Califórnia	0	1	11
粘合	zhān hé	aderir/colar	0	1	12
，	,	,	8	1	\N
公關	gōng guān	relações públicas	0	1	11
剪彩	jiǎn cǎi	cortar a fita	0	1	33
神液	shén yè	líquido milagroso	5	1	24
看上去	kàn shàng qù	parece que	2	1	44
恐怕	kǒng pà	provavelmente	1	1	34
宴會	yàn huì	banquete	5	1	44
玉液	yù yè	líquido de jade	1	1	44
駐顏	zhù yán	preservar a beleza facial	3	1	42
失陪	shī péi	me ausentar	4	1	12
春天	chūn tiān	primavera	3	1	11
我倆	wǒ liǎ	nós dois	2	1	33
所有人	suǒ yǒu rén	todas as pessoas	1	1	33
毫不	háo bù	de modo algum	2	1	24
如同	rú tóng	como	2	1	22
責怪	zé guài	culpar	4	1	24
樓	lóu	andar	7	1	\N
秀	xiù	elegante	2	1	\N
秘密	mì mì	segredo	13	1	44
促狹	cù xiá	malicioso	0	1	42
並未	bìng wèi	não	0	1	44
私下	sī xià	em particular	2	1	14
煥發	huàn fā	radiante	3	1	41
未婚妻	wèi hūn qī	noiva	2	1	41
胡說	hú shuō	bobagem	2	1	21
熱門	rè mén	popular	0	1	42
瞞不過	mán bù guò	não consigo esconder de	0	1	24
支票	zhī piào	cheque	2	1	14
不見	bú jiàn	não nos vemos	5	1	24
出賣	chū mài	vender/trair	1	1	14
虛擲	xū zhí	desperdiçar	0	1	12
澤	zé	pântano	18	1	\N
精心	jīng xīn	com cuidado	1	1	11
達科塔	dá kē tǎ	Dakota	1	1	21
清白	qīng bái	inocente	0	1	12
每種	měi zhǒng	cada tipo	2	1	33
呵護	hē hù	proteger	2	1	14
聽候	tīng hòu	aguardar	0	1	14
光陰	guāng yīn	tempo	8	1	11
執	zhí	empunhar	3	1	\N
差遣	chāi qiǎn	ordens	0	1	13
不來	bù lái	não vir	4	1	42
華麗	huá lì	esplêndido	1	1	24
架子	jià zi	prateleira	3	1	45
浴缸	yù gāng	banheira	2	1	41
遺憾	yí hàn	lamentar	15	1	24
限制	xiàn zhì	restrição, limitação	8	1	44
面孔	miàn kǒng	rosto	0	1	43
聲譽	shēng yù	reputação	0	1	14
卓絕	zhuó jué	excelente	0	1	22
尤物	yóu wù	pessoa ou coisa excepcionalmente bela	0	1	24
疑慮重重	yí lǜ chóng chóng	cheio de dúvidas	0	1	24
海兒	hǎi ér	filho do mar	3	1	32
法則	fǎ zé	lei, regra	6	1	32
補品	bǔ pǐn	suplemento	0	1	33
奉承	fèng chéng	bajular	0	1	42
三十八	sān shí bā	trinta e oito	0	1	12
七十一	qī shí yī	setenta e um	0	1	12
情人	qíng rén	amante	1	1	22
長生	cháng shēng	vida longa	0	1	21
不老	bù lǎo	não envelhecer	0	1	43
自律	zì lǜ	autodisciplina	0	1	44
掃地	sǎo dì	varrer o chão	0	1	34
招搖	zhāo yáo	exibir-se	0	1	12
瓊漿	qióng jiāng	néctar divino	1	1	21
求之不得	qiú zhī bù dé	algo muito desejado mas difícil de obter	0	1	21
從前	cóng qián	antigamente	6	1	22
秋天	qiū tiān	outono	0	1	11
性慾	xìng yù	desejo sexual	1	1	44
責	zé	repreender	5	1	\N
肉慾	ròu yù	desejo carnal	0	1	44
衰退	shuāi tuì	declinar	0	1	14
老朽	lǎo xiǔ	envelhecer e decair	0	1	33
娛樂業	yú lè yè	indústria do entretenimento	0	1	24
隱退	yǐn tuì	retirar-se	0	1	34
一貧如洗	yī pín rú xǐ	ficar pobre como um rato	0	1	12
悄	qiāo	silenciosamente	1	1	\N
高效	gāo xiào	de alta eficiência	0	1	14
免	miǎn	estar isento	5	1	\N
假傳	jiǎ chuán	falsamente transmitir	1	1	32
死訊	sǐ xùn	notícia da morte	1	1	34
眼睜睜	yǎn zhēng zhēng	impotentemente	2	1	31
瞭如指掌	liǎo rú zhǐ zhǎng	conhecer como a palma da mão	1	1	32
亂成一團	luàn chéng yī tuán	emaranhado	1	1	42
好好	hǎo hǎo	bem	65	1	33
做得	zuò dé	fazer	2	1	42
十年	shí nián	dez anos	18	1	22
敬重	jìng zhòng	respeitar	0	1	44
顧客	gù kè	cliente	4	1	44
溫暖	wēn nuǎn	caloroso	6	1	13
酒精	jiǔ jīng	álcool	4	1	31
得逞	dé chěng	ter sucesso (em algo negativo)	4	1	23
自以為	zì yǐ wéi	pensar arrogantemente	5	1	43
經驗	jīng yàn	experiência	45	1	14
道理	dào lǐ	razão	23	1	43
杯子	bēi zi	copo	7	1	15
恩	ēn	graça	15	1	\N
酒杯	jiǔ bēi	taça de vinho	0	1	31
薄薄	báo báo	finamente	0	1	22
早點	zǎo diǎn	cedo	3	1	33
醉酒	zuì jiǔ	bêbado	0	1	43
抓緊	zhuā jǐn	agarrar firme	0	1	13
沫漢路	mò hàn lù	estrada Mohan	0	1	44
山頂	shān dǐng	topo da montanha	0	1	13
山崖	shān yá	penhasco	0	1	12
崖	yá	penhasco	0	1	\N
溶解	róng jiě	dissolvido	0	1	23
貪	tān	cobiçar	0	1	\N
吃完	chī wán	terminar de comer	1	1	12
擺正	bǎi zhèng	endireitar	0	1	34
油門	yóu mén	acelerador	0	1	22
得不到	dé bù dào	não pode obter	0	1	24
粗俗	cū sú	vulgar/grosseiro	0	1	12
驗屍	yàn shī	autópsia	0	1	41
報警	bào jǐng	chamar a polícia	8	1	43
歸類	guī lèi	classificar	0	1	14
酒醉	jiǔ zuì	embriagado	0	1	34
經手	jīng shǒu	manusear	0	1	13
駕車者	jià chē zhě	motorista	0	1	41
多想	duō xiǎng	pensar demais	0	1	13
冷酷	lěng kù	cruel	0	1	34
令人作嘔	lìng rén zuò ǒu	nojento	0	1	42
-海倫	hǎi lún	-Helen	0	1	32
-這是	-zhè shì	-isto é	0	1	44
無力	wú lì	sem força	2	1	24
纖秀	xiān xiù	esbelto e elegante	0	1	14
偽裝	wěi zhuāng	disfarçar	2	1	31
如初	rú chū	como no início	0	1	21
911	jiǔ yī yī	911	0	1	31
醉死	zuì sǐ	morrer bêbado	0	1	43
髮型	fà xíng	penteado	0	1	42
眼力	yǎn lì	visão	0	1	34
反覆	fǎn fù	repetidamente	2	1	34
脫臼	tuō jiù	deslocado	0	1	14
-我	wǒ	-eu	3	1	\N
評語	píng yǔ	avaliação	1	1	23
下賤	xià jiàn	desprezível	1	1	44
摔壞了	shuāi huài le	quebrou	1	1	14
爛醉如泥	làn zuì rú ní	bêbado como um gambá	0	1	44
自作自受	zì zuò zì shòu	colhe o que planta	1	1	44
說法	shuō fǎ	versão	2	1	13
醉醺醺	zuì xūn xūn	bêbado	0	1	41
-不	bù	não	0	1	\N
死屍	sǐ shī	cadáver	1	1	31
發動	fā dòng	ligar	1	1	14
一聲	yī shēng	um som	11	1	11
賤貨	jiàn huò	mercadoria barata	2	1	44
痛快	tòng kuài	divertido	0	1	44
自衛	zì wèi	autodefesa	3	1	44
話兒	huà r	conversa	0	1	45
有沒有	yǒu méi yǒu	tem ou não	2	1	32
值	zhí	valer	11	1	\N
逆來順受	nì lái shùn shòu	aceitar passivamente	1	1	42
查	chá	verificar	1	1	\N
母狗	mǔ gǒu	cadela	0	1	33
1110	yī yī yī líng	1110	0	1	11
摧毀	cuī huǐ	destruindo	3	1	13
很難	hěn nán	muito difícil	8	1	32
翹翹	qiào qiào	expressão coloquial para 'morto'	0	1	44
著手	zhuó shǒu	começar	1	1	23
刻毒	kè dú	venenoso	0	1	42
懂了	dǒng le	entendido	7	1	35
下地獄	xià dì yù	descer ao inferno	0	1	44
聽懂	tīng dǒng	entender	3	1	13
只管	zhǐ guǎn	apenas	2	1	33
修	xiū	consertar	71	1	\N
案子	àn zi	caso	3	1	45
受刑	shòu xíng	sofrer punição	0	1	42
祝酒	zhù jiǔ	brinde	1	1	43
舉杯	jǔ bēi	brindar	2	1	31
摔斷了	shuāi duàn le	quebrou	0	1	14
將來	jiāng lái	que no futuro	2	1	12
停跳	tíng tiào	parou de bater	0	1	24
漢	hàn	Han	3	1	\N
轉身	zhuǎn shēn	virar-se	1	1	31
禽獸	qín shòu	besta	0	1	24
神經病	shén jīng bìng	doido	0	1	21
在哪	zài nǎ	onde está	0	1	43
硬	yìng	dura	4	1	\N
搬動	bān dòng	mover	0	1	14
掛斷	guà duàn	desligar	0	1	44
通電話	tōng diàn huà	falar ao telefone	0	1	14
慘叫	cǎn jiào	grito angustiado	0	1	34
摔下來	shuāi xià lái	cair	0	1	14
無懈可擊	wú xiè kě jī	à prova de falhas	0	1	24
晚於	wǎn yú	mais tarde que	0	1	32
精確	jīng què	preciso	0	1	14
伙計	huǒ jì	parceiro	0	1	34
-怎麼	zěn me	-como	0	1	35
惡毒	è dú	malicioso	5	1	42
從何	cóng hé	de onde	0	1	22
摔壞	shuāi huài	quebrar ao cair	0	1	14
救救我	jiù jiù wǒ	me salve	1	1	44
競爭	jìng zhēng	competir	1	1	41
酸	suān	dor	0	1	\N
鄰居們	lín jū men	vizinhos	0	1	21
在逃	zài táo	foragido	0	1	42
大言不慚	dà yán bù cán	falar descaradamente	0	1	42
凶手	xiōng shǒu	assassino	1	1	13
休克	xiū kè	choque	1	1	14
控訴	kòng sù	acusação	0	1	44
太平間	tàipíngjiān	morgue	3	1	\N
濕透	shī tòu	encharcado	0	1	14
1985年	yī jiǔ bā wǔ nián	ano 1985	0	1	13
抒發	shū fā	expressar	0	1	11
回避	huí bì	evitando	0	1	24
修補	xiū bǔ	reparar	5	1	13
堅持	jiān chí	persistência	54	1	12
賤	jiàn	desprezível	2	1	\N
駐顏神液	zhù yán shén yè	líquido divino da beleza	1	1	42
黑漆漆	hēi qī qī	escuro como breu	0	1	11
納悶	nà mèn	confuso/perplexo	0	1	44
行裝	xíng zhuāng	bagagem	0	1	21
中心	zhōng xīn	centro	9	1	11
游完	yóu wán	terminar de nadar	0	1	22
理論	lǐ lùn	teoria	2	1	34
緬懷	miǎn huái	recordar	0	1	32
正確的	zhèng què de	correto	0	1	44
陰謀家	yīn móu jiā	conspirador	0	1	12
克萊拉	kè lái lā	Clara	0	1	42
同謀者	tóng móu zhě	cúmplice	0	1	22
不可以	bù kě yǐ	não podem	1	1	43
消極	xiāo jí	negativo	0	1	12
收拾	shōu shí	arrumar	6	1	12
上衣	shàng yī	blusa	1	1	41
研究	yán jiū	pesquisa	8	1	21
沒必要	méi bì yào	não é necessário	0	1	24
服它	fú tā	tomá-lo	0	1	21
起死還生	qǐ sǐ huán shēng	ressuscitar	0	1	33
對方	duì fāng	um ao outro	4	1	41
四周	sì zhōu	ao redor	1	1	41
渾身	hún shēn	todo o corpo	1	1	21
要不要	yào bú yào	quer ou não quer	1	1	42
褪色	tuì sè	desbotar	6	1	44
下雨	xià yǔ	chover	5	1	43
神藥	shén yào	remédio divino	0	1	24
先生們	xiān sheng men	senhores	3	1	15
10月	shí yuè	outubro	0	1	24
26日	èr shí liù rì	dia 26	0	1	42
富有	fù yǒu	rico em	11	1	43
服了	fú le	tomou	1	1	25
不停	bù tíng	sem parar	3	1	42
美容書	měi róng shū	livro de beleza	0	1	32
便宜	pián yi	barato	4	1	25
適應	shì yìng	adaptar-se	5	1	44
不惜	bù xī	não poupar	1	1	41
傳播	chuán bō	espalhar	2	1	21
村莊	cūn zhuāng	aldeia	2	1	11
妙	miào	bom	36	1	\N
見鬼去吧	jiàn guǐ qù ba	vá para o inferno	0	1	43
做為	zuò wéi	como	1	1	42
忠告	zhōng gào	conselho	0	1	14
泳裝	yǒng zhuāng	roupa de banho	0	1	31
兩件式	liǎng jiàn shì	duas peças/conjunto	0	1	34
嫉恨	jí hèn	invejar e odiar	0	1	24
機場	jī chǎng	aeroporto	3	1	13
媽的	mā de	porra	7	1	15
終生	zhōng shēng	prisão perpétua	1	1	11
先修	xiān xiū	pré-requisito	0	1	11
神奇	shén qí	mágico/maravilhoso	0	1	22
無暇	wú xiá	impecável	0	1	22
終究	zhōng jiū	afinal	0	1	11
甚或	shèn huò	ou até mesmo	0	1	44
信守	xìn shǒu	cumprir a promessa	0	1	43
高尚	gāo shàng	nobre	0	1	14
守信	shǒu xìn	manter a palavra	0	1	34
脫皮	tuō pí	descascar	1	1	12
在乎	zài hu	importar-se	4	1	45
日日夜夜	rì rì yè yè	dia e noite	0	1	44
永永遠遠	yǒng yǒng yuǎn yuǎn	para sempre	0	1	33
三十七	sān shí qī	trinta e sete	0	1	12
四個	sì gè	quatro	0	1	44
信徒	xìn tú	fiéis	0	1	42
運動者	yùn dòng zhě	esportista	0	1	44
精力	jīng lì	energia	0	1	14
充沛	chōng pèi	abundante	0	1	14
改造	gǎi zào	transformar	0	1	34
醒酒	xǐng jiǔ	despertar do álcool	0	1	33
後來	hòu lái	depois	22	1	42
野心	yě xīn	ambição	1	1	31
監禁	jiān jìn	prisão	5	1	14
悲痛	bēi tòng	tristeza	1	1	14
救命	jiù mìng	socorro	1	1	44
脊椎骨	jǐ zhuī gǔ	vértebra	0	1	31
右手	yòu shǒu	mão direita	0	1	43
輕蔑	qīng miè	desprezo	1	1	14
大發雷霆	dà fā léi tíng	ficar furiosa	0	1	41
你嗎	nǐ ma	você	1	1	35
贏	yíng	vencer	9	1	\N
搞鬼	gǎo guǐ	pregar peça	1	1	33
沒死	méi sǐ	não morreu	0	1	23
外邊	wài biān	fora	0	1	41
成不了	chéng bù liǎo	não conseguir	0	1	24
-當然	dāng rán	claro	0	1	12
昭示	zhāo shì	revelando	0	1	14
倒是	dào shì	realmente	4	1	44
手段	shǒu duàn	meio/método	0	1	34
甲醛	jiǎ quán	formaldeído	0	1	32
敷衍了事	fū yǎn liǎo shì	fazer de qualquer jeito	0	1	13
死神	sǐ shén	deus da morte	0	1	32
松節油	sōng jié yóu	terebintina	0	1	12
飲	yǐn	beber	0	1	\N
調皮鬼	tiáo pí guǐ	travesso	0	1	22
明年	míng nián	ano que vem	10	1	22
啊呀	ā yā	ai	0	1	11
湯姆	tāng mǔ	Tom	0	1	13
多遠	duō yuǎn	muito longe	0	1	13
險境	xiǎn jìng	perigo	0	1	34
婆婆媽媽	pó po mā mā	indeciso/irresoluto	0	1	25
奇詭	qí guǐ	bizarro/misterioso	0	1	23
罪有應得	zuì yǒu yīng dé	merecer o castigo	0	1	43
永駐	yǒng zhù	permanecer para sempre	3	1	34
搞成	gǎo chéng	transformar em	0	1	32
管用	guǎn yòng	útil	1	1	34
丟了	diū le	perdeu	0	1	15
拗	ǎo	estalar	0	1	\N
講話	jiǎng huà	falar	2	1	34
狐狸精	hú li jīng	mulher sedutora/destruidora de lares	0	1	25
約翰	yuē hàn	John	13	1	14
開了	kāi le	abrimos	1	1	15
那次	nà cì	aquela vez	1	1	44
脖子	bó zi	pescoço	7	1	25
顏色	yán sè	cor	5	1	24
鋪開	pū kāi	estender	0	1	11
青年	qīng nián	juventude	4	1	12
僅有	jǐn yǒu	único	1	1	33
迭宕起伏	dié dàng qǐ fú	cheio de altos e baixos	0	1	24
忽然	hū rán	de repente	1	1	12
無往不利	wú wǎng bù lì	bem-sucedido em tudo	0	1	23
什麼樣	shén me yàng	que tipo	2	1	25
瘦小	shòu xiǎo	magro e pequeno	0	1	43
能不能	néng bù néng	pode ou não pode	1	1	24
厭倦	yàn juàn	cansar	3	1	44
空洞	kōng dòng	vazio	0	1	14
X光	X guāng	raio-X	2	1	51
服裝	fú zhuāng	roupas	14	1	21
依靠	yī kào	depender	23	1	14
肥佬	féi lǎo	gordo	0	1	23
之所以	zhī suǒ yǐ	a razão pela qual	4	1	13
有可能	yǒu kě néng	é possível	6	1	33
換了	huàn le	trocou	3	1	45
光臨	guāng lín	honrar com a presença	3	1	12
共同	gòng tóng	juntos	4	1	42
節	jié	seções	17	1	\N
虛偽	xū wěi	hipócrita	2	1	13
上天	shàng tiān	céu	21	1	41
麗索那	Lì suǒ nà	Lisona	0	1	43
打定主意	dǎ dìng zhǔ yì	decidido	0	1	34
迷倒	mí dǎo	derrubar (com drogas/sedução)	0	1	23
侮辱	wǔ rǔ	humilhação	5	1	33
公開	gōng kāi	público	6	1	11
出租車	chū zū chē	táxi	0	1	11
碌碌無為	lù lù wú wéi	trabalhar sem realizar nada	0	1	44
只因	zhǐ yīn	apenas porque	0	1	31
許下	xǔ xià	fazer (uma promessa)	0	1	34
一諾千金	yī nuò qiān jīn	palavra de honra	0	1	14
比華利山莊	bǐ huá lì shān zhuāng	Beverly Hills	0	1	32
品德	pǐn dé	caráter moral	0	1	32
嚴格	yán gé	rigoroso	0	1	22
活屍	huó shī	zumbi	0	1	21
諾言	nuò yán	promessa	3	1	42
手藝	shǒu yì	habilidade manual	0	1	34
巧奪天工	qiǎo duó tiān gōng	maravilhosamente trabalhado	0	1	32
咬人	yǎo rén	morder pessoas	0	1	32
留駐	liú zhù	permanecer	0	1	24
唐吉訶德	Táng jí hē dé	Dom Quixote	0	1	22
罷手	bà shǒu	parar	0	1	43
迪克	dí kè	Dick	1	1	24
海利	hǎi lì	Haley	1	1	34
客戶們	kè hù men	clientes	0	1	44
好玩	hǎo wán	divertido	0	1	32
無所不知	wú suǒ bù zhī	sabe tudo	0	1	23
奇妙	qí miào	maravilhosas	3	1	24
9號	jiǔ hào	número 9	0	1	34
丙烯	bǐng xī	acrílico	0	1	31
塗料	tú liào	tinta	0	1	24
行業	háng yè	setor	2	1	24
縫製	féng zhì	costurou	2	1	24
食指	shí zhǐ	dedo indicador	0	1	23
脫落	tuō luò	soltar-se/cair	0	1	14
互相	hù xiāng	mutuamente	12	1	41
谷	gǔ	vale	3	1	\N
一勞永逸	yī láo yǒng yì	resolver um problema de uma vez por todas	0	1	12
幹的	gàn de	feito	2	1	45
活著	huó zhe	viva	21	1	25
其它	qí tā	outros	0	1	21
歲月	suì yuè	anos	25	1	44
請教	qǐng jiào	consultar	0	1	34
一生	yī shēng	vida inteira	12	1	11
工具	gōng jù	ferramentas	2	1	14
求救	qiú jiù	pedir socorro	0	1	24
不妙	bù miào	não boa	0	1	44
毒氣室	dú qì shì	câmara de gás	0	1	24
洛城	luò chéng	Los Angeles	0	1	42
鬆開	sōng kāi	soltar	0	1	11
體溫	tǐ wēn	temperatura corporal	4	1	31
埋掉	mái diào	enterrada	1	1	24
共和黨人	gòng hé dǎng rén	republicanos	0	1	42
鐵鏟	tiě chǎn	pá de ferro	1	1	33
同謀	tóng móu	cúmplice	0	1	22
意想不到	yì xiǎng bù dào	inesperado	0	1	43
全盛	quán shèng	auge	0	1	24
寶勃	bǎo bó	Bao Bo (nome próprio)	0	1	32
記載	jì zǎi	registro	0	1	43
預示	yù shì	presságio	0	1	44
奧本	ào běn	Oppen (nome próprio)	0	1	43
-到底	dào dǐ	afinal	0	1	43
埋	mái	enterrar	4	1	\N
不均勻	bù jūn yún	desigual	1	1	41
煤油	méi yóu	querosene	0	1	22
一走了之	yī zǒu liǎo zhī	ir embora e dar o caso por encerrado	0	1	13
贏家	yíng jiā	vencedor	3	1	21
修完	xiū wán	terminar de consertar	0	1	12
停下	tíng xià	parar	2	1	24
一口	yī kǒu	um gole	1	1	13
匿名	nì míng	anônimo	0	1	42
裝死	zhuāng sǐ	fingir de morto	0	1	13
一眼	yī yǎn	com um olhar	2	1	13
禿頂	tū dǐng	careca	0	1	13
死去	sǐ qù	morrer	2	1	34
大腹便便	dà fù pián pián	barrigudo	0	1	44
窟窿	kū long	buraco	1	1	15
客氣	kè qì	ser formal	6	1	44
奇跡	qí jì	milagre	0	1	24
爭吵	zhēng chǎo	discussão	8	1	13
弄壞	nòng huài	estragar	2	1	44
贏得	yíng dé	ganhar	9	1	22
顯現	xiǎn xiàn	aparecer	0	1	34
騙子	piàn zi	mentiroso	4	1	45
成性	chéng xìng	por natureza	0	1	24
唐娜	táng nà	Dona	7	1	24
一想	yī xiǎng	pensar um pouco	6	1	13
痕跡	hén jī	marcas	3	1	21
難以置信	nán yǐ zhì xìn	inacreditável	8	1	23
的確	dí què	realmente	3	1	24
搶	qiǎng	roubar	4	1	\N
看穿	kàn chuān	ver através	0	1	41
狗娘養的	gǒu niáng yǎng de	filho da puta	0	1	32
色相	sè xiàng	aparência física	0	1	44
目不忍睹	mù bù rěn dǔ	insuportável de se ver	0	1	44
司克特	sī kè tè	Scott	0	1	14
亨特	hēng tè	Hunter	0	1	14
伸出來	shēn chū lái	esticar para fora	0	1	11
瞎子	xiā zi	cego	0	1	15
聾子	lóng zi	surdo	0	1	25
下流坯	xià liú pī	canalha	0	1	42
議論	yì lùn	comentar	0	1	44
謝天謝地	xiè tiān xiè dì	graças a Deus	0	1	41
大驚小怪	dà jīng xiǎo guài	fazer tempestade em copo d'água	2	1	41
打聽	dǎ tīng	perguntar sobre	0	1	31
的確是	dí què shì	realmente é	0	1	24
濕著	shī zhe	molhado	0	1	15
多謝	duō xiè	muito obrigado	0	1	14
大自然	dà zì rán	natureza	0	1	44
風車	fēng chē	moinho de vento	0	1	11
奮力	fèn lì	vigorosamente	0	1	44
傷殘	shāng cán	deficiente físico	0	1	12
推下	tuī xià	empurrar para baixo	0	1	14
受歡迎	shòu huān yíng	popular	1	1	41
姑娘們	gū niáng men	moças, meninas	2	1	12
臉上	liǎn shàng	rosto	1	1	34
考驗	kǎo yàn	testando	1	1	34
背後	bèi hòu	atrás das costas	2	1	44
絕無	jué wú	absolutamente não	1	1	22
份上	fèn shàng	consideração	15	1	44
天意	tiān yì	vontade divina	1	1	14
美夢	měi mèng	sonho bom	0	1	34
惡夢	è mèng	pesadelo	0	1	44
窘	jiǒng	embaraçoso	0	1	\N
來講	lái jiǎng	falar	0	1	23
聚	jù	reunir	4	1	\N
重申	chóng shēn	reafirmar	0	1	21
拋頭露面	pāo tóu lù miàn	aparecer em público	0	1	12
出風頭	chū fēng tóu	chamar a atenção	0	1	11
潮	cháo	na moda	0	1	\N
點名	diǎn míng	chamar a lista	0	1	32
見鬼	jiàn guǐ	caramba	0	1	43
切換	qiē huàn	mudar	0	1	14
模式	mó shì	modo	0	1	24
落閘	luò zhá	baixar a cancela	0	1	42
出口處	chū kǒu chù	saída	0	1	13
旅館裡	lǚ guǎn lǐ	pousada	0	1	33
生路	shēng lù	saída	0	1	14
組裝	zǔ zhuāng	montar	0	1	31
找到了嗎	zhǎo dào le ma	encontrou	0	1	34
太遲了	tài chí le	muito tarde	0	1	42
他跑了	tā pǎo le	ele fugiu	0	1	13
回來的	huí lái de	voltar	0	1	22
不過是	bù guò shì	não passa de	0	1	44
停留	tíng liú	permanecer	0	1	22
冰淇淋	bīng qí lín	sorvete	4	1	12
混合	hùn hé	mistos	1	1	42
看不見	kàn bù jiàn	não consigo ver	0	1	44
塗漆	tú qī	pintar	0	1	21
路段	lù duàn	trecho da estrada	0	1	44
著色	zhuó sè	colorir	1	1	24
遠見	yuǎn jiàn	visão de longo prazo	0	1	34
宮殿	gōng diàn	palácio	5	1	14
卡里奧卡	kǎ lǐ ào kǎ	Carioca	0	1	33
賢人	xián rén	pessoa virtuosa	0	1	22
JIN	JIN	JIN	12	1	\N
遍布	biàn bù	espalhado por	0	1	44
強健	qiáng jiàn	forte	0	1	24
滿滿	mǎn mǎn	cheio	1	1	33
多彩	duō cǎi	colorido	0	1	13
一條	yī tiáo	uma (para regras)	4	1	12
過夜	guò yè	pernoitar	5	1	44
顧問	gù wèn	consultoria	0	1	44
子孫	zǐ sūn	descendentes	0	1	31
後代	hòu dài	gerações futuras	0	1	44
延續	yán xù	continuar	0	1	24
乾脆	gān cuì	direto	3	1	14
南韓	nán hán	Coreia do Sul	0	1	22
胡說八道	hú shuō bā dào	bobagem	4	1	21
預警	yù jǐng	aviso prévio	0	1	43
喬伊	qiáo yī	Joy	7	1	21
散開	sàn kāi	dispersar	1	1	41
胡扯	hú chě	bobagem	2	1	23
關門	guān mén	fechar a porta	10	1	12
凡事	fán shì	tudo	4	1	24
女生	nǚ shēng	meninas	1	1	31
學者	xué zhě	acadêmico	2	1	23
女生們	nǚ shēng men	moças	0	1	31
森巴舞	sēn bā wǔ	samba	2	1	11
住過	zhù guò	morou	0	1	44
冷氣機	lěng qì jī	ar-condicionado	1	1	34
奇科	qí kē	Chico	-87	1	21
聖經	shèng jīng	Bíblia	2	1	41
賓客們	bīn kè men	hóspedes	1	1	14
一套	yí tào	um conjunto de	6	1	24
娜娜杜	nà nà dù	Nana Du	0	1	44
落	luò	cair	12	1	\N
帥氣	shuài qì	elegante	7	1	44
豐富	fēng fù	rico	27	1	14
何時	hé shí	quando	5	1	22
兩顆	liǎng kē	duas estrelas	0	1	31
姊妹	zǐ mèi	irmãs	13	1	34
團體	tuán tǐ	grupos	6	1	23
花瓣	huā bàn	pétalas	0	1	14
星星	xīng xīng	estrelas	0	1	11
驚嘆	jīng tàn	admirar surpresas	0	1	14
羅珊娜	Luó shān nà	Rosanna	0	1	21
維修	wéi xiū	reparo	0	1	21
合照	hé zhào	foto em grupo	0	1	24
攝影機	shè yǐng jī	câmera	0	1	43
列為	liè wéi	listar como	0	1	42
激動不已	jī dòng bù yǐ	extremamente emocionado	0	1	14
長好大	zhǎng hǎo dà	cresceu muito	0	1	33
只差	zhǐ chà	só falta	0	1	34
舞龍	wǔ lóng	dança do dragão	0	1	32
演變	yǎn biàn	evoluir	0	1	34
坦承	tǎn chéng	admitir abertamente	1	1	32
決定權	jué dìng quán	direito de decisão	0	1	24
今天的	jīn tiān de	de hoje	0	1	11
男友	nán yǒu	namorado	7	1	23
花花公子	huā huā gōng zǐ	playboys	0	1	11
華服	huá fú	vestes esplêndidas, roupa suntuosa	0	1	22
學會	xué huì	aprender	7	1	24
它的	tā de	seu	1	1	15
不滿	bù mǎn	insatisfeito	0	1	43
真是太美了	zhēn shì tài měi le	realmente é tão lindo	0	1	14
包廂	bāo xiāng	camarote	0	1	11
在於	zài yú	reside em	12	1	42
救救	jiù jiù	socorro	0	1	44
協會	xié huì	associação	0	1	24
分會	fēn huì	filial	0	1	14
未竟	wèi jìng	inacabado	0	1	44
下車	xià chē	descer do veículo	0	1	41
一整瓶	yī zhěng píng	garrafa inteira	0	1	13
瓣	bàn	pétala	0	1	\N
噴塗	pēn tú	pulverizar/pintar com spray	1	1	12
關節	guān jié	junta	0	1	12
Subtitles by SOFTITLER	Subtitles by SOFTITLER	Legendas por SOFTITLER	0	1	55
巴踢波拉	bā tī bō lā	Batipora (transliteração)	0	1	11
巴特波拉斯	bā tè bō lā sī	Bartolaus	0	1	14
順便說一句	shùn biàn shuō yī jù	a propósito	0	1	44
青年旅舍	qīng nián lǚ shě	albergue da juventude	1	1	12
轉化	zhuǎn huà	transformar	0	1	34
經典之作	jīng diǎn zhī zuò	obra clássica	0	1	13
預估	yù gū	prever	0	1	41
自便	zì biàn	fique à vontade	0	1	44
一分鐘	yī fēn zhōng	um minuto	0	1	11
集團	jí tuán	grupo	0	1	22
抹	mǒ	esfregar	0	1	\N
巨星	jù xīng	estrela	0	1	41
出動	chū dòng	entrar em ação	0	1	14
主導者	zhǔ dǎo zhě	líder	0	1	33
首演	shǒu yǎn	estreia	0	1	33
緊張感	jǐn zhāng gǎn	sensação de nervosismo	0	1	31
齊聚一堂	qí jù yī táng	reunir-se juntos	0	1	24
抽獎	chōu jiǎng	sorteio	0	1	13
副	fù	conjunto	8	1	\N
陌生人	mò shēng rén	estranho	2	1	41
加進	jiā jìn	adicionou	0	1	14
一下午	yī xià wǔ	uma tarde	0	1	14
我的媽呀	wǒ de mā ya	minha nossa	0	1	35
永生	yǒng shēng	vida eterna	16	1	31
順道	shùn dào	de passagem	0	1	44
另一邊	lìng yī biān	outro lado	2	1	41
青年旅館	qīng nián lǚ guǎn	albergue da juventude	1	1	12
舞步	wǔ bù	passo de dança	0	1	34
席維妮雅	Xí wéi nī yǎ	Silvania	1	1	22
祝賀	zhù hè	parabenizar	0	1	44
首秀	shǒuxiù	estreia	2	1	\N
一大堆	yī dà duī	um monte	3	1	14
下巴	xià ba	queixo	2	1	45
Jin	Jin	Jin	7	1	\N
母馬	mǔ mǎ	égua	0	1	33
退場	tuì chǎng	saída	1	1	43
競賽	jìng sài	competição	1	1	44
創造了	chuàng zào le	criou	0	1	44
擊球	jī qiú	rebater a bola	1	1	12
告上	gào shàng	processar	2	1	44
譁然	huá rán	clamoroso	0	1	22
索薩	suǒ sà	Sosa	1	1	34
膠	jiāo	cola	2	1	\N
走秀	zǒu xiù	desfilar	5	1	34
倉庫	cāng kù	armazém	1	1	14
辛內蘭迪亞	xīn nèi lán dí yà	Sinnerlandia	2	1	14
規則	guī zé	regra	6	1	12
太美了	tài měi le	tão lindo	2	1	43
歡呼聲	huān hū shēng	gritos de alegria	14	1	11
跟隨	gēn suí	seguir	5	1	12
穿著	chuān zhuó	vestindo	6	1	12
一再	yī zài	repetidamente	1	1	14
親眼	qīn yǎn	com os próprios olhos	3	1	13
為你	wèi nǐ	por você	3	1	43
模	mó	modelo	8	1	\N
夠了	gòu le	suficiente	18	1	45
名堂	míng táng	truques	1	1	22
首位	shǒu wèi	primeira mulher	0	1	34
專注於	zhuān zhù yú	focado em	2	1	14
打扮	dǎ bàn	vestir-se	3	1	34
旅舍	lǚ shè	albergue/hostel	4	1	34
搭檔	dā dàng	parceiro	1	1	14
近距離	jìn jù lí	de perto	3	1	44
做好	zuò hǎo	fazer bem	1	1	43
順帶一提	shùn dài yī tí	a propósito	3	1	44
外出	wài chū	sair	3	1	41
熱愛	rè ài	amar profundamente	8	1	44
氣場	qì chǎng	aura	3	1	43
在這點上	zài zhè diǎn shàng	nesse ponto	0	1	44
極了	jí le	extremamente	4	1	25
勞累	láo lèi	cansado	0	1	24
搶劫	qiǎng jié	assalto	13	1	32
點心	diǎn xīn	lanches	8	1	31
專家	zhuān jiā	especialista	3	1	11
擊	jī	bater	13	1	\N
到此	dào cǐ	até aqui	3	1	43
告知	gào zhī	informar	4	1	41
拿來	ná lái	trazer	2	1	22
合	hé	combinar	66	1	\N
實力	shí lì	capacidade/habilidade	0	1	24
森巴	sēn bā	samba	1	1	11
換個	huàn gè	trocar de	0	1	44
嗨翻天	hāi fān tiān	estar muito animado	0	1	11
劇透	jù tòu	spoiler	0	1	44
告辭	gào cí	despedir-me	0	1	42
法庭	fǎ tíng	tribunal	12	1	32
群組	qún zǔ	grupo	1	1	23
景點	jǐng diǎn	atração	0	1	33
火腿捲	huǒ tuǐ juǎn	rolinho de presunto	0	1	33
套	tào	conjunto	11	1	\N
起酥乳酪餅	qǐ sū rǔ lào bǐng	torta de queijo folhada	0	1	31
歡迎禮	huān yíng lǐ	presente de boas-vindas	0	1	12
多拉麗絲	duō lā lì sī	Dolores	0	1	11
郊	jiāo	subúrbio	0	1	\N
黑咖啡	hēi kā fēi	café preto	0	1	11
有過	yǒu guò	teve	14	1	34
這就	zhè jiù	agora mesmo	1	1	44
察覺到	chá jué dào	perceber	0	1	22
薇薇	Wēi wēi	Weiwei	0	1	11
能量	néng liàng	energia	4	1	24
女戰士	nǚ zhàn shì	guerreira	0	1	34
嚐嚐	cháng chang	experimentar	0	1	25
開始吧	kāi shǐ ba	começar	0	1	13
西內蘭迪亞	xī nèi lán dí yà	Sinerandia	0	1	14
醬	jiàng	pasta	6	1	\N
選美比賽	xuǎn měi bǐ sài	concurso de beleza	0	1	33
勇士	yǒng shì	guerreiro	0	1	34
吉姆	jí mǔ	Jim	4	1	23
招待	zhāo dài	entretendo	0	1	14
客人們	kè rén men	convidados	0	1	42
謝啦	xiè la	valeu	0	1	45
Rique	Rique	Rique	0	1	\N
壞掉	huài diào	estragado	1	1	44
尖叫聲	jiān jiào shēng	gritos	3	1	14
裝扮	zhuāng bàn	traje	4	1	14
親兄弟	qīn xiōng dì	irmão de sangue	0	1	11
奇觀	qí guān	maravilhas	1	1	21
氣呼呼	qì hū hū	bufando de raiva	0	1	41
班級	bān jí	classes	4	1	12
女人們	nǚ rén men	mulheres	1	1	32
嚴重的	yán zhòng de	sério	0	1	24
爆表	bào biǎo	estourar o medidor	0	1	43
囉	luō	partícula modal	13	1	\N
生機勃勃	shēng jī bó bó	cheio de vida/vigorante	0	1	11
絢麗多彩	xuàn lì duō cǎi	deslumbrante e colorido	0	1	44
這麼做	zhè me zuò	fazer isso	0	1	45
編舞	biān wǔ	coreografia	0	1	13
兩個人	liǎng gè rén	duas pessoas	1	1	34
休息日	xiū xí rì	dia de folga	2	1	12
尊貴	zūn guì	honoráveis	17	1	14
嗯哼	ń hēng	uh-huh	8	1	51
技術	jì shù	técnico	0	1	44
圖片	tú piàn	imagens	1	1	24
開心了	kāi xīn le	feliz	0	1	11
遊行	yóu xíng	desfile	20	1	22
戲服	xì fú	figurino	1	1	42
在意	zài yì	me importar	2	1	44
全班	quán bān	classe toda	2	1	21
女孩們	nǚ hái men	meninas	1	1	32
亮相	liàng xiàng	aparecer	0	1	44
很快地	hěn kuài de	rapidamente	1	1	34
隱蔽	yǐn bì	oculto	0	1	34
時髦	shí máo	na moda	2	1	22
真的嗎	zhēn de ma	sério	5	1	15
門前	mén qián	frente da porta	0	1	22
不可思議	bù kě sī yì	inacreditável	6	1	43
守護	shǒu hù	proteger	3	1	34
但也	dàn yě	mas também	0	3	43
哈允	hā yǔn	Harun	0	1	13
就是說	jiù shì shuō	isto é	0	1	44
夢幻	mèng huàn	dos sonhos	3	1	44
MADÁ	MADÁ	MADÁ	6	1	\N
老家	lǎo jiā	terra natal	0	1	31
謝謝你	xiè xiè nǐ	obrigada	2	1	44
閒聊	xián liáo	conversa casual	6	1	22
說真的	shuō zhēn de	sério	6	1	11
瑪黛	mǎ dài	mate	6	1	34
氣氛	qì fēn	atmosfera	2	1	41
層面	céng miàn	nível	2	1	24
耳邊	ěr biān	ouvido	7	1	31
羅莎	luó shā	Rosa	13	1	21
至今	zhì jīn	até agora	5	1	41
滑	huá	deslizar	5	1	\N
尚未	shàng wèi	ainda não	5	1	44
大放異彩	dà fàng yì cǎi	brilhar intensamente	7	1	44
幻想	huàn xiǎng	fantasia	13	1	43
里奇	lǐ qí	Richie	7	1	32
出去了	chū qù le	saiu	0	1	14
調整	tiáo zhěng	ajustar	4	1	23
擊球隊	jí qiú duì	time de beisebol	0	1	22
羅莎娜	Luó shā nà	Rosana	-42	1	21
桑巴舞	sāng bā wǔ	dança de samba	2	1	11
剛開始	gāng kāi shǐ	começar agora	0	1	11
主禱文	zhǔ dǎo wén	Pai Nosso	0	1	33
優美	yōu měi	graciosa	0	1	13
嚇了一跳	xià le yī tiào	levou um susto	0	1	45
嚇人一跳	xià rén yī tiào	assustador	0	1	42
動作	dòng zuò	movimento	9	1	44
蘿莎娜	luó shā nà	Rosana	8	1	21
美了	měi le	bonito	0	1	35
獨一無二	dú yī wú èr	único	0	1	21
上映	shàng yìng	estrear	1	1	44
救了	jiù le	salvou	0	1	45
黃的	huáng de	amarelo	0	1	25
據說	jù shuō	supostamente	0	1	41
紅紅的	hóng hóng de	vermelhinho	0	1	22
懷裡	huái lǐ	colo/abraço	3	1	23
想想看	xiǎng xiǎng kàn	pense um pouco	0	1	33
通紅	tōng hóng	vermelho vivo	0	1	12
中彈	zhòng dàn	ser baleado	0	1	44
GIGI	GIGI	Gigi	6	1	\N
巨龍	jù lóng	dragão gigante	12	1	42
自討苦吃	zì tǎo kǔ chī	procurar sofrimento	0	1	43
好幾次	hǎo jǐ cì	várias vezes	1	1	33
還不到	hái bú dào	ainda não chegou a	0	1	22
要不是	yào bú shì	se não fosse	1	1	42
瑪德蓮娜	mǎ dé lián nà	Madalena	8	1	32
拉斐拉夫人	lā fěi lā fū rén	Senhora Rafaela	2	1	13
法蘭西斯科	fǎ lán xī sī kē	Francisco	9	1	32
困境	kùn jìng	situação difícil	1	1	44
鞋子	xié zi	sapatos	7	1	25
走路	zǒu lù	caminhar	3	1	34
奧爾加	Ào ěr jiā	Olga	20	1	43
吩咐	fēn fù	ordenar	2	1	14
衝著	chōng zhe	direcionada a	2	1	15
拿掉	ná diào	remover	2	1	24
叫了	jiào le	chamamos	2	1	45
意志	yì zhì	vontade	2	1	44
那條	nà tiáo	aquele	5	1	42
廚房	chú fáng	cozinha	11	1	22
哇靠	wā kào	puta merda	3	1	14
追著	zhuī zhe	perseguindo	0	1	15
皮肉傷	pí ròu shāng	ferimento superficial	0	1	24
錢包	qián bāo	carteira	0	1	21
打倒	dǎ dǎo	derrubar	0	1	33
維拉坎布卡	wéi lā kǎn bù kǎ	Vila Kambuka	9	1	21
那顆	nà kē	aquela	0	1	41
瑪達蓮娜	Mǎ dá lián nà	Madalena	3	1	32
美蘭妮	měi lán ní	Melanie	1	1	32
正當	zhèng dàng	justo	3	1	44
對面	duì miàn	em frente	2	1	44
影片	yǐng piàn	vídeo	3	1	34
很好的	hěn hǎo de	muito bom	1	1	33
坐坐	zuò zuo	sentar um pouco	1	1	45
趕來	gǎn lái	vir rapidamente	2	1	32
超愛	chāo ài	adorar demais	5	1	14
形成的	chéng de	formação	0	1	25
貝莉莎	Bèi lì shā	Belisa	142	1	44
頭腦	tóu nǎo	mente	14	1	23
努力	nǔ lì	esforçar-se	80	1	34
也不是	yě bù shì	nem	1	1	34
反對	fǎn duì	opor-se	11	1	34
飾	shì	disfarçar	0	1	\N
莫雷拉	mò léi lā	Moreira	46	1	42
closes	closes	fecha	0	1	\N
海灘	hǎi tān	praia	3	1	31
幫幫忙	bāng bāng máng	ajudar	1	1	11
納薩雷	Nà sà léi	Nazaré	0	1	44
慢點	màn diǎn	devagar	0	1	43
好起来	hǎo qǐ lái	melhorar	0	1	33
市集	shì jí	feira	0	1	42
打翻	dǎ fān	derramar	0	1	31
深呼吸	shēn hū xī	respiração profunda	4	1	11
一公升	yī gōng shēng	um litro	0	1	11
很長	hěn cháng	muito longo	4	1	32
夏允	Xià Yǔn	Xia Yun	0	1	43
髒兮兮	zāng xī xī	sujo	0	1	11
住進	zhù jìn	mudar-se para	0	1	44
MUXOXO	MUXOXO	MUXOXO	0	1	\N
希拉	xī lā	Hila	15	1	11
吹口哨	chuī kǒu shào	assobiar	0	1	13
髒亂	zāng luàn	bagunçado/sujo	0	1	14
拿撒勒	Ná sǎ lè	Nazaré	3	1	23
用來	yòng lái	usado para	0	1	42
擾	rǎo	perturbar	4	1	\N
埃爾納尼	āi ěr nà ní	Ernani	1	1	13
打結	dǎ jié	dar nó	0	1	32
累人	lèi rén	cansativo	0	1	42
問了	wèn le	perguntou	0	1	45
特意	tè yì	de propósito	0	1	44
囑咐	zhǔ fù	instruir	0	1	34
階梯式	jiē tī shì	em escada/gradual	0	1	11
損壞	sǔn huài	danificar	1	1	34
心滿意足	xīn mǎn yì zú	satisfeita	0	1	13
大個子	dà gè zi	grandalhão	0	1	44
勞林多	Láo lín duō	Laurindo	1	1	22
表哥	biǎo gē	primo	2	1	31
巴拉	bā lā	Bala	0	1	11
集體	jí tǐ	coletivo	0	1	23
闖了進來	chuǎng le jìn lái	invadiu entrando	0	1	35
運輸	yùn shū	transporte	0	1	41
不振	bù zhèn	não animado	0	1	44
莫測	mò cè	imprevisíveis	0	1	44
輕輕	qīng qīng	suavemente	0	1	11
水晶	shuǐ jīng	cristal	2	1	31
方塊	fāng kuài	bloco	0	1	14
途中	tú zhōng	durante o percurso	0	1	21
店鋪	diàn pù	loja	0	1	44
發票	fā piào	nota fiscal	0	1	14
SPA	SPA	SPA	0	1	\N
打錯	dǎ cuò	discar errado	0	1	34
做作	zuò zuò	artificial	0	1	44
印度	yìn dù	Índia	0	1	44
奧爾加夫人	Ào ěr jiā fū rén	Senhora Olga	1	1	43
瑪妲	mǎ dá	Marta	1	1	32
桌巾	zhuō jīn	toalha de mesa	0	1	11
丫頭	yā tóu	garota	4	1	12
散步	sàn bù	passear	5	1	44
卡蒂亞	kǎ dì yà	Kátia	10	1	34
好事	hǎo shì	boa ação	2	1	34
家裏	jiā lǐ	casa	1	1	13
問起	wèn qǐ	perguntar sobre	1	1	43
伊爾森	yī ěr sēn	Ielson	1	1	13
寢具	qǐn jù	roupa de cama	1	1	34
窩	wō	to curl up	1	1	\N
來往	lái wǎng	interagir	1	1	23
自言自語	zì yán zì yǔ	falar sozinho	2	1	42
嘰嘰喳喳	jī jī zhā zhā	tagarelar	4	1	11
親戚	qīn qī	parente	4	1	11
晚飯	wǎn fàn	jantar	4	1	34
約好了	yuē hǎo le	combinei	1	1	13
開朗	kāi lǎng	extrovertido	1	1	13
打來	dǎ lái	ligou	2	1	32
氣沖沖	qì chōng chōng	furioso	1	1	41
就是啊	jiù shì a	é mesmo	1	1	44
卡蒂婭	Kǎ dì yǎ	Catia	2	1	34
商品	shāng pǐn	mercadoria	1	1	13
打過	dǎ guò	ligou	4	1	34
這時候	zhè shí hòu	agora	1	1	42
納扎雷	Nà zhā léi	Nazaré	9	1	41
槍戰	qiāng zhàn	tiroteio	5	1	14
比安卡	bǐ ān kǎ	Bianca	31	1	31
差別	chā bié	diferença	1	1	12
姪女	zhí nǚ	sobrinha	14	1	23
街區	jiē qū	quarteirão	5	1	11
餐具	cān jù	utensílios de jantar	2	1	14
維奧萊特	wéi ào lái tè	Violet	23	1	24
老爸	lǎo bà	pai	13	1	34
沙子	shā zi	areia	6	1	15
簽	qiān	assinar	8	1	\N
一整天	yī zhěng tiān	o dia todo	2	1	13
更換	gēng huàn	trocar	1	1	14
飯	fàn	refeição	21	1	\N
特蕾莎	Tè lěi shā	Teresa	37	1	43
目標	mù biāo	alvo	58	1	41
喬爾森	qiáo ěr sēn	Joelson	25	1	23
浴巾	yù jīn	toalha de banho	0	1	41
MICRO	MICRO	micro	0	1	\N
澆水	jiāo shuǐ	regar	0	1	13
潛在	qián zài	potencial	0	1	24
買家	mǎi jiā	comprador	0	1	31
超大的	chāo dà de	enorme	0	1	14
籌碼	chóu mǎ	ficha	0	1	23
不兼容性	bù jiān róng xìng	incompatibilidade	0	1	41
明說	míng shuō	dizer claramente	0	1	21
尼泰羅伊	ní tài luó yī	Niterói	1	1	24
秘密地	mì mì de	secretamente	0	1	44
極點	jí diǎn	extremo	0	1	23
吊	diào	pendurar	0	1	\N
前男友	qián nán yǒu	ex-namorado	0	1	22
拉攏	lā lǒng	cortejar	0	1	13
強硬	qiángyìng	inflexível	0	1	\N
布鲁诺	bù lǔ nuò	Bruno	0	1	43
早起	zǎo qǐ	acordar cedo	1	1	33
破車	pò chē	carro velho	0	1	41
闖進來	chuǎng jìn lái	invadir	0	1	34
部長	bù zhǎng	ministro	0	1	43
逝去	shì qù	passado/desaparecido	0	1	44
完蛋了	wán dàn le	estar acabado	0	1	24
戈米迪	gē mǐ dí	Gomi Di	0	1	13
速	sù	rápido	0	1	\N
口頭禪	kǒu tóu chán	bordão	0	1	32
抱持	bào chí	manter	0	1	42
水平	shuǐ píng	nível	2	1	32
萊伯倫	lái bó lún	Leblon	0	1	22
咖啡館	kā fēi guǎn	cafeteria	0	1	11
多收	duō shōu	cobrar a mais	0	1	11
扛	káng	carregar	0	1	\N
嫌	xián	reclamar	0	1	\N
烤箱	kǎo xiāng	forno	2	1	31
慶幸	qìng xìng	grato/aliviado	0	1	44
諾莎	nuò shā	Nuosha	0	1	41
戈米德	Gē mǐ dé	Gomeade	6	1	13
忠貞不渝	zhōng zhēn bù yú	leal e constante	0	1	11
當我	dāng wǒ	quando eu	0	1	13
不得了	bù dé liǎo	extremamente	0	1	42
會下雨的	huì xià yǔ de	vai chover	0	1	44
想的	xiǎng de	pensado	0	1	35
政變	zhèng biàn	golpe de estado	0	1	44
解決不了	jiě jué bù liǎo	não consegue resolver	0	1	32
19	shí jiǔ	19	2	1	23
更高	gèng gāo	mais alto	0	1	41
重逢	chóng féng	reunir	1	1	22
登上	dēng shàng	subir	2	1	14
文明	wén míng	civilizada	2	1	22
劇院	jù yuàn	teatro	2	1	44
層次	céng cì	nível	1	1	24
高處	gāo chù	lugar alto	1	1	14
X射線	X shè xiàn	raio-X	0	1	54
友善	yǒu shàn	amigável	1	1	34
所說的	suǒ shuō de	o que se diz	1	1	31
還在	hái zài	ainda está	1	1	24
懷了	huái le	engravidei de	5	1	25
打架	dǎ jià	brigar	1	1	34
坐著	zuò zhe	sentado	4	1	45
總有一天	zǒng yǒu yī tiān	um dia	1	1	33
肉餅	ròu bǐng	torta de carne	0	1	43
坦誠	tǎn chéng	sincero	2	1	32
友情	yǒu qíng	amizade	1	1	32
秘書	mì shū	secretário	2	1	41
阿松	ā sōng	Asō	0	1	11
走進	zǒu jìn	entrar	1	1	34
落入	luò rù	cair em	0	1	44
僅僅	jǐn jǐn	apenas	1	1	33
紐莎	niǔ shā	Nyusha	10	1	31
通行證	tōngxíngzhèng	passe	2	1	\N
網中	wǎng zhōng	rede	0	1	31
安於	ān yú	contentar-se com	0	1	12
桑	sāng	senhor	3	1	\N
多的是	duō de shì	há muitas	0	1	15
關上	guān shàng	fechar	3	1	14
阿松桑	ā sōng sāng	Aso-san	5	1	11
需不需要	xū bù xū yào	preciso ou não	0	1	14
樹立	shù lì	estabelecer	0	1	44
上層	shàng céng	camada superior	0	1	42
起得	qǐ dé	levantar	0	1	32
輻射能	fú shè néng	energia de radiação	0	1	24
找找看	zhǎo zhǎo kàn	procurar	0	1	33
換藥	huàn yào	trocar curativo	0	1	44
曝光	bào guāng	expor	4	1	41
泯滅	mǐn miè	extinguir	0	1	34
屋子	wū zi	sala	1	1	15
認養	rèn yǎng	adotar	0	1	43
書店	shū diàn	livraria	4	1	14
最大的	zuì dà de	o maior	1	1	44
提交	tí jiāo	submeter	1	1	21
猛獸	měng shòu	feras	1	1	34
趕走	gǎn zǒu	expulsar	1	1	33
拉蘭熱拉斯	lā lán rè lā sī	Laranjeiras	0	1	12
跟上	gēn shàng	acompanhar	0	1	14
搞點	gǎo diǎn	arranjar um pouco	0	1	33
找點	zhǎo diǎn	encontrar um pouco	0	1	33
暗中	àn zhōng	secretamente	0	1	41
完好無損	wán hǎo wú sǔn	intacto	0	1	23
惹上	rě shàng	provocar/envolver-se em	0	1	34
也會	yě huì	também será	0	1	34
告發	gào fā	denunciar	0	1	41
真實	zhēn shí	verdadeiro	22	1	12
監視	jiān shì	monitorar	7	1	14
小偷	xiǎo tōu	ladrão	0	1	31
瘋瘋癲癲	fēng fēng diān diān	louca	0	1	11
爱	ài	amar	0	1	\N
寄了	jì le	enviei	0	1	45
說得	shuō dé	falar	6	1	12
窮光蛋	qióng guāng dàn	pobre, desgraçado sem dinheiro	1	1	21
諾伊薩	Nuò yī sà	Noisa	2	1	41
企求	qǐ qiú	desejar	0	1	32
接納	jiē nà	aceitar	1	1	14
直說	zhí shuō	falar diretamente	0	1	21
干净	gān jìng	limpo	0	1	14
說辭	shuō cí	argumento	0	1	12
單親	dān qīn	pai ou mãe solteiro	1	1	11
里斯	lì sī	lis (nome)	1	1	41
無非	wú fēi	nada mais que	1	1	21
無知	wú zhī	ignorância	7	1	21
布宜諾斯艾利斯	bù yí nuò sī ài lì sī	Buenos Aires	2	1	42
厚臉皮	hòu liǎn pí	descaramento	1	1	43
離譜	lí pǔ	absurdo	3	1	23
收養	shōu yǎng	adotar	2	1	13
西達	xī dá	Sida	7	1	12
跺腳	duò jiǎo	pisar forte	1	1	43
看出	kàn chū	perceber	10	1	41
烏爾巴諾	wū ěr bā nuò	Urbano	4	1	13
思路	sī lù	linha de pensamento	1	1	14
隱瞞	yǐn mán	esconder	15	1	32
樂子	lè zi	diversão	2	1	45
句話	jù huà	frase	2	1	44
游	yóu	nadar	2	1	\N
旅	lǚ	viagem	14	1	\N
辯駁	biàn bó	rebater	0	1	42
鬥嘴	dòu zuǐ	brigar	0	1	43
無意中	wú yì zhōng	sem querer	0	1	24
拔光	bá guāng	arrancar tudo	0	1	21
廢鐵場	fèi tiě chǎng	ferro-velho	0	1	43
廢金屬	fèi jīn shǔ	sucata de metal	0	1	41
刺破	cì pò	furar	0	1	44
再見了	zài jiàn le	adeus	0	1	44
法克羅	fǎ kè luó	Farrow	0	1	34
旗幟	qí zhì	bandeira	0	1	24
週五	zhōu wǔ	sexta-feira	2	1	13
化為	huà wéi	transformar-se em	0	1	42
趾	zhǐ	dedo do pé	0	1	\N
假釋犯	jiǎ shì fàn	liberdade condicional	0	1	34
雅卡雷帕瓜	yǎ kǎ léi pà guā	Jacarepaguá	0	1	33
開走了	kāi zǒu le	foi embora	0	1	13
去過了	qù guò le	fui	0	1	44
應有盡有	yīng yǒu jìn yǒu	tem tudo que se precisa	1	1	13
斷絕	duàn jué	cortar	0	1	42
半死	bàn sǐ	meio morto	0	1	43
拉法埃拉	lā fǎ āi lā	Rafaella	0	1	13
長高	zhǎng gāo	ficar mais alto	0	1	31
愛撫	ài fǔ	acariciar	0	1	43
高於	gāo yú	superior a	0	1	12
世紀	shì jì	século	1	1	44
書架	shū jià	estante de livros	0	1	14
達瓦	dá wǎ	Dawa	0	1	23
不夠格	bú gòu gé	não estar à altura	0	1	24
相對	xiāng duì	relativo	0	1	14
祖父母	zǔ fù mǔ	avós	0	1	34
膽子	dǎn zi	coragem	0	1	35
嚇唬	xià hu	assustar	0	1	45
單親媽媽	dān qīn mā mā	mãe solteira	0	1	11
說過了	shuō guò le	disse	1	1	14
曉得	xiǎo dé	saber	0	1	32
姿態	zī tài	pose	1	1	14
毛	máo	pelo	3	1	\N
為難	wéi nán	constrangido	1	1	22
追查	zhuī chá	investigar	1	1	12
游泳	yóu yǒng	nadar	2	1	23
沙灘	shā tān	areia da praia	7	1	11
上過床	shàng guò chuáng	dormiram juntos	0	1	44
塵土	chén tǔ	poeira/terra	10	1	23
謙遜	qiān xùn	modéstia	1	1	14
一天天	yī tiān tiān	dia após dia	3	1	11
身為	shēn wéi	sendo	19	1	12
一座	yī zuò	um	35	1	14
我們的	wǒ men de	nosso	7	1	35
嘲諷	cháo fěng	zombar	0	1	23
個性	gè xìng	personalidade	0	1	44
賣掉	mài diào	vender	3	1	44
咄咄逼人	duō duō bī rén	agressivo	0	1	11
美的	měi de	bonito	1	1	35
沒做	méi zuò	não fez	1	1	24
兩回事	liǎng huí shì	duas coisas diferentes	0	1	32
身兼	shēn jiān	acumula	0	1	11
名下	míng xià	em nome de	4	1	24
好幾個	hǎo jǐ gè	vários	1	1	33
雙職	shuāng zhí	dois empregos	0	1	12
抽屜	chōu ti	gaveta	1	1	15
當成	dàng chéng	considerar como	3	1	42
教養	jiào yǎng	educação	2	1	43
紙夾	zhǐ jiā	clipe de papel	0	1	31
日本人	rì běn rén	japonês/japonesa	2	1	43
週日	zhōu rì	domingo	2	1	14
至極	zhì jí	extremo	0	1	42
收斂	shōu liǎn	conter	1	1	13
女武神	nǚ wǔ shén	valquíria	0	1	33
懂得	dǒng dé	saber	3	1	32
旅程	lǚ chéng	viagem	4	1	32
撫摸	fǔ mō	acariciar	0	1	31
週末	zhōu mò	fins de semana	2	1	14
戒指	jiè zhi	anel	3	1	45
沒了	méi le	desapareceu	3	1	25
更好地	gèng hǎo de	melhor	0	1	43
挑戰	tiǎo zhàn	desafio	10	1	34
踢	tī	chutar	17	1	\N
大哉問	dà zāi wèn	grande pergunta	0	1	41
瓦爾基里亞	wǎ ěr jī lǐ yà	Valquíria	2	1	33
他們的	tā men de	deles	2	1	15
那家	nà jiā	aquela	4	1	41
揚	yáng	erguer	7	1	\N
新版	xīn bǎn	nova edição	0	1	13
波赫士	bō hè shì	Borges	0	1	14
布羅迪報告	bù luó dí bào gào	O Relatório de Brodie	0	1	42
常去	cháng qù	frequentar	0	1	24
小忙	xiǎo máng	pequeno favor	0	1	32
退步	tuì bù	regredindo	0	1	44
然後呢	rán hòu ne	e depois	0	1	24
弄丟	nòng diū	perder	2	1	41
正因如此	zhèng yīn rú cǐ	exatamente por isso	2	1	41
按摩	àn mó	massagem	5	1	42
嗤之以鼻	chī zhī yǐ bí	zombar	2	1	11
代理店	dài lǐ diàn	agência	0	1	43
震驚	zhèn jīng	chocada	7	1	41
小桑妮	Xiǎo Sāng Nī	Pequena Sunny	0	1	31
調皮勁兒	tiáo pí jìn er	travessura	0	1	22
敞篷車	chǎng péng chē	carro conversível	0	1	32
嬌氣	jiāo qì	mimado	0	1	14
經紀公司	jīng jì gōng sī	agência	0	1	14
瑪麗尼亞	mǎ lì ní yà	Marínia	1	1	34
沒興趣	méi xìng qù	não ter interesse	0	1	24
看吧	kàn ba	veja	9	1	45
范丁哈	fàn dīng hā	Van Den Haag	0	1	41
破滅	pò miè	desmoronar	0	1	44
自由自在	zì yóu zì zài	livre e despreocupado	0	1	42
軟化	ruǎn huà	amolecer	0	1	34
聞	wén	sentir o cheiro	7	1	\N
搖籃	yáo lán	berço	1	1	22
XAVIER	XAVIER	Xavier	0	1	\N
小屁孩	xiǎo pì hái	pivete	1	1	34
阿里	ā lǐ	Ali	4	1	13
配上	pèi shàng	acompanhado de	0	1	44
獻殷勤	xiàn yīn qín	ser atencioso	0	1	41
有價值	yǒu jià zhí	valioso	0	1	34
東尼奧	dōng ní ào	Antonio	0	1	12
瘟疫	wēn yì	praga	0	1	14
侍從	shì cóng	servo	0	1	42
苦水	kǔ shuǐ	amarguras	0	1	33
情婦	qíng fù	amante	0	1	24
貶義	biǎn yì	pejorativo	0	1	34
試試看	shì shì kàn	experimentar	5	1	44
含義	hán yì	significado	0	1	24
底線	dǐ xiàn	limite	0	1	34
不只	bù zhǐ	não apenas	5	2	43
遭遇	zāo yù	enfrentar	1	1	14
放肆	fàng sì	insolente	2	1	44
物質	wù zhí	material	45	1	42
滿足感	mǎn zú gǎn	sensação de satisfação	1	1	32
實驗	shí yàn	experimento	1	1	24
傻話	shǎ huà	bobagens	1	1	34
拖	tuō	arrastar	2	1	\N
製	zhì	fazer	2	1	\N
品嚐	pǐn cháng	saborear	3	1	32
高貴	gāo guì	nobre	1	1	14
萬迪尼亞	wàn dí ní yà	Vandinia	4	1	42
女傭	nǚ yōng	empregada doméstica	2	1	31
滿腹	mǎn fù	cheio de	1	1	34
奧爾嘉	Ào ěr jiā	Olga	0	1	43
自以為是	zì yǐ wéi shì	presunçoso	4	1	43
怎麼說	zěn me shuō	como dizer	2	1	35
參薯	shēn shǔ	inhame	0	1	13
生子	shēng zǐ	ter filhos	0	1	13
母愛	mǔ ài	amor materno	0	1	34
下樓	xià lóu	descer as escadas	1	1	42
思想	sī xiǎng	pensamento	0	1	13
消化	xiāo huà	digerir	2	1	14
好好地	hǎo hǎo de	bem	1	1	33
可惡	kě wù	odioso, detestável	1	1	34
小小	xiǎo xiǎo	pequeninos	2	1	33
闖入	chuǎng rù	invadir	1	1	34
出氣筒	chū qì tǒng	pêra de desabafo	1	1	14
一旦	yī dàn	uma vez	5	1	14
淪為	lún wéi	reduzida a	0	1	22
例子	lì zi	exemplo	8	1	45
把戲	bǎ xì	truque	2	1	34
影子	yǐng zi	sombra	0	1	35
湧現	yǒng xiàn	surgir	3	1	34
搞錯	gǎo cuò	cometer um erro	5	1	34
半路	bàn lù	meio do caminho	0	1	44
口味	kǒu wèi	sabor	5	1	34
不對	bù duì	errado	21	1	44
嚐	cháng	provar	4	1	\N
差異	chā yì	diferença	2	1	14
受難	shòu nàn	sofrer	0	1	44
品格	pǐn gé	caráter	0	1	32
居高臨下	jū gāo lín xià	condescendente	0	1	11
優越感	yōu yuè gǎn	senso de superioridade	0	1	14
繼母	jì mǔ	madrasta	0	1	43
暢所欲言	chàng suǒ yù yán	falar livremente	0	1	43
開懷大笑	kāi huái dà xiào	rir de coração aberto	0	1	12
說些	shuō xiē	dizer algumas	0	1	11
世故	shì gù	experiente	0	1	44
圓滑	yuán huá	astuto	0	1	22
凡人	fán rén	mortal	0	1	22
往來	wǎng lái	interagir	0	1	32
青睞	qīng lài	favor	0	1	14
當事	dāng shì	quando se trata	0	1	14
體內	tǐ nèi	dentro do corpo	0	1	34
索亞雷斯	Suǒ yà léi sī	Soares	0	1	34
各自	gè zì	cada um	0	1	44
購物中心	gòu wù zhōng xīn	shopping center	8	1	44
旁邊	páng biān	ao lado	2	1	21
小孩子	xiǎo hái zi	criança	4	1	32
自在	zì zài	à vontade	3	1	44
		ponto de interrogação	0	1	\N
糙米	cāo mǐ	arroz integral	0	1	13
冰涼	bīng liáng	gelado	0	1	12
小點心	xiǎo diǎn xīn	lanchinho	0	1	33
這般	zhè bān	assim/desta forma	0	1	41
背部	bèi bù	costas	0	1	44
這兩	zhè liǎng	estes dois	0	1	43
一如	yī rú	assim como	0	1	12
悄悄話	qiāo qiāo huà	segredo	1	1	11
瓦爾基麗亞	wǎ ěr jī lì yà	Valquíria	0	1	33
捅刀	tǒng dāo	esfaquear	0	1	31
煩了	fán le	irritado	0	1	25
但願	dàn yuàn	espero que sim	9	1	44
一萬	yī wàn	dez mil	1	1	14
總比	zǒng bǐ	é melhor que	1	1	33
曹操	cáo cāo	Cao Cao	0	1	21
智能	zhì néng	inteligência	19	1	42
要死	yào sǐ	morrer	0	1	43
親生	qīn shēng	biológico	7	1	11
腦袋瓜	nǎo dài guā	cabeça (coloq.)	0	1	34
心疼	xīn téng	pena, dó	0	1	12
克制	kè zhì	contido	1	1	44
你在不在	nǐ zài bù zài	se você está ou não	0	1	34
倒流	dào liú	fluir para trás	0	1	42
圈子	quān zi	círculo	0	1	15
犯	fàn	cometer	18	1	\N
生活方式	shēng huó fāng shì	estilo de vida	0	1	12
錄取	lù qǔ	ser admitido	0	1	43
疼愛	téng ài	amar, adorar	1	1	24
TELECATCH	TELECATCH	TELECATCH	0	1	\N
犯規	fàn guī	cometer falta	1	1	41
岌岌可危	jí jí kě wēi	perigo iminente	0	1	22
富爾塔多	fù ěr tǎ duō	Furtado	3	1	43
表象	biǎo xiàng	aparência	0	1	34
延長	yán cháng	prolongar	5	1	22
歡愉	huān yú	alegria	0	1	12
不小心	bù xiǎo xīn	sem querer	0	1	43
輩	bèi	tipo, laia	6	1	\N
忽略了	hū lüè le	ignorei	0	1	14
故	gù	razão	37	1	\N
一家之主	yī jiā zhī zhǔ	chefe da família	0	1	11
此時此刻	cǐ shí cǐ kè	neste exato momento	0	1	32
裡了	lǐ le	dentro	0	1	35
規	guī	regra	24	1	\N
環境	huán jìng	ambiente	3	1	24
薄弱	bó ruò	fraca	0	1	24
圍欄	wéi lán	cerca	0	1	22
涼快	liáng kuai	fresco	0	1	25
人工智慧	rén gōng zhì huì	inteligência artificial	0	1	21
流氓	liú máng	desonesto/vagabundo	0	1	22
遊走性	yóu zǒu xìng	errante	0	1	23
小索妮娜	xiǎo suǒ nī nà	pequena Sonina	1	1	33
帶有	dài yǒu	carrega/possui	1	1	43
晉級	jìn jí	avançar	5	1	42
認可	rèn kě	aprovação	6	1	43
過去了	guò qù le	passou	2	1	44
價值觀	jià zhí guān	valores	2	1	42
日漸	rì jiàn	gradualmente	1	1	44
似的	shì de	como se	6	1	45
一百萬	yī bǎi wàn	um milhão	1	1	13
奇卡	qí kǎ	Chica	4	1	23
真愛	zhēn ài	amor verdadeiro	1	1	14
疼痛	téng tòng	dor	1	1	24
否定	fǒu dìng	negar	3	1	34
盤子	pán zi	prato	2	1	25
盡量	jǐn liàng	o máximo possível	3	1	34
來説	lái shuō	dizer	4	1	21
你家	nǐ jiā	sua casa	2	1	31
濫用了	làn yòng le	abusou	1	1	44
無價	wú jià	inestimável	2	1	24
抓狂	zhuā kuáng	enlouquecer	0	1	12
心痛	xīn tòng	coração partido	0	1	14
我經常	wǒ jīng cháng	eu frequentemente	0	1	31
小安東尼奧	xiǎo ān dōng ní ào	pequeno Antonio	0	1	31
迷失者	mí shī zhě	pessoa perdida	0	1	21
說起	shuō qǐ	falar sobre	0	1	13
羞恥	xiū chǐ	vergonha	10	1	13
一億	yī yì	cem milhões	0	1	14
珍愛	zhēn ài	precioso	0	1	14
沸騰	fèi téng	ferver	0	1	42
薄	báo	fina	0	1	\N
毫不猶豫	háo bù yóu yù	sem hesitação	0	1	24
發飆	fā biāo	ficar furioso	0	1	11
協議書	xié yì shū	contrato	0	1	24
重啟	chóng qǐ	reiniciar	0	1	23
理論上	lǐ lùn shàng	teoricamente	0	1	34
受到了	shòu dào le	recebeu	0	1	44
紛爭	fēn zhēng	conflito, disputa	0	1	11
跌倒	diē dǎo	cair	0	1	13
吾	wú	nosso	0	1	\N
芋頭	yù tóu	inhame/taro	0	1	42
娜薩雷	nà sà léi	Nassare	0	1	44
做功課	zuò gōng kè	fazer lição de casa	0	1	41
腐爛	fǔ làn	podre	0	1	34
大嬸	dà shěn	senhora	0	1	43
撞見	zhuàng jiàn	encontrar por acaso	0	1	44
之情	zhī qíng	sentimento	0	1	12
腐壞	fǔ huài	apodrecer	0	1	34
雀躍	què yuè	saltar de alegria	0	1	44
手掌心	shǒu zhǎng xīn	palma da mão	1	1	33
直覺	zhí jué	intuição	9	1	22
大錯特錯	dà cuò tè cuò	completamente errado	1	1	44
充分	chōng fèn	pleno	2	1	14
被冒犯了	bèi mào fàn le	ofendida	0	1	44
開放	kāi fàng	aberta	5	1	14
英俊	yīng jùn	bonito	6	1	14
癢	yǎng	coceira	1	1	\N
味道	wèi dào	sabor/cheiro	8	1	44
前妻	qián qī	ex-esposa	1	1	21
袖手旁觀	xiù shǒu páng guān	ficar de braços cruzados	0	1	43
容許	róng xǔ	permitir	0	1	23
無盡的	wú jìn de	infinito	0	1	24
訓斥	xùn chì	repreender	1	1	44
這件	zhè jiàn	este	2	1	44
虐待	nüè dài	abuso	0	1	44
奮鬥	fèn dòu	lutar	25	1	44
為榮	wéi róng	orgulhar-se	1	1	22
優勢	yōu shì	vantagem	0	1	14
可別	kě bié	não deve	1	1	32
崇拜	chóng bài	admiração	2	1	24
羞辱	xiū rǔ	humilhar	3	1	13
熟悉	shú xī	familiar	1	1	21
特殊	tè shū	especial	2	1	41
最糟	zuì zāo	pior	1	1	41
真摯	zhēn zhì	sincero	1	1	14
不出	bù chū	não sair	2	1	41
受用	shòu yòng	aproveitar	17	1	44
樁	zhuāng	caso	3	1	\N
缺陷	quē xiàn	defeito	0	1	14
機構	jī gòu	instituição	6	1	14
乖乖牌	guāi guāi pái	pessoa obediente/comportada	0	1	11
演講稿	yǎn jiǎng gǎo	rascunho do discurso	0	1	33
展現	zhǎn xiàn	mostrar/exibir	21	1	34
出入	chū rù	entrar e sair	0	1	14
練習	liàn xí	exercício	3	1	42
基本	jī běn	básico	0	1	13
皮	pí	casca	5	1	\N
頭痛	tóu tòng	dor de cabeça	4	1	24
禮儀	lǐ yí	etiqueta	0	1	32
界限	jiè xiàn	limite	4	1	44
批評	pī píng	criticar	5	1	12
不安全感	bù ān quán gǎn	insegurança	2	1	41
作祟	zuò suì	agir	0	1	44
母獅	mǔ shī	leoa	0	1	31
莫雷蒂	mò léi dì	Moretti (sobrenome)	2	1	42
放射治療	fàng shè zhì liáo	radioterapia	1	1	44
你媽的	nǐ mā de	sua mãe	0	1	31
小丫頭	xiǎo yā tóu	garotinha	0	1	31
小孩子們	xiǎo hái zi men	crianças	0	1	32
瓦爾基麗雅	wǎ ěr jī lì yǎ	Valquíria	0	1	33
玩吧	wán ba	brincar	0	1	25
合不來	hé bù lái	não se dar bem	0	1	24
南瓜	nán guā	abóbora	3	1	21
分行	fēn háng	filial	0	1	12
視如己出	shì rú jǐ chū	tratar como se fosse seu próprio filho	0	1	42
說句實在話	shuō jù shí zài huà	falando a verdade	0	1	14
清清楚楚	qīng qīng chǔ chǔ	claramente	1	1	11
牽涉	qiān shè	envolvido	1	1	14
聞到	wén dào	cheirar (perceber pelo olfato)	2	1	24
為政	wéi zhèng	governar	0	1	24
跳出來	tiào chū lái	aparecer	0	1	41
分清楚	fēn qīng chǔ	distinguir claramente	0	1	11
活命	huó mìng	permanecer vivo	0	1	24
庸俗	yōng sú	vulgar	0	1	12
可鄙	kě bǐ	desprezível	0	1	33
照做	zhào zuò	seguir as instruções	0	1	44
承受著	chéng shòu zhe	suportando	0	1	24
倉促間	cāng cù jiān	às pressas	0	1	14
做主	zuò zhǔ	decidir	0	1	43
聊聊天	liáo liáo tiān	conversar	0	1	22
路易辛奧	lù yì xīn ào	Luizinho	0	1	44
鬆	sōng	relaxar	0	1	\N
最小化	zuì xiǎo huà	minimizar	0	1	43
無所	wú suǒ	não ter nada para	0	1	23
採用	cǎi yòng	adotar	0	1	34
政策	zhèng cè	política	0	1	44
頂	dǐng	topo	1	1	\N
男爵	nán jué	barão	0	1	22
鴕鳥	tuó niǎo	avestruz	0	1	23
這個樣子	zhè ge yàng zi	deste jeito	0	1	45
既定	jì dìng	estabelecido	0	1	44
房地產	fáng dì chǎn	imóvel, propriedade	0	1	24
圈套	quān tào	armadilha	0	1	14
每分鐘	měi fēn zhōng	cada minuto	0	1	31
爆炸	bào zhà	explodir	2	1	44
活該	huó gāi	merecido	1	1	21
送給	sòng gěi	dar para	1	1	43
八卦	bā guà	fofoca	2	1	14
危及	wēi jí	ameaçar	1	1	12
紅牌	hóng pái	cartão vermelho	0	1	22
永久	yǒng jiǔ	permanente	3	1	33
獨居	dú jū	viver sozinho	0	1	21
何必	hé bì	por que	1	1	24
優先事項	yōu xiān shì xiàng	prioridades	1	1	11
不快	bù kuài	infelicidade	0	1	44
埃德加	Āi dé jiā	Edgar	9	1	12
臉龐	liǎn páng	rosto	1	1	32
意大利	yì dà lì	Itália	1	1	44
留給	liú gěi	deixar para	2	1	23
坐在	zuò zài	sentar-se	6	1	44
權衡	quán héng	ponderar	0	1	22
一點一滴	yī diǎn yī dī	pouco a pouco	0	1	13
停職	tíng zhí	suspensão	4	1	22
演戲	yǎn xì	atuando	1	1	34
變成了	biàn chéng le	tornou-se	1	1	42
還清	huán qīng	quitar	2	1	21
團結	tuán jié	unida	19	1	22
經紀人	jīng jì rén	corretor, agente	1	1	14
表明	biǎo míng	indicar	2	1	32
債	zhài	dívida	4	1	\N
大馬路	dà mǎ lù	rua principal	5	1	43
鬧事	nào shì	causar problemas	1	1	44
露出	lù chū	revelar	1	1	41
EDGAR	EDGAR	EDGAR	26	1	\N
同情	tóng qíng	ter pena	10	1	22
沒能	méi néng	não conseguiu	3	1	22
床單	chuáng dān	lençol	5	1	21
移居	yí jū	mudar-se para	0	1	21
土	tǔ	terra	10	1	\N
親密	qīn mì	íntimo	7	1	14
獨立性	dú lì xìng	independência	0	1	24
鬧劇	nào jù	farsa	5	1	44
明確	míng què	claro, definido	3	1	24
隱私	yǐn sī	privacidade	0	1	31
職	zhí	vocação	1	1	\N
笑容	xiào róng	sorriso	3	1	42
話說	huà shuō	por assim dizer	0	1	41
電台	diàn tái	estação de rádio	1	1	42
心懷感激	xīn huái gǎn jī	estar agradecido	0	1	12
涼爽	liáng shuǎng	fresco e agradável	0	1	23
放回	fàng huí	colocar de volta	0	1	42
坦率	tǎn shuài	franco	0	1	34
無視	wú shì	ignorar	1	1	24
可憐蟲	kě lián chóng	coitadinho	0	1	32
眼淚	yǎn lèi	lágrimas	0	1	34
擦乾	cā gān	enxugar	0	1	11
塗滿	tú mǎn	coberto de tinta	0	1	23
鋼琴師	gāng qín shī	pianista	0	1	12
瞧不起	qiáo bù qǐ	desprezar	0	1	24
趕了出去	gǎn le chū qù	expulsou	0	1	35
報應	bào yìng	retribuição/karma	0	1	44
飛快	fēi kuài	extremamente rápido	0	1	14
鋼琴家	gāng qín jiā	pianista	0	1	12
王冠	wáng guān	coroa	1	1	21
不甘心	bù gān xīn	não se conformar	0	1	41
巴不得	bā bù dé	mal posso esperar	0	1	14
稀巴爛	xī bā làn	em pedaços	0	1	11
有一天	yǒu yī tiān	um dia	0	1	31
大發	dà fā	dar largas a	0	1	41
亂跑	luàn pǎo	sair correndo por aí	0	1	43
防止	fáng zhǐ	prevenir	0	1	23
見解	jiàn jiě	perspectiva	0	1	43
扔掉	rēng diào	jogar fora	2	1	14
火上加油	huǒ shàng jiā yóu	adicionar lenha na fogueira	0	1	34
高傲	gāo ào	arrogante	0	1	14
並沒有	bìng méi yǒu	não	4	1	42
甩	shuǎi	atirar	0	1	\N
窮人	qióng rén	pobre	0	1	22
打拼	dǎ pīn	batalhar	0	1	31
愷奧	kǎi ào	recusa de Ciao	0	1	34
大費周章	dà fèi zhōu zhāng	dar-se a tanto trabalho	0	1	44
明智	míng zhì	sábio	1	1	24
徘徊	pái huái	vaguear/andar sem rumo	0	1	22
出手	chū shǒu	agir	0	1	13
壓垮	yā kuǎ	esmagar	0	1	13
駱駝	luò tuó	camelo	0	1	42
購物車	gòu wù chē	carrinho de compras	0	1	44
頭緒	tóu xù	pista	0	1	24
外婆	wài pó	avó materna	0	1	42
嚇壞	xià huài	assustar muito	0	1	44
心神不寧	xīn shén bù níng	perturbado	0	1	12
D	D	D	1	1	\N
找回	zhǎo huí	recuperar	0	1	32
分錢	fēn qián	centavo	0	1	12
女巫	nǚ wū	bruxa	0	1	31
姿勢	zī shì	postura	0	1	14
彬彬有禮	bīn bīn yǒu lǐ	cortês/polido	0	1	11
刻板	kè bǎn	estereotipado	0	1	43
以免	yǐ miǎn	para evitar	0	1	33
可恨	kě hèn	odioso	0	1	34
未遂	wèi suì	tentado	2	1	44
壓根	yā gēn	completamente	0	1	11
第一夫人	dì yī fū rén	primeira-dama	0	1	41
沒睡	méi shuì	não dormido	0	1	24
待命	dài mìng	de prontidão	0	1	44
驚慌失措	jīng huāng shī cuò	em pânico	0	1	11
寶貝們	bǎo bèi men	queridos	0	1	34
輕聲細語	qīng shēng xì yǔ	voz suave e palavras gentis	0	1	11
無助	wú zhù	desamparado	2	1	24
臉孔	liǎn kǒng	rosto	0	1	33
萊奧	Lái ào	Leo	0	1	24
無能	wú néng	incompetente	1	1	22
之日	zhī rì	o dia	0	1	14
怎麼回事	zěn me huí shì	que história é essa	1	1	35
二手	èr shǒu	segunda mão	0	1	43
幫幫	bāng bāng	ajude	2	1	11
機械	jī xiè	mecânico	0	1	14
一臉	yī liǎn	com uma cara de	2	1	13
反而	fǎn ér	pelo contrário	1	1	32
老天爺	lǎo tiān yé	Deus	2	1	31
理所當然	lǐ suǒ dāng rán	naturalmente	1	1	33
原理	yuán lǐ	princípio	0	1	23
大叔	dà shū	tio	3	1	41
票	piào	bilhete	6	1	\N
VIOLETA	VIOLETA	violeta	1	1	\N
打死	dǎ sǐ	matar à tiros	2	1	33
表妹	biǎo mèi	prima	1	1	34
繆斯	miù sī	musa	5	1	41
試看	shì kàn	experimentar para ver	1	1	44
送達	sòng dá	entregar	1	1	42
床頭櫃	chuáng tóu guì	criado-mudo	0	1	22
裝備	zhuāng bèi	equipar	1	1	14
確保	què bǎo	garantir	12	1	43
莫	mò	não	6	1	\N
從現在開始	cóng xiàn zài kāi shǐ	a partir de agora	0	1	24
注視	zhù shì	olhar fixamente	2	1	44
珍貴	zhēn guì	valioso	2	1	14
撞上	zhuàng shàng	colidir com	0	1	44
稻草	dào cǎo	palha	2	1	43
發光	fā guāng	brilhar	2	1	11
大賽	dà sài	grande competição	0	1	44
沒有辦法	méi yǒu bàn fǎ	não ter jeito	0	1	23
推遲	tuī chí	adiar	0	1	12
当然	dāng rán	claro	0	1	12
回覆了	huí fù le	respondeu	0	1	24
多拉利斯	duō lā lì sī	Dolores	0	1	11
瑪德蓮	mǎ dé lián	Madalena	0	1	32
吵過架	chǎo guò jià	brigamos	0	1	34
當真	dàng zhēn	levar a sério	0	1	41
氣瘋	qì fēng	enlouquecer de raiva	0	1	41
挺著	tǐng zhe	empinando/estufando	0	1	35
不動	bù dòng	não mexer	0	1	44
玻璃心	bō li xīn	coração de vidro	0	1	15
朵娜	duǒ nà	Dona	0	1	34
可憐兮兮	kě lián xī xī	lastimável	0	1	32
年年	nián nián	todo ano	0	1	22
面具	miàn jù	máscara	1	1	44
之輩	zhī bèi	indivíduo	0	1	14
洋裝	yáng zhuāng	vestido	1	1	21
哼唱中	hēng chàng zhōng	cantarolando	0	1	14
畫作	huà zuò	pintura	1	1	44
草圖	cǎo tú	esboço	0	1	32
埋伏	mái fú	emboscada	0	1	22
走狗	zǒu gǒu	capacho	0	1	33
立場	lì chǎng	posição	0	1	43
費事	fèi shì	trabalhoso	0	1	44
有請	yǒu qǐng	convidar	0	1	33
顯得	xiǎn dé	parecer	1	1	32
您了	nín le	você (partícula)	0	1	25
供應	gōng yìng	fornecimento	0	1	14
一來	yī lái	de uma vez	2	1	12
回聲繚繞	huí shēng liáo rào	eco que reverbera	0	1	21
小不點	xiǎo bù diǎn	pontinho	1	1	34
麻木不仁	má mù bù rén	insensível	0	1	24
嚇人	xià rén	assustador	0	1	42
塔尼亞	tǎ ní yà	Tânia	0	1	32
盡我所能	jìn wǒ suǒ néng	fazer o meu melhor	0	1	43
報名	bào míng	inscrição	0	1	42
下個	xià gè	próximo	1	1	44
逃跑	táo pǎo	fugir	9	1	23
哨聲	shào shēng	apito	3	1	41
保拉夫人	bǎo lā fū rén	senhora Paula	0	1	31
低地	dī dì	terras baixas	0	1	14
不幸的是	bù xìng de shì	infelizmente	0	1	44
拆解	chāi jiě	desmontado	0	1	13
Bonjour	Bonjour	olá (francês)	0	1	\N
安東尼奧	ān dōng ní ào	Antônio	0	1	11
派上用場	pài shàng yòng chǎng	ser útil	0	1	44
既然如此	jì rán rú cǐ	já que é assim	0	1	42
潛力	qián lì	potencial	3	1	24
苦惱	kǔ nǎo	angústia	0	1	33
亦	yì	também	0	1	\N
哭花	kū huā	chorar até a maquiagem escorrer	0	1	11
妝	zhuāng	maquiagem	0	1	\N
危害	wēi hài	prejudicar	0	1	14
JUNTOS	JUNTOS	juntos	0	1	\N
歷史性	lì shǐ xìng	histórico	0	1	43
一絲不苟的人	yī sī bù gǒu de rén	pessoa meticulosa	0	1	11
悄悄	qiāo qiāo	silenciosamente	0	1	11
狂歡者	kuáng huān zhě	folião	0	1	21
緊密	jǐn mì	próximo, íntimo	1	1	34
衝到了	chōng dào le	correu para	0	1	14
共度	gòng dù	passar juntos	1	1	44
座無虛席	zuò wú xū xí	lotado (sem assentos vazios)	0	1	42
ACT	ACT	ACT	1	1	\N
唉呀	āi yā	ah/oh	1	1	11
聽起來	tīng qǐ lái	soar	4	1	13
不確定	bù què dìng	não tenho certeza	2	1	44
早日	zǎo rì	cedo	0	1	34
合得來	hé de lái	se dar bem	2	1	25
女士們	nǚ shì men	senhoras	4	1	34
祢	nǐ	você (formal)	5	1	\N
儲蓄	chǔ xù	poupança	5	1	34
項目	xiàng mù	projeto	10	1	44
信念	xìn niàn	crença	1	1	44
開支	kāi zhī	despesas	1	1	11
貸款	dài kuǎn	empréstimo	1	1	43
截止	jié zhǐ	encerrar	2	1	23
河邊	hé biān	beira do rio	0	1	21
超好	chāo hǎo	super boa	3	1	13
綁	bǎng	amarrados	3	1	\N
這事	zhè shì	isso	0	1	44
不高興	bù gāo xìng	infeliz/descontente	1	1	41
嘉年華會	jiā nián huá huì	carnaval	1	1	12
下一場	xià yī chǎng	próxima sessão	1	1	41
藐視	miǎo shì	desprezar	0	1	34
跡象	jī xiàng	sinal	1	1	14
主見	zhǔ jiàn	opinião própria	0	1	34
一年	yī nián	um ano	2	1	12
戲劇化	xì jù huà	dramático	1	1	44
馬鈴薯	mǎ líng shǔ	batata	7	1	32
零件	líng jiàn	peças	12	1	24
砰	pēng	bang	3	1	\N
氣死	qì sǐ	irritar até a morte	0	1	43
帶球	dài qiú	conduzir a bola	0	1	42
不敬	bú jìng	desrespeito	0	1	24
摘出來	zhāi chū lái	isolar/extrair	0	1	11
訂購	dìng gòu	encomendar	2	1	44
傾訴	qīng sù	desabafar	4	1	14
歌曲	gē qǔ	música	2	1	13
鎖著	suǒ zhe	trancada	0	1	35
商量	shāng liáng	discutir	2	1	12
定義	dìng yì	definição	10	1	44
窗口	chuāng kǒu	janela	0	1	13
更糟	gèng zāo	pior	0	1	41
強悍	qiáng hàn	forte	0	1	24
一如往常	yī rú wǎng cháng	como de costume	0	1	12
我的天	wǒ de tiān	meu deus	0	1	35
醫生們	yī shēng men	médicos	0	1	11
嚇死人	xià sǐ rén	assustador	0	1	43
還擊	huán jī	revidar	0	1	21
護航	hù háng	escoltar	0	1	42
籌款	chóu kuǎn	arrecadar fundos	0	1	23
子民	zǐ mín	povo	0	1	32
敬拜	jìng bài	adorar	1	1	44
侄女	zhí nǚ	sobrinha	2	1	23
奇柯	Qí kē	Chico	0	1	21
炸掉	zhà diào	explodir	0	1	44
奪冠	duó guàn	ganhar o campeonato	0	1	24
出彩	chū cǎi	destacar-se	0	1	13
願意的話	yuàn yì de huà	quiser	0	1	44
即興	jí xìng	improvisado	0	1	24
而戰	ér zhàn	lutar	0	1	24
聽得懂	tīng dé dǒng	entende (ao ouvir)	1	1	12
揮霍	huī huò	esbanjar	0	1	14
餘地	yú dì	margem	0	1	24
派人	pài rén	enviar alguém	0	1	42
聽說了	tīng shuō le	ouvi dizer	0	1	11
沒法	méi fǎ	não ter como	0	1	23
分鐘後	fēn zhōng hòu	minutos depois	0	1	11
告白	gào bái	confissão	1	1	42
冠軍	guàn jūn	campeão	6	1	41
出身	chū shēn	origem	0	1	11
根源	gēn yuán	raiz	0	1	12
耗盡	hào jìn	esgotar	0	1	44
針	zhēn	agulha	0	1	\N
最深處	zuì shēn chù	mais profundo	1	1	41
劍	jiàn	espada	0	1	\N
侵犯	qīn fàn	violação	0	1	14
燙	tàng	quente	0	1	\N
瓦爾基麗婭	wǎ ěr jī lì yǎ	Valquíria	1	1	33
委託	wěi tuō	comissão	3	1	31
年邁	nián mài	idoso	0	1	24
童謠	tóng yáo	cantiga infantil	0	1	22
唱的	chàng de	cantada	0	1	45
由此	yóu cǐ	por aqui	0	1	23
住宿	zhù sù	hospedando	0	1	44
內斂	nèi liǎn	introvertido	0	1	43
火災	huǒ zāi	incêndio	0	1	31
沒一刻	méi yī kè	nem um momento	0	1	21
誤報	wù bào	falso alarme	0	1	44
起誓	qǐ shì	fazer um juramento	0	1	34
籌	chóu	angariar	0	1	\N
利息	lì xī	juros	0	1	41
所料	suǒ liào	esperado	0	1	34
難搞	nán gǎo	difícil de lidar	0	1	23
加上	jiā shàng	adicionar	0	1	14
破壞性	pò huài xìng	destrutivo	0	1	44
驚嚇	jīng xià	susto	0	1	14
告解室	gào jiě shì	confessionário	0	1	43
安東內利	ān dōng nèi lì	Antonelli	0	1	11
些什麼	xiē shén me	o quê	0	1	12
守	shǒu	obedecer	17	1	\N
新聞	xīn wén	notícia	3	1	12
時裝秀	shí zhuāng xiù	desfile de moda	2	1	21
一樁	yī zhuāng	um caso	1	1	11
時鐘	shí zhōng	relógio	24	1	21
穩定	wěn dìng	estável	4	1	34
特別的	tè bié de	especial	2	1	42
弗朗西斯科	fú lǎng xī sī kē	Francisco	28	1	23
掉以輕心	diào yǐ qīng xīn	descuidar	0	1	43
插進	chā jìn	inserir	0	1	14
錯過了	cuò guò le	perdeu	0	1	44
償還	cháng huán	pagar	6	1	22
尖	jiān	ponta	2	1	\N
規矩	guī jǔ	regras	1	1	13
渺小	miǎo xiǎo	insignificante	1	1	33
放開	fàng kāi	soltar	6	1	41
滾開	gǔn kāi	sair, cair fora	5	1	31
開銷	kāi xiāo	despesas	2	1	11
火辣	huǒ là	picante/apimentado	1	1	34
異想天開	yì xiǎng tiān kāi	ter ideias mirabolantes	0	1	43
冒了	mào le	arriscou	0	1	45
欣賞	xīn shǎng	admirar	3	1	13
開啟	kāi qǐ	abrir	3	1	13
花娜	huā nà	Hana	1	1	14
大顯身手	dà xiǎn shēn shǒu	mostrar toda a sua habilidade	5	1	43
僅此而已	jǐn cǐ ér yǐ	só isso	7	1	33
從小	cóng xiǎo	desde criança	2	1	23
天父	tiān fù	Pai Celestial	2	1	14
產品	chǎn pǐn	produto	3	1	33
無故	wú gù	sem motivo	1	1	24
擊球手	jī qiú shǒu	rebatedor	1	1	12
佩雷拉	pèi léi lā	Pereira (nome próprio)	8	1	42
突如其來	tū rú qí lái	inesperado	0	1	12
傑米	jié mǐ	Jamie	7	1	23
伏擊	fú jī	emboscada	0	1	21
獲勝	huò shèng	vencer	5	1	44
花費	huā fèi	gastos	6	1	14
把握	bǎ wò	aproveitar	22	1	34
新來的	xīn lái de	recém-chegado	0	1	12
屈辱	qū rǔ	humilhante	1	1	13
深處	shēn chù	profundezas	6	1	14
緣	yuán	causa	18	1	\N
惡劣的	è liè de	severo	0	1	44
雖	suī	embora	11	1	\N
全盤托出	quán pán tuō chū	revelar completamente	0	1	22
事兒	shì er	assunto	3	1	45
特雷莎	tè léi shā	Teresa	0	1	42
杰森	jié sēn	Jason	0	1	21
乳霜	rǔ shuāng	creme	0	1	31
雙腳	shuāng jiǎo	dois pés	0	1	13
追及	zhuī jí	alcançar	0	1	12
維奧萊特夫人	wéi ào lái tè fū rén	Senhora Violet	1	1	24
群人	qún rén	grupo de pessoas	0	1	22
逆轉勝	nì zhuǎn shèng	vitória virada	0	1	43
佩服	pèi fú	admirar	0	1	42
回聲般的聲音	huí shēng bān de shēng yīn	voz ecoante	0	1	21
小個子	xiǎo gè zi	baixinho	5	1	34
舅舅	jiù jiu	tio	0	1	45
林哥	lín gē	Ringo	0	1	21
聽話	tīng huà	obediente	0	1	14
使徒	shǐ tú	apóstolos	1	1	32
連理	lián lǐ	casamento	0	1	23
正派	zhèng pài	decente	0	1	44
告解	gào jiě	confissão	1	1	43
跪下	guì xià	ajoelhar	0	1	44
演奏	yǎn zòu	tocar (instrumento)	7	1	34
對抗	duì kàng	confrontar	0	1	44
教籍	jiào jí	membresia eclesiástica	0	1	42
路線	lù xiàn	rota	1	1	44
內心	nèi xīn	interior	13	1	41
資本	zī běn	capital	0	1	13
消失了	xiāo shī le	desapareceu	0	1	11
幾十年	jǐ shí nián	décadas	0	1	32
威爾遜	Wēi ěr xùn	Wilson	0	1	13
字母	zì mǔ	letra	0	1	43
出庭	chū tíng	comparecer em tribunal	0	1	12
地球	dì qiú	Terra	0	1	42
順序	shùn xù	ordem	0	1	44
管風琴	guǎn fēng qín	órgão	0	1	31
序列	xù liè	sequência	0	1	44
航班	háng bān	voo	3	1	21
羅馬	luó mǎ	Roma	13	1	23
撒手不管	sā shǒu bù guǎn	lavar as mãos	0	1	13
轟	hōng	estrondo	0	1	\N
通向	tōng xiàng	conduzir a	0	1	14
只不過	zhǐ bù guò	apenas	1	1	34
熱浪	rè làng	onda de calor	1	1	44
看見	kàn jiàn	ver	24	1	44
爭	zhēng	disputar	5	1	\N
來襲	lái xí	atacar	1	1	22
盒子	hé zi	caixa	4	1	25
滿口	mǎn kǒu	boca cheia	0	1	33
辭職	cí zhí	demitir-se	6	1	22
胡言	hú yán	bobagem	0	1	22
跨越	kuà yuè	atravessar	0	1	44
永世	yǒng shì	eternidade	0	1	34
——	——	travessão	1	1	\N
Belisa	Bēilìsā	Belisa	1	1	\N
拖鞋	tuō xié	chinelo	0	1	12
收穫	shōu huò	ganho	0	1	14
衣櫥	yī chú	guarda-roupa	1	1	12
康妮	kāng nī	Connie	0	1	11
拉羅卡	Lā luó kǎ	La Rocca	1	1	12
鬼地方	guǐ dì fāng	lugar horrível	0	1	34
皮草	pí cǎo	casaco de pele	1	1	23
明媚	míng mèi	radiante	0	1	24
邁阿密	mài ā mì	Miami	0	1	41
把柄	bǎ bǐng	cabo/alça (fig. ponto fraco)	0	1	33
淘汰	táo tài	eliminar	0	1	24
芝加哥	zhī jiā gē	Chicago	0	1	11
貂皮	diāo pí	pele de marta	1	1	12
見識	jiàn shí	testemunhar	7	1	42
走錯了	zǒu cuò le	errou o caminho	0	1	34
彎路	wān lù	desvios	0	1	14
高速公路	gāo sù gōng lù	rodovia	0	1	14
超車	chāo chē	ultrapassar	0	1	11
黑道	hēi dào	mundo do crime	0	1	14
大人物	dà rén wù	figura importante	0	1	42
拉洛卡	Lā Luò Kǎ	Larroca	1	1	14
遠遠	yuǎn yuǎn	muito	0	1	33
身手	shēn shǒu	habilidades	0	1	13
地獄	dì yù	inferno	21	1	44
德洛麗斯	Dé luò lì sī	Dolores	5	1	24
竊竊私語	qiè qiè sī yǔ	sussurrar	1	1	44
開庭	kāi tíng	abrir sessão (tribunal)	2	1	12
德洛里斯	dé luò lǐ sī	Dolores	2	1	24
陽光	yáng guāng	luz do sol	5	1	21
按	àn	de acordo com	3	1	\N
貝莉絲	Bèi Lǐ Sī	Beilisi	28	1	43
活下去	huó xià qù	continuar vivendo	1	1	24
恥辱	chǐ rǔ	humilhação	0	1	33
國際	guó jì	internacional	1	1	24
才華	cái huá	talento	1	1	22
早該	zǎo guāi	deveria ter	0	1	31
的印象	de yǐn xiàng	impressão	0	1	53
整合	zhěng hé	integrar	0	1	32
鐵諷	tiě fěng	ironia cruel	1	1	33
妳們	nǐ men	vocês	0	1	35
沒見過	méi jiàn guò	não vi	0	1	24
米歇爾	mǐ xiē ěr	Michelle	0	1	31
傳來	chuán lái	enviou	0	1	22
蒂娜	dì nà	Tina	0	1	44
相反	xiāng fǎn	oposto	9	1	13
薩瑟	sà sè	Suther	2	1	44
盡一切努力	jìn yī qiè nǔ lì	fazer todos os esforços	0	1	41
肅靜	sù jìng	silêncio	0	1	44
艾迪	ài dí	Eddie	3	1	42
勿	wù	não	1	1	\N
轟飛	hōng fēi	explodir para longe	0	1	11
索瑟	suǒ sè	Sosse	4	1	34
日落	rì luò	pôr do sol	0	1	44
然而	rán ér	no entanto	19	1	22
樓上	lóu shàng	andar de cima	3	1	24
歌手	gē shǒu	cantor	1	1	13
吸煙	xī yān	fumar	1	1	11
不在乎	bù zài hu	não se importa	7	1	44
昨晚	zuó wǎn	noite passada	2	1	23
感激	gǎn jī	grato	2	1	31
中尉	zhōng wèi	tenente	4	1	14
鞏固	gǒng gù	consolidar	0	1	34
矩	jǔ	esquadro	0	1	\N
錄影帶	lù yǐng dài	fita de vídeo	1	1	43
惡	è	maldade	25	1	\N
舉	jǔ	ato	8	1	\N
雷諾	léi nuò	Reno	9	1	24
錄音帶	lù yīn dài	fitas cassete	0	1	41
Madá	Madá	Madá	9	1	\N
難看	nán kàn	feio	3	1	24
洞穴	dòng xué	caverna	1	1	42
指證	zhǐ zhèng	incriminar	0	1	34
文斯	wén sī	Vince	35	1	21
牢裡	láo lǐ	prisão	0	1	23
克拉倫斯	kè lā lún sī	Clarence	32	1	41
恰恰	qià qià	exatamente	6	1	44
作證	zuò zhèng	testemunhar	2	1	44
德洛麗絲	dé luò lì sī	Dolores	23	1	24
凱奧	kǎi ào	Kao	31	1	34
算是	suàn shì	pode-se considerar	2	1	44
深表	shēn biǎo	expressar profundamente	0	1	13
指	zhǐ	apontar	37	1	\N
紀律	jì lǜ	disciplina	1	1	44
綠色	lǜ sè	verde	1	1	44
真名	zhēn míng	nome verdadeiro	0	1	12
梳洗	shū xǐ	lavar	0	1	13
天主教	tiān zhǔ jiào	catolicismo	1	1	13
套頭衫	tào tóu shān	suéter	0	1	42
本質	běn zhì	essência	0	1	34
虎膽妙算	hǔ dǎn miào suàn	Missão Impossível	0	1	33
貧窮	pín qióng	pobreza	1	1	22
三項	sān xiàng	três	0	1	14
貞潔	zhēn jié	castidade	0	1	12
一舉	yī jǔ	de uma só vez	1	1	13
漸進	jiàn jìn	progressivo	0	1	44
修道會	xiū dào huì	sociedade religiosa	0	1	14
躍	yuè	pular	0	1	\N
敲門	qiāo mén	bater a porta	0	1	12
紫貂皮	zǐ diāo pí	pele de marta zibelina	0	1	31
ERNIE	ERNIE	ERNIE	0	1	\N
宗教	zōng jiào	religioso	0	1	14
滾出	gǔn chū	sair	0	1	31
厄尼	È ní	Ernie	6	1	42
顯眼	xiǎn yǎn	visível	2	1	33
荷官	hé guān	crupiê	0	1	21
專屬	zhuān shǔ	exclusivo	0	1	13
而為	ér wéi	e agir	0	1	22
偏僻	piān pì	remoto	0	1	14
十萬	shí wàn	cem mil	0	1	24
轎車	jiào chē	carro de passeio	0	1	41
氣候	qì hòu	clima	0	1	44
炸	zhà	explodir	0	1	\N
關閉	guān bì	fechamento	3	1	14
左邊	zuǒ biān	esquerda	0	1	31
宜人	yí rén	agradável	0	1	22
大衣	dà yī	casaco	0	1	41
面臨	miàn lín	enfrentar	1	1	42
不便	bù biàn	inconveniente	0	1	44
企鵝	qǐ é	pinguim	0	1	32
容忍	róng rěn	tolerar	0	1	23
全體	quán tǐ	toda a	1	1	23
帕特里克	pà tè lǐ kè	Patrick	1	1	44
恩物	ēn wù	dons	0	1	14
一無所獲	yī wú suǒ huò	não obter nada	0	1	12
場所	chǎng suǒ	local	1	1	33
懸賞	xuán shǎng	recompensa	1	1	23
威利	wēi lì	Willy	1	1	14
院長	yuàn zhǎng	diretor(a)	10	1	43
聖體	shèng tǐ	sagrada hóstia	0	1	43
主教	zhǔ jiào	bispo	4	1	34
修女	xiū nǚ	freiras	49	1	13
凱瑟琳	kǎi sè lín	Catarina	4	1	34
白人	bái rén	pessoas brancas	6	1	22
范	Fàn	Van	4	1	\N
紀念	jì niàn	comemorar	6	1	44
獻上	xiàn shàng	oferecer	1	1	44
禱告	dǎo gào	oração	3	1	34
不著	bù zháo	não conseguir	0	1	42
小腹	xiǎo fù	abdômen	2	1	34
體貼入微	tǐ tiē rù wēi	extremamente atencioso	1	1	31
做得到	zuò dé dào	conseguir fazer	1	1	42
臀部	tún bù	quadril/nádegas	1	1	24
好人	hǎo rén	pessoa boa	2	1	32
能耐	néng nai	habilidade	1	1	25
爭取	zhēng qǔ	lutar por	4	1	13
不配	bù pèi	não merecer	1	1	44
上了	shàng le	conseguiu	1	1	45
人物	rén wù	pessoa/figura	6	1	24
人脈	rén mài	contatos	1	1	24
辦不到	bàn bú dào	não consigo fazer	1	1	42
服從	fú cóng	obediente	1	1	22
顧慮	gù lǜ	preocupação	1	1	44
扭轉	niǔ zhuǎn	reverter	1	1	33
小丑	xiǎo chǒu	palhaço	9	1	33
共融	gòng róng	comunhão	0	1	42
敬	jìng	respeitar	2	1	\N
謹	jǐn	respeitosamente	22	1	\N
背	bèi	decorar	10	1	\N
豪華	háo huá	luxuoso	2	1	22
外套	wài tào	casaco	5	1	44
設計	shè jì	projetado	2	1	44
餘生	yú shēng	resto da vida	0	1	21
聖人	shèng rén	santos	10	1	42
怪人	guài rén	homem estranho	0	1	42
大人	dà rén	senhor	15	1	42
蝙蝠	biān fú	morcego	0	1	12
鐘樓	zhōng lóu	torre do sino	1	1	12
足以	zú yǐ	suficiente para	0	1	23
各地	gè dì	vários lugares	0	1	44
乾洗	gān xǐ	lavagem a seco	0	1	13
無處不在	wú chù bù zài	onipresente	0	1	24
最多	zuì duō	no máximo	0	1	41
兩個月	liǎng gè yuè	dois meses	0	1	34
出獄	chū yù	sair da prisão	0	1	14
瘋掉	fēng diào	enlouquecer	0	1	14
裝扮成	zhuāng bàn chéng	disfarçados de	0	1	14
別無他物	bié wú tā wù	não há mais nada	0	1	22
滾出去	gǔn chū qù	saiam daqui	2	1	31
囚禁	qiú jìn	aprisionar	0	1	24
寄生蟲	jì shēng chóng	parasita	0	1	41
櫃子	guì zi	armário	0	1	45
遮蓋	zhē gài	cobrir	0	1	14
不妨	bù fáng	não há mal em	0	1	42
人選	rén xuǎn	candidato	0	1	23
刻意	kè yì	deliberadamente	0	1	44
卡蒂爾	Kǎ dì ěr	Cartier	2	1	34
耶穌基督	yē sū jī dū	Jesus Cristo	0	1	11
好多了	hǎo duō le	muito melhor	0	1	31
勾搭	gōu dā	paquerar	0	1	11
腳踏兩條船	jiǎo tà liǎng tiáo chuán	pisar em dois barcos	0	1	34
范·卡蒂埃	fàn kǎ dì āi	Van Cuttier	0	1	43
竭盡所能	jié jìn suǒ néng	fazer tudo que estiver ao nosso alcance	0	1	24
地下	dì xià	subterrâneo	0	1	44
凸起	tū qǐ	protuberância	0	1	13
槍套	qiāng tào	coldre	0	1	14
洛杉磯	luò shān jī	Los Angeles	1	1	41
克拉倫斯·威廉斯三世	kè lā lún sī · wēi lián sī sān shì	Clarence Williams III	0	1	41
康科迪亞	kāng kē dí yà	Concórdia	0	1	11
嬤嬤	mā ma	madre (freira)	6	1	15
性生活	xìng shēng huó	vida sexual	1	1	41
蔭	yīn	sombra	0	1	\N
幽	yōu	sombrio	0	1	\N
訂單	dìng dān	pedido	1	1	41
領受	lǐng shòu	receber	0	1	34
開動	kāi dòng	começar	0	1	14
鹽	yán	sal	1	1	\N
愜意	qià yì	confortável	0	1	44
有些	yǒu xiē	alguns	25	1	31
食	shí	comer	30	1	\N
感召	gǎnzhào	chamado	0	1	\N
租	zū	alugar	6	1	\N
將要	jiāng yào	prestes a	3	1	14
普里特金	pǔ lǐ tè jīn	Pritikin	0	1	33
西德尼	xī dé ní	Sidney	50	1	12
奈何	nài hé	o que pode ser feito	0	1	42
回過	huí guò	retornou a	0	1	24
自己的	zì jǐ de	própria	0	1	43
住處	zhù chù	residência	0	1	44
意願	yìyuàn	desejo	14	1	\N
8x10	bā ché shí	oito por dez	0	1	12
傳真	chuán zhēn	fax	0	1	21
聯繫人	lián xì rén	contatos	0	1	24
宣布	xuān bù	anunciar	6	1	14
其餘	qí yú	restante	0	1	22
甚少	shèn shǎo	muito pouca	0	1	43
撒旦	sā dàn	Satã	0	1	14
燦爛	càn làn	brilhante	3	1	44
開拓型	kāi tuò xíng	pioneiro	0	1	14
教團	jiào tuán	ordem religiosa	0	1	42
些許	xiē xǔ	um pouco	0	1	13
窒息	zhì xī	sufocante	0	1	41
連篇	lián piān	interminável	0	1	21
溫哥華	wēn gē huá	Vancouver	0	1	11
樹林	shù lín	floresta	0	1	42
女修道院	nǚ xiū dào yuàn	convento	1	1	31
電力	diàn lì	energia elétrica	0	1	44
希爾頓	xī ěr dùn	Hilton	0	1	13
噩夢	è mèng	pesadelo	6	1	44
不願	bù yuàn	não querer	10	1	44
訣竅	jué qiào	truque	1	1	24
綽綽有餘	chuò chuò yǒu yú	mais que suficiente	1	1	44
里諾	lǐ nuò	Reno	3	1	34
阿們	ā men	amém	3	1	15
自大	zì dà	arrogante	1	1	44
牢房	láo fáng	cela	3	1	22
出租	chū zū	aluguel	5	1	11
我很	wǒ de hěn	eu estou	1	1	35
配得上	pèi dé shàng	ser digno de	3	1	42
sisters	jiě mèi	irmãs	1	1	34
某人	mǒu rén	alguém	18	1	32
牆	qiáng	parede	5	1	\N
那就	nà jiù	então	7	1	44
最后	zuì hòu	último	0	1	44
来说	lá shuō	para	0	1	21
逗	dòu	provocar	0	1	\N
侶	lǚ	parceiro	0	1	\N
傢俱	jiā jù	móveis	1	1	14
上過	shàng guò	frequentei	2	1	44
畏懼	wèi jù	temer	0	1	44
唇	chún	lábios	0	1	\N
緘	jiān	selar	0	1	\N
日用	rì yòng	diário	0	1	44
法學院	fǎ xué yuàn	faculdade de direito	1	1	32
後會有期	hòu huì yǒu qī	até nos encontrarmos novamente	0	1	44
指揮	zhǐ huī	maestro	4	1	31
共和國	gòng hé guó	república	0	1	42
就座	jiù zuò	sentar-se	0	1	44
剩餘	shèng yú	restante	0	1	42
高人一等	gāo rén yī děng	superior aos outros	0	1	12
儀式性	yí shì xìng	ritualística	0	1	24
飢餓	jī è	fome	1	1	14
提早	tí zǎo	adiantar	2	1	23
小伙子們	xiǎo huǒ zi men	rapazes	0	1	33
赤	chì	vermelho	0	1	\N
虛張聲勢	xū zhāng shēng shì	blefando	0	1	11
難怪	nán guài	não é de admirar	0	1	24
說句話	shuō jù huà	dizer uma palavra	0	1	14
這些人	zhè xiē rén	estas pessoas	0	1	41
石器時代	shí qì shí dài	Idade da Pedra	0	1	24
躁	zào	agitado	0	1	\N
產物	chǎn wù	produto	0	1	34
摩托車	mótuōchē	motocicleta	0	1	\N
懶蟲	lǎn chóng	preguiçoso	2	1	32
何在	hé zài	onde está	2	1	24
愚弄	yú nòng	enganando	0	1	24
羅伯特	luó bó tè	Roberto	10	1	22
拉撒路	lā sā lù	Lázaro	3	1	11
今晨	jīn chén	esta manhã	1	1	12
察覺	chá jué	perceber	4	1	22
儀式	yí shì	ritual	8	1	24
雙	shuāng	duplo	19	1	\N
此地	cǐ dì	este lugar	0	1	34
賜	cì	conceder	2	1	\N
深入	shēn rù	aprofundar-se	33	1	14
失蹤	shī zōng	desapareceu	3	1	11
類型	lèi xíng	tipos	5	1	42
識相	shí xiàng	ser sensato	0	1	24
賦予	fù yǔ	conceder	1	1	43
歌唱	gē chàng	cantar	8	1	14
貪睡	tān shuì	dorminhoco	0	1	14
人民	rén mín	povo	2	1	22
與其	yǔ qí	em vez de	2	1	32
當事人	dāng shì rén	cliente	1	1	14
凌晨	líng chén	madrugada	0	1	22
藉	jiè	confiar em	31	1	\N
拼命	pīn mìng	desesperadamente	1	1	14
二十分鐘	èr shí fēn zhōng	vinte minutos	0	1	42
追趕	zhuī gǎn	perseguir	1	1	13
鑽	zuān	perfurar	19	1	\N
礙事	ài shì	atrapalhar	1	1	44
蕎麥	qiáo mài	trigo sarraceno	1	1	24
人間	rén jiān	mundo	39	1	21
美元	měi yuán	dólar americano	6	1	32
照耀	zhào yào	brilhando	0	1	44
閒話	xián huà	conversa fiada	2	1	24
今早	jīn zǎo	esta manhã	0	1	13
聚會	jù huì	reunião	2	1	44
足	zú	pé	2	1	\N
設	shè	definir	4	1	\N
與會者	yù huì zhě	participantes	0	1	44
團契	tuán qì	comunhão	0	1	24
同樂	tóng lè	alegrar-se juntos	0	1	24
寂寞	jì mò	solidão	2	1	44
本週	běn zhōu	esta semana	0	1	31
選集	xuǎn jí	coletânea	0	1	32
費心	fèi xīn	dedicar esforço mental	0	1	41
勞力	láo lì	esforço físico	0	1	24
當鋪	dàng pù	loja de penhor	0	1	44
銷贓	xiāo zāng	desovar bens roubados	0	1	11
數據庫	shù jù kù	banco de dados	0	1	44
愛女	ài nǚ	filha amada	0	1	43
摯愛	zhì ài	amado	0	1	44
教皇	jiào huáng	papa	0	1	42
空姐	kōng jiě	comissária de bordo	0	1	13
緊了	jǐn le	apertado	0	1	35
進步的	jìn bù de	progressivo	0	1	44
新潮	xīn cháo	moderno	0	1	12
打通	dǎ tōng	completar uma ligação	0	1	31
有多難	yǒu duō nán	quão difícil é	0	1	31
新婚	xīn hūn	casamento novo	0	1	11
賭徒	dǔ tú	jogador	0	1	32
隔壁	gé bì	vizinho	0	1	24
伯莎	bó shā	Bertha (nome próprio)	0	1	21
妓女	jì nǚ	prostituta	1	1	43
少說	shǎo shuō	falar pouco	0	1	31
幹活	gàn huó	trabalhar	1	1	42
什麼都不做	shén me dōu bù zuò	não fazer nada	0	1	25
證人	zhèng rén	testemunha	0	1	42
內鬼	nèi guǐ	traidor, espião interno	0	1	43
難逃	nán táo	difícil escapar	0	1	22
身陷	shēn xiàn	imerso	0	1	14
小時候	xiǎo shí hòu	quando criança	0	1	32
起床了	qǐ chuáng le	levantar-se	0	1	32
你這	nǐ zhè	você este	0	1	34
愛睏蟲	ài kùn chóng	preguiçoso	0	1	44
發笑	fā xiào	rir	0	1	14
藏著	cáng zhe	escondido	0	1	25
萬無一失	wàn wú yī shī	à prova de falhas	0	1	42
領悟	lǐng wù	compreender	0	1	34
迷糊	mí hu	desnorteado	0	1	25
就好像	jiù hǎo xiàng	como se	0	1	43
被困住	bèi kùn zhù	ficar preso	0	1	44
全人類	quán rén lèi	toda a humanidade	0	1	22
刺青	cì qīng	tatuagem	0	1	41
真善美	zhēn shàn měi	A Noviça Rebelde	0	1	14
凳子	dèng zi	banco	0	1	45
F	F	F	0	1	\N
載	zài	carregar	0	1	\N
獻唱	xiàn chàng	cantar em homenagem	0	1	44
拿下來	ná xià lái	tirar	0	1	24
彈	tán	tocar	28	1	\N
《	《	《	2	1	\N
升	shēng	sustenido	1	1	\N
自願	zì yuàn	voluntário	5	1	44
選出	xuǎn chū	eleger	0	1	31
救出去	jiù chū qù	resgatar	0	1	41
可樂	kě lè	coca-cola	1	1	34
頌	sòng	hino	0	1	\N
信件	xìn jiàn	carta	0	1	44
倒抽	dào chōu	aspirar	0	1	41
》	》	》	2	1	\N
教誨	jiào huì	ensinamentos	0	1	44
萬福	wàn fú	dez mil bênçãos	2	1	42
宣揚	xuān yáng	propagar	0	1	12
耶路撒冷	yē lù sā lěng	Jerusalém	0	1	14
1500	yī wǔ líng líng	1500	1	1	13
叛變	pàn biàn	traição	0	1	44
女低音	nǚ dī yīn	contralto	0	1	31
黑道家族	hēi dào jiā zú	Família Soprano	0	1	14
低音部	dī yīn bù	seção de baixos	0	1	11
掃蕩	sǎo dàng	varrer	0	1	34
烘焙	hōng bèi	assar	0	1	14
順其自然	shùn qí zì rán	deixar as coisas acontecerem naturalmente	0	1	42
阿爾托斯	ā ěr tuō sī	Altos	0	1	13
年輕的	nián qīng de	jovem	0	1	21
唱詩班	chàng shī bān	coral eclesiástico	2	1	41
人群	rén qún	multidão	0	1	22
一致	yī zhì	concordar	2	1	14
全城	quán chéng	cidade inteira	1	1	22
形容	xíng róng	descrever	1	1	22
姊姊	jiě jie	irmã mais velha	5	1	35
提高	tí gāo	aumentar	3	1	21
酒鬼	jiǔ guǐ	bêbados	4	1	33
凡	fán	van	36	1	\N
喧嘩	xuān huá	barulho	0	1	12
原來	yuán lái	afinal	10	1	22
明日	míng rì	amanhã	1	1	24
爆米花	bào mǐ huā	pipoca	3	1	43
空中	kōng zhōng	no ar	2	1	11
群眾	qún zhòng	multidão	2	1	24
蓋過	gài guò	superar	0	1	44
喧囂	xuān xiāo	barulho	0	1	11
技巧	jì qiǎo	técnica	0	1	43
音量	yīn liàng	volume	0	1	14
A	A	A	4	1	\N
滿是	mǎn shì	cheio de	1	1	34
一輛	yī liàng	um	3	1	14
聆聽	líng tīng	escutar	2	1	21
1	yī	um	3	1	\N
傳道	chuán dào	pregando	15	1	24
竭力	jié lì	com todas as forças	0	1	24
引領	yǐn lǐng	guiar	2	1	33
一路	yī lù	todo o caminho	11	1	14
牢記	láo jì	lembrar firmemente	0	1	24
筆記	bǐ jì	notas	1	1	34
聽見	tīng jiàn	ouvir	3	1	14
謝幕	xiè mù	cortina final	0	1	44
院長嬤嬤	yuàn zhǎng mó mó	Madre Superiora	1	1	43
有個	yǒu gè	tem um	4	1	34
奮戰	fèn zhàn	luta árdua	0	1	44
姐妹們	jiě mèi men	irmãs	1	1	34
跳舞	tiào wǔ	dançar	8	1	43
飛來	fēi lái	voando em direção	0	1	12
耳熟	ěr shú	familiar	0	1	32
萊特曼	Lái tè màn	Letterman	0	1	24
猜猜	cāi cāi	adivinha quem	2	1	11
許多人	xǔ duō rén	muitas pessoas	1	1	31
性愛	xìng ài	sexo	0	1	44
激勵人心	jī lì rén xīn	inspirador	0	1	14
聖座	shèng zuò	Santa Sé	0	1	44
動用	dòng yòng	usar	0	1	44
親啟	qīn qǐ	abrir pessoalmente	0	1	13
煽動	shān dòng	incitar	0	1	14
台詞	tái cí	fala, texto	1	1	22
忙碌	máng lù	ocupados	10	1	24
義賣	yì mài	venda beneficente	0	1	44
四重奏	sì chóng zòu	quarteto	0	1	42
簽字	qiān zì	assinar	0	1	14
沒帶	méi dài	não trouxe	0	1	24
錢券	qián quàn	vale	0	1	24
漏洞	lòu dòng	vulnerabilidade	0	1	44
夥計們	huǒ jì men	pessoal	0	1	34
緊張的	jǐn zhāng de	nervoso	0	1	31
放假	fàng jià	dar férias	2	1	44
本名	běn míng	nome verdadeiro	0	1	32
德洛莉絲	dé luò lì sī	Dolores	0	1	24
卡蒂耶	kǎ dì yē	Cartier	0	1	34
撒了謊	sā le huǎng	mentiu	0	1	15
來源	lái yuán	fonte	0	1	22
瑪麗·克拉倫斯	mǎ lì · kè lún sī	Marie Clarence	0	1	34
八道	bā dào	disparates	0	1	14
座位	zuò wèi	assento	1	1	44
指甲	zhǐ jia	unha	0	1	35
這台	zhè tái	esta máquina	0	1	42
節奏感	jié zòu gǎn	senso de ritmo	0	1	24
孰	shú	quem	0	1	\N
點唱機	diǎn chàng jī	jukebox	1	1	34
聖賢	shèng xián	sábios	0	1	42
揮	huī	brandir	0	1	\N
匯	huì	transferir	0	1	\N
單一	dān yī	única	0	1	11
沉睡	chén shuì	adormecer profundamente	0	1	24
置身	zhì shēn	colocar-se	0	1	41
彈奏	tán zòu	tocar	7	1	24
女高音	nǚ gāo yīn	soprano	2	1	31
鄰里	lín lǐ	vizinhança	1	1	23
和弦	hé xián	acorde	2	1	22
深沉的	shēn chén de	profundo	0	1	12
可愛的	kě ài de	adoráveis	0	1	34
女中音	nǚ zhōng yīn	mezzo-soprano	0	1	31
內行人	nèi háng rén	especialista	0	1	42
高歌	gāo gē	cantar em voz alta	0	1	11
閒事	xián shì	assuntos alheios	0	1	24
帶回	dài huí	trazer de volta	3	1	42
天籟	tiān lài	som celestial	0	1	14
樂器	yuè qì	instrumento musical	0	1	44
屋樑	wū liáng	viga do telhado	0	1	12
風格	fēng gé	estilo	2	1	12
心聲	xīn shēng	voz interior	1	1	11
讚美詩	zàn měi shī	hino de louvor	0	1	43
親口	qīn kǒu	pessoalmente (com a própria boca)	2	1	13
過往	guòwǎng	passado	0	1	\N
合唱團	hé chàng tuán	coral	14	1	24
舊金山	jiù jīn shān	São Francisco	1	1	41
下週末	xià zhōu mò	próximo fim de semana	0	1	41
八度	bā dù	oitava	0	1	14
蒙席	méng xí	monsenhor	1	1	22
重大	zhòng dà	importante	1	1	44
難聽	nán tīng	desafinado	1	1	21
哲學	zhé xué	filosofia	1	1	22
修道院	xiū dào yuàn	mosteiro	23	1	14
求求你	qiú qiú nǐ	por favor	3	1	22
發出來	fā chū lái	emitido	0	1	11
描述	miáo shù	descrever	3	1	24
放聲	fàng shēng	soltar a voz	1	1	41
歸功於	guī gōng yú	graças a	0	1	11
親近	qīn jìn	aproximar-se	1	1	14
阿爾瑪	ā ěr mǎ	Alma	2	1	13
抹大拉	mǒ dà lā	Madalena	2	1	34
人心	rén xīn	coração das pessoas	2	1	21
大量	dà liàng	grande quantidade	0	1	44
傾聽	qīng tīng	escutar	3	1	11
投入	tóu rù	investir	4	1	24
銀器	yín qì	objetos de prata	0	1	24
音符	yīn fú	nota musical	4	1	12
包含	bāo hán	incluir	2	1	12
召喚	zhào huàn	chamando	3	1	44
衰落	shuāi luò	declinar	2	1	14
靈性	líng xìng	espiritualidade	20	1	24
譴責	qiǎn zé	condenar	1	1	32
托盤	tuō pán	bandeja	0	1	12
早上好	zǎo shang hǎo	bom dia	3	1	35
後方	hòu fāng	fundo	0	1	41
陌生	mò shēng	estranho	2	1	41
掉落	diào luò	deixar cair	2	1	44
伸出	shēn chū	estender	0	1	11
虛弱	xū ruò	fraco	0	1	14
唱著	chàng zhe	cantando	0	1	45
歡慶	huān qìng	celebração	0	1	14
援手	yuán shǒu	mão de ajuda	0	1	23
事實上	shì shí shàng	na verdade	6	1	42
少數人	shǎo shù rén	minoria	0	1	34
鏡頭	jìng tóu	lente (câmera)	0	1	42
布吉烏吉	bù jí wū jí	boogie-woogie	0	1	42
拉斯維加斯	lā sī wéi jiā sī	Las Vegas	0	1	11
擠爆	jǐ bào	lotar até explodir	0	1	34
拼了命	pīn le mìng	dar tudo de si	0	1	15
閒暇	xián xiá	lazer	0	1	22
震撼	zhèn hàn	chocar	0	1	44
肩膀	jiān bǎng	ombro	0	1	13
一職	yī zhí	posição	0	1	12
創新	chuàng xīn	inovação	0	1	41
激勵	jī lì	inspirar	0	1	14
表揚	biǎo yáng	elogio	0	1	32
星期天	xīng qī tiān	domingo	6	1	11
大主教	dà zhǔ jiào	arcebispo	0	1	43
存續	cún xù	continuar existindo	0	1	24
展開	zhǎn kāi	desenrolar	0	1	31
可憐見的	kě lián jiàn de	coitado	0	1	32
振興	zhèn xīng	revitalizar	0	1	41
逆轉	nì zhuǎn	reverter	0	1	43
迫不及待	pò bù jí dài	ansioso	0	1	44
大門	dà mén	portão	0	1	42
日間	rì jiān	diurno	0	1	41
托兒	tuō ér	creche	0	1	12
無家可歸者	wú jiā kě guī zhě	sem-teto	0	1	21
設立	shè lì	estabelecer	1	1	44
電池	diàn chí	bateria	3	1	42
造訪	zào fǎng	visitar	0	1	43
日程	rì chéng	agenda	0	1	42
異常	yì cháng	anormalmente	0	1	42
繁忙	fán máng	ocupado	0	1	22
光榮	guāng róng	honra	0	1	12
曲目	qǔ mù	faixa	0	1	34
罪惡	zuì è	mal	1	1	44
甚	shèn	muito	2	1	\N
美分	měi fēn	centavos	0	1	31
獎勵	jiǎng lì	recompensa	4	1	34
長袍	cháng páo	túnicas	0	1	22
合拍	hé pāi	no ritmo	0	1	21
棍	gùn	bastão	0	1	\N
先驅者	xiān qū zhě	pioneiro	0	1	11
良機	liáng jī	boa oportunidade	0	1	21
不合調	bù hé diào	desafinado	0	1	42
職業者	zhí yè zhě	profissional	0	1	24
自由職業	zì yóu zhí yè	profissão liberal	0	1	42
口語	kǒu yǔ	linguagem falada	0	1	33
莊重	zhuāng zhòng	solene	0	1	14
漸強	jiàn qiáng	aumentar gradualmente	0	1	42
源	yuán	fonte	0	1	\N
尉	wèi	oficial militar	0	1	\N
稱之為	chēng zhī wéi	chamamos isso de	0	1	11
嘎嘎叫	gā gā jiào	grasnar	0	1	11
拼湊	pīn còu	juntar	0	1	14
仁慈	rén cí	compaixão	0	1	22
中提琴	zhōng tí qín	viola	0	1	12
法官	fǎ guān	juiz	15	1	31
驚呼	jīng hū	exclamar	1	1	11
合唱	hé chàng	coro	1	1	24
什麼的	shén me de	coisas assim	2	1	25
時時刻刻	shí shí kè kè	a todo momento	1	1	22
世俗	shì sú	secular	5	1	42
音訊	yīn xùn	notícias	1	1	14
拿到了	ná dào le	conseguiu	1	1	24
和聲	hé shēng	harmonia	0	1	21
紅色	hóng sè	vermelho	2	1	24
大幅	dà fú	significativamente	0	1	42
表達	biǎo dá	expressar	6	1	32
驚人	jīng rén	surpreendente	1	1	12
全新	quán xīn	completamente novo	3	1	21
改善	gǎi shàn	melhorar	0	1	34
下令	xià lìng	dar ordem	3	1	44
竭盡全力	jié jìn quán lì	dar o máximo de si	1	1	24
近來	jìn lái	ultimamente	1	1	42
可好	kě hǎo	está bem	1	1	33
帶來了	dài lái le	trouxe	2	1	42
旋轉	xuán zhuǎn	girar	1	1	23
唱出	chàng chū	cantar	0	1	41
所見	suǒ jiàn	vê	1	1	34
全場	quán chǎng	plateia	1	1	23
美國	měi guó	Estados Unidos	4	1	32
這座	zhè zuò	este	2	1	44
唱了	chàng le	cantou	0	1	45
盡快	jǐn kuài	o mais rápido possível	11	1	34
糖漿	táng jiāng	xarope	3	1	21
秒鐘	miǎo zhōng	segundos	0	1	31
進門	jìn mén	entrar	0	1	42
熱衷於	rè zhōng yú	apaixonado por	0	1	41
現任	xiàn rèn	atual/incumbente	0	1	44
褻瀆	xiè dú	blasfêmia	0	1	42
山核桃	shān hé táo	noz-pecã	2	1	12
腐化了	fǔ huà le	corrompeu	0	1	34
奶油	nǎi yóu	creme	4	1	32
多不勝數	duō bù shèng shǔ	inúmeros/incontáveis	0	1	14
執行	zhí xíng	executar	2	1	22
幫上忙	bāng shàng máng	ajudar	1	1	14
轉讓	zhuǎn ràng	transferir	0	1	34
周邊	zhōu biān	periferia	0	1	11
鄰國	lín guó	países vizinhos	0	1	22
設施	shè shī	instalações	0	1	41
看顧	kàn gù	cuidar	1	1	44
沒意思	méi yì si	sem graça	0	1	24
非凡的	fēi fán de	extraordinária	0	1	12
姊妹們	zǐ mèi men	irmãs	0	1	34
教宗本人	jiào zōng běn rén	o próprio Papa	0	1	41
音樂會	yīn yuè huì	concerto	0	1	14
謙卑	qiān bēi	humildes	0	1	11
莊嚴	zhuāng yán	solene	0	1	12
聖潔	shèng jié	sagrado	0	1	42
娛樂	yú lè	entretenimento	0	1	24
投票	tóu piào	votação	1	1	24
舉手	jǔ shǒu	levantar a mão	0	1	33
不恰當	bù qià dàng	inadequado	0	1	44
善解人意	shàn jiě rén yì	compreensivo	0	1	43
辭呈	cí chéng	carta de demissão	0	1	22
奧哈拉	ào hā lā	O'Hara	1	1	41
調動	diào dòng	transferir	0	1	44
鈴鼓	líng gǔ	pandeiro	0	1	23
熊抱	xióng bào	abraço de urso	0	1	24
示範	shì fàn	demonstração	0	1	44
善報	shàn bào	recompensa pela bondade	0	1	44
教宗	jiào zōng	papa	6	1	41
類風濕性關節炎	lèi fēng shī xìng guān jié yán	artrite reumatoide	0	1	41
脫髮	tuō fǎ	queda de cabelo	0	1	13
頸部	jǐng bù	pescoço	0	1	34
息肉	xī ròu	pólipo	0	1	14
哀號	āi háo	lamento	0	1	12
惡報	è bào	retribuição pelo mal	0	1	44
轉子	zhuǎn zǐ	rotor	0	1	33
大忌	dà jì	grande tabu	0	1	44
上車	shàng chē	entrar no carro	0	1	41
蛾摩拉	é mó lā	Gomorra	0	1	22
加爾默羅會	jiā ěr mò luó huì	Carmelitas	0	1	13
生涯	shēng yá	vida	14	1	12
伊格納修斯	yī gé nà xiū sī	Inácio	0	1	12
文尼	wén ní	Vinny	1	1	22
更為	gèng wéi	mais	0	1	42
奧妙	ào miào	misteriosas	0	1	44
國際化	guó jì huà	internacionalização	0	1	24
多數	duō shù	maioria	0	1	14
愉悅	yú yuè	prazeroso	1	1	24
滑步	huá bù	passo deslizante	2	1	24
罪行	zuì xíng	crime	1	1	42
全力以赴	quán lì yǐ fù	dar tudo de si	3	1	24
內華達州	nèi huá dá zhōu	Nevada	0	1	42
曼紐爾	màn niǔ ěr	Manuel	0	1	43
運送	yùn sòng	envio	0	1	44
獻	xiàn	oferecer	4	1	\N
裝束	zhuāng shù	roupa	0	1	14
籃	lán	cesta	0	1	\N
槍法	qiāng fǎ	pontaria	0	1	13
押	yā	apostar	0	1	\N
RED	hóng	vermelho	0	1	\N
表態	biǎo tài	expressar opinião	1	1	34
衛生條件	wèi shēng tiáo jiàn	condições sanitárias	1	1	41
領袖	lǐng xiù	líder	0	1	34
演示	yǎn shì	demonstração	0	1	34
老古董	lǎo gǔ dǒng	pessoa antiquada	0	1	33
噠噠	dā dā	onomatopeia (som de batidas)	0	1	11
應得	yīng dé	merecer	1	1	12
就這樣	jiù zhè yàng	assim	39	1	44
惡意	è yì	malícia	0	1	44
臂	bì	braço	0	1	\N
掙扎	zhēng zhá	lutar	5	1	12
抓到	zhuā dào	pegar	0	1	14
掙	zhēng	lutar	1	1	\N
扎	zhā	perfurar	1	1	\N
調離	diào lí	transferir	0	1	42
作品	zuò pǐn	obra	3	1	43
黛安娜	dài ān nà	Diana	0	1	41
放下	fàng xià	abaixe	16	1	44
三重奏	sān chóng zòu	trio	0	1	12
彼得	bǐ dé	Pedro	5	1	32
絕非	jué fēi	definitivamente não é	5	1	21
左	zuǒ	esquerda	32	1	\N
亨利	hēng lì	Henry	0	1	14
埃	Āi	e	22	1	\N
放縱	fàng zòng	indulgência	1	1	44
29	èr shí jiǔ	29	0	1	42
交匯處	jiāo huì chù	interseção	0	1	14
為此	wèi cǐ	por isso	3	1	43
插上	chā shàng	conectar/inserir	0	1	14
泰特	tài tè	Tate	3	1	44
管閒事	guǎn xián shì	intrometer-se	0	1	32
deal	chāo	negócio	0	1	\N
敗類	bài lèi	escória	0	1	44
專場	zhuān chǎng	apresentação especial	0	1	13
煞車	shā chē	freio	0	1	11
抓了	zhuā le	prenderam	0	1	15
瑪麗·克拉倫斯修女	mǎ lì · kè lā lún sī xiū nǚ	Irmã Mary Clarence	0	1	34
天主教徒	tiān zhǔ jiào tú	católicos	0	1	13
入住	rù zhù	fazer check-in	1	1	44
目睹	mù dǔ	testemunhar	0	1	43
殘忍	cán rěn	cruel	0	1	23
躲藏	duǒ cáng	esconder-se	0	1	32
聯邦政府	lián bāng zhèng fǔ	governo federal	0	1	21
結帳	jié zhàng	fazer checkout	0	1	24
漠視	mò shì	indiferença	0	1	44
空手	kōng shǒu	de mãos vazias	0	1	13
而歸	ér guī	retornar	0	1	21
緩解	huǎn jiě	aliviar	0	1	33
禿頭	tū tóu	careca	0	1	12
報答	bào dá	retribuir	0	1	42
審判	shěn pàn	julgamento	1	1	34
水果	shuǐ guǒ	fruta	0	1	33
多洛莉絲	duō luò lì sī	Dolores	0	1	14
常有的	cháng yǒu de	comum	0	1	23
開拍	kāi pāi	ação	0	1	11
艾斯佩克圖姆	Ài sī pèi kè tú mǔ	espectro	0	1	41
艾斯皮里圖姆	Ài sī pí lǐ tú mǔ	espírito	0	1	41
卡庫姆	Kǎ kù mǔ	caco	0	1	34
圖圖	Tú tú	todo	0	1	22
普魯比烏姆	Pǔ lǔ bǐ wū mǔ	púbico	0	1	33
趴下	pā xià	deitar-se	0	1	14
輕浮	qīng fú	frívola	1	1	12
23	èr shí sān	vinte e três	0	1	42
14	shí sì	quatorze	0	1	24
娘們	niáng men	mulher	0	1	25
美德	měi dé	virtude	0	1	32
酒廊	jiǔ láng	bar	5	1	32
阿爾瑪修女	ā ěr mǎ xiū nǚ	Irmã Alma	0	1	13
低音	dī yīn	baixo	0	1	11
甦醒球	sū xǐng qiú	balão de ressuscitação (ambu)	1	1	13
清晰	qīng xī	claro	2	1	11
會有	huì yǒu	haverá	1	1	43
了不起	liǎo bù qǐ	incrível, impressionante	19	1	34
尖嘯聲	jiān xiào shēng	ruído estridente	2	1	14
硬幣	yìng bì	moeda	1	1	44
脫衣舞	tuō yī wǔ	strip-tease	0	1	11
膽小	dǎn xiǎo	covarde	0	1	33
融入	róng rù	integrar-se	0	1	24
團結一致	tuán jié yī zhì	unidos como um	0	1	22
上千	shàng qiān	milhares	0	1	41
下注	xià zhù	apostar	1	1	44
愛情	ài qíng	amor	30	1	42
過得	guò dé	passar (tempo)	18	1	42
動手	dòng shǒu	agir	1	1	43
引進	yǐn jìn	introduzir	0	1	34
演唱會	yǎn chàng huì	show	0	1	34
輕笑	qīng xiào	riso leve	0	1	14
我自己	wǒ zì jǐ	eu mesmo	8	1	34
施打	shī dǎ	aplicar (injeção)	1	1	13
樂	yuè	música	44	1	\N
手臂	shǒu bì	braço	2	1	34
身邊	shēn biān	ao lado	65	1	11
誠然	chéng rán	sinceramente	1	1	22
奧斯瑪	ào sī mǎ	Osma	20	1	41
小傢伙	xiǎo jiā huo	garotinho/criança	10	1	31
打理	dǎ lǐ	cuidar	1	1	33
鴉	yā	grafiti	0	1	\N
記錄	jì lù	registro	12	1	44
有一段	yǒu yī duàn	tem um	0	1	31
廣場	guǎng chǎng	praça	14	1	33
憐憫	lián mǐn	misericórdia	0	1	23
拜拜	bài bài	tchau	4	1	44
顛覆	diān fù	subverter	0	1	14
封鎖	fēng suǒ	bloquear	1	1	13
耗	hào	consumir	1	1	\N
偷車賊	tōu chē zéi	ladrão de carros	1	1	11
至高無上	zhì gāo wú shàng	supremo	0	1	41
黨	dǎng	partido	0	1	\N
單數形式	dān shù xíng shì	forma singular	1	1	14
高樓	gāo lóu	prédio alto	1	1	12
風雲人物	fēng yún rén wù	pessoa influente	1	1	12
編輯們	biān jí men	editores	0	1	12
駕駛座	jià shǐ zuò	assento do motorista	2	1	43
舔	tiǎn	lamber	0	1	\N
牛頭臉	niú tóu liǎn	cara de cabeça de boi	1	1	22
亮點	liàng diǎn	destaque	0	1	43
呼籲	hū yù	apelar	0	1	14
麵包店	miàn bāo diàn	padaria	8	1	41
掉下來	diào xià lái	cair	0	1	44
RG	RG	RG	0	1	\N
獎項	jiǎng xiàng	prêmio	1	1	34
一線	yī xiàn	um raio	0	1	14
曙光	shǔ guāng	luz do amanhecer	0	1	31
母親們	mǔqīnmen	mães	0	1	\N
自由人	zì yóu rén	pessoa livre	0	1	42
塞吉尼奧	sāi jí ní ào	Sérgio	0	1	12
採訪	cǎi fǎng	entrevistar	0	1	33
艾爾莎	ài ěr shā	Elsa	13	1	43
衣原體	yī yuán tǐ	clamídia	0	1	12
糖果	táng guǒ	doce	1	1	23
保琳娜	bǎo lín nà	Paulina	6	1	32
萬一	wàn yī	caso	3	1	41
白白	bái bái	em vão	0	1	22
最重要的	zuì zhòng yào de	mais importante	0	1	44
衝浪板	chōng làng bǎn	prancha de surfe	0	1	14
寶琳尼亞	Bǎo lín ní yà	Paulínia	0	1	32
MARÍLIA	MARÍLIA	Marília	0	1	\N
還行	hái xíng	aceitável	0	1	22
當機	dāng jī	travar	0	1	11
什麼東西	shén me dōng xī	que coisa	0	1	25
保鮮膜	bǎo xiān mó	filme plástico	0	1	31
馬查多	mǎ chá duō	Machado	9	1	32
馬塞多	mǎ sāi duō	Macedo	6	1	31
瑪麗利亞	Mǎ lì yà	Maria	6	1	34
杜達	dù dá	Duda	32	1	42
程序	chéng xù	programa	7	1	24
寶琳	Bǎo lín	Paulina	7	1	32
洛佩斯	luò pèi sī	López	5	1	44
游泳板	yóu yǒng bǎn	prancha de natação	0	1	23
醜聞	chǒu wén	escândalo	1	1	32
聖保羅	Shèng Bǎo luó	São Paulo	5	1	43
下次	xià cì	próxima vez	2	1	44
幾點	jǐ diǎn	que horas	4	1	33
果汁	guǒ zhī	suco	4	1	31
在外面	zài wài miàn	está lá fora	0	1	44
相機	xiàng jī	câmera	1	1	41
整整齊齊	zhěng zhěng qí qí	arrumado e ordenado	0	1	33
快門	kuài mén	obturador	1	1	42
插頭	chā tóu	plugue	1	1	12
廣泛	guǎng fàn	extenso	3	1	34
潛水	qián shuǐ	mergulhar	1	1	23
新聞界	xīn wén jiè	imprensa	3	1	12
熱好了	rè hǎo le	esquentou	0	1	43
跑過來	pǎo guò lái	correu até aqui	0	1	34
來回	lái huí	ir e voltar	0	1	22
投放	tóu fàng	veicular	0	1	24
編號	biān hào	número de série	0	1	14
上官司	shàng guān sī	processo judicial	0	1	41
批准	pī zhǔn	aprovar	0	1	13
收錢	shōu qián	receber dinheiro	0	1	12
書面	shū miàn	escrito	0	1	14
轉發	zhuǎn fā	encaminhar	0	1	31
收據	shōu jù	recibo	1	1	14
傳送帶	chuán sòng dài	esteiras transportadoras	0	1	24
企劃	qǐ huà	plano/projeto	0	1	34
一首歌	yī shǒu gē	uma canção	0	1	13
站著	zhàn zhe	de pé	0	1	45
便利	biàn lì	conveniência	2	1	44
扶著	fú zhe	apoiando	0	1	25
太早	tài zǎo	muito cedo	0	1	43
佈置	bù zhì	dispor	0	1	44
鑽穿	zuān chuān	perfurar	0	1	11
踢腳板	tī jiǎo bǎn	rodapé	0	1	13
提案	tí àn	proposta	0	1	24
奧運會	ào yùn huì	Jogos Olímpicos	0	1	44
年齡段	nián líng duàn	faixa etária	0	1	22
選拔賽	xuǎn bá sài	seletiva	0	1	32
大姑娘	dà gū niáng	moça	0	1	41
參議員	cān yì yuán	senador	1	1	14
患上	huàn shàng	contrair (doença)	0	1	44
經由	jīng yóu	através de	0	1	12
性傳播	xìng chuán bō	sexualmente transmissível	0	1	42
機率	jī lǜ	probabilidade	0	1	14
微生物	wēi shēng wù	microrganismo	1	1	11
十一	shí yī	onze	0	1	21
雷納托	Léi nà tuō	Renato	16	1	24
三十二	sān shí èr	trinta e dois	0	1	12
羊膜穿刺術	yáng mó chuān cì shù	amniocentese	0	1	22
遺傳	yí chuán	hereditariedade	1	1	22
途徑	tú jìng	caminho	1	1	24
保莉娜	bǎo lì nà	Paulina	0	1	34
保琳哈	Bǎo lín hā	Paulinha	0	1	32
看得到	kàn dé dào	consegue ver	0	1	42
拋開	pāo kāi	descartar/jogar fora	0	1	11
TCHARAM	TCHARAM	TCHARAM	0	1	\N
ELZA	ELZA	ELZA	0	1	\N
我要離婚了	wǒ yào lí hūn le	Eu vou me divorciar	0	1	34
想不到	xiǎng bù dào	não imaginar	0	1	34
飯菜	fàn cài	comida	0	1	44
甜食	tián shí	doces	0	1	22
空位	kōng wèi	assento vazio	0	1	14
及其	jí qí	e seu	0	1	22
回來了	huí lái le	voltou	1	1	22
馬里利亞	Mǎ lǐ lì yà	Marília	0	1	33
曼加貝拉	Màn jiā bèi lā	Mangabeira	0	1	41
打破	dǎ pò	quebrar	2	1	34
說實話	shuō shí huà	falar a verdade	0	1	12
糟了	zāo le	que droga	5	1	15
睡著了	shuì zháo le	adormeceu	0	1	42
弗雷	fú léi	Frey	2	1	22
陪著	péi zhe	acompanhando	1	1	25
用了	yòng le	usado	1	1	45
街頭	jiē tóu	rua	7	1	12
想過了嗎	xiǎng guò le ma	já pensou	0	1	34
叔叔	shū shu	tio	114	1	15
閉	bì	fechar	4	1	\N
每一次	měi yī cì	cada vez	0	1	31
快線	kuài xiàn	linha expressa	0	1	44
紀錄	jì lù	recorde	0	1	44
體驗	tǐ yàn	experiência	8	1	34
玩玩	wán wán	brincar	0	1	22
傳遞	chuán dì	transmitir	5	1	24
查出	chá chū	descobrir	0	1	21
您好	nín hǎo	olá	23	1	23
說出去	shuō chū qù	espalhar	0	1	11
那天晚上	nà tiān wǎn shang	aquela noite	0	1	41
積蓄	jī xù	economias	0	1	14
scheme	scheme	esquema	1	1	\N
閃開	shǎn kāi	saia do caminho	0	1	31
用勁	yòng jìn	usar força	0	1	44
到位	dào wèi	correto	0	1	44
副本	fù běn	cópia	0	1	43
帶你	dài nǐ	levar você	0	1	43
艾莎	Ài shā	Elsa	2	1	41
真可惜	zhēn kěxī	que pena	0	1	13
談一談	tán yī tán	conversar	0	1	21
唱反調	chàng fǎn diào	contradizer	1	1	43
傲慢	ào màn	arrogância	3	1	44
老是	lǎo shì	sempre	9	1	34
下班	xià bān	sair do trabalho	1	1	41
三明治	sān míng zhì	sanduíche	7	1	12
哪兒	nǎ er	onde	11	1	35
免費的	miǎn fèi de	gratuitos	2	1	34
或是	huò shì	ou	1	1	44
待著	dāi zhe	ficar	1	1	15
卡斯特洛斯	kǎ sī tuō luō sī	Castelos	2	1	31
杜	dù	Du	2	1	\N
當天	dāng tiān	no dia	3	1	11
沒想到	méi xiǎng dào	não esperava	3	1	23
仍然	réng rán	ainda	25	1	22
裝模作樣	zhuāng mú zuò yàng	fingir	6	1	12
征服	zhēng fú	conquistar	3	1	12
物理	wù lǐ	física	0	1	43
保拉	Bǎo lā	Paula	0	1	31
保利尼亞	Bǎo lì ní yà	Bulgária	0	1	34
難吃	nán chī	ruim de comer	1	1	21
基因	jī yīn	gene	0	1	11
食堂	shí táng	refeitório	0	1	22
日式	rì shì	japonês	0	1	44
日文	rì wén	japonês	0	1	42
這是	zhè shì	isto é	146	2	44
實驗品	shí yàn pǐn	cobaia	0	1	24
蘑菇	mó gu	cogumelos	0	1	25
香菇	xiāng gū	cogumelo shiitake	0	1	11
刷	shuā	escovar/pintar	0	1	\N
牽扯	qiān chě	envolver	4	1	13
聊過了	liáo guò le	conversamos	0	1	24
表	biǎo	aparência	10	1	\N
翰	hàn	caneta	26	1	\N
足夠了	zú gòu le	suficiente	0	1	24
粉	fěn	pó	0	1	\N
塗	tú	aplicar	3	1	\N
約了	yuē le	marcamos	0	1	15
倆	liǎ	ambos	11	1	\N
塑膠袋	sù jiāo dài	sacola plástica	1	1	41
真是太	zhēn shì tài	realmente muito	0	1	14
瘋狂了	fēng kuáng le	ficou louco	0	1	12
難得	nán dé	raro	0	1	22
恩愛	ēn ài	amoroso	0	1	14
作風	zuò fēng	estilo	0	1	41
按時	àn shí	pontualmente	0	1	42
性關係	xìng guān xì	relação sexual	0	1	41
11	shí yī	onze	1	1	21
亂子	luàn zi	confusão	0	1	45
傳染	chuán rǎn	infectar	5	1	23
責任感	zé rèn gǎn	senso de responsabilidade	0	1	24
某處	mǒu chù	algum lugar	1	1	34
娜蒂	nà dì	Naty (apelido)	0	1	44
我那時	wǒ nà shí	eu naquela época	0	1	34
往前	wǎng qián	para frente	0	1	32
嗚呼	wū hū	ai de mim	0	1	11
那種	nà zhǒng	esse tipo de	22	1	43
男士	nán shì	senhor	1	1	24
吃藥	chī yào	tomar remédio	2	1	14
寶琳哈	Bǎo lín hā	Paulinha	2	1	32
鼓勵	gǔ lì	incentivo	1	1	34
好多	hǎo duō	muitos	3	1	31
圍裙	wéi qún	avental	2	1	22
價格	jià gé	preço	2	1	42
一下子	yī xià zi	de uma vez	4	1	14
失禮	shī lǐ	indelicado	2	1	13
杜杜	dù dù	Dudu	0	1	44
寶琳娜	bǎo lín nà	Paulina	43	1	32
道路	dào lù	estrada	45	1	44
工程	gōng chéng	engenharia	2	1	12
季	jì	temporada	10	1	\N
送交	sòng jiāo	entregar	0	1	41
保琳	bǎo lín	Paulin	0	1	32
清酒	qīng jiǔ	saquê	0	1	13
禿	tū	careca	0	1	\N
搬走	bān zǒu	mudar-se	0	1	13
摩擦聲	mó cā shēng	som de fricção	0	1	21
尼爾達	ní ěr dá	Nilda	0	1	23
服用	fú yòng	tomar	0	1	24
埃爾扎·克魯斯·克雷多	āi ěr zhā·kè lǔ sī·kè léi duō	Elza Cruz Credo	0	1	13
展	zhǎn	exposição	0	1	\N
累壞了	lèi huài le	exausto	0	1	44
候選	hòu xuǎn	candidato	0	1	43
睏	kùn	com sono	0	1	\N
芒加貝拉	Máng jiā bèi lā	Mungabera	0	1	21
十歲	shí suì	dez anos de idade	0	1	24
轉眼之間	zhuǎn yǎn zhī jiān	num piscar de olhos	1	1	33
落單	luò dān	deixar sozinho	0	1	41
開胃	kāi wèi	aperitivo	0	1	14
所愛	suǒ ài	amado	1	1	34
鬥	dòu	lutar	2	1	\N
那你	nǐ	então você	0	1	\N
小點	xiǎo diǎn	petisco	0	1	33
快艇	kuài tǐng	lancha	1	1	43
名稱	míng chēng	nome	1	1	21
靜靜	jìng jìng	silenciosamente	1	1	44
報案	bào àn	registrar ocorrência	6	1	44
來得及	lái dé jí	a tempo	3	1	22
不管怎樣	bù guǎn zěn yàng	de qualquer maneira	1	1	43
無限期	wú xiàn qī	prazo indeterminado	1	1	24
中午	zhōng wǔ	meio-dia	5	1	13
到時候	dào shí hòu	na hora certa	1	1	42
豆子	dòu zi	feijão	1	1	45
頑固	wán gù	teimosa	1	1	24
遺產	yí chǎn	herança	7	1	23
季度	jì dù	trimestre	0	1	44
雪梨	xuě lí	pera	1	1	32
騷貨	sāo huò	sacana	1	1	14
宮縮	gōng suō	contração uterina	2	1	11
之人	zhī rén	pessoa	1	1	12
擅長	shàn cháng	bom em	2	1	42
走走	zǒu zǒu	caminhar	1	1	33
瑪麗莉亞	mǎ lì lì yà	Marília	46	1	34
安裝	ān zhuāng	instalou	1	1	11
骨肉	gǔ ròu	carne e osso	0	1	34
文化	wén huà	cultura	6	1	24
趕上	gǎn shàng	alcançar	0	1	34
馬丁尼	mǎ dīng ní	martini	2	1	31
自豪	zì háo	orgulhosa	5	1	42
不斷	bù duàn	constantemente	5	1	44
印象	yìn xiàng	impressão	3	1	44
用品	yòng pǐn	artigos/suprimentos	2	1	43
帶上	dài shàng	levar	1	1	44
自私	zì sī	egoísta	7	1	41
回頭	huí tóu	até logo	8	1	22
鬼東西	guǐ dōng xī	coisa estranha/porcaria	0	1	31
瑪莉利亞	mǎ lì lì yà	Maria	0	1	34
訴諸	sù zhū	recorrer a	0	1	41
好球	hǎo qiú	boa jogada	0	1	32
抽射	chōu shè	chute	0	1	14
使勁	shǐ jìn	com força	0	1	34
使把勁	shǐ bǎ jìn	fazer força	0	1	33
剩下的	shèng xià de	restante	0	1	44
划水	huá shuǐ	fazer corpo mole	1	1	23
物理治療	wù lǐ zhì liáo	fisioterapia	0	1	43
牙醫	yá yī	dentista	0	1	21
全數	quán shù	total	0	1	24
算帳	suàn zhàng	acertar contas	0	1	44
退回	tuì huí	devolvido	1	1	42
商場	shāng chǎng	shopping center	0	1	13
店舖	diàn pù	loja	0	1	44
通姦者	tōng jiān zhě	adúltero	0	1	11
保留	bǎo liú	retenção	1	1	32
表弟	biǎo dì	primo (mais novo)	0	1	34
二表哥	èr biǎo gē	primo de segundo grau (pelo lado materno)	0	1	43
班古	bān gǔ	Bangu	0	1	13
馬薩爾	mǎ sà ěr	Marsal	2	1	34
翌日	yì rì	dia seguinte	0	1	44
淘汰賽	táo tài sài	torneio eliminatório	0	1	24
從來不	cóng lái bù	nunca	0	1	22
埃爾扎	āi ěr zhā	Elza	0	1	13
精裝本	jīng zhuāng běn	capa dura	0	1	11
早到	zǎo dào	chegar cedo	1	1	34
出乎意料	chū hū yì liào	inesperado	0	1	11
鎖了	suǒ le	trancou	0	1	35
落伍	luò wǔ	ficar para trás	1	1	43
門房	mén fáng	porteiro	0	1	22
土地	tǔ dì	terreno	0	1	34
痙攣	jìng luán	espasmo	0	1	42
流血	liú xiě	sangrento	0	1	23
停車場	tíng chē chǎng	estacionamento	1	1	21
想吐	xiǎng tù	querer vomitar	0	1	34
有病的	yǒu bìng de	doente	0	1	34
泳衣	yǒng yī	roupa de banho	0	1	31
五百萬	wǔ bǎi wàn	cinco milhões	0	1	33
現金	xiàn jīn	dinheiro	0	1	41
小青菜	xiǎo qīng cài	couve chinesa	0	1	31
排毒	pái dú	desintoxicação	0	1	22
壯膽	zhuàng dǎn	encorajar-se	0	1	43
從什麼時候	cóng shénme shíhòu	desde quando	0	1	22
冒出	mào chū	surgir	0	1	41
開始了	kāi shǐ le	começou	0	1	13
記憶	jì yì	memória	5	1	44
HANA	HANA	HANA (nome próprio)	0	1	\N
爛貨	làn huò	lixo/mercadoria ruim	0	1	44
魔力	mó lì	magia	3	1	24
蒙娜麗莎	Méng nà lì shā	Mona Lisa	0	1	24
冰箱貼	bīng xiāng tiē	ímã de geladeira	0	1	11
男孩們	nán hái men	meninos	1	1	22
探視	tàn shì	visita	0	1	44
復活節	fù huó jié	Páscoa	0	1	42
西洋	xī yáng	ocidental	0	1	12
寬恕	kuān shù	perdoado	12	1	14
回到	huí dào	voltar para	51	2	24
雙陸棋	shuāng lù qí	gamão	0	1	14
象棋	xiàng qí	xadrez chinês	0	1	42
九十	jiǔ shí	noventa	0	1	32
那件事	nà jiàn shì	aquela coisa/aquele assunto	0	1	44
看得出來	kàn dé chū lái	pode ser visto	0	1	42
下降	xià jiàng	cair/baixar	25	1	44
那群人	nà qún rén	aquelas pessoas	0	1	42
汽水	qì shuǐ	refrigerante	2	1	43
錯愕	cuò è	perplexo	0	1	44
解構	jiě gòu	desconstruir	0	1	34
增加	zēng jiā	aumentar	17	1	11
辯稱	biàn chēng	alegar	0	1	41
瑪德萊娜	mǎ dé lái nà	Madalena	3	1	32
領導者	lǐng dǎo zhě	líder	0	1	33
貝卡	bèi kǎ	Becca	0	1	43
代理人	dài lǐ rén	agente	0	1	43
緩慢地	huǎn màn de	lentamente	0	1	34
珉智	Mǐn zhì	Min-ji	0	1	34
未到	wèi dào	não chegou	0	1	44
準備好了	zhǔn bèi hǎo le	preparado	0	1	34
只限	zhǐ xiàn	apenas	0	1	34
奢侈	shē chǐ	luxuoso	0	1	13
美貌	měi mào	beleza	0	1	34
審核	shěn hé	verificação	0	1	32
蘿賽莉娜	Luó sài lì nà	Roselina	0	1	24
橫幅	héng fú	faixa	0	1	22
瘋婆子	fēng pó zi	mulher louca	0	1	12
靜靜地	jìng jìng de	silenciosamente	0	1	44
一一	yī yī	um por um	0	1	11
喜悦	xǐ yuè	alegria	0	1	34
得到過	dé dào guò	ter obtido	0	1	24
奧斯馬爾·佩雷拉	Ào sī mǎ ěr·Pèi léi lā	Osmã Pereira	1	1	41
密切	mì qiè	próximo	1	1	44
解僱	jiě gù	demitir	1	1	34
兒戲	ér xì	brincadeira de criança	2	1	24
事事如意	shì shì rú yì	tudo como desejado	1	1	44
朵拉莉絲	duǒ lā lì sī	Doralice	2	1	31
董事	dǒng shì	diretor	1	1	34
優雅	yōu yǎ	elegante	3	1	13
王子	wáng zǐ	príncipe	5	1	23
流行	liú xíng	popular	2	1	22
聊得來	liáo de lái	dar-se bem (em conversa)	0	1	25
瑪黛琳娜	mǎ dài lín nà	Madalena	0	1	34
疾	jí	doença	0	1	\N
不願意	bù yuàn yì	não querer	2	1	44
喔	ō	oh	46	1	\N
維奧萊塔夫人	wéi ào lái tǎ fū rén	Senhora Violetta	2	1	24
了一頓	le yí dùn	(partícula indicando ação concluída)	0	1	52
銀	yín	prata	0	1	\N
無禮的	wú lǐ de	sem educação	0	1	23
找麻煩	zhǎo má fan	procurar problemas	3	1	32
私密	sī mì	privado	2	1	14
少來	shǎo lái	para com isso	0	1	32
一筆	yī bǐ	um traço	3	1	13
名人	míng rén	celebridade	0	1	22
填飽	tián bǎo	encher	0	1	23
峰會	fēng huì	cúpula	0	1	14
順利無阻	shùn lì wú zǔ	tranquila e sem obstruções	0	1	44
500	wǔ bǎi	quinhentos	0	1	33
布法達	bù fǎ dá	Buffada	0	1	43
很忙	hěn máng	muito ocupado	0	1	32
必须	bì xū	deve	0	1	41
真好	zhēn hǎo	muito bom	0	1	13
泳池	yǒng chí	piscina	0	1	32
資料夾	zī liào jiá	pasta	0	1	14
患	huàn	sofrer	1	1	\N
奇哥	qí gē	Irmão Qi	21	1	21
遲遲	chí chí	atrasado	1	1	22
拔	bá	extrair	4	1	\N
500萬	wǔ bǎi wàn	5 milhões	0	1	33
安安靜靜	ān ān jìng jìng	tranquilo	0	1	11
偶爾	ǒu ěr	ocasionalmente	7	1	33
拋錨	pāo máo	enguiçar	0	1	12
出口	chū kǒu	saída	6	1	13
腿	tuǐ	perna	14	1	\N
細心	xì xīn	cuidadoso	2	1	41
擁抱	yōng bào	abraço	29	1	14
太平	tài píng	pacífico	0	1	42
臨時	lín shí	temporário	0	1	22
突發狀況	tū fā zhuàng kuàng	situação inesperada	0	1	11
成績	chéng jī	resultado	0	1	21
盧	lú	Lu	7	1	\N
那份	nà fèn	aquela porção	0	1	44
一秒	yī miǎo	um segundo	0	1	13
錯的	cuò de	errado	0	1	45
得分	dé fēn	pontuação	0	1	21
警事	jǐng shì	assuntos policiais	0	1	34
版面	bǎn miàn	página	0	1	34
中獎的	zhòng jiǎng de	premiado	0	1	43
探長	tàn zhǎng	inspetor	0	1	43
只為	zhǐ wèi	apenas para	1	1	34
游泳池	yóu yǒng chí	piscina	4	1	23
草率	cǎo shuài	descuidado	3	1	34
插曲	chā qǔ	interlúdio	1	1	13
約約	yuē yuē	Yue Yue	6	1	11
時尚	shí shàng	elegante	3	1	24
自稱	zì chēng	autodenominar-se	7	1	41
實際上	shí jì shàng	na verdade	13	1	24
紳士	shēn shì	cavalheiro	3	1	14
系列	xì liè	série	2	1	44
買單	mǎi dān	pagar a conta	2	1	31
指控	zhǐ kòng	acusação	5	1	34
那又怎樣	nà yòu zěn yàng	e daí	0	1	44
病床	bìng chuáng	leito de hospital	0	1	42
這一槍	zhè yī qiāng	este tiro	0	1	41
開票	kāi piào	apuração de votos	0	1	14
望	wàng	esperar	21	1	\N
初剪版	chū jiǎn bǎn	corte inicial	0	1	13
摘下	zhāi xià	tirar	0	1	14
知名	zhī míng	conhecido	0	1	12
搞不清楚	gǎo bù qīng chǔ	não entender	0	1	34
維奧萊塔·卡斯蒂略	Wéi ào lái tǎ·Kǎ sī dì lüè	Violeta Castillo	0	1	24
衡量	héng liáng	medir	0	1	22
首要	shǒu yào	primordial	1	1	34
縫紉	féng rèn	costura	0	1	24
齊聚	qí jù	reunir	0	1	24
介	jiè	entre	0	1	\N
超現實	chāo xiàn shí	surreal	0	1	14
阿姨們	ā yí men	tias	0	1	12
忙於	máng yú	ocupado com	0	1	22
刺繡	cì xiù	bordar	0	1	44
姑姑們	gū gu men	tias paternas	0	1	15
捕捉	bǔ zhuō	capturar	0	1	31
獨自一人	dú zì yī rén	sozinha	1	1	24
警探	jǐng tàn	detetive	7	1	34
圖像	tú xiàng	imagens	0	1	24
阿德利婭	Ā dé lì yǎ	Adélia	27	1	12
預約掛號	yù yuē guà hào	marcar consulta	1	1	41
日程表	rì chéng biǎo	agenda	1	1	42
老土	lǎo tǔ	antiquado/caipira	4	1	33
對勁	duì jìn	certo/normal	1	1	44
老頭子	lǎo tóu zi	velho	1	1	32
伊澤特	yī zé tè	Izet	1	1	12
嘉年華	jiā nián huá	carnaval	1	1	12
小鬼	xiǎo guǐ	diabrete	1	1	33
留出	liú chū	reservar	0	1	21
薇薇娜	wēi wēi nà	Vivina	6	1	11
夜裡	yè lǐ	noite	1	1	43
停戰	tíng zhàn	trégua	1	1	24
道格拉斯	dào gé lā sī	Douglas	1	1	42
吸鼻聲	xī bí shēng	fungada/som de aspirar pelo nariz	2	1	12
鎖住	suǒ zhù	trancar	1	1	34
遇見了	yù jiàn le	encontrou	1	1	44
維維尼亞	Wéi wéi ní yà	Vivínia	0	1	22
當下	dāng xià	o momento presente	4	1	14
一點都不	yī diǎn dōu bù	nem um pouco	1	1	13
獨立	dú lì	independente	6	1	24
你不該	nǐ bù gāi	você não deveria	1	1	34
CHICO	CHICO	Chico	1	1	\N
男聲	nán shēng	voz masculina	8	1	21
典禮	diǎn lǐ	cerimônia	1	1	33
回頭路	huí tóu lù	caminho de volta	2	1	22
洗腦	xǐ nǎo	lavagem cerebral	2	1	33
傑爾森	jié ěr sēn	Jelson	2	1	23
噗	pū	som de riso ou sopro	6	1	\N
同事們	tóng shì men	colegas	1	1	24
不像	bù xiàng	não parecer	1	1	44
門東薩	mén dōng sà	Mendoça	1	1	21
寒冷	hán lěng	frio	2	1	23
動作快點	dòng zuò kuài diǎn	mexa-se rápido	0	1	44
治安	zhì ān	segurança pública	0	1	41
起源	qǐ yuán	origem	0	1	32
依舊	yī jiù	ainda	5	1	14
獻給	xiàn gěi	dedicado a	3	1	43
加布里埃爾	jiā bù lǐ āi ěr	Gabriel	1	1	14
垃圾堆	lā jī duī	pilha de lixo	5	1	11
神力	shén lì	poder divino	0	1	24
圖卡	tú kǎ	Tuka	1	1	23
豪宅	háo zhái	mansão	1	1	22
電子語音	diàn zǐ yǔ yīn	voz eletrônica	6	1	43
幸運星	xìng yùn xīng	estrela da sorte	0	1	44
瓦爾德雷斯	wǎ ěr dé léi sī	Valderez	13	1	33
贊助人	zàn zhù rén	patrocinador	0	1	44
群體	qún tǐ	grupo	5	1	23
片刻	piàn kè	momento	5	1	44
流逝	liú shì	passar (tempo)	5	1	24
計票	jì piào	contagem de votos	1	1	44
手續	shǒu xù	procedimento	4	1	34
下手	xià shǒu	atacar	1	1	43
活出	huó chū	viver	41	1	21
重量	zhòng liàng	peso	2	1	44
有價值的	yǒu jià zhí de	valioso	0	1	34
入睡	rù shuì	adormecer	4	1	44
咬	yǎo	mordeu	2	1	\N
女兒們	nǚ ér men	filhas	0	1	32
菸頭	yān tóu	bituca de cigarro	15	1	12
弗雷塔斯	fú léi tǎ sī	Freitas	0	1	22
舉報	jǔ bào	denunciar	1	1	34
被捕	bèi bǔ	ser preso	1	1	43
小蟲子	xiǎo chóng zi	pequeno inseto	0	1	32
如昔	rú xī	como antes	0	1	21
遙想	yáo xiǎng	recordar	0	1	23
並肩	bìng jiān	ombro a ombro	0	1	41
排除	pái chú	eliminar	0	1	22
萬難	wàn nán	todas as dificuldades	0	1	42
有力	yǒu lì	vigoroso	0	1	34
令人羨慕	lìng rén xiàn mù	invejável	0	1	42
薇薇尼亞	Wēi wēi ní yà	Vivínia	0	1	11
選票	xuǎn piào	voto	0	1	34
隨後	suí hòu	em seguida	0	1	24
卡琳娜	Kǎ lín nà	Karina	3	1	32
逮捕	dài bǔ	prender	8	1	43
組合	zǔ hé	combinação	0	1	32
絲毫	sī háo	um pouco (com 'não')	0	1	12
起疑	qǐ yí	suspeitar	0	1	32
同往	tóng wǎng	ir juntos	0	1	23
說的	shuō de	dito	2	1	15
頻繁	pín fán	frequente	0	1	22
傷心欲絕	shāng xīn yù jué	desolado	0	1	11
坐牢	zuò láo	ir para a prisão	1	1	42
而活	ér huó	viver	2	1	22
人力資源	rén lì zī yuán	recursos humanos	2	1	24
聖卡塔琳娜	shèng kǎ tǎ lín nà	Santa Catarina	1	1	43
宿醉	sù zuì	ressaca	3	1	44
氣炸	qì zhà	explodir de raiva	3	1	44
費爾南達	Fèi ěr nán dá	Fernanda	4	1	43
嚴肅	yán sù	sério	25	1	24
海岸	hǎi àn	costa	1	1	34
伊莎特	yī shā tè	Isalt	1	1	11
正式	zhèng shì	oficialmente	7	1	44
維持	wéi chí	manter	3	1	22
斗	dǒu	caçamba	1	1	\N
João	João	João	30	1	\N
疏遠	shū yuǎn	distanciar	2	1	13
堆	duī	pilha	8	1	\N
侵害	qīn hài	dano, ataque	1	1	14
認輸	rèn shū	admitir a derrota	1	1	41
免受	miǎn shòu	evitar sofrer	2	1	34
你可以	nǐ kě yǐ	você pode	2	1	33
比爾	bǐ ěr	Bill	3	1	33
玩笑	wán xiào	brincadeira	38	1	24
卡車	kǎ chē	caminhão	1	1	31
抖落	dǒu luò	sacudir	14	1	34
天知道	tiān zhī dào	só Deus sabe	1	1	11
尼羅	ní luó	Nilo	1	1	22
灰塵	huī chén	poeira	14	1	12
人口	rén kǒu	população	2	1	23
專案	zhuān àn	projeto	1	1	14
桑拿房	sāng ná fáng	sauna	1	1	12
公雞	gōng jī	galo	1	1	11
才不是呢	cái bú shì ne	de jeito nenhum	1	1	22
要嗎	yào ma	quer/necessita	1	1	45
諾爾薩	nuò ěr sà	Norsa	3	1	43
低收入	dī shōu rù	baixa renda	1	1	11
統治者	tǒng zhì zhě	governante	1	1	34
300	sān bǎi	trezentos	1	1	13
息息相關	xī xī xiāng guān	estar intimamente relacionado	1	1	11
癱瘓	tān huàn	paralisada	1	1	14
佔有慾	zhàn yǒu yù	possessividade	1	1	43
兒時	ér shí	infância	1	1	22
鰥夫	guān fū	viúvo	1	1	11
深愛	shēn ài	amar profundamente	1	1	14
切開	qiē kāi	cortar	1	1	11
處女膜	chǔ nǚ mó	hímen	1	1	33
下週	xià zhōu	semana que vem	1	1	41
生計	shēng jì	sustento	1	1	14
理念	lǐ niàn	conceito	1	1	34
檢驗	jiǎn yàn	examinar	2	1	34
緊鄰	jǐn lín	próximo a	1	1	32
爺爺	yé ye	avô	13	1	25
羅納迪諾	luó nà dí nuò	Ronaldinho	1	1	24
懂事	dǒng shì	ser sensato	1	1	34
給個	gěi gè	dar um	1	1	34
蝙蝠俠	biān fú xiá	Batman	0	1	12
尼祿	Ní lù	Nero	1	1	24
聽到的	tīng dào de	ouvir	1	1	14
香	xiāng	perfumado	7	1	\N
收留	shōu liú	acolher	1	1	12
穿上	chuān shàng	vestir	2	1	14
矛盾	máo dùn	contradição	1	1	24
打領帶	dǎ lǐng dài	usar gravata	1	1	33
懵懂	měng dǒng	inocente	1	1	33
緊急情況	jǐn jí qíng kuàng	situação de emergência	1	1	32
丟棄	diū qì	descartado	2	1	14
一覺	yī jiào	um sono	1	1	14
阿黛利亞	Ā dài lì yà	Adélia	5	1	14
摩西	mó xī	Moisés	1	1	21
判定	pàn dìng	julgar	1	1	44
迫切	pò qiè	urgente	1	1	44
州立	zhōu lì	estadual	1	1	14
被發現	bèi fā xiàn	foi descoberto	1	1	41
賭	dǔ	apostar	3	1	\N
艦長	jiàn zhǎng	capitão	1	1	43
我得走了	wǒ dé zǒu le	Preciso ir	1	1	32
拜佛	bài fó	adorar buda	1	1	42
能幹	néng gàn	competente	2	1	24
脫下	tuō xià	tirar	1	1	14
內褲	nèi kù	calcinha/cueca	3	1	44
衛生部長	wèi shēng bù zhǎng	ministro da saúde	1	1	41
打擾一下	dǎ rǎo yī xià	com licença	1	1	33
逃亡	táo wáng	fuga	1	1	22
今天早上	jīn tiān zǎo shang	esta manhã	1	1	11
哭著	kū zhe	chorando	2	1	15
阿德利亞	Ā dé lì yà	Adélia	1	1	12
未成年人	wèi chéng nián rén	menor de idade	1	1	42
那天	nà tiān	aquele dia	2	1	41
ELIZETE	ELIZETE	ELIZETE	1	1	\N
分文	fēn wén	dinheiro	1	1	12
香檳	xiāng bīn	champanhe	5	1	11
荷馬	hé mǎ	Homer	5	1	23
比圖卡	bǐ tú kǎ	Bituca	7	1	32
那裏	nà lǐ	lá	2	1	43
丟進	diū jìn	jogar dentro	1	1	14
護衛艦	hù wèi jiàn	fragata	1	1	44
混混	hùn hun	desordeiro	1	1	45
現代	xiàn dài	moderno	3	1	44
哼唱	hēng chàng	cantarolando	1	1	14
索菲亞修女	suǒ fēi yà xiū nǚ	freira Sofia	1	1	31
錫安	xī ān	Sião	1	1	11
一巴掌	yī bā zhǎng	um tapa	1	1	11
甜棗	tián zǎo	tâmara doce	1	1	23
抱抱	bào bào	abraço	2	1	44
缺愛	quē ài	carente de amor	1	1	14
桌子	zhuō zi	mesa	4	1	15
阿瑪達	Ā Mǎ Dá	Amada	1	1	13
女權主義者	nǚ quán zhǔ yì zhě	feminista	1	1	32
污漬	wū zì	mancha	1	1	14
不人道	bù rén dào	desumano	1	1	42
還算	hái suàn	ainda conta como	1	1	24
司法	sī fǎ	justiça	3	1	13
貼心	tiē xīn	atencioso	1	1	11
搭便車	dā biàn chē	pegar carona	1	1	14
睡過	shuì guò	dormir	1	1	44
長聲	cháng shēng	som prolongado	5	1	21
40	sì shí	quarenta	2	1	42
阿德莉亞	Ā dé lì yà	Adélia	13	1	12
阿德莉婭	Ā dé lì yǎ	Adélia	9	1	12
范德·阿爾梅達	fàn dé · ā ěr méi dá	Vander Almeida	1	1	42
熄	xī	apagar	1	1	\N
全面	quán miàn	abrangente	1	1	24
此後	cǐ hòu	depois disso	1	1	34
餵	wèi	alimentar	1	1	\N
險些	xiǎn xiē	quase	1	1	31
瓦斯卡諾	wǎ sī kǎ nuò	Vascano	1	1	31
瓦斯卡人	wǎ sī kǎ rén	vascano	1	1	31
變弱了	biàn ruò le	enfraqueceu	1	1	44
萬德	wàn dé	Vander	1	1	42
分攤	fēn tān	dividir	2	1	11
瓦斯科	wǎ sī kē	Vasco	13	1	31
兄弟們	xiōng dì men	irmãos	4	1	14
所有的	suǒ yǒu de	todos	6	1	33
少年	shào nián	adolescente	3	1	42
8	bā	oito	1	1	\N
暫	zàn	temporariamente	1	1	\N
預防性的	yù fáng xìng de	preventivo	1	1	42
莉澤特	Lì zé tè	Lizette	3	1	42
原則	yuán zé	princípio	13	1	22
加緊	jiā jǐn	intensificar	0	1	13
共進晚餐	gòng jìn wǎn cān	jantar juntos	3	1	44
大蒜	dà suàn	alho	9	1	44
倔強	jué jiàng	teimoso	0	1	24
放鴿子	fàng gē zi	dar um bolo	1	1	41
敬告	jìng gào	advertir respeitosamente	1	1	44
尼羅河	ní luó hé	Rio Nilo	3	1	22
打造	dǎ zào	feita sob medida	0	1	34
闖蕩	chuǎng dàng	aventurar-se	0	1	34
垃圾車	lā jī chē	caminhão de lixo	1	1	11
潛入	qián rù	infiltrar-se	0	1	24
祈願	qí yuàn	rezar por	0	1	24
涵蓋	hán gài	abranger	0	1	24
笑著說	xiào zhe shuō	dizendo sorrindo	1	1	45
光頭	guāng tóu	careca	1	1	12
奇聞軼事	qí wén yì shì	anedotas curiosas	0	1	22
炫	xuàn	deslumbrante	1	1	\N
七十年代	qī shí nián dài	década de setenta	0	1	12
人形	rén xíng	forma humana	0	1	22
環球報	huán qiú bào	Jornal Global	1	1	22
小事	xiǎo shì	pequeno assunto	10	1	34
就連	jiù lián	até mesmo	2	1	42
男嬰	nán yīng	bebê menino	1	1	21
法規	fǎ guī	regulamento	1	1	31
產生	chǎn shēng	produzir	8	1	31
低沉	dī chén	grave, profundo	1	1	12
超多的	chāo duō de	superlotadas	1	1	11
垃圾桶	lā jī tǒng	lixeira	5	1	11
夏日	xià rì	verão	0	1	44
過低	guò dī	excessivamente baixa	1	1	41
543-5000	wǔ sì sān wǔ líng líng líng	543-5000	1	1	34
綁定	bǎng dìng	vincular	0	1	34
值勤	zhí qín	serviço de plantão	1	1	22
墜入	zhuì rù	cair em	1	1	44
愛河	ài hé	rio do amor	1	1	42
上司	shàng sī	chefe	4	1	41
第十	dì shí	décimo	1	1	42
阿爾弗雷尼奧	Ā ěr fú léi ní ào	Alfredônio	1	1	13
熱騰騰	rè téng téng	fumegante	2	1	42
再不	zài bù	não mais	1	1	44
阿黛莉婭	Ā dài lì yǎ	Adélia	3	1	14
來著	lái zhe	era mesmo	1	1	25
吸引力	xī yǐn lì	atração	1	1	13
回首	huí shǒu	olhar para trás	0	1	23
班表	bān biǎo	escala de turno	1	1	13
扔進	rēng jìn	jogar dentro	1	1	14
唧唧聲	jī jī shēng	som de chilrear	9	1	11
妝容	zhuāng róng	maquiagem	1	1	12
一支	yī zhī	um/uma (classificador para objetos longos e finos)	3	1	11
睫毛膏	jié máo gāo	rímel	1	1	22
都不配	dōu bù pèi	não merece	1	1	14
之子	zhī zǐ	filho	1	1	13
不僅	bù jǐn	não apenas	5	1	43
奧諾雷中心	ào nuò léi zhōng xīn	Centro Honoré	1	1	44
炸雞塊	zhá jī kuài	nuggets de frango	3	1	21
不多	bù duō	não muito	1	1	41
祖父	zǔ fù	avô	4	1	34
棄嬰	qì yīng	bebê abandonado	1	1	41
不少	bù shǎo	não pouco	3	1	43
誕生	dàn shēng	nascer	6	1	41
睡不著	shuì bù zháo	não conseguir dormir	4	1	44
搞丟了	gǎo diū le	perder	1	1	31
輔導	fǔ dǎo	aconselhamento	1	1	33
評審	píng shěn	avaliação	1	1	23
保障	bǎo zhàng	garantir	1	1	34
著重	zhuó zhòng	enfatizar	1	1	24
耶穌	yē sū	Jesus	21	1	11
HOMERO	HOMERO	Homero	1	1	\N
伊莉澤特	yī lì zé tè	Elizabete	1	1	14
不當	bù dàng	inadequado	1	1	44
跨	kuà	através	1	1	\N
完整性	wán zhěng xìng	integridade	1	1	23
監護權	jiān hù quán	custódia	3	1	14
紅黑軍團	hóng hēi jūn tuán	time rubro-negro	1	1	21
榮耀無比	róng yào wú bǐ	glória incomparável	1	1	24
弗拉門戈	fú lā mén gē	Flamengo	8	1	21
命令	mìng lìng	ordem	16	1	44
報亭	bào tíng	banca de jornal	0	1	42
定了	dìng le	decidido	2	1	45
膽量	dǎn liàng	coragem	2	1	34
放手	fàng shǒu	soltar a mão	5	1	43
兜風	dōu fēng	passear	3	1	11
菸蒂	yān dì	bituca de cigarro	3	1	14
8點	bā diǎn	8 horas	1	1	13
關進去	guān jìn qù	trancar dentro	1	1	14
喊停	hǎn tíng	pedir para parar	1	1	32
早已	zǎo yǐ	já	0	1	33
融合	róng hé	fundir	1	1	22
特點	tè diǎn	características	0	1	43
艘	sōu	classificador para embarcações	0	1	\N
興奮感	xīng fèn gǎn	sensação de empolgação	0	1	14
盯	dīng	olhar fixamente	0	1	\N
炸物	zhá wù	frituras	0	1	24
捲餅	juǎn bǐng	wrap/envolto	1	1	33
炸雞排	zhá jī pái	filé de frango empanado	0	1	21
伴隨	bàn suí	acompanhado	0	1	42
梳頭髮	shū tóu fà	pentear o cabelo	0	1	12
與此同時	yǔ cǐ tóng shí	ao mesmo tempo	0	1	33
玩得開心	wán dé kāi xīn	divertir-se	0	1	22
懷念	huái niàn	lembrar com saudade	8	1	24
挺好的	tǐng hǎo de	muito bom	0	1	33
說說	shuō shuo	falar	0	1	15
劑	jì	dose	0	1	\N
襲來	xí lái	atacar/vir de repente	0	1	22
這就是	zhè jiù shì	é isso aí	0	1	44
漲	zhǎng	subir	0	1	\N
權限	quán xiàn	permissão	0	1	24
埃迪萊妮	Āi dí lái nī	Edilene	0	1	12
推翻	tuī fān	derrubar	0	1	11
當面	dāng miàn	pessoalmente	0	1	14
亮片	liàng piàn	lantejoulas	1	1	44
辦得到	bàn dé dào	conseguir fazer	1	1	42
董事會	dǒng shì huì	conselho de administração	2	1	34
怎麼看	zěn me kàn	como vê	0	1	35
好不好	hǎo bù hǎo	que tal	1	1	34
現象	xiàn xiàng	fenômeno	5	1	44
大道	dà dào	avenida principal	17	1	44
現代化	xiàn dài huà	modernização	1	1	44
歷史學家	lì shǐ xué jiā	historiador	1	1	43
必定	bì dìng	certamente	19	1	44
來臨	lái lín	chegar	1	1	22
鬆了口氣	sōng le kǒu qì	aliviado	0	1	15
聯賽	lián sài	liga	2	1	24
資訊	zī xùn	informações	1	1	14
卡斯提略	kǎ sī tí lüè	Castillo	4	1	31
來着	lái zhe	era/foi	0	1	25
小屋	xiǎo wū	cabana	1	1	31
花園	huā yuán	jardim	2	1	12
懂了嗎	dǒng le ma	entendeu	1	1	35
美極了	měi jí le	lindo demais	1	1	32
穩住	wěn zhù	estabilizar	4	1	34
奇怪的	qí guài de	estranho	0	1	24
輪	lún	roda	19	1	\N
指示	zhǐ shì	instruções	1	1	34
傲	ào	orgulho	1	1	\N
預兆	yù zhào	presságio	2	1	44
送到	sòng dào	entregue	4	1	44
埃迪萊娜	Āi dí lái nà	Edilena	0	1	12
惱火	nǎo huǒ	irritado	1	1	33
一無所知	yī wú suǒ zhī	não saber nada	4	1	12
獨特	dú tè	único	1	1	24
進步	jìn bù	progredir	25	1	44
伴隨著	bàn suí zhe	acompanhado por	0	1	42
可得	kě dé	deve	1	1	32
反悔	fǎn huǐ	voltar atrás	1	1	33
阿爾伯托	ā ěr bó tuō	Alberto	-42	1	13
零食	líng shí	lanche	5	1	22
雲霄飛車	yún xiāo fēi chē	montanha-russa	0	1	21
甜點	tián diǎn	sobremesa	0	1	23
滿嘴	mǎn zuǐ	boca cheia	0	1	33
前提	qián tí	premissa	0	1	22
火腿	huǒ tuǐ	presunto	1	1	33
高喬人	Gāo qiáo rén	Gaúcho	0	1	12
下回	xià huí	próxima vez	0	1	42
馬達萊娜區	Mǎ dá lái nà qū	região Maddalena	0	1	32
晃來晃去	huàng lái huàng qù	vagueando	0	1	42
暢遊	chàng yóu	viajar à vontade	0	1	42
調情	tiáo qíng	flerte	0	1	22
工作人員	gōng zuò rén yuán	equipe de trabalho	0	1	14
真正地	zhēn zhèng dì	verdadeiramente	0	1	14
回想	huí xiǎng	relembrar	0	1	23
遵循	zūn xún	seguir	0	1	12
嫉妒心	jí dù xīn	ciúmes	0	1	24
老媽	lǎo mā	mãe	0	1	31
傳來了	chuán lái le	espalhou	0	1	22
天上的	tiān shàng de	celestial	0	1	14
神啊	shén a	deus	0	1	25
我吧	wǒ ba	eu	0	1	35
多加	duō jiā	adicionar mais	0	1	11
迷人了	mí rén le	fascinante	0	1	22
大街	dà jiē	avenida	0	1	41
毫無保留	háo wú bǎo liú	sem reservas	0	1	22
士氣	shì qì	moral	0	1	44
強心針	qiáng xīn zhēn	injeção de estimulante cardíaco	0	1	21
盡力而為	jìn lì ér wéi	fazer o melhor possível	0	1	44
創下	chuàng xià	estabeleceu	0	1	44
虛構	xū gòu	fictício	0	1	14
羅謝爾	luó xiè ěr	Rochelle	0	1	24
白銀	bái yín	prata	0	1	22
小組	xiǎo zǔ	grupo	0	1	33
漲價	zhǎng jià	aumentar o preço	0	1	34
曼格拉区	màn gé lā qū	distrito de Mangala	0	1	42
不可避免	bù kě bì miǎn	inevitável	0	1	43
林多馬爾	lín duō mǎ ěr	Lindomar (nome próprio)	0	1	21
停賽	tíng sài	suspensão	1	1	24
側翼	cè yì	flanco	1	1	44
透露	tòu lù	revelou	13	1	44
空調	kōng tiáo	ar-condicionado	2	1	12
熱天	rè tiān	dia quente	0	1	41
軟管	ruǎn guǎn	mangueira	0	1	33
處分	chǔ fèn	penalidade	1	1	34
機密	jī mì	confidencial	0	1	14
保鑣	bǎo biāo	guarda-costas	0	1	31
這傢伙	zhè jiā huǒ	esse cara	0	1	41
景象	jǐng xiàng	cena	0	1	34
雞皮疙瘩	jī pí gē da	arrepios	0	1	12
點子	diǎn zi	ideias	0	1	35
古老	gǔ lǎo	antigo	0	1	33
全年	quán nián	o ano todo	0	1	22
箱子	xiāng zi	caixa	0	1	15
裝了	zhuāng le	carregou	0	1	15
才怪	cái guài	apenas brincando	0	1	24
三天	sān tiān	três dias	2	1	11
潰	kuì	colapso	0	1	\N
何處	hé chù	onde	14	1	24
無能為力	wú néng wéi lì	impotente	12	1	22
場合	chǎng hé	ocasião	12	1	32
真正	zhēn zhèng	verdadeiramente	27	1	14
洋娃娃	yáng wá wa	boneca	1	1	22
而已	ér yǐ	apenas isso	36	1	23
特雷索波利斯	Tèlèsuōbólìsī	Treze Tílias	3	1	\N
站點	zhàn diǎn	ponto de parada	0	1	43
打折	dǎ zhé	descontado	0	1	32
喿	yō	caramba	1	1	\N
悲慘	bēi cǎn	miserável	0	1	13
錯覺	cuò jué	ilusão	0	1	42
手工	shǒu gōng	artesanal	0	1	31
閃亮	shǎn liàng	brilhante	0	1	34
風景	fēng jǐng	paisagem	0	1	13
化裝	huà zhuāng	fantasia	0	1	41
固定	gù dìng	fixado	0	1	44
住了	zhù le	(partícula indicativa de ação concluída)	0	1	45
飛龍	fēi lóng	dragão voador	0	1	12
備用	bèi yòng	reserva	0	1	44
水瓶	shuǐ píng	garrafa de água	0	1	32
棒球	bàng qiú	beisebol	1	1	42
保全	bǎo quán	segurança	1	1	32
帶著	dài zhe	trazendo	19	1	45
回去	huí qù	voltar	15	1	24
獎	jiǎng	prêmio	8	1	\N
合法	hé fǎ	legal	4	1	23
閃	shǎn	brilhante	5	1	\N
投資	tóu zī	investimento	29	1	21
節制	jié zhì	autocontrole	1	1	24
嗚	wū	uivo	3	1	\N
噓聲	xū shēng	sussurro	3	1	11
老派	lǎo pài	antiquado	3	1	34
嬉戲	xī xì	brincar	0	1	14
於是	yú shì	então	14	1	24
ohn	yuē hàn	john	1	1	14
收	shōu	aceitar	18	1	\N
地盤	dì pán	território	0	1	42
淋浴	lín yù	chuveiro	0	1	24
不出來	bù chū lái	não conseguir	0	1	41
假日	jià rì	feriado	0	1	44
若伊爾森	ruò yī ěr sēn	Ronaldo	0	1	41
心意	xīn yì	sentimento	0	1	14
發脾氣	fā pí qì	perde a paciência	0	1	12
討好	tǎo hǎo	agradar	0	1	33
家中	jiā zhōng	em casa	8	1	11
跑到	pǎo dào	correu para	0	1	34
巴特波拉	bā tè bō lā	Batbora (nome próprio)	0	1	14
掩飾	yǎn shì	disfarce	0	1	34
擺攤	bǎi tān	montar barraca	0	1	31
圈	quān	círculo	0	1	\N
離校	lí xiào	saída da escola	0	1	24
溜達	liū dá	passear	0	1	12
跟踪	gēn zōng	seguir	0	1	11
微型	wēi xíng	miniatura	0	1	12
發明的	fā míng de	inventado	0	1	12
淡了	dàn le	desvanecido	0	1	45
首映	shǒu yìng	estreia	0	1	34
龍舟賽	lóng zhōu sài	corrida de barcos-dragão	0	1	21
大塊頭	dà kuài tóu	grandalhão	0	1	44
小盧	Xiǎo Lú	Xiao Lu	0	1	32
Roxelle	Roxelle	Roxelle	0	1	\N
縫補	féng bǔ	costurar/remendar	0	1	23
納爾多	nà ěr duō	Naldo	0	1	43
金鍊	jīn liàn	corrente de ouro	0	1	14
銀鍊	yín liàn	corrente de prata	0	1	24
添	tiān	adicionar	0	1	\N
塞津哈	sāi jīn hā	Sejinha	0	1	11
細節	xì jié	detalhes	9	1	42
爭鬥	zhēng dòu	luta	0	1	14
周到	zhōu dào	atencioso	2	1	14
大事	dà shì	grande evento	1	1	44
亮粉	liàng fěn	glitter	0	1	43
融洽	róng qià	harmonioso	1	1	24
神靈	shén líng	divindade	1	1	22
愛過	ài guò	amou	1	1	44
悉尼	xī ní	Sidney	1	1	12
扒手	pá shǒu	batedor de carteira	0	1	23
阿謝	ā xiè	agradecimento	2	1	14
爆滿	bào mǎn	lotado	0	1	43
寬容	kuān róng	indulgente	2	1	12
口氣	kǒu qì	tom	5	1	34
瑞奇	ruì qí	Ricky	3	1	42
曰	yuē	disse	259	3	\N
表格	biǎo gé	formulários	0	1	32
保鏢	bǎo biāo	guarda-costas	5	1	31
被窩	bèi wō	cobertor	0	1	41
居	jū	residir	7	1	\N
車上	chē shàng	no carro	0	1	14
福利	fú lì	benefícios	0	1	24
貝絲	bèi sī	Beth	17	1	41
粗人	cū rén	grosseiro	0	1	12
埃德森	Āi dé sēn	Edson	49	1	12
珍惜	zhēn xī	valorizar	18	1	11
政	zhèng	governo	4	1	\N
清單	qīng dān	lista	1	1	11
Embora	suī rán	embora	0	1	12
帶我去	dài wǒ qù	leve-me	0	1	43
大堆	dà duī	grande pilha	0	1	41
聖灰星期三	shèng huī xīng qī sān	quarta-feira de cinzas	0	1	41
收費	shōu fèi	cobrança de taxa	1	1	14
降臨	jiàng lín	descer/chegar	2	1	42
進行中	jìn xíng zhōng	em andamento	0	1	42
治	zhì	governar	7	1	\N
請示	qǐng shì	consultar	0	1	34
獲取	huò qǔ	obter	1	1	43
分發	fēn fā	distribuir	2	1	11
雷鳴	léi míng	trovão	0	1	22
盟友	méng yǒu	aliados	1	1	23
很快樂	hěn kuài lè	muito felizes	0	1	34
若奧	ruò ào	nome próprio (João)	0	1	44
家庭中	jiā tíng zhōng	família	0	1	12
行蹤	xíng zōng	paradeiro	0	1	21
維尼亞	wéi ní yà	Virgínia	0	1	22
紫羅蘭色	zǐ luó lán sè	violeta	0	1	32
專門	zhuān mén	especialmente	0	1	12
證明了	zhèng míng le	provou	0	1	42
信賴的	xìn lài de	de confiança	0	1	44
整頓	zhěng dùn	arrumar	0	1	34
蘿克塞爾	Luó kè sāi ěr	Rockcell	0	1	24
聽錯	Tīng cuò	ouvir errado	0	1	14
打動	dǎ dòng	comover	6	1	34
襯衫	chèn shān	camisa	3	1	41
一輛車	yī liàng chē	um carro	0	1	14
愛戴	ài dài	amar e respeitar	0	1	44
拘泥	jū nì	ater-se	0	1	14
習俗	xí sú	costumes	0	1	22
正因為	zhèng yīn wèi	justamente porque	0	1	41
奔跑	bēn pǎo	correr	0	1	13
奧里沙	ào lǐ shā	orixá	1	1	43
抓走	zhuā zǒu	levar à força	1	1	13
迴盪	huí dàng	ecoar	3	1	24
番	fān	vez	0	1	\N
捲入	juǎn rù	envolvido	0	1	34
蘿潔塔	luó jié tǎ	Rojeta	0	1	22
添麻煩	tiān má fán	causar problemas	0	1	12
到貨	dào huò	entrega de mercadorias	0	1	44
可能會	kě néng huì	pode	3	1	32
狐狸	hú li	raposa	8	1	25
缺失	quē shī	falta	0	1	11
美人兒	měi rén er	belezinhas	0	1	32
同胞們	tóng bāo men	compatriotas	0	1	21
Jão	Jão	João	6	1	\N
最佳	zuì jiā	melhor	0	1	41
公斤	gōng jīn	quilograma	0	1	11
視為	shì wéi	ver como	21	1	42
淪陷	lún xiàn	cair (em desgraça/amor)	0	1	24
manipulative	manipulative	manipulativo	1	1	\N
宣言	xuān yán	declaração	0	1	12
藥物治療	yào wù zhì liáo	tratamento medicamentoso	0	1	44
抗拒	kàng jù	resistir	0	1	44
逐漸	zhú jiàn	gradualmente	0	1	24
磨合	mó hé	ajustar-se	0	1	22
中槍	zhòng qiāng	levar um tiro	5	1	41
情報	qíng bào	inteligência	0	1	24
呼氣	hū qì	expirar	0	1	14
預先	yù xiān	antecipadamente	0	1	41
大條	dà tiáo	grande problema	0	1	42
擺設	bǎi shè	decoração	0	1	34
薇奧萊塔	wēi ào lái tǎ	Violeta	0	1	14
serious	serious	sério	10	1	\N
心地	xīn dì	coração	0	1	14
照著	zhào zhe	de acordo com	1	1	45
週期	zhōu qī	ciclo	1	1	11
挑釁	tiǎo xìn	provocar	1	1	34
就不	jiù bù	não	2	1	44
缺	quē	falta	11	1	\N
渴望	kě wàng	ansiar	18	1	34
從未	cóng wèi	nunca	74	1	24
取得	qǔ dé	obter	1	1	32
仙女	xiān nǚ	fada	5	1	13
一句	yī jù	uma palavra	2	1	14
妨礙	fáng ài	atrapalhar	5	1	24
失誤	shī wù	erros	1	1	14
灌輸	guànshū	incutir	1	1	\N
六個	liù gè	seis	0	1	44
孚日	Fú rì	Vosges	0	1	24
恨之入骨	hèn zhī rù gǔ	odiar profundamente	0	1	41
EDSON	EDSON	EDSON	0	1	\N
落後	luò hòu	atrasado	1	1	44
請求	qǐng qiú	solicitar	37	1	32
愛心	ài xīn	amor	4	1	41
Chico	Chico	Chico	1	1	\N
透	tòu	completamente	52	1	\N
刻苦	kè kǔ	diligente/assíduo	0	1	43
平凡	píng fán	comum	0	1	22
過活	guò huó	viver	0	1	42
約ão	Yuē'ào	João	1	1	\N
木材	mù cái	madeira	0	1	42
家具	jiā jù	móvel	1	1	14
搬過來	bān guò lái	trazer para cá	0	1	14
邁出	mài chū	dar	0	1	41
我真	wǒ zhēn	eu realmente	0	1	31
默契	mò qì	sintonia	0	1	44
救世主	jiù shì zhǔ	salvador	0	1	44
主要是	zhǔ yào shì	principalmente é	0	1	34
錯失	cuò shī	perder	0	1	41
掩護	yǎn hù	cobrir	0	1	34
起疑心	qǐ yí xīn	suspeitar	0	1	32
一點地	yī diǎn de	gradualmente	0	1	13
卡菈	kǎ lā	Kara	0	1	31
在某些方面	zài mǒu xiē fāng miàn	em certos aspectos	0	1	43
席	xí	esteira	5	1	\N
席薇妮雅	xí wēi nī yǎ	Silvania	0	1	21
緊張兮兮	jǐn zhāng xī xī	nervoso	0	1	31
球隊	qiú duì	time	1	1	24
怨氣	yuàn qì	ressentimento	0	1	44
一步	yī bù	passo	2	1	14
錢財	qián cái	dinheiro	1	1	22
目的	mù dì	objetivo	2	1	44
分配	fēn pèi	distribuição	5	1	14
這話	zhè huà	estas palavras	1	1	44
貨物	huò wù	mercadorias	3	1	44
那件	nà jiàn	aquele	1	1	44
局面	jú miàn	situação	1	1	24
左右	zuǒ yòu	influenciar/controlar	10	1	34
買了	mǎi le	comprou	13	1	35
ZULEIKA	ZULEIKA	ZULEIKA	3	1	\N
姿	zī	postura	0	1	\N
YK	YK	YK	0	1	\N
長椅	cháng yǐ	banco	0	1	23
受得了	shòu dé liǎo	aguentar	0	1	42
香榭麗舍大道	xiāng xiè lì shě dà dào	Avenida dos Campos Elísios	0	1	14
警衛室	jǐng wèi shì	guarita	0	1	34
馬拉松式	mǎ lā sōng shì	maratonista	0	1	31
兩條	liǎng tiáo	dois	0	1	32
鬆懈	sōng xiè	relaxar	0	1	14
啪	pā	pah	6	1	\N
河流	hé liú	rios	0	1	22
深知	shēn zhī	compreender profundamente	0	1	11
濃縮咖啡	nóng suō kā fēi	café espresso	0	1	21
錄	lù	gravar	0	1	\N
塞巴	sāi bā	Seba	0	1	11
細語	xì yǔ	sussurro	0	1	43
正眼	zhèng yǎn	olhar direto	0	1	43
瞧過	qiáo guò	olhou	0	1	24
省省	shěng shěng	economizar	0	1	33
摔倒	shuāi dǎo	cair	0	1	13
TILINTAR	tilintar	tilintar	0	1	\N
DE	de	de	0	1	\N
TALHERES	talheres	talheres	0	1	\N
流感	liú gǎn	gripe	0	1	23
喬昂	qiáo áng	Joao	1	1	22
重生	chóng shēng	renascer	1	1	21
籌備	chóu bèi	preparar	2	1	24
慌亂	huāng luàn	em pânico	0	1	14
循環	xún huán	ciclo	1	1	22
巴塞拉爾	Bā sài lā ěr	Barcelar	3	1	14
安娜·露西亞	Ānnà Lùxīyà	Ana Lúcia	1	1	14
文書	wén shū	documentação	1	1	21
成真	chéng zhēn	tornar-se realidade	1	1	21
強烈	qiáng liè	forte	10	1	24
都會	dōu huì	sempre	3	1	14
同樣的	tóng yàng de	os mesmos	1	1	24
巴塞拉	bā sāi lā	Bacelar	1	1	11
揮之不去的	huī zhī bù qù de	persistente	1	1	11
出生證明	chū shēng zhèng míng	certidão de nascimento	4	1	11
一頁	yī yè	uma página	2	1	14
棘手	jí shǒu	complicada	2	1	23
正經事	zhèng jīng shì	assunto sério	0	1	41
一陣子	yī zhèn zi	um tempo	5	1	14
不是吧	bù shì ba	não é	0	1	44
改進	gǎi jìn	melhorar	3	1	34
青	qīng	verde	3	1	\N
說來	shuō lái	dizer	0	1	12
援兵	yuán bīng	reforços	0	1	21
耍手段	shuǎ shǒu duàn	manipulando	0	1	33
籌錢	chóu qián	arrecadar dinheiro	0	1	22
遲	chí	tarde	17	1	\N
小窩	xiǎo wō	casinha/ninho	0	1	31
租出去	zū chū qù	alugar	0	1	11
一份力	yī fèn lì	uma parte do esforço	0	1	14
蓄意	xù yì	intencional	0	1	44
動彈不得	dòng tan bù dé	incapaz de se mover	0	1	45
每時每刻	měi shí měi kè	a cada momento	0	1	32
說不通	shuō bù tōng	não faz sentido	0	1	14
砲灰	pào huī	bucha de canhão	0	1	41
穆索索	Mù suǒ suǒ	Mussoso	0	1	43
親身	qīn shēn	pessoalmente	0	1	11
體會	tǐ huì	experimentar	0	1	34
注意力	zhù yì lì	atenção	0	1	44
該的	gāi de	deveria	0	1	15
椰子	yē zi	coco	3	1	15
點了	diǎn le	pediu	0	1	35
摩洛哥	mó luò gē	Marrocos	1	1	24
決策權	jué cè quán	poder de decisão	0	1	24
大錯	dà cuò	grande erro	0	1	44
首爾	shǒu ěr	Seul	0	1	33
善良	shàn liáng	bondoso	3	1	42
踏上	tà shàng	pisar em	0	1	44
做個	zuò gè	fazer um	0	1	44
扣分	kòu fēn	descontar pontos	0	1	41
措手不及	cuò shǒu bù jí	pegar de surpresa	0	1	43
希爾維亞	xī ěr wéi yà	Sylvia	0	1	13
真心地	zhēn xīn dì	sinceramente	0	1	11
準確地	zhǔn què de	com precisão	0	1	34
已有的	yǐ yǒu de	existente	0	1	33
釘書針	dìng shū zhēn	grampo	0	1	41
忍者	rěn zhě	ninja	0	1	33
高明	gāo míng	astuto	0	1	12
計謀	jì móu	plano	0	1	42
騙取	piàn qǔ	enganar para obter	0	1	43
被抓到	bèi zhuā dào	ser pego	0	1	41
相提並論	xiāng tí bìng lùn	comparar	0	1	12
授予	shòu yǔ	conceder	0	1	43
全權	quán quán	plenos poderes	0	1	22
沉溺	chén nì	afundar-se	0	1	24
老鷹	lǎo yīng	águia	0	1	31
鳳凰	fèng huáng	fênix	0	1	42
爆料	bào liào	revelar informações	0	1	44
好久不見	hǎo jiǔ bú jiàn	há muito tempo não via	3	1	33
正確無誤	zhèng què wú wù	correto e sem erros	0	1	44
全名	quán míng	nome completo	0	1	22
血緣	xuè yuán	laços de sangue	0	1	42
空白處	kòng bái chù	espaço em branco	0	1	42
無盡	wú jìn	infinito	0	1	24
期盼已久	qī pàn yǐ jiǔ	há muito tempo esperado	0	1	14
拿走了	ná zǒu le	levaram	0	1	23
技術上	jì shù shàng	tecnicamente	0	1	44
走過	zǒu guò	passar por	9	1	34
暈	yūn	tonto	0	1	\N
便車	biàn chē	carona	0	1	41
很高	hěn gāo	muito alta	0	1	31
欄	lán	coluna	0	1	\N
以往	yǐ wǎng	no passado	1	1	33
妮	nī	menina	3	1	\N
活動性	huó dòng xìng	mobilidade	0	1	24
性行為	xìng xíng wéi	sexo	1	1	42
注意事項	zhù yì shì xiàng	precauções	0	1	44
發動機	fā dòng jī	motor	0	1	14
老死	lǎo sǐ	morrer de velhice	0	1	33
分享	fēn xiǎng	compartilhamento	7	1	13
享受	xiǎng shòu	aproveitar	76	1	34
遇	yù	encontrar	11	1	\N
閒置	xián zhì	ocioso	0	1	24
粗劣	cū liè	grosseiro	0	1	14
藝術性	yì shù xìng	artisticidade	0	1	44
破冰	pò bīng	quebrar o gelo	0	1	41
美滿	měi mǎn	feliz	0	1	33
馬克斯	Mǎ kè sī	Marx	0	1	34
民族	mín zú	étnico	0	1	22
助產士	zhù chǎn shì	parteira	0	1	43
股東	gǔ dōng	acionista	2	1	31
翻倍	fān bèi	dobrar	0	1	14
少數	shǎo shù	minoria	0	1	34
有利可圖	yǒu lì kě tú	lucrativo	0	1	34
負擔	fù dān	fardo	1	1	41
利潤	lì rùn	lucro	1	1	44
輸	shū	perder	10	1	\N
困難	kùn nán	difícil	22	1	42
意圖	yì tú	intenção	5	1	42
極其	jí qí	extremamente	1	1	22
屋裡	wū lǐ	dentro de casa	1	1	13
缺乏	quē fá	falta de	21	1	12
命運	mìng yùn	destino	11	1	44
得起	dé qǐ	pode suportar	0	1	23
回聲	huí shēng	eco	35	1	21
眨眼	zhǎ yǎn	piscar os olhos	3	1	33
醒來	xǐng lái	acordar	13	1	32
位置	wèi zhì	local	6	1	44
汁	zhī	suco	5	1	\N
憑	píng	baseado em	22	1	\N
搭	dā	pegar	11	1	\N
沾不上	zhān bù shàng	não consegue tocar	0	1	14
感情	gǎn qíng	sentimento	38	1	32
成就	chéng jiù	realizar	82	1	24
構築	gòu zhù	construir	0	1	44
砂漿	shā jiāng	argamassa	0	1	11
原創	yuán chuàng	original	0	1	24
素材	sù cái	material	0	1	42
柱頭	zhù tóu	capitel	0	1	42
鍍金	dù jīn	douramento	0	1	41
金箔	jīn bó	folha de ouro	0	1	12
表面	biǎo miàn	superfície	0	1	34
功夫	gōng fū	habilidade	0	1	11
皮婭	pí yà	Pia	0	1	24
建築師	jiàn zhú shī	arquiteta	0	1	42
舊夢	jiù mèng	velho sonho	0	1	44
担	dān	preocupar	11	1	\N
喬基歐	Qiáojī'ōu	Giorgio	1	1	\N
猜測	cāi cè	suposição	0	1	14
貴	guì	caro	23	1	\N
期待	qī dài	esperar	30	1	14
黛利拉	dài lì lā	Dalila	2	1	44
街角	jiē jiǎo	esquina	1	1	13
黛莉拉	Dài lì lā	Delilah	1	1	44
女朋友	nǚ péng yǒu	namorada	13	1	32
安妮塔	Ān nī tǎ	Anita	27	1	11
出錯	chū cuò	errar	1	1	14
改革	gǎi gé	reforma	1	1	32
建築	jiàn zhú	construção	1	1	42
重重	chóng chóng	pesadamente	0	1	22
時光	shí guāng	tempo	18	1	21
足不出戶	zú bù chū hù	não sair de casa	0	1	24
丹尼爾	dān ní ěr	Daniel	32	1	12
沉	chén	profundo	11	1	\N
默	mò	silencioso	2	1	\N
散	sàn	passear	0	1	\N
世道	shì dào	estado do mundo	0	1	44
孤兒	gū ér	órfão	0	1	12
死刑	sǐ xíng	pena de morte	0	1	32
慾望	yù wàng	desejo	5	1	44
雞尾酒療法	jī wěi jiǔ liáo fǎ	coquetel terapêutico	0	1	13
DALILA	DALILA	Dalila	0	1	\N
BRUNO	BRUNO	Bruno	0	1	\N
出軌	chūguǐ	trair	0	1	\N
達莉拉	dá lì lā	Dalila	12	1	24
網路	wǎng lù	internet	0	1	34
蜜	mì	mel	0	1	\N
判	pàn	julgar	1	1	\N
職責	zhí zé	dever	0	1	22
判決	pàn jué	sentença	0	1	42
尋覓著	xún mì zhe	procurando	0	1	24
感染了	gǎn rǎn le	infectado	0	1	33
吸引	xī yǐn	atrair	2	1	13
遭	zāo	sofrer	0	1	\N
轟炸	hōng zhà	bombardear	0	1	14
聲稱	shēng chēng	alegar	0	1	11
於事無補	yú shì wú bǔ	não adianta nada	0	1	24
扮演	bàn yǎn	interpretar	0	1	43
首例	shǒu lì	primeiro caso	0	1	34
花樣	huā yàng	truques/artimanhas	1	1	14
騙人	piàn rén	enganar as pessoas	1	1	42
資金	zī jīn	fundos	6	1	11
懷孕了	huái yùn le	grávida	4	1	24
雙眼	shuāng yǎn	olhos	1	1	13
榮譽	róng yù	honra	3	1	24
一般來說	yī bān lái shuō	geralmente	0	1	11
百萬	bǎi wàn	milhão	1	1	34
婚外情	hūn wài qíng	caso extraconjugal	0	1	14
進程	jìn chéng	processo	0	1	42
搖擺	yáo bǎi	balançar	2	1	23
硬要	yìng yào	insistir em	0	1	44
支撐	zhī chēng	apoiar	0	1	11
海倫娜夫人	hǎi lún nà fū rén	Senhora Helena	0	1	32
臭嘴	chòu zuǐ	boca suja	0	1	43
無地農	wú dì nóng	Wudong	0	1	24
逃家	táo jiā	fugir de casa	0	1	21
舞會	wǔ huì	baile	0	1	34
長達	cháng dá	durar até	0	1	22
自行車	zì xíng chē	bicicleta	0	1	42
鈴鐺	líng dang	sino	0	1	25
勞動節	láo dòng jié	Dia do Trabalho	0	1	24
就好了	jiù hǎo le	seria bom	0	1	43
民間	mín jiān	popular/do povo	0	1	21
私生活	sī shēng huó	vida privada	0	1	11
屬實	shǔ shí	verdadeiro	0	1	32
傳遞者	chuán dì zhě	transmissor	0	1	24
共犯	gòng fàn	cúmplice	0	1	44
控告	kòng gào	acusar	0	1	44
誹謗罪	fěi bàng zuì	crime de difamação	0	1	34
誹謗	fěi bàng	difamação	0	1	34
勝訴	shèng sù	ganhar uma ação judicial	0	1	44
毫無用處	háo wú yòng chù	completamente inútil	0	1	22
女醫生	nǚ yī shēng	médica	0	1	31
安全帶	ān quán dài	cinto de segurança	0	1	12
套子	tào zi	camisinha/preservativo	0	1	45
相伴	xiāng bàn	acompanhar	0	1	14
普莉西拉	pǔ lì xī lā	Priscila	0	1	34
佩德羅	pèi dé luó	Pedro	1	1	42
電玩	diàn wán	videogame	0	1	42
不讓	bù ràng	não deixa	0	1	44
玩了	wán le	brincou	0	1	25
普莉希拉	pǔ lì xī lā	Priscila	0	1	34
病毒	bìng dú	vírus	2	1	42
聽得到	tīng dé dào	consegue ouvir	0	1	12
弄不好	nòng bù hǎo	não ficar bom	0	1	44
不太行	bù tài xíng	não muito bom	0	1	44
埃內斯托	āi nèi sī tuō	Ernesto	1	1	14
滑頭	huá tóu	esperto/astuto	0	1	22
往返	wǎng fǎn	ida e volta	0	1	33
愛滋病毒	ài zī bìng dú	vírus HIV	1	1	41
心電感應	xīn diàn gǎn yìng	telepatia	0	1	14
讚美	zàn měi	elogio	0	1	43
性騷擾	xìng sāo rǎo	assédio sexual	0	1	41
發號施令	fā hào shī lìng	dar ordens	0	1	14
阿弗蘭尼奧	ā fú lán ní ào	Aflânio	0	1	12
發胖	fā pàng	engordar	0	1	14
動輒	dòng zhé	facilmente	0	1	42
股息	gǔ xī	dividendo	0	1	31
扣除	kòu chú	deduzir	0	1	42
尤利烏斯	yóu lì wū sī	Júlio	0	1	24
凱撒	kǎi sā	César	0	1	31
撥打	bō dǎ	discar	0	1	13
問候	wèn hòu	saudação	0	1	44
振作	zhèn zuò	animar-se	0	1	44
保利尼奧	Bǎo lì ní ào	Paulinho	0	1	34
付諸	fù zhū	aplicar a	0	1	41
實踐	shí jiàn	prática	0	1	24
存放	cún fàng	armazenar	0	1	24
好幾年	hǎo jǐ nián	vários anos	0	1	33
衝擊力	chōng jī lì	força de impacto	0	1	11
欲望	yù wàng	desejo	0	1	44
大不相同	dà bù xiāng tóng	muito diferente	0	1	44
發自	fā zì	emanar de	0	1	14
接送	jiē sòng	transporte	0	1	14
拉丁美洲	Lādīng Měizhōu	América Latina	1	1	13
主動	zhǔ dòng	ativo	0	1	34
愛滋病	ài zī bìng	AIDS	4	1	41
追蹤	zhuī zōng	rastrear	1	1	11
小酒館	xiǎo jiǔ guǎn	taverna	0	1	33
越是	yuè shì	quanto mais	1	1	44
航海	háng hǎi	navegação	0	1	23
二十年	èr shí nián	vinte anos	0	1	42
勝過	shèng guò	superar	0	1	44
Toyun	Toyun	Toyun	0	1	\N
Renata	Renata	Renata	0	1	\N
Doralice	Doralice	Doralice	0	1	\N
陸上	lù shàng	em terra	0	1	44
鹹	xián	salgado	0	1	\N
藥局	yào jú	farmácia	0	1	42
非事	fēi shì	não-assuntos	0	1	14
言語	yán yǔ	palavras	0	1	23
自尊心	zì zūn xīn	amor-próprio	2	1	41
開除掉	kāi chú diào	demitir	0	1	12
修正	xiū zhèng	corrigir	5	1	14
前天	qián tiān	anteontem	0	1	21
缺點	quē diǎn	desvantagem	1	1	13
拘留	jū liú	detenção	3	1	12
敲打	qiāo dǎ	bater	1	1	13
內烏薩	nèi wū sà	Neusa	1	1	41
攻擊	gōng jī	ataque	1	1	11
令人感動	lìng rén gǎn dòng	comovente	1	1	42
見證人	jiànzhèngrén	testemunhas	1	1	\N
互動	hù dòng	interação	1	1	44
無所謂	wú suǒ wèi	não importa	1	1	23
重拾	chóng shí	retomar	2	1	22
判斷	pàn duàn	julgar	2	1	44
數十次	shù shí cì	dezenas de vezes	0	1	42
數百次	shù bǎi cì	centenas de vezes	0	1	43
男妓	nán jì	prostituto	0	1	24
驗	yàn	verificar	4	1	\N
辦到	bàn dào	realizar	2	1	44
Gerson	Gerson	Gerson	5	1	\N
·	·	·	11	1	\N
之處	zhī chù	aspectos	3	1	14
波拉	bō lā	Paula	0	1	11
勸	quàn	aconselhar	17	1	\N
這顆	zhè kē	este	0	1	41
吃虧	chī kuī	sair perdendo	0	1	11
共舞	gòng wǔ	dançar juntos	0	1	43
太快了	tài kuài le	muito rápido	0	1	44
乖孫	guāi sūn	neto obediente	0	1	11
御用	yù yòng	imperial	0	1	44
婚床	hūn chuáng	cama de casamento	0	1	12
隱密	yǐn mì	secreto	0	1	34
熟知	shú zhī	conhecer bem	0	1	21
昂貴	áng guì	caro	0	1	24
蒙羞	méng xiū	envergonhar	0	1	21
前方	qián fāng	frente	0	1	21
走運	zǒu yùn	sortudo	0	1	34
好主意	hǎo zhǔ yì	boa ideia	0	1	33
而你	ér nǐ	e você	0	1	23
買個	mǎi gè	comprar um	0	1	34
小禮物	xiǎo lǐ wù	pequeno presente	0	1	33
可以嗎	kě yǐ ma	está bem	0	1	33
結結巴巴地	jié jié bā bā de	gaguejando	0	1	22
作客	zuò kè	ser convidado	0	1	44
席爾維娜	xí ěr wéi nà	Silvina	0	1	23
起訴	qǐ sù	processar	0	1	34
樸素	pǔ sù	simples	0	1	34
已有	yǐ yǒu	já tem	0	1	33
幾位	jǐ wèi	vários	0	1	34
言論	yán lùn	comentários	0	1	24
希德	Xī dé	Heed	0	1	12
多娜	duō nà	Donna	0	1	14
慘了	cǎn le	terrível	0	1	35
牙刷	yá shuā	escova de dentes	0	1	21
父權	fù quán	patriarcado	0	1	42
親自動手	qīn zì dòng shǒu	fazer pessoalmente	0	1	14
真誠	zhēn chéng	sinceridade	0	1	12
好多年	hǎo duō nián	muitos anos	0	1	31
釋放令	shì fàng lìng	ordem de libertação	0	1	44
進去了	jìn qù le	entrou	0	1	44
他說	tā shuō	ele disse	0	1	11
放出來了	fàng chū lái le	soltou	0	1	41
執法	zhí fǎ	aplicação da lei	0	1	23
跳過	tiào guò	pular	0	1	44
是非	shì fēi	certo e errado	0	1	41
對錯	duì cuò	correto e incorreto	0	1	44
嚐到	cháng dào	experimentar	0	1	24
濕潤	shī rùn	úmido	0	1	14
社交媒體	shè jiāo méi tǐ	mídia social	0	1	41
滿溢	mǎn yì	transbordante	0	1	34
鼓樂	gǔ yuè	música de tambor	0	1	34
情誼	qíng yì	laços	0	1	24
運用	yùn yòng	empregar	0	1	44
當回事	dāng huí shì	levar a sério	0	1	12
當一回事	dāng yī huí shì	levar a sério	0	1	11
大白	dà bái	ser revelado	0	1	42
富人	fù rén	rico	0	1	42
老神在在	lǎo shén zài zài	despreocupado	0	1	32
戰略性	zhàn lüè xìng	estratégico	0	1	44
離場	lí chǎng	saída	0	1	23
這股	zhè gǔ	esta onda	0	1	43
把他	bǎ tā	o levar	0	1	31
那種方式	nà zhǒng fāng shì	dessa maneira	0	1	43
不中用	bù zhōng yòng	inútil	2	1	41
美女們	měi nǚ men	belezas	0	1	33
蘿克賽	Luó kè sài	Roxanne	0	1	24
灰姑娘	huī gū niáng	Cinderela	0	1	11
從這裡	cóng zhè lǐ	daqui	1	1	24
肚肚	dù dù	barriguinha	0	1	44
菈	lā	(onomatopeia)	0	1	\N
羞死了	xiū sǐ le	morrer de vergonha	0	1	13
可觀	kě guān	considerável	0	1	31
Tati	Tati	Tati	0	1	\N
嘀咕	dí gu	murmurar	0	1	25
速度	sù dù	velocidade	0	1	44
瑪黛蓮娜	mǎ dài lián nà	Madalena	3	1	34
一槍	yī qiāng	bala	0	1	11
仿	fǎng	copiar	0	1	\N
Rô	Rô	Rô	0	1	\N
RIQUE	RIQUE	RIQUE	0	1	\N
無法接受	wú fǎ jiē shòu	inaceitável	0	1	23
繡	xiù	bordar	0	1	\N
打中	dǎ zhòng	acertou	0	1	34
之至	zhī zhì	extremamente	1	1	14
過著	guò zhe	vivendo	1	1	45
備受	bèi shòu	altamente elogiado	1	1	44
對決	duì jué	confronto	1	1	42
狡猾	jiǎo huá	astuto/esperto	3	1	32
好感	hǎo gǎn	boa impressão	1	1	33
容光煥發	róng guāng huàn fā	radiante	2	1	21
火大	huǒ dà	irritado	0	1	34
此事	cǐ shì	este assunto	9	1	34
嘉	jiā	belo	6	1	\N
臟	zàng	órgão interno	10	1	\N
失敗	shī bài	falhas	2	1	14
較真	jiào zhēn	ser meticuloso	0	1	41
很明顯	hěn míng xiǎn	muito óbvio	0	1	32
華	huá	esplendor	3	1	\N
吃醋	chī cù	com ciúmes	1	1	14
世人	shì rén	mundo	11	1	42
旺盛	wàng shèng	intenso	1	1	44
不清楚	bù qīng chǔ	não claro	1	1	41
朗	lǎng	claro	18	1	\N
動搖	dòng yáo	vacilar	1	1	42
欺負	qī fù	intimidar	0	1	14
邀	yāo	convidar	3	1	\N
享有	xiǎng yǒu	desfrutar	0	1	33
奢華	shē huá	luxuoso	0	1	12
正好相反	zhèng hǎo xiāng fǎn	exatamente o oposto	0	1	43
聯合會	lián hé huì	associação	0	1	22
繆思	miù sī	Musa	0	1	41
包養	bāo yǎng	ser sustentado financeiramente	0	1	13
金款	jīn kuǎn	fundos	0	1	13
黏人	nián rén	grudento/pegajoso (pessoa)	0	1	22
在某些	zài mǒu xiē	em alguns	0	1	43
老實說	lǎo shí shuō	honestamente	0	1	32
像樣	xiàng yàng	decente	0	1	44
陪陪	péi péi	acompanhar	0	1	22
猜	cāi	adivinhar	4	1	\N
得過	dé guò	já recebeu	0	1	24
瓜葛	guā gé	envolvimento	2	1	12
讀完	dú wán	terminar de ler	0	1	22
該有	gāi yǒu	dever ter	0	1	13
好美	hǎo měi	que lindo	0	1	33
你看看	nǐ kàn kàn	você olha	0	1	34
後製	hòu zhì	pós-produção	0	1	44
胡來	hú lái	agir de forma irresponsável	0	1	22
語氣	yǔ qì	tom de voz	0	1	34
做吧	zuò ba	vamos fazer	0	1	45
武斷	wǔ duàn	arbitrária	0	1	34
票券	piào quàn	bilhete	0	1	44
緩慢	huǎn màn	lento	0	1	34
就這麼做吧	jiù zhème zuò ba	vamos fazer isso	0	1	44
維拉坎布卡聯合會	wéi lā kǎn bù kǎ lián hé huì	Federação de Vila Campuca	0	1	21
說情	shuō qíng	interceder	0	1	12
降級	jiàng jí	rebaixamento	0	1	42
拍打	pāi dǎ	bater	0	1	13
用力	yòng lì	com força	0	1	44
尊崇	zūn chóng	veneração	0	1	12
讚揚	zàn yáng	elogios	0	1	42
崇敬	chóng jìng	reverência	0	1	24
舞池	wǔ chí	pista de dança	0	1	32
醋味	cù wèi	cheiro de vinagre	0	1	44
陳述	chén shù	declaração	0	1	24
通俗	tōng sú	comum	0	1	12
訴訟程序	sù sòng chéng xù	processo judicial	0	1	44
試探	shì tàn	sondar	0	1	44
玩物	wán wù	brinquedo	0	1	24
總共	zǒng gòng	no total	0	1	34
愛迪蓮娜	ài dí lián nà	Edilena	0	1	42
食品櫃	shí pǐn guì	despensa	0	1	23
不早	bù zǎo	não cedo	0	1	43
貝莉西亞	bèi lì xī yà	Belícia	0	1	44
問過	wèn guò	perguntou	0	1	44
我去	wǒ qù	eu vou	0	1	34
認出	rèn chū	reconhecer	0	1	41
從此	cóng cǐ	desde então	0	1	23
盜竊	dào qiè	roubo	1	1	44
逮捕令	dài bǔ lìng	mandado de prisão	2	1	43
錦標賽	jǐn biāo sài	campeonato	1	1	31
居住	jū zhù	residir	4	1	14
粒	lì	grão	0	1	\N
蝴蝶	hú dié	borboleta	0	1	22
棒棒糖	bàng bàng táng	pirulito	0	1	44
算不上	suàn bù shàng	não pode ser considerado	0	1	44
齊利亞	Qí lì yà	Zília (nome próprio)	0	1	24
沒救了	méi jiù le	não tem salvação	0	1	24
high	high	alto (animado)	0	1	\N
跟我	gēn wǒ	comigo	0	1	13
捍衛	hàn wèi	defender	0	1	44
只想	zhǐ xiǎng	só pensando	0	1	33
擲	zhì	jogar	0	1	\N
掃	sǎo	varrer	0	1	\N
道謝	dào xiè	agradecer	0	1	44
親一個	qīn yī gè	um beijo	0	1	11
挪	nuó	mover	0	1	\N
停手	tíng shǒu	parar	0	1	23
弄痛	nòng tòng	Machucar	0	1	44
試過	shì guò	tentou	1	1	44
派了	pài le	enviou	1	1	45
無意	wú yì	sem intenção	3	1	24
頂層	dǐng céng	topo	0	1	32
加油站	jiā yóu zhàn	posto de gasolina	1	1	12
本來	běn lái	originalmente	97	2	32
往往	wǎng wǎng	frequentemente	2	1	33
策劃	cè huà	planejando	9	1	44
高峰會	gāo fēng huì	cúpula	0	1	11
花兒	huā er	flor	0	1	15
讓人	ràng rén	faz as pessoas	4	1	42
里克	lǐ kè	Rick	4	1	34
黏	nián	grudar	3	1	\N
出名	chū míng	famoso	0	1	12
授課	shòu kè	lecionar	0	1	44
富裕	fù yù	próspero	0	1	44
支系	zhī xì	ramo	0	1	14
目前	mù qián	atualmente	28	1	42
高昂	gāo áng	elevado	1	1	12
速食店	sù shí diàn	lanchonete de fast-food	0	1	42
吉爾伯托	jí ěr bó tuō	Gilberto	31	1	23
思緒	sī xù	pensamentos	2	1	14
掉鏈子	diào liàn zi	decepcionar/falhar	0	1	44
念念不忘	niàn niàn bú wàng	lembrar constantemente	0	1	44
小旅行	xiǎo lǚ xíng	pequena viagem	0	1	33
Yara	yǎ'ēr	Yara	0	1	\N
無人	wú rén	ninguém	1	1	22
作主	zuò zhǔ	decidir	16	1	43
轟動一時	hōng dòng yī shí	sensação	0	1	14
精彩絕倫	jīng cǎi jué lún	absolutamente brilhante	0	1	13
返校	fǎn xiào	retornar à escola	0	1	34
之際	zhī jì	no momento de	0	1	14
石子	shí zǐ	pedras	0	1	23
歸屬	guī shǔ	pertencimento	0	1	13
蒙面人	méng miàn rén	pessoa mascarada	0	1	24
網球拍	wǎng qiú pāi	raquetes de tênis	0	1	32
男生	nán shēng	garoto	0	1	21
帕拉	pà lā	Para	0	1	41
分量	fèn liàng	peso	0	1	44
壓制	yā zhì	suprimir	0	1	14
收場	shōu chǎng	finalizar	0	1	13
眼中	yǎn zhōng	nos olhos	0	1	31
珍寶	zhēn bǎo	tesouro	0	1	13
拿下	ná xià	capturar	0	1	24
坐熱	zuò rè	esquentar o assento	0	1	44
襲擊	xí jī	ataque	0	1	21
心地善良	xīn dì shàn liáng	bondoso	0	1	14
聲調	shēng diào	tom	0	1	14
挑起	tiǎo qǐ	provocar	0	1	33
捅了	tǒng le	cutucaram	0	1	35
馬蜂窩	mǎ fēng wō	vespeiro	0	1	31
稱王	chēng wáng	reinar	1	1	12
小球	xiǎo qiú	bolinhas	0	1	32
粗暴	cū bào	brutal	0	1	14
低聲下氣	dī shēng xià qì	falar de forma humilde e submissa	0	1	11
扭動	niǔ dòng	contorcer	0	1	34
灑脫	sǎ tuō	despreocupada	0	1	31
那張	nà zhāng	aquela	1	1	41
主人	zhǔ rén	dono	9	1	32
作戰	zuò zhàn	combater	0	1	44
鄭重	zhèng zhòng	solene	0	1	44
奔波	bēn bō	correr de um lado para o outro	1	1	11
非法	fēi fǎ	ilegal	4	1	13
關乎	guān hū	concernente a	1	1	11
星辰	xīng chén	estrelas	1	1	12
做飯	zuò fàn	cozinhar	4	1	44
創建	chuàng jiàn	criar	5	1	44
退還	tuì huán	reembolsar	3	1	42
記名	jì míng	registro de nome	0	1	42
穆索克斯	Mùsuǒkèsī	Mussox	0	1	\N
一週	yī zhōu	uma semana	2	1	11
再一次	zài yī cì	mais uma vez	0	1	41
登機	dēng jī	embarque	0	1	11
過大	guò dà	excessiva	0	1	44
憂慮	yōu lǜ	preocupação	0	1	14
相會	xiāng huì	encontrar-se	0	1	14
底朝天	dǐ cháo tiān	de cabeça para baixo/virar completamente	0	1	32
您好嗎	nín hǎo ma	como está a senhora	0	1	23
動機	dòng jī	motivo	0	1	41
蒂蒂	dì dì	Didi	0	1	44
再度	zài dù	novamente	0	1	44
歡喜	huān xǐ	alegria	2	1	13
崗位	gǎng wèi	posto	0	1	34
我不會	wǒ bù huì	eu não vou	0	1	34
單位	dān wèi	unidade	0	1	14
艾迪蓮娜	Ài dí lián nà	Adelina	0	1	42
火	huǒ	fogo	22	1	\N
鼓	gǔ	tambor	0	1	\N
銀級	yín jí	prata	0	1	22
預期	yù qī	antecipar	1	1	41
那場	nà chǎng	aquela	1	1	43
憤世嫉俗	fèn shì jí sú	cínico	1	1	44
皇后	huáng hòu	rainha	3	1	24
匯報	huì bào	relatar	3	1	44
防備	fángbèi	defesa	1	1	\N
社群媒體	shè qún méi tǐ	mídia social	1	1	42
歐多西奧	ōu duō xī ào	Eudócio	11	1	11
賺錢	zhuàn qián	ganhar dinheiro	5	1	42
卵巢癌	luǎn cháo ái	câncer de ovário	3	1	32
心理醫生	xīn lǐ yī shēng	psicólogo	12	1	13
垂涎欲滴	chuí xián yù dī	salivar de desejo	2	1	22
奧斯瓦爾多	ào sī wǎ ěr duō	Osvaldo	-160	1	41
靈通	líng tōng	bem-informado	2	1	21
輕狂	qīng kuáng	imprudência juvenil	2	1	12
飛往	fēi wǎng	voando para	1	1	13
降低	jiàng dī	reduzir	1	1	41
整年	zhěng nián	o ano todo	3	1	32
記者	jì zhě	repórter	2	1	43
和解	hé jiě	reconciliação	3	1	23
系列賽	xì liè sài	série	0	1	44
不好意思	bù hǎo yì si	desculpe	20	1	43
暖	nuǎn	aquecer	2	1	\N
進軍	jìn jūn	avançar para	0	1	41
黃金聯賽	huáng jīn lián sài	Golden League	0	1	21
傻眼	shǎ yǎn	pasmo, atônito	0	1	33
普羅維拉坎布卡	pǔ luó wéi lā kǎn bù kǎ	Provila Cambuca	0	1	32
聯合隊	lián hé duì	equipe unida	0	1	22
為生	wéi shēng	ganhar a vida	0	1	21
歸宿	guī sù	destino final	1	1	14
姐夫	jiě fū	cunhado	0	1	31
某事	mǒu shì	algo	0	1	34
票款	piào kuǎn	valor do bilhete	0	1	43
專制	zhuān zhì	autoritário	0	1	14
當年	dāng nián	naqueles anos	4	1	12
犯下	fàn xià	cometer	0	1	44
搜查令	sōu chá lìng	mandado de busca	0	1	12
戴上	dài shàng	colocou	0	1	44
手銬	shǒu kào	algemas	1	1	34
經歷過	jīng lì guò	ter passado por	0	1	14
獲獎	huò jiǎng	premiado	0	1	43
羅多佛	Luó duō fó	Rodolfo	0	1	21
有意	yǒu yì	intencionalmente	0	1	34
資產	zī chǎn	ativos	0	1	13
拘留所	jū liú suǒ	centro de detenção	0	1	12
看守所	kān shǒu suǒ	casa de custódia	0	1	13
武斷的	wǔ duàn de	arbitrária	0	1	34
偷偷	tōu tōu	secretamente	0	1	11
薩普卡伊	sà pǔ kǎ yī	Sapukai	0	1	43
廠棚	chǎng péng	galpão	0	1	32
火山	huǒ shān	vulcão	0	1	31
多此一舉	duō cǐ yī jǔ	carregar lenha para a floresta	3	1	13
堅守	jiān shǒu	aderir firmemente	0	1	13
基礎	jī chǔ	fundamento	0	1	13
史詩般的	shǐ shī bān de	épico	0	1	31
動力	dòng lì	motivação	0	1	44
愛人們	ài rén men	amores	0	1	42
森巴大道	sēn bā dà dào	Avenida Samba	0	1	11
戈埃斯	gē āi sī	Goes	0	1	11
惹事	rě shì	causar problemas	0	1	34
出家門	chū jiā mén	sair de casa	0	1	11
晉升	jìn shēng	promovido	0	1	41
中學	zhōng xué	ensino médio	4	1	12
聯合	lián hé	unido	2	1	22
度蜜月	dù mì yuè	lua de mel	0	1	44
有道理	yǒu dào lǐ	fazer sentido	1	1	34
掏心掏肺	tāo xīn tāo fèi	de coração, sincero	0	1	11
滿分	mǎn fēn	nota máxima	0	1	31
十分	shí fēn	muito	0	1	21
沒辦法的	méi bàn fǎ de	não tem jeito	0	1	24
理應	lǐ yīng	deveria	0	1	31
傑森·巴羅斯	jié sēn·bā luó sī	Jason Barros	0	1	21
聯合區	lián hé qū	distrito unido	0	1	22
了嘛	le ma	partícula final	0	1	55
擊鼓	jí gǔ	bater tambor	0	1	23
嗨翻全場	hāi fān quán chǎng	animar a plateia toda	0	1	11
粗鹽	cū yán	sal grosso	0	1	12
攪動	jiǎo dòng	mexer	0	1	34
用心	yòng xīn	com dedicação	1	1	41
浴	yù	banho	0	1	\N
散漫	sǎn màn	desleixado	0	1	34
違法	wéi fǎ	ilegal	0	1	23
分子	fèn zǐ	elemento	0	1	43
?	?:	ponto de interrogação	0	1	\N
審視	shěn shì	examinar	2	1	34
難懂	nán dǒng	difícil de entender	0	1	23
插座	chā zuò	tomada	0	1	14
烤麵包機	kǎo miàn bāo jī	torradeira	0	1	34
偶遇	ǒuyù	encontro casual	0	1	\N
小若	xiǎo ruò	Xiao Ruo	0	1	34
談論了	tán lùn le	discutiram	0	1	24
知曉	zhī xiǎo	saber	0	1	13
夥伴們	huǒ bàn men	companheiros	0	1	34
姑	gu	garota	0	1	\N
娘	niáng	senhorita	0	1	\N
搬來	bān lái	mudar-se para cá	0	1	12
雪	xuě	neve	8	1	\N
有罪	yǒu zuì	culpado	0	1	34
白癡	bái chī	idiota	0	1	21
臨頭	lín tóu	iminente	0	1	22
申請	shēn qǐng	aplicação	0	1	13
體諒	tǐ liàng	consideração	0	1	34
悲痛欲絕	bēi tòng yù jué	inconsolável	0	1	14
失常	shī cháng	desequilíbrio	0	1	12
一回事	yī huí shì	uma questão	0	1	12
極樂世界	jí lè shì jiè	Terra Pura (paraíso budista)	0	1	24
看在	kàn zài	considerar	0	1	44
夢寐以求	mèng mèi yǐ qiú	ansiar dia e noite	0	1	44
澤齊托	zé qí tuō	Zequito	0	1	22
許可證	xǔ kě zhèng	licenças	0	1	33
希妲	xī dá	Heeda	0	1	12
親和力	qīn hé lì	afinidade	0	1	12
分寸	fēn cun	moderação	0	1	15
欣喜	xīn xǐ	alegrar-se	0	1	13
鼓后	gǔ hòu	rainha da bateria	0	1	34
欣喜若狂	xīn xǐ ruò kuáng	extremamente feliz	0	1	13
見證	jiàn zhèng	testemunhar	0	1	44
低估	dī gū	subestimei	1	1	11
但他	dàn tā	mas ele	0	3	41
主題	zhǔ tí	tema	5	1	32
傳達	chuán dá	transmitir	3	1	22
備齊	bèi qí	totalmente preparado	1	1	42
幾句	jǐ jù	algumas palavras	1	1	34
提過	tí guò	mencionei	2	1	24
目的地	mǔ de dì	destino	0	1	35
期限	qī xiàn	prazo	7	1	14
過了	guò le	passaram	3	1	45
端莊	duān zhuāng	séria	0	1	11
陣	zhèn	rajada	3	1	\N
有利	yǒu lì	vantajoso	1	1	34
從容不迫	cóng róng bù pò	calmo e descontraído	1	1	22
禮券	lǐ quàn	vale-presente	0	1	34
月曆	yuè lì	calendário mensal	0	1	44
沒事吧	méi shì ba	está tudo bem	0	1	24
躲開	duǒ kāi	desviar	0	1	31
撞球場	zhuàng qiú chǎng	sala de sinuca	0	1	42
一聽	yī tīng	assim que ouviu	0	1	11
婦女們	fù nǚ men	mulheres	0	1	43
高亢	gāo kàng	alta e sonora	0	1	14
打嗎	dǎ ma	jogar	0	1	35
制服	zhì fú	uniforme	1	1	42
論點	lùn diǎn	argumento	0	1	43
太低級了吧	tài dī jí le ba	é de nível muito baixo, não é	0	1	41
祭壇	jì tán	altar	0	1	42
講得	jiǎng dé	falado	0	1	32
被抓	bèi zhuā	ser preso	0	1	41
身在	shēn zài	estar em	0	1	14
事宜	shì yí	assuntos	1	1	42
齊	qí	completo	41	1	\N
上班	shàng bān	ir trabalhar	5	1	41
人身保護令	rén shēn bǎo hù lìng	mandado de habeas corpus	0	1	21
了吧	le ba	partícula final	0	1	55
攤位	tān wèi	barraca	0	1	14
禮車	lǐ chē	carro de cortesia	3	1	31
全套	quán tào	conjunto completo	0	1	24
排場	pái chǎng	pompa	0	1	23
被拘留	bèi jū liú	ser detido	0	1	41
就緒	jiù xù	pronto	12	1	44
鋃鐺入獄	láng dāng rù yù	ser algemado e preso	0	1	21
朵拉麗絲	duǒ lā lì sī	Dolores	0	1	31
汽艇	qì tǐng	barco a motor	0	1	43
財物	cái wù	bens materiais	0	1	24
付款	fù kuǎn	pagamento	0	1	43
有權	yǒu quán	têm o direito	1	1	32
受傷了	shòu shāng le	ficou ferida	0	1	41
賜福	cì fú	abençoar	0	1	42
不合理	bù hé lǐ	irracional	0	1	42
盧金亞斯	Lú jīn yà sī	Lucius	0	1	21
懂行	dǒng háng	entendido no assunto	0	1	32
份子	fèn zǐ	parte	0	1	43
衷心	zhōng xīn	sincero	0	1	11
這邊	zhè biān	aqui	64	2	41
罗克塞尔	luó kè sè ěr	Roxel	0	1	24
罗萨娜	luó sà nà	Rossana	0	1	24
不請自來	bù qǐng zì lái	vir sem ser convidado	0	1	43
侄子	zhí zi	sobrinho	0	1	25
诉	sù	alegar	3	1	\N
謊話	huǎng huà	mentira	4	1	34
木已成舟	mù yǐ chéng zhōu	a madeira já virou barco	1	1	43
鎮浩	zhèn hào	Zhenhao	0	1	44
實話實說	shí huà shí shuō	falar a verdade	0	1	24
到來	dào lái	chegada	6	1	42
吵過	chǎo guò	brigamos	0	1	34
感人	gǎn rén	comovente	1	1	32
靈感	líng gǎn	inspiração	5	1	23
不公	bù gōng	injusto	1	1	41
是不是	shì bú shì	é ou não é	43	1	42
召集	zhào jí	convocar	1	1	42
馬達萊娜	mǎ dá lái nà	Madalena	21	1	32
辭掉	cí diào	pedir demissão, renunciar	0	1	24
遠了	yuǎn le	distante	0	1	35
怒火	nù huǒ	fúria	2	1	43
摘	zhāi	colher	20	1	\N
放款	fàng kuǎn	liberar empréstimo	0	1	43
代求	dài qiú	interceder	0	1	42
言歸於好	yán guī yú hǎo	reconciliar-se	0	1	21
惡魔	è mó	demônio	1	1	42
踏	tà	pisar	0	1	\N
RAFAELA	RAFAELA	RAFAELA	0	1	\N
去過	qù guò	ter ido	0	1	44
親了	qīn le	beijou	0	1	15
躺著	tǎng zhe	deitada	0	1	35
豪車	háo chē	carro de luxo	0	1	21
羅多夫	luó duō fū	Rodolfo	0	1	21
籠子	lóng zi	gaiola	0	1	25
厭煩	yàn fán	aborrecimento	0	1	42
過得好	guò dé hǎo	passar bem/viver bem	0	1	42
魯	lǔ	rude	0	1	\N
我媽	wǒ mā	minha mãe	1	1	31
煩惱	fán nǎo	preocupação	4	1	23
荒唐	huāng táng	absurdo	5	1	12
小寶寶	xiǎo bǎo bǎo	bebê	7	1	33
嘲笑	cháo xiào	zombar	1	1	24
而我	ér wǒ	e eu	0	1	23
研討會	yán tǎo huì	seminário	1	1	23
從頭	cóng tóu	do início	0	1	22
再來一遍	zài lái yī biàn	vir/começar mais uma vez	0	1	42
困	kùn	preso	27	1	\N
著了魔	zháo le mó	ficou obcecada	0	1	25
例	lì	exemplo	1	1	\N
困擾	kùn rǎo	perturbar	1	1	43
休想	xiū xiǎng	não pense em	0	1	13
付清	fù qīng	pagar integralmente	1	1	41
只好	zhǐ hǎo	só posso	11	1	33
優越	yōu yuè	superior	1	1	14
盤旋	pán xuán	pairar	1	1	22
逃出	táo chū	escapar de	0	1	21
差勁	chà jìn	ruim	1	1	44
壞話	huài huà	palavras ruins/maledicência	4	1	44
古板	gǔ bǎn	antiquado	1	1	33
整晚	zhěng wǎn	a noite toda	1	1	33
實惠	shí huì	econômico	0	1	24
看似	kàn sì	parecer	0	1	44
小題大做	xiǎo tí dà zuò	tempestade em copo d'água	0	1	32
安心	ān xīn	tranquilo	0	1	11
做朋友	zuò péng yǒu	ser amigo	0	1	42
表兄弟	biǎo xiōng dì	primos	0	1	31
蘇蕾卡	sū léi kǎ	Suleika	0	1	12
將近	jiāng jìn	quase	0	1	14
上街	shàng jiē	sair à rua	0	1	41
喝醉了	hē zuì le	bêbado	0	1	14
重要的是	zhòng yào de shì	O importante é	1	1	44
自命不凡	zì mìng bù fán	convencida	0	1	44
直截了當	zhí jié liǎo dàng	direta	0	1	22
不知情	bù zhī qíng	não estar ciente	0	1	41
現狀	xiàn zhuàng	status quo	0	1	44
半夜	bàn yè	meia-noite	0	1	44
防守	fáng shǒu	defender	0	1	23
侵佔	qīn zhàn	invadir/ocupar	0	1	14
比方說	bǐ fāng shuō	por exemplo	2	1	31
所不同	suǒ bù tóng	diferente	0	1	34
踩著	cǎi zhe	pisando	0	1	35
大開眼界	dà kāi yǎn jiè	abrir muito os olhos	0	1	41
米粒	mǐ lì	grão de arroz	0	1	34
搞得	gǎo dé	fazer de um jeito	0	1	32
擊垮	jī kuǎ	derrubar	0	1	13
恨透	hèn tòu	odiar profundamente	0	1	44
睡衣	shuì yī	pijama	0	1	41
嚷嚷	rāng rang	gritar	0	1	15
傍晚	bàng wǎn	anoitecer	1	1	43
站起來	zhàn qǐ lái	levantar-se	0	1	43
血管	xuè guǎn	vaso sanguíneo	0	1	43
動武	dòng wǔ	usar força física	0	1	43
聯邦	lián bāng	federal	0	1	21
巴伊亞	bā yī yà	baiana	0	1	11
滾蛋	gǔn dàn	cair fora	0	1	34
人情味	rén qíng wèi	calor humano	0	1	22
突襲	tū xí	invadir	0	1	12
破舊	pò jiù	velho e decrépito	0	1	44
推擠	tuī jǐ	empurrar	0	1	13
翹著	qiào zhe	arrebitado	0	1	45
好累	hǎo lèi	muito cansado	0	1	34
好煩躁	hǎo fán zào	muito irritado	0	1	32
即將到來	jí jiāng dào lái	que está chegando	0	1	21
吵醒	chǎo xǐng	acordar (com barulho)	2	1	33
颳風	guā fēng	ventar	0	1	11
打球	dǎ qiú	jogar bola	0	1	32
超棒	chāo bàng	super fantástico	0	1	14
手忙腳亂	shǒu máng jiǎo luàn	atrapalhado	0	1	32
奶瓶	nǎi píng	mamadeira	0	1	32
踢球	tī qiú	jogar futebol	0	1	12
所做的事	suǒ zuò de shì	o que faz	0	1	34
放空	fàng kōng	divagar	0	1	41
拉長音	lā cháng yīn	prolongar o som	0	1	12
抱孫子	bào sūn zi	ter netos	0	1	41
瘦瘦	shòu shòu	magro	0	1	44
深藍色	shēn lán sè	azul escuro	0	1	12
死者	sǐ zhě	falecido	0	1	33
憤慨	fèn kǎi	indignação	3	1	43
絆	bàn	tropeçar	0	1	\N
海軍藍	hǎi jūn lán	azul marinho	0	1	31
負有	fù yǒu	ter/possuir	0	1	43
還不是	hái bù shì	ainda não é	0	1	24
設限	shè xiàn	estabelecer limites	0	1	44
阿喀琉斯	Ā kā liú sī	Aquiles	0	1	11
Violeta	Violeta	Violeta	0	1	\N
不合時宜	bù hé shí yí	inoportuno	0	1	42
撲克	pū kè	pôquer	0	1	14
OSMA	OSMA	OSMA	0	1	\N
糖	táng	açúcar	2	1	\N
羅穆洛	luó mù luò	Rômulo	0	1	24
屬	shǔ	pertencer	0	1	\N
行李箱	xíng lǐ xiāng	mala de viagem	0	1	23
一無是處	yī wú shì chù	inútil em todos os aspectos	0	1	12
猜想	cāi xiǎng	supor	2	1	13
牆邊	qiáng biān	beira da parede	0	1	21
沒那麼	méi nà me	não tão	0	1	24
負責任	fù zé rèn	responsável	0	1	42
手中	shǒu zhōng	nas mãos	2	1	31
屋	wū	casa	1	1	\N
稱	chēng	chamar	2	1	\N
感受到	gǎn shòu dào	sentir	4	1	34
橋樑	qiáo liáng	ponte	5	1	22
在場	zài chǎng	presente	2	1	43
玩家	wán jiā	jogador	1	1	21
伊莉塞特	Yī lì sāi tè	Elisete	23	1	14
物種	wù zhǒng	espécie	0	1	43
臉蛋	liǎn dàn	rosto	0	1	34
溫情	wēn qíng	afeição	0	1	12
各就各位	gè jiù gè wèi	cada um no seu lugar	0	1	44
各司其職	gè sī qí zhí	cada um cumpre sua função	0	1	41
甜味劑	tián wèi jì	adoçante	0	1	24
塞薩莉亞	Sāi sà lì yà	Cecília	0	1	14
懊悔	ào huǐ	arrependimento	3	1	43
盡失	jìn shī	completamente perdida	0	1	41
城裡	chéng lǐ	cidade	0	1	23
辦事	bàn shì	resolver assuntos	0	1	44
完好無缺	wán hǎo wú quē	intacto	0	1	23
可逆	kě nì	reversível	0	1	34
憲政	xiàn zhèng	constitucional	0	1	44
羅穆盧斯	luó mù lú sī	Rômulo	0	1	24
說白了	shuō bái le	para ser direto	0	1	12
週六	zhōu liù	sábado	0	1	14
週一	zhōu yī	segunda-feira	1	1	11
拓荒者	tuò huāng zhě	pioneiro	0	1	41
天長地久	tiān cháng dì jiǔ	eterno	0	1	12
腦後	nǎo hòu	atrás da mente	0	1	34
翻頁	fān yè	virar a página	0	1	14
又有	yòu yǒu	novamente tem	0	1	43
被綁	bèi bǎng	amarrado	0	1	43
超緊	chāo jǐn	super apertado	0	1	13
發了	fā le	enviei	0	1	15
小張	Xiǎo Zhāng	Xiao Zhang	0	1	31
豪爾赫·科雷亞·巴塞拉爾	háo ěr hè · kē léi yà · bā sài lā ěr	Jorge Correa Bacerral	0	1	23
展翅	zhǎn chì	estender as asas	0	1	34
高飛	gāo fēi	voar alto	0	1	11
一身	yī shēn	todo o corpo	0	1	11
酸腐味	suān fǔ wèi	cheiro azedo	0	1	13
我的上帝	wǒ de shàng dì	meu deus	0	1	35
暖洋洋	nuǎn yáng yáng	quente e aconchegante	0	1	32
正正好	zhèng zhèng hǎo	exatamente certo	0	1	44
傀儡	kuǐ lěi	fantoche	0	1	33
正是如此	zhèng shì rú cǐ	Exatamente assim	0	1	44
心知肚明	xīn zhī dù míng	Saber muito bem	0	1	11
那句話	nà jù huà	aquela frase	0	1	44
重來	chóng lái	recomeçar	0	1	22
一遍	yī biàn	uma vez	0	1	14
緊緊	jǐn jǐn	firmemente	0	1	33
貼近	tiē jìn	próximo	0	1	14
擺放	bǎi fàng	colocar	0	1	34
紫羅蘭夫人	zǐ luó lán fū rén	Senhora Violeta	2	1	32
聯手	lián shǒu	juntar forças	0	1	23
演變成	yǎn biàn chéng	transformar-se em	0	1	34
舊的	jiù de	antiga	0	1	45
經典	jīng diǎn	clássico	0	1	13
京劇	jīng jù	ópera de Pequim	0	1	14
情節	qíng jié	enredo	0	1	22
橋段	qiáo duàn	cena	0	1	24
傾倒	qīng dǎo	derramar	0	1	13
輕輕的	qīng qīng de	suavemente	0	1	11
濃濃	nóng nóng	intensa	0	1	22
新年份	xīn nián fèn	novo ano/modelo	0	1	12
股份	gǔ fèn	ações	0	1	34
福爾摩莎	fú ěr mó shā	Formosa	0	1	23
沙發	shā fā	sofá	8	1	11
艾伯托	ài bó tuō	Alberto	0	1	42
凡尼爾達	fán ní ěr dá	Vanellope	0	1	22
志向	zhì xiàng	aspiração	4	1	44
用處	yòng chù	utilidade	0	1	44
貝利莫爾	Bèi lì mò ěr	Belimor	0	1	44
毫無意義	háo wú yì yì	sem sentido	1	1	22
距離	jù lí	distância	2	1	42
蛇	shé	cobra	5	1	\N
始於	shǐ yú	começa com	0	1	32
蘇萊卡太太	sū lái kǎ tài tài	Sra. Suraika	0	1	12
文明人	wén míng rén	pessoa civilizada	0	1	22
蜥蜴	xī yì	lagarto	0	1	14
翻過	fān guò	virar	1	1	14
碟子	dié zi	pires	0	1	25
Bianca	Bianca	Bianca	0	1	\N
羅慕洛	luó mù luò	Rômulo	2	1	24
聊一聊	liáo yī liáo	conversar um pouco	0	1	21
想了想	xiǎng le xiǎng	pensei um pouco	0	1	35
虧本	kuī běn	com prejuízo	0	1	13
出局	chū jú	eliminado	0	1	12
子兒	zǐ er	moeda	0	1	35
跌	diē	cair	0	1	\N
吃醋了	chī cù le	está com ciúmes	0	1	14
小文迪	Xiǎo Wéndí	pequena Wendi	0	1	32
小薇	xiǎo wēi	Xiaowei	0	1	31
樞紐	shū niǔ	pivô	0	1	13
總有	zǒng yǒu	sempre tem	0	1	33
解鎖	jiě suǒ	destravar	0	1	33
妻	qī	esposa	0	1	\N
救助	jiù zhù	socorrer	0	1	44
優先級	yōu xiān jí	prioridade	0	1	11
適中	shì zhōng	moderado	0	1	41
動盪	dòng dàng	conturbado	0	1	44
早先	zǎo xiān	anteriormente	0	1	31
謀	móu	planejar	0	1	\N
DNA	DNA	DNA	13	1	\N
唯有	wéi yǒu	somente	0	1	23
我爸	wǒ bà	meu pai	0	1	34
養	yǎng	criar	73	1	\N
DANIEL	DANIEL	Daniel	15	1	\N
小凡	Xiǎo Fán	Xiaofan	0	1	32
私有化	sī yǒu huà	privatização	0	1	13
怎麼樣的	zěn me yàng de	como é	3	1	35
依賴	yī lài	depender	11	1	14
暢通無阻	chàng tōng wú zǔ	livre e desimpedido	1	1	41
鈔票	chāo piào	dinheiro	0	1	14
谷底	gǔ dǐ	fundo do poço	0	1	33
搬家	bān jiā	mudar de casa	0	1	11
保姆	bǎo mǔ	babá	3	1	33
湯匙	tāng chí	colher de sopa	1	1	12
日常	rì cháng	diário	2	1	42
壺	hú	chaleira	1	1	\N
瑪麗絲黛拉	Mǎ lì sī dài lā	Maristela	0	1	34
唯一的	wéi yī de	único	0	1	21
機智	jī zhì	esperto	0	1	14
怎麼會這樣	zěn me huì zhè yàng	como pôde acontecer isso	0	1	35
遠遠地	yuǎn yuǎn de	de longe	0	1	33
委屈	wěi qu	injustiça	0	1	35
莫及	mò jí	irremediável	0	1	42
正直	zhèng zhí	honesto	0	1	42
厭惡感	yàn wù gǎn	sentimento de aversão	0	1	44
蓋森	Gài sēn	Gessen	0	1	41
領取	lǐng qǔ	retirar	0	1	33
樂壞了	lè huài le	ficou muito feliz	0	1	44
內烏扎	nèi wū zhā	Neusa	0	1	41
小把戲	xiǎo bǎ xì	truquezinho	0	1	33
陰謀	yīn móu	conspiração	7	1	12
相連	xiāng lián	conectado	0	1	12
養活	yǎng huó	sustentar	1	1	32
靠著	kào zhe	apoiando-se	0	1	45
傳奇	chuán qí	lenda	0	1	22
小故事	xiǎo gù shì	pequena história	0	1	34
辯解	biàn jiě	justificar	0	1	43
骨氣	gǔ qì	integridade moral	0	1	34
敏捷	mǐn jié	ágil	0	1	32
小弟弟	xiǎo dì di	irmãozinho	0	1	34
逃脫	táo tuō	escapar	1	1	21
施壓	shī yā	pressão	0	1	11
亂放	luàn fàng	colocar de forma desorganizada	0	1	44
輕易	qīng yì	facilmente	0	1	14
限度	xiàn dù	limite	0	1	44
肥皂劇	féi zào jù	novela	0	1	24
漸漸地	jiàn jiàn de	gradualmente	0	1	44
有錢人	yǒu qián rén	pessoa rica	0	1	32
吧啦吧啦吧啦	bā lā bā lā bā lā	blá-blá-blá	0	1	11
好做	hǎo zuò	bom para fazer	0	1	34
挨打	ái dǎ	apanhar	3	1	23
確幸	què xìng	certeza feliz	0	1	44
那段	nà duàn	aquele pedaço/período	0	1	44
敞開心扉	chǎng kāi xīn fēi	abrir o coração	0	1	31
歷程	lì chéng	jornada	0	1	42
替罪羊	tì zuì yáng	bode expiatório	0	1	44
人際關係	rén jì guān xì	relações interpessoais	0	1	24
魔幻	mó huàn	mágico	0	1	24
迷上	mí shàng	ficar viciado em	0	1	24
福祉	fú zhǐ	bem-estar	0	1	23
說事	shuō shì	discutir assunto	0	1	14
開路	kāi lù	abrir caminho	0	1	14
分身乏術	fēn shēn fá shù	sobrecarregado	0	1	11
順便一提	shùn biàn yī tí	a propósito	0	1	44
就是說啊	jiù shì shuō a	isso mesmo	0	1	44
忘不了	wàng bù liǎo	não consigo esquecer	0	1	44
招供	zhāo gòng	confessar	0	1	14
諾伊扎	Nuò yī zhā	Neuza	0	1	41
快餐店	kuài cān diàn	lanchonete de fast-food	0	1	41
聽從	tīng cóng	obedecer	3	1	12
邁	mài	dar	0	1	\N
特許	tè xǔ	franquia	0	1	43
乖	guāi	obediente/comportado	1	1	\N
經營權	jīng yíng quán	direito de gestão	0	1	12
做不了	zuò bù liǎo	não conseguir fazer	3	1	44
藍	lán	azul	11	1	\N
夢	mèng	sonho	82	2	\N
眼紅	yǎn hóng	invejar	0	1	32
若熱	ruò rè	Jorge	0	1	44
開頭	kāi tóu	começo	0	1	12
繼子	jì zǐ	enteado	0	1	43
病假	bìng jià	licença médica	0	1	44
官方	guān fāng	oficial	2	1	11
有時	yǒu shí	às vezes	28	1	32
青少年	qīng shào nián	adolescente	11	1	14
閃耀	shǎn yào	brilhar	55	1	34
分界線	fēn jiè xiàn	linha divisória	1	1	14
警長	jǐng zhǎng	xerife	19	1	33
扣住	kòu zhù	ser apreendido	0	1	44
為止	wéi zhǐ	parar	12	1	23
入口處	rù kǒu chù	entrada	0	1	43
擱	gē	colocar de lado	0	1	\N
高度	gāo dù	alto grau	0	1	14
雷吉娜	Léijínà	Regina	0	1	\N
人工授精	rén gōng shòu jīng	inseminação artificial	5	1	21
席爾維尼亞	xí ěr wéi ní yà	Silvínia	0	1	23
醉漢	zuì hàn	bêbados	4	1	44
舒	shū	confortável	9	1	\N
噴嚏	pēn tì	espirro	4	1	14
強恩	qiáng ēn	João	0	1	21
了一些	yīxiē	alguns	5	1	\N
強行	qiáng xíng	forçar	0	1	22
拉近	lā jìn	aproximar	0	1	14
凡妮達	fán nī dá	Vanida	0	1	21
倫多	Lún duō	Lando	4	1	21
疚	jiù	culpa	9	1	\N
萬尼爾達	wàn ní ěr dá	Vanilda	0	1	42
外快	wài kuài	renda extra	0	1	44
傲氣	ào qì	arrogância	0	1	44
老樣子	lǎo yàng zi	como sempre	0	1	34
莹  (repetição)	yíng	brilhante	0	1	\N
熱身	rè shēn	aquecimento	1	1	41
現身	xiàn shēn	aparecer	0	1	41
一邊	yī biān	um lado	0	1	11
沙龍	shā lóng	salão	0	1	12
水到渠成	shuǐ dào qú chéng	acontecer naturalmente	0	1	34
耽誤	dān wù	atrasar	0	1	14
不都	bù dōu	nem todos	0	1	41
打發	dǎ fā	passar	0	1	31
滿天	mǎn tiān	céu cheio	0	1	31
他那	tā nà	dele aquela	0	1	14
渾厚	hún hòu	profunda/encorpada	0	1	24
嗓音	sǎng yīn	voz	0	1	31
西爾維尼亞	xī ěr wéi ní yà	Silvânia	8	1	13
值了	zhí le	valeu a pena	0	1	25
煮飯	zhǔ fàn	cozinhar arroz	0	1	34
洗碗	xǐ wǎn	lavar louça	0	1	33
叫來	jiào lái	chamei	0	1	42
的情況下	de qíng kuàng xià	situação	4	1	52
魯道夫	lǔ dào fū	Rodolfo	0	1	34
就職	jiù zhí	assumir o cargo	0	1	42
熱爾松	rè ěr sōng	Gérson	0	1	43
孤獨感	gū dú gǎn	sensação de solidão	3	1	12
冷	lěng	frio	31	3	\N
整形外科醫生	zhěng xíng wài kē yī shēng	médico cirurgião plástico	3	1	32
瘟	wēn	peste	4	1	\N
賈桂琳	jiǎ guì lín	Jacqueline	-62	1	34
期盼	pèi qiàn	expectativa	4	1	44
工作的	gōng zuò de	trabalho	4	1	14
人力	rén lì	humano	4	1	24
早就	zǎo jiù	já teria	56	2	34
喬ão	Qiáo ào	João	7	1	24
紐扣	niǔ kuò	botão	4	1	34
涉及到	sài xiào dào	envolve	4	1	44
招聘	huàng pìn	recrutamento	4	1	44
開端	kāi duān	início	12	1	11
薪酬	xué yōng	salário	5	1	21
屏	píng	tela	9	1	\N
拿著	ná zhe	segure	1	1	25
奧斯	ào sī	ós	4	1	41
昂	áng	alto	6	1	\N
哀傷	āi shāng	tristeza	4	1	11
包容性	bāo fàng xìng	inclusividade	4	1	14
Neuza	Néu zá	Neuza	9	1	22
的心裡	de xīn lǐ	no coração	7	1	51
懷上	huái shàng	engravidou	5	1	24
疫	yì	epidemia	4	1	\N
往常	wǎngcháng	como sempre	4	1	\N
是最	zuì shì	é o mais	4	1	44
一首	yī shǒu	uma (música)	3	1	13
做了	zuò le	feito	43	3	45
質問	zhì wèn	perguntar	4	1	44
螢	yíng	luz	16	1	\N
天啊	tiān a	céus	113	3	15
忙亂	máng luàn	ocupado	6	1	24
歌聲	gē shēng	voz cantando	1	1	11
矮	ǎi	baixo	8	1	\N
卡斯特利洛	Kǎsātèlìluó	Castelllho	6	1	\N
Edson	Èd sōn	Edson	5	1	41
蘿莉絲	luó lì sī	Lolita	15	1	24
警覺	jǐng jué	vigilância	4	1	32
電子郵件	èr shì diàn zǐ yóu jiàn	e-mail	8	1	44
黑人	hēi rén	negro	10	1	12
露西	Lù xī	Lucy	-46	1	41
哥倫斯	gē lún sī	Colúmbia	4	1	12
职位	wèi zhì	cargo	4	1	44
慈善	cí shān	caridade	4	1	21
公共	gōng gòng	público	5	1	14
本意	běn yì	intenção	9	1	34
呼嚕嚕	hū lū lū	ronco	4	1	11
兄弟姐妹	xiōng dì jiě mèi	irmãos e irmãs	4	1	14
最重要	zuì zhòng yào	mais importante	9	1	44
物件	wù qiàn	objeto	4	1	44
拼圖	pīn tú	quebra-cabeça	4	1	12
不過度	bù guò dù	não excessivo	4	1	44
fiancée	fān nài fēi	noiva	4	1	14
提醒	tí xǐng	lembrar	12	1	23
可可	kě kě	Coco	13	1	33
minute	mínuto	minuto	4	1	\N
吱溜	zhī liū	escorregão	4	1	11
而生	ér shēng	nascer	4	1	21
宗旨	zōng zhī	propósito	4	1	11
提示	tī shì	dicas	9	1	14
食欲	shí yù	apetite	4	1	24
有一	yǒu yī	há	4	1	31
火車	huǒ chē	trem	4	1	31
顯露出	xiǎn lòu chū	revelar	4	1	34
戈亞人	gē yà rén	pessoas de Goa	4	1	14
生活中	shēnghuó zhōng	na vida	4	1	11
哈哈	haha	risada	23	1	\N
布里歐	Bù lǐ ōu	brioche	4	1	43
匹	pǐ	cavalo	9	1	\N
保險	bǎo xiǎn	seguro	6	1	33
柜	guì	armário	4	1	\N
多拉爾西	duō lā ěr xī	Doralice	4	1	11
的  (neste caso, usado para formar uma pergunta)	de		0	1	\N
短缺	duǎn qiào	escassez	4	1	34
董	dǒng	Dong	11	1	\N
卡索萊特	Kǎsuǒlètè	cassoulet	4	1	\N
保證了	bǎo zhèng le	prometi	4	1	34
聖母經	shèng mǔ jīng	Ave Maria	4	1	43
警局	jǐng jú	delegacia	8	1	32
糕點師	gāo diǎn shī	confeiteira	4	1	13
貴族	guì zú	nobre	6	1	42
卡宮	Kǎ gōng	palácio	4	1	31
付費	fù fèi	pagar	4	1	44
設定	she4 ding4	definir	4	1	55
五佰	wǔ bǎi	quinhentos	4	1	33
莉莎	Lǐ shā	Lisá	4	1	31
苦澀	kǔ sè	amargo	4	1	34
還回	huán huí	devolver	4	1	22
撤銷	chè xiāo	cancelar	4	1	41
順應	shùn yìng	ceder	4	1	44
涼	liáng	fresco	20	1	\N
吐	tǔ	expelir	4	1	\N
正軌	zhèng guǐ	nos eixos	4	1	43
設置	shè zhì	configuração	4	1	44
正午	zhèng wǔ	meio-dia	4	1	43
毯子	tǎn zi	tapete	4	1	35
真得很	zhēn de hěn	realmente muito	4	1	15
如釋重負	rú shì zhòng fù	como se um grande peso tivesse sido retirado	4	1	24
偉	wěi	grande	4	1	\N
盟	méng	aliado	4	1	\N
正規化	zhèng guī huà	normalizar	4	1	41
吃驚	chī jīng	surpresa	7	1	11
步入	bù pò	entrar	4	1	44
是在	shì zài	é em	5	1	44
聰	cōng	inteligente	4	1	\N
弗朗西斯	Fú lǎng xī sī	Francisco	4	1	23
大姊	dà zhóu	irmã mais velha	4	1	42
明智地	míng zhì de	sabiamente	4	1	24
海邊	hǎi biān	praia	8	1	31
玩耍	suǎn yǎn	brincar	5	1	33
卡爾	Kǎ ěr	Karl	8	1	33
野	yě	selvagem	5	1	\N
每一	měi yī	cada	17	1	31
培養	péi yǎng	criar	5	1	23
粥	zhōu	mingau	4	1	\N
賽	sài	competição	6	1	\N
池	chí	piscina	6	1	\N
三人	sān rén	três pessoas	5	1	12
瑞克斯勒	Ruì xī sī lè	Ricksler	11	1	41
勁	jìng	força	4	1	\N
GG	jiǎojiǎ	irmão mais velho (abreviação)	4	1	\N
貝爾西	Bèi'ěrxī	Belsi	4	1	\N
exploitation	exploitation	exploração	4	1	\N
禮貌	lǐmào	cortesia	4	1	\N
仁	rén	benevolente	16	1	\N
慈	cí	misericordioso	27	1	\N
哄	hǒng	acalmar	5	1	\N
fact	fact	fato	4	1	\N
喬爾遜	Qiáo ěr sōng	Joel	4	1	23
从	cóng	de	10	1	\N
莫瑞拉	Mò Ruì lā	Morila	12	1	44
噹聲	duāng shēng	som	4	1	11
騙局	piàn jú	fraude	4	1	42
也可以	yě kě yǐ	também pode	7	1	33
很容易	hěn yǒu yì	muito fácil	4	1	33
小手	xiǎo shǒu	mãozinha	4	1	33
幻覺	huàn jué	ilusão	4	1	42
握住了	wò zhù le	segurei	4	1	44
碎片	suì piè	pedaços	5	1	44
分擔	fēn dān	compartilhar	4	1	11
吉爾森	Jī ěr sēn	Gilson	4	1	13
格格不入	gé gé bù rù	não se encaixar	5	1	22
後門	hòu mén	porta dos fundos	4	1	42
連接	lián jié	conexão	4	1	22
生命中	shēng míng zhōng	na vida	4	1	12
無理取鬧	wú lǐ qǔ nào	sem razão, provocação	4	1	23
這筆	zhè bǐ	essa	4	1	43
一部	yī bù	parte	4	1	14
被罵	bèi mà	ser repreendido	4	1	44
解脱	jiě tuō	libertar	4	1	31
嚇	xià	assustar	6	1	\N
Francisco	Fàn lǎo sī	Francisco	6	1	43
夥	huǒ	parceiro	11	1	\N
钱	qián	dinheiro	4	1	\N
老爺子	lǎo yé zi	senhor	4	1	32
吼聲	hǒu shēng	grito	4	1	31
三个	sān gè	três	4	1	14
每年	měi nián	todos os anos	4	1	32
質	zhì	qualidade	46	1	\N
賽巴斯蒂安	sài bǎ shì di àn	Sebastian	9	1	43
薩巴斯提安	Sà bǎo sī tài àn	Sebastian	5	1	43
風度	fēng dù	compostura	4	1	14
君子	jūn zǐ	cavalheiro	4	1	13
大型	dà xíng	grande	4	1	42
蓄水池	xù shuǐ chí	reservatório	4	1	43
的大	de	do	20	1	\N
[笑聲]	xiào shēng	risada	11	1	41
克勒	kè lè	não aplicável	10	1	44
邏	luó	lógica	6	1	\N
瑞思	Ruì Sī	Ruisi	6	1	41
的生活	de shēnghuó	vida	11	1	51
騰	téng	saltar	5	1	\N
欠 (qi should be		ān): devido	4	1	\N
叔	shū	tio	16	1	\N
过	guò	passar	5	1	\N
来	lái	vir	16	1	\N
原樣	yuán yàng	original	5	1	24
打亂	dǎ luàn	perturbar	5	1	34
慶	qìng	celebrar	4	1	\N
噷	tòng	(onomatopeia de vômito)	4	1	\N
似	sì	como	5	1	\N
uncle	伯伯/bóbo	tio	4	1	\N
宅	zhái	mansão	4	1	\N
Sebastian	sēbǎixībǎn	Sebastian	9	1	\N
课	kè	aula	4	1	\N
villa	vɪlla	villa	4	1	\N
泥	ní	lama	6	1	\N
爺	yé	senhor	4	1	\N
澤西托	Zexītuō	Jerseyto	5	1	\N
輯	jí	lógica	4	1	\N
形	xíng	forma	4	1	\N
folks		pessoal	4	1	\N
善用	shànyòng	bem utilizado	4	1	\N
善事	shànde	boas ações	4	1	\N
拼	pīn	juntar	7	1	\N
缪斯	miù sī	musa	4	1	41
疑惑	yí huò	dúvida	4	1	24
失眠	shī mián	insônia	4	1	12
奇奇	qí qí	Qiqi	6	1	22
韁繩	jiāng shéng	rédea	4	1	12
多蘿莉絲	duō luó lì sī	Dorolisi	4	1	12
聖捷波因特	Shèng Jié Bō Yīn Tè	Saint Joseph	4	1	42
展覽	zhǎn lǎn	exposição	7	1	33
當中	dāng zhōng	entre	9	1	11
價	jià	preço	9	1	\N
賴	lài	confiar	4	1	\N
昨	zuó	ontem	5	1	\N
卡斯特洛	Kǎ sī tè luò	Castelo	7	1	31
海綿布	hǎi mián bù	esponja	4	1	32
標示	biāo shì	sinalização	4	1	14
貝利扎	Bèi lì zā	Bélgica	4	1	44
譚蒂	Tán dì	Tandy	15	1	24
桌子上	zhuō shàng	na mesa	4	1	14
疾馳	jí chí	galopar	4	1	22
瑩莉	yíng lì	Yingli	4	1	24
牌	piá	placa	8	1	\N
姑父	gū fu	tio	4	1	15
pancake	pán ké bǐn	panqueca	4	1	22
也很	yě hěn	também muito	10	1	33
儘快	jǐn kuài	rapidamente	4	1	34
一振	yī zhèn	animar	4	1	14
少爺	shào yé	jovem mestre	5	1	42
可用	kě yòng	usar	4	1	34
富婆	fù pó	mulher rica	4	1	42
要把	yào bǎ	precisa	4	1	43
紐帶	niǔ dài	laço	4	1	34
西席亞	Xī Xī Yà	Xixiya	4	1	11
打噴嚏	dǎ pēn tì	espirrar	4	1	31
左頭	zuǒ tóu	esquerda	4	1	32
JORGE		Jorge	21	1	\N
帳篷	zhàng péng	tenda	4	1	42
飛逝	fēi shì	passar rapidamente	4	1	14
散歩	sǎn bù	passear	4	1	34
熨燙	yùn tàng	passar	4	1	44
專心致志	zhuān xīn zhì zhì	concentrado	4	1	11
在那里	nà lǐ	lá	4	1	43
如下	rú xià	como abaixo	4	1	24
还	hái	ainda	6	1	\N
憤	fèn	raiva	11	1	\N
憎	zēng	odiar	6	1	\N
板	bǎn	chefe	11	1	\N
遺	yí	herança	8	1	\N
貝莉	Bèilǐ	Bailey	4	1	\N
賬	zhàng	conta	4	1	\N
販	fàn	vender	4	1	\N
咱	zán	nós	4	1	\N
猾	huá	astuto	4	1	\N
大衛	Dàwéi	David	4	1	\N
懼	jù	medo	4	1	\N
輔	fǔ	complemento	9	1	\N
式	shì	estilo	7	1	\N
予	yǔ	dar	7	1	\N
志	zhì	atenção	26	1	\N
狡	jiǎo	astuto	5	1	\N
悶	mèn	preocupado	6	1	\N
椅	yǐ	cadeira	6	1	\N
[笑]	xiào	[risada]	5	1	\N
卷	juàn	rolo	4	1	\N
婆	 pó	mulher	9	1	\N
伯納	Bó nà	Barnard	2	1	24
聰明的	cōng míng de	inteligente	13	1	12
喘息聲	chuǎn xī shēng	som de respiração	2	1	31
莹   (yíng)	repetição	brilhante	0	1	\N
揭穿	jiē chuān	expor	2	1	11
賬戶	zhàng hù	conta	2	1	44
的   (de)	neste caso, usado para formar uma pergunta		0	1	55
阿爾伯	ā ěr bó	Alberto	5	1	13
警察局	jǐng chá jú	delegacia de polícia	19	1	32
貝莎	Bèi shā	Bêsha	5	1	41
要去	qù yào	ir	11	1	44
寡	guǎ	viúva	2	1	\N
社團	shè tuán	associação	2	1	42
roxelle	roxelle	roxelle	4	1	\N
好吗	hǎo ma	está bem	4	1	35
婉麗	wǎn lì	elegante	5	1	34
令人敬佩	lìng rén jìng pèi	respeitável	5	1	42
莹    (repetição)	yíng	brilhante	0	1	\N
雅拉	yǎ lā	Yara	5	1	31
搞得很難受	gǎo de hěn nán shòu	nos deixar desconfortáveis	4	1	35
福	fú	bênção	13	1	\N
咕嚕嚕	gū lū lū	gurugu	2	1	11
洪亮	hóng liàng	alto	9	1	24
紗	shā	seda	39	1	\N
的    (neste caso, usado para formar uma pergunta)	de		0	1	\N
輝	huī	brilho	3	1	\N
水面	shuǐ miàn	superfície da água	3	1	34
卡爾拉	Kǎ'ěrlā	Carla	50	1	\N
逃出生天	táo chū shēng tiān	escapar	2	1	21
羅歇爾	Luò xié'ěr	Roger	5	1	42
穆克斯	mù kuò sī	Mù Kuò Sī	2	1	44
港湾	gǎng wān	porto seguro	2	1	31
參	shēn	participar	3	1	\N
喋喋不休	dié dié bù xiū	tagarela	2	1	22
是一項	shì yī xiàng	é uma	2	1	41
彗星	huì xīng	cometa	2	1	41
Cambuca	Kǎnbù kuài	Cambuca	2	1	34
怒吼	nù hǒu	roar	8	1	43
肉毒桿菌素	ròu dú gān jūn sù	toxina botulínica	4	1	42
家長	jiā xiào	chefe de família	9	1	14
芝	zhī	queijo	2	1	\N
半價	bàn jià	metade do preço	4	1	44
桑巴舞會	sāng bā wǔ huì	samba festa	2	1	11
婉妮	wǎn nī	Wan Ni	2	1	31
遊玩	yóu wán	brincar	4	1	22
賬單	zhàng dān	conta	2	1	41
汽車	qì chē	carro	22	1	41
克爾	kě ěr	Ker	5	1	33
偷走	tōu zǒu	roubar	5	1	13
madá	pinyin não disponível	madá	2	1	55
浮出	fú chū	emergir	2	1	21
隧道	suì dào	túnel	2	1	44
商	shāng	comércio	2	1	\N
繁榮	fánróng	próspero	2	1	\N
茲	zī	zi	12	1	\N
,	,	,	22	1	\N
賀	hè	felicitações	6	1	\N
上的	shàng de	na	4	1	45
杰	jié	Jie	4	1	\N
縷	lǚ	raio	2	1	\N
也很愛你	yě hěn ài nǐ	também te amo muito	2	1	33
一堂	yī táng	uma aula	3	1	12
城	chéng	cidade	17	1	\N
明星	míng xīng	estrela, celebridade	4	1	21
崎	qí	montanhoso	14	1	\N
譭	yìng	difamação	2	1	\N
後車廂	hòu chē xiāng	porta-malas	3	1	41
ribs...	ribā...	costelas...	2	1	\N
約東	yuē dōng	Yue Dong	12	1	11
好像	hǎo xiàng	parece que	60	1	34
勘察	kan cha	inspeção	1	1	55
說出	shuō chū	dizer	15	1	11
虹	hóng	arco-íris	1	1	\N
市	shì	cidade	7	1	\N
翔	xiáng	planar	2	1	\N
伙	huǒ	companheiro	0	1	\N
唐生	táng shēng	Tang Sheng	2	1	21
寶拉	bǎo lā	Paula	44	1	31
只剩下	zhǐ xiǎng yǒu	só resta	0	1	33
洛	luò	loca	16	1	\N
呀	ya	partícula interrogativa	70	1	\N
幸子	xìng zi	Kaoru	5	1	45
ribs	rib	costelas	2	1	\N
氧	yǎng	oxigênio	2	1	\N
馬達	mǎ dá	motor	397	1	32
茹	rú	Ru	3	1	\N
辭	cí	despedida	3	1	\N
依	yī	de acordo com	2	1	\N
數	shǔ	número	49	1	\N
婦產科	fù chǎn kē	ginecologia	5	1	43
貝思	bèi sī	Bess	5	1	41
貝芙	bèi fú	Befu	2	1	42
內茲	nèi zē	Nez	2	1	41
交通事故	jiāotōng xiǎolù	acidente de trânsito	2	1	13
一个人	yī gè rén	sozinho	2	1	14
瑪麗達	mǎ lì dá	Marilda	2	1	34
喚	huàn	chamar	20	1	\N
吃羨慕	chī xiàn mù	inveja	2	1	14
簡	jiǎn	simples	7	1	\N
呵	he	he	5	1	\N
夫人的	fū rén de	da senhora	2	1	12
王后	wáng hòu	rainha	2	1	24
珍妮塔	Zhēn nītǎ	Janneta	2	1	11
約瑟	yuē sè	Joseph	16	1	14
理奇	Lǐ qí	Ricky	2	1	32
納納尼娜	nà nà ní ní na	Nana Nalina	2	1	44
疲倦	pí juàn	cansado	2	1	24
![塔蒂]	tǎ dì	Tat[de]	2	1	34
約診	yuē zhěn	consulta marcada	2	1	13
妊娠	rùn shēn	gravidez	2	1	41
是一	shì yī	é uma	3	1	41
溺愛	nì ài	superproteger	2	1	44
卡斯特利	kǎ sù tè lì	Castelli	2	1	34
分數	fēn shù	pontuação	2	1	14
瑞克	Ruòkè	Rick	11	1	\N
維尼露達	wēi ní lù dá	Vinilouda	2	1	12
支援	zhī yuàn	suportar	3	1	14
警衛	jǐng wèi	segurança	2	1	34
由季	yóu jì	Yuj	2	1	24
小兄弟	xiǎo xiōngdì	irmãozinho	2	1	31
很害怕	hěn pà	com medo	2	1	34
叫聲	jiào shēng	miado	2	1	41
瓦爾特	Wǎ ěr tè	Walter	2	1	33
批判	pī pàn	crítica	2	1	14
我很痛	wǒ hěn tòng	estou com dor	2	1	33
非常痛	fēi cháng tòng	muito dolorido	2	1	12
護衛	hù wèi	proteger	2	1	44
可憐的	kě lián de	pobre	6	1	32
艾森	ài sēn	Asen	12	1	41
DonaNiuza	Dǒu nà níu zū	DonaNiuza	2	1	34
貝蒂	Bèi tí	Betty	3	1	42
總是在	zǒng shì zài	sempre está	3	1	34
紐扎	niǔ zhā	Niuza	2	1	31
尿布	niào bǔ	fralda	2	1	43
妇科	fù kē	ginecologia	2	1	41
自拍	zì bài	selfie	12	1	44
藤	téng	cipó	2	1	\N
參考	cān kǎo	referência	2	1	13
小夥伴	xiǎo huǒ bàn	companheiro	2	1	33
柔和	róu hé	suave	2	1	22
維瓦尼亞	wéi wā ní yà	Vivânia	2	1	21
医生	yī shēng	médico	2	1	11
希科	xī kē	Sique	2	1	11
口哨聲	kǒu shāo shēng	assobio	2	1	31
在家	zài jiā	em casa	2	1	41
的事務	de shì wù	assuntos	2	1	54
阿伯	ā bó	vovô	2	1	12
框	kuàng	moldura	2	1	\N
小問題	xiǎo wèn tí	pequeno problema	2	1	34
孫	sūn	sobrinho	26	1	\N
曾孫	zēngsūn	bisneto	5	1	\N
son	zǐ	filho	7	1	\N
斯坦	tān	tan	4	1	\N
即時	jí shí	em tempo real	4	1	22
婉妮達	wǎn nī dá	Wǎnnīdá	3	1	31
卡塔	Kǎtǎ	Catar	2	1	\N
埃爾森	ài ěr sēn	Erson	5	1	43
扶	fú	segurar	2	1	\N
徐	xú	lento	2	1	\N
格拉索	Gélāsuǒ	Grasso	2	1	\N
郵	yóu	correio	2	1	\N
儲	chǔ	armazenar	2	1	\N
蓄	xù	economizar	2	1	\N
邪	xié	mal	2	1	\N
![噯噯聲]	kerchief	[tosse]	2	1	\N
SEBASTIAN	seˈbastiən	SEBASTIAN	2	1	\N
荷	hé	íris	2	1	\N
掛念	guàniàn	preocupação	2	1	\N
內茲亞	Nèizēiyā	Nezúa	2	1	\N
calm	ān	calma	2	1	\N
za	za	(não encontrado na frase, ignorar)	2	1	\N
導	dǎo	dirigir	2	1	\N
长	cháng	longo	2	1	\N
开始	kāishǐ	começar	2	1	\N
时间	shíjiān	tempo	5	1	\N
蒂亞戈	Dìyāgē	Tiago	2	1	\N
一生下來	yī shēng xià lái	nascer	1	1	11
色彩	sè cǎi	cor	6	1	43
流星	liú xīng	estrela cadente	1	1	21
PAULA	pāu lā	PAULA	2	1	11
羅斯	luó sī	Rosy	1	1	21
堂哥	táng gē	primo	2	1	21
這一次	zhè yī cì	desta vez	2	1	41
喬妮	Qiáo ní	Jony	2	1	22
痛打	tòng dǎ	surra	2	1	43
神智	shén zhì	mente	2	1	24
發佈	fā bù	lançar	2	1	14
加勒比	jiā lè bǐ	Caribe	2	1	14
難忘	nán wàng	inesquecível	2	1	24
伸縮	shēn suō	expansível	2	1	11
放了	fàng le	soltou	2	1	45
停頓	tíng dùn	pausa	2	1	24
牽	qiān	segurar	23	1	\N
平	píng	paz	24	1	\N
羅克瑟	Luó Kè Sī	Rockser	4	1	24
两	liǎng	dois	1	1	\N
後備	hòubèi	traseiro	0	1	\N
蔚	wèi	esplêndido	1	1	\N
翱	áo	voar	2	1	\N
对	duì	correto	2	1	\N
囁語	yànyǔ	sussurro	2	1	\N
相信了	xiāngxìnle	acreditou	2	1	\N
誓	shì	juramento	17	1	\N
雅	yǎ	elegante	7	1	\N
爸	bà	pai	40	1	\N
聖	shèng	Santo	144	2	\N
外面	wài miàn	fora	24	1	44
裁縫	cái féng	costureira	2	1	22
打撲克	dǎ pū kē	jogar pôquer	2	1	31
揭開	jiē kāi	abrir	8	1	11
內祖母	nèi zǔ mǔ	bisavó	2	1	43
上心	shàng xīn	preocupar-se muito	2	1	41
遞	dì	entregar	14	1	\N
董荷娜	Dǒng Hé nà	Dang Ho-na	2	1	32
的想法	de xiǎng fǎ	ideia	2	1	53
老弟	lǎo dì	irmão mais novo	2	1	34
西奧凡	Xī ào fān	Theo van	2	1	14
舒伯特	Shū Bó Tè	Schubert	4	1	12
來了	lái le	cheguei/vim	43	1	25
接收器	shōu jī qì	receptor	1	1	11
融化	róng huà	derreter	3	1	24
正要	zhèng yào	estar prestes a	5	1	44
羅克勒	luō kè lè	Rockler	16	1	14
卑劣	bēi liè	vil	2	1	14
矯揉造作	jiǎo róu zào zuò	afetado	2	1	32
克拉拉	Kǎ Lā Lā	Clara	2	1	31
弱	ruò	fraqueza	5	1	\N
john	geɪn	john	3	1	\N
布魯娜	Bù lǔ nà	Bruna	5	1	43
的事物	de shì wù	coisas	2	1	54
拚命	pīn mìng	desesperadamente	2	1	14
總部	zǒng bù	sede	2	1	34
毫無關係	háo wú guān xì	não ter nenhuma relação	2	1	22
傻傻的	shǎ shǎ de	bobo	2	1	33
寂	jì	quieto	18	1	\N
朱莉安娜	Zhū Lí'Ānnà	Juliana	2	1	12
刁難	diāo nàn	dificultar	2	1	14
卡歐	Kǎ ōu	Kao	3	1	31
喚醒	huàn xǐng	despertar	2	1	43
單純	dān chún	simples/puro	2	1	12
發明了	fā míng le	inventaram	2	1	12
胡編亂造	hú biān luàn zào	inventar aleatoriamente	2	1	21
代理處	dài lǐ chù	agência	3	1	43
出  (repetição)	chū	sair	0	1	\N
婚事	hūn shì	casamento	2	1	14
閒混	xián hùn	vaguear/perder tempo	2	1	24
審問	shěn wèn	interrogar	2	1	34
的名字	de míng zì	nome	2	1	52
robustecer	zhuó zhuàng	crescer	2	1	24
早在	zǎo zài	desde cedo	2	1	34
LU	LU	LU	5	1	\N
不會吧	bù huì ba	não acredito	2	1	44
著呢	zhe ne	está	2	1	55
六個月	liù gè yuè	seis meses	2	1	44
感覺到	gǎn jué dào	sentir	2	1	32
嘟嘟	dū dū	(nome ou som imitativo)	2	1	11
半月	bàn yuè	meio mês	2	1	44
八個	bā gè	oito	2	1	14
但我	dàn wǒ	mas eu	2	1	43
我發誓	wǒ fā shì	eu juro	2	1	31
緊繃	jǐn bēng	tenso	2	1	31
西爾瓦	Xī'ěr wǎ	Silva	2	1	13
我在	wǒ zài	estou	2	1	34
加倍	jiā bèi	dobrar	2	1	14
惹惱	rě nǎo	irritar	2	1	33
不可或缺	bù kě orì shǎo	indispensável	2	1	43
撒	sā	contar	5	1	\N
丁	dīng	quarto	11	1	\N
吃了	chī le	comeu	2	1	15
製成	zhì chéng	feito	3	1	42
七個	qī gè	sete	3	1	14
逍遙	xiāo yáo	vagabundo	2	1	12
未来	wèi lái	futuro	2	1	42
小时	xiǎo shí	horas	2	1	32
後天	hòu tiān	depois de amanhã	4	1	41
故弄玄虛	gù nòng xuán xū	mistério	2	1	44
嘆息聲	tǎn xī shēng	suspiro	5	1	31
拉斐爾	Lā fēi ěr	Rafael	2	1	11
小人	xiǎo rén	pessoa mesquinha	2	1	32
搞笑	gǎo xiào	engraçado	2	1	34
取名	qǔ míng	nomear	2	1	32
儿子	ér zi	filho	5	1	25
瑪麗娜	Mǎ Lì Nà	Marina	2	1	34
自告奮勇	zì gào fèn yǒng	voluntariamente	2	1	44
Cambuca村	cāng bù cā子 cūn	Cambuca aldeia	2	1	14
辯護	biàn hù	defesa	2	1	44
善罷	shàn bá	aceitar	2	1	42
甘休	gān xiū	pacificamente	2	1	11
迴響	huí xiǎng	echoing	2	1	23
永不	bù yǒng	nunca	4	1	43
作出	zuò chū	fazer	2	1	41
阻礙	zǔ ài	obstáculo	2	1	34
茶葉	chá yè	chá	2	1	24
胎兒	tāi ér	feto	2	1	12
警務	jǐng wù	policial	2	1	34
認真地	rèn zhēn de	sinceramente	2	1	41
伸展	shēnzhǎn	esticar	2	1	\N
嘖嘖	zé zé	cacarejar	2	1	22
古	gǔ	antigo	21	1	\N
玩兒	wán er	brincar	2	1	25
约	yuē	encontro	3	1	\N
牛皮	niú pí	couro de boi	2	1	22
伊莎貝爾	Yī shā bèi ěr	Isabel	2	1	11
痴	chī	tolo	2	1	\N
躲避	bì duò	esquivar	2	1	44
款	kuǎn	item	2	1	\N
乏	fá	falta	2	1	\N
的孩子	de hái zi	dos filhos	4	1	52
Cacá	Cacá	Cacá	3	1	\N
健	jiàn	saudável	4	1	\N
棚	péng	barraca	2	1	\N
摧	cuī	destruir	2	1	\N
见	jiàn	ver	3	1	\N
溫蒂	Wēndì	Wendy	2	1	\N
怡	yí	agradável	2	1	\N
斐	fěi	lindo	2	1	\N
路易	Lùyì	Louis	7	1	\N
manipulation	manipulation	manipulação	2	1	\N
逐	zhú	perseguir	2	1	\N
reveal		揭露	2	1	\N
lesson	lesson	lição	2	1	\N
加維亞	jiā wēi yà	Gaviao	2	1	11
虔誠	qián chéng	devoto	5	1	22
时	shí	tempo	2	1	\N
不定	bù dìng	incerto	0	1	44
居民	jū mín	residente	1	1	12
的手	de	de	5	1	\N
東	dōng	leste	19	1	\N
间	jiān		1	1	\N
霓	ní	néon	1	1	\N
寸	cun	polegada	3	1	\N
芝士	zhī shì	queijo	1	1	14
卡伊奧的	kǎi yōu de	de Kaiyou	2	1	31
商業	shāng yè	comercial	2	1	14
亞松森	Yà Sōng Sēn	Assunção	2	1	41
武神	wǔ shén	guerreira divina	2	1	32
球迷	bǐ fēi	torcedor	2	1	31
LUIS	LUO2 SI	LUIZ	5	1	55
凡迪尼亞	fán dí ní yà	Vandyne	2	1	22
空	kōng	vazio	10	1	\N
從容地	cóng róng de	calmamente	2	1	22
消逝	xiāoshì	desaparecer	0	1	\N
knights	nài shì	cavaleiros	2	1	44
瓦斯克	Wà sī ké	Vasquez	2	1	41
男的	nán de	menino	2	1	25
迴盪的	huí dàng de	ressoando	2	1	24
松西翁	sōng xī wēng	Uncle Sàngxī	2	1	11
男人主義	nán rén zhǔ yì	machismo	2	1	22
是多少	duō shǎo	quanto	2	1	13
胡思亂想	húsī luànxiǎng	devaneio	2	1	24
菜	cài	vegetal	5	1	\N
蛋	dàn	ovo	10	1	\N
不合	bù hé	não concordar	2	1	42
私事	sī shì	assunto pessoal	2	1	14
端	duān	servir	10	1	\N
氣呼呼地	qì hū hū de	irritados	2	1	41
席爾瓦娜	Xí ěr wǎ nà	Silva	18	1	23
安頓	ān dùn	nos estabelecer	6	1	14
跳	tiào	bater	17	1	\N
傢	jiā	sujeito	0	1	\N
財	 cái	riqueza	2	1	\N
了一	yī	um	9	1	\N
墊	diàn	base	2	1	\N
尺	chǐ	medida	19	1	\N
辛	xīn	amargo	8	1	\N
霍	huò	queimar	10	1	\N
褪	tuì	desbotar	2	1	\N
敞	chǎng	aberto	2	1	\N
处	chǔ	lugar	0	1	\N
牛奶	niú nǎi	leite	8	1	23
道夫	dào fū	dao fu	14	1	41
球衣	QIU YI	camisa de time	8	1	55
禮	lǐ	presente	5	1	\N
懷著	huái zhe	carregando	2	1	25
早得很		muito cedo	2	1	\N
靜  (repetida)	jìng	quieto	0	1	\N
拐杖	guǎ zhàng	bengala	2	1	34
春	chūn	primavera	2	1	\N
希	xī	esperança	3	1	\N
蹤	zōng	rastro	2	1	\N
扉	fēi	porta	2	1	\N
最終	zuì zhōng	finalmente	39	1	41
冷靜	lěng jìng	calmo	222	2	34
逛	guàng	passear	2	1	\N
SHEILA	SHEILA	SHEILA	2	1	\N
短期	duǎnqī	curto prazo	2	1	\N
爐	lú	forno	1	1	\N
獨	dú	sozinho	15	1	\N
BIANCA		Bianca	6	1	\N
勢利	shì lì	interesseiro	2	1	44
索尼婭	Sòn lì yà	Sonya	2	1	44
身心	shēn xīn	mente e corpo	2	1	11
荷蘭	hé lán	Holanda	11	1	22
不好意	bù hǎo yì	desculpa	2	1	43
比如	bǐ rú	como	2	1	32
萬分	wàn fēn	extremamente	4	1	41
沉痛	chén tòng	pesar	0	1	24
天賦	tiān fù	talento	3	1	14
欽佩	qīn pèi	admirar	9	1	14
馬可	mǎ kě	Marco	25	1	33
boys	nǎi pútóng	meninos	4	1	32
瓦斯	wǎ sī	gás	2	1	31
弗拉	fú lā	Flamengo	2	1	21
慣	guàn	acostumar	1	1	\N
很差勁	hěn chà jìng	muito ruim	2	1	34
小吃	xiǎo chī	lanche	2	1	31
審閱	shěn yuè	revisar	2	1	34
用功	yòng gōng	aplicado	2	1	41
例外	lì wài	exceção	2	1	44
叔本華	shū běn huá	Schopenhauer	2	1	13
或者說	huò zhě shuō	ou melhor dizendo	2	1	43
瑪麗莎	Mǎ lì shā	Marisa	2	1	34
co	kǎ	(onomatopeia para grito)	2	1	\N
德行	dé xíng	caráter	2	1	22
購物	gòu wù	compras	5	1	44
失竊	shī qiè	roubo	2	1	14
膚	fū	pele	2	1	\N
格雷戈里奧	gé lēi guō lì ào	Gregório	5	1	21
過錯	guò cuò	erro	2	1	44
敏感度	mǐn gǎn dù	sensibilidade	2	1	33
的老	lǎo de	do velho	2	1	35
取回	qǔ huí	recuperar	2	1	32
交出	jiāo chū	entregar	4	1	11
被盜	bèi dào	roubados	2	1	44
麗蒂尼亞	lì dì ní yà	Leticia	2	1	44
碧安卡	bì ān kǎ	Bianca	24	1	41
強尼	qiáng ní	Johnny	2	1	22
萬達	wàn dá	Wanda	2	1	42
哈勒瑞	hā lè ruì	Halle Berry	2	1	14
LUISINHO	LUO1 SI4 N1	Luizinho	2	1	55
索取	qǔ suǒ	buscar	2	1	33
無損	wúsǔn	sem danos	2	1	\N
小路易	xiǎo lù yì	pequeno Luís	2	1	34
咆哮	páo xiào	rugir	2	1	24
之物	zhī wù	coisas	2	1	14
髒話	zāng huà	palavrão	2	1	14
早早	zǎo zǎo	cedo	4	1	33
攀登	pá dēng	escalar	2	1	21
收回	huí sūi	recuperar	2	1	21
LEONARDO	LEI XU NA DO	Leonardo	5	1	55
100	yī bǎi	100	2	1	13
受夠	shòu gòu	cansar	2	1	44
小索妮婭	Xiǎo Sònīyà	Pequena Sonia	2	1	34
膝蓋	xī gài	joelho	3	1	14
贓物	zāng wù	bens roubados	2	1	14
龐	páng	grande	2	1	\N
滴答聲	dī dá shēng	som de tic-tac	21	1	12
哈維爾	hā wēi ěr	Harvey	2	1	11
個人物	gè rén wù	pessoa	2	1	42
別的事	bié de shì	outra coisa	2	1	25
喝了	hēo le	bebi	2	1	15
耳朵	ěr duo	orelha	2	1	35
高手	gāo shǒu	especialista	2	1	13
內盧	nèi lú	Janeiro	7	1	42
范迪尼亞	fàn dí ní yà	Vendini	2	1	42
名叫	mìng jiào	chamada	3	1	44
氣味	qì wèi	cheiro	2	1	44
的目光	de míng guó	olhar	4	1	52
Urban	Urban	Urban	2	1	\N
可做	kě zuò	fazer	3	1	34
射	shè	disparar	7	1	\N
暴	bào	violento	2	1	\N
葛	gé	bambu	14	1	\N
災	zāi	desastre	4	1	\N
RITINHA	RITINHA	Ritinha	2	1	\N
椰	yē	coco	3	1	\N
佩尼亞	Pènīyà	Penya	2	1	\N
搖	yáo	balançar	2	1	\N
襯	chèn	camisa	2	1	\N
衫	shān	camisa	2	1	\N
柱	zhù	usar	2	1	\N
罐	guàn	jarro	2	1	\N
拂	fú	passar	2	1	\N
完好	wǎnhǎo	intacto	2	1	\N
購	gòu	comprar	2	1	\N
膝	xī	joelho	2	1	\N
階	jiē	degrau	2	1	\N
梯	tī	escada	2	1	\N
危急	wēijí	crítico	2	1	\N
關頭	guāntóu	momento crítico	2	1	\N
醋	cù	vinagre	2	1	\N
維爾	wéi'ěr	Helena	2	1	\N
振	zhèn	vibrante	2	1	\N
禍	huò	desgraça	2	1	\N
松	sōng	pinho	2	1	\N
OLGA	ˈɔl.ɡa	OLGA	2	1	\N
KÁTIA	KÁTIĀ	Kátia	2	1	\N
擰	niǔ	torcer	2	1	\N
摩	mó	friccionar	8	1	\N
安卡	Ānkǎ	Bianca	2	1	\N
憾	hàn	arrependimento	3	1	\N
皙	xī	translúcido	2	1	\N
汗	hàn	suor	2	1	\N
浹	jié	banhar	2	1	\N
陶	táo	porcelana	2	1	\N
愉	yú	alegre	2	1	\N
悅	yuè	prazer	2	1	\N
警報	jǐng bào	alarme	1	1	34
叫醒	jiào xǐng	acordar	1	1	43
毛巾	máo jīn	toalha	1	1	21
赤腳	chì jiǎo	descalço	1	1	43
还要	hái yào	ainda	1	1	24
艱苦	jiān kǔ	difícil	1	1	13
无	wú	sem	0	1	\N
撒哈拉	sā hā lā	Saara	1	1	11
冰冰	bīng bīng	gelado	1	1	11
不容	bù róng	não tolera	1	1	42
多管閒事	duō guǎn xián shì	intrometer-se	4	1	13
悶不樂	mèn bù lè	mal-humorado	1	1	44
到了	dào le	chegamos	50	1	45
餅	bǐng	bolo	3	1	\N
葛拉莎	Gé lā shā	Glásha	1	1	21
个	gè	(measure word)	5	1	\N
枯	kū	murchar	1	1	\N
坡	pō	inclinação	1	1	\N
加薪	jiā xīn	aumento de salário	1	1	11
恩寵	ēnchǒng	favor divino	1	1	\N
哲	zhé	filosofia	2	1	\N
PRO	PRO	PRO	1	1	\N
元	yuán	célula	1	1	\N
嚔	yē	suspiro	1	1	\N
神經元	shén jīng yuán	neurônio	1	1	21
pancakes	pancakes	panquecas	1	1	\N
趴	pā	deitar	3	1	\N
大腿	dà tuǐ	coxa	1	1	43
Cristina	Kristīnā	Cristina	3	1	\N
俗氣	sú qì	vulgar	1	1	24
新生	xīn shēng	novo	1	1	11
遙遠的	yáo yuǎn de	distante	1	1	23
西迪紐	Xī Dì Niǔ	Sidniu	1	1	14
完美的	wán měi de	perfeito	4	1	23
俊美	jùn měi	atraente	1	1	43
瑪莉莉亞	Mǎ lì lì yà	Marília	1	1	34
尊重	zūn zhòng	respeitar	43	1	14
神經	shén jīng	neurônio	5	1	21
偷偷摸摸	tōu tōu mō mō	furtivamente	1	1	11
踏進	tà jìn	entrar	0	1	44
程度	chéng dù	grau	1	1	24
劃定	huà dìng	definido	2	1	44
珍	zhēn	Janet	1	1	\N
吁	xū	ofegante	23	1	\N
瞎	xiā	cego	2	1	\N
另有	lìng yǒu	tem outra	1	1	43
此生	cǐ shēng	esta vida	2	1	31
懇求	kěn qiú	implorar	4	1	32
noses	bí zǐ	narizes	1	1	23
雕刻家	tuō qiāo jiā	escultor	1	1	11
投射	tóu shè	projetando	3	1	24
婦科	fù kē	ginecologia	1	1	41
修車	xiū chē	reparo de carro	1	1	11
蘋果	píng guǒ	maçã	3	1	23
雅內特	yǎ nèi tè	Janet	1	1	34
結實	jié shi	firme	1	1	25
的話題	de huà tí	o tópico	1	1	54
雅頓	yǎ dùn	Yardley	1	1	34
風流種	fēng liú zhǒng	mulherengo	1	1	12
奇迪尼奧	Qí Dì Ní Yáo	Chiquinho	1	1	24
滿腔	mǎn qiāng	cheia	1	1	31
的心願	de xīn yuàn	desejo	1	1	51
細微	xì wēi	sutis	1	1	41
射精	shè jīng	ejaculação	1	1	41
傳單	chuán dān	panfleto	1	1	21
罷休	bà xiū	desistir	1	1	41
步伐	bù fá	passos	2	1	42
免了	miǎn le	isento	1	1	35
墨西哥	Mè xiōng gē	México	1	1	41
炎	yán	inflamação	5	1	\N
標題	biāo tí	título	1	1	12
葛蕾莎	Gé Luì Shā	Martha	9	1	24
臨	lín	fronteira	1	1	\N
格拉薩	gé lā sà	Grazia	17	1	21
不太好	bù tài hǎo	não muito bem	1	1	44
的眼	de yǎn	de olho	1	1	53
目光	mù guāng	olhar	1	1	41
淫慾	yín yù	luxúria	1	1	24
苦海	kǔ hǎi	mar de sofrimento	1	1	33
阿基歐	ā jī ōu	Aquiles	1	1	11
撇嘴	piě zuǐ	revirar os lábios	1	1	33
體貼	tǐ tiē	atencioso	1	1	31
寥寥	liáo liáo	poucos	1	1	22
洩	xiè	ejaculação	1	1	\N
當值	dāng zhí	de plantão	1	1	12
無心	wú xīn	sem intenção	1	1	21
嘴唇	chún biāo	lábios	1	1	21
CRISTINA	CRISTINA	Cristina	3	1	\N
經意	jīng yì	intencional	1	1	14
棕色	zōng sè	castanho	1	1	14
奧秘	ào mì	mistério	1	1	44
决	jué	resolver	1	1	\N
我也不會	wǒ yě bù huì	Eu também não	1	1	33
在我	zài wǒ	em mim	1	1	43
夏洛特	xià luò tuō	Shirley	1	1	44
淫穢	yín huì	obscene	1	1	24
劈	pī	dividir	5	1	\N
珍妮特	Zhēn nī tè	Janet	5	1	11
外送員	wài sòng yuán	entregador	1	1	44
綠	lǜ	verde	1	1	\N
愈發	yù fā	cada vez mais	1	1	41
退休	tuìxiū	aposentadoria	3	1	\N
奈德	Nài dé	Ned	1	1	42
嘟	dū	soprar	1	1	\N
的女人	nǚ rén	mulher	1	1	32
廠	chǎng	fábrica	1	1	\N
晨	chén	manhã	1	1	\N
加快	jiākuài	acelerar	1	1	\N
多好	duō hǎo	ótimo	1	1	13
返	fǎn	retornar	2	1	\N
十七	shí qī	dezessete	1	1	21
巴掌	bā zhǎng	tapa	1	1	13
小西迪尼奧	Xiǎo Xī Dī Ní Ōu	Jorge	1	1	31
西迪尼奧	Xī dí niáo	Sidinio	3	1	12
內德	Nèi dé	Ned	1	1	42
得很晚	de hěn wǎn	muito tarde	1	1	53
羨慕	xiàn mù	invejar	2	1	44
攻	gōng	atacar	2	1	\N
漂	piào	flutuar	5	1	\N
招	zhāo	recorrer	5	1	\N
问	wèn	problema	1	1	\N
题	tí	problema	1	1	\N
結過	jiéguò	casaram	1	1	\N
集	jí	reunião	3	1	\N
格蕾莎	Gélèsā	Grease	7	1	\N
剝奪	bōduó	privar	1	1	\N
邃	suì	profundo	1	1	\N
塑	sù	plástico	1	1	\N
眾	zhòng	todos	20	1	\N
ANAIR	a-na-i-er	ANAIR	3	1	\N
「貝薩」	bèi sà	'beisa'	1	1	44
功	gōng	sucesso	2	1	\N
我只是	wǒ zhǐ shì	eu sou apenas	1	1	33
在看	zài kàn	em ver	1	1	44
骨	gǔ	osso	1	1	\N
革	gé	couro	3	1	\N
顱	luó	crânio	1	1	\N
查梅戈	Chá Méi Gē	Chamego	1	1	22
露絲	Lù sī	Rosa (nome próprio)	40	1	41
陰影	yīn yǐng	sombra	3	1	13
這種	zhè zhǒng	este tipo de	221	1	43
罪人	zuì rén	culpado	0	1	42
尤其	yóu qí	especialmente	18	1	22
考量	kǎo liàng	considerar	1	1	34
点	diǎn	algo	3	1	\N
細碎	xì suì	pequenos	1	1	44
聲響	shēng xiǎng	som	1	1	13
順	shùn	obedecer	4	1	\N
口袋	bà guēi	bolso	1	1	41
前世	qiánshì	vidas passadas	3	1	\N
二代	èr dài	segunda geração	1	1	44
覆	fù	cobrir	6	1	\N
闡述	chǎn shù	explicar	1	1	34
恰到好處	qià dào hǎo chù	perfeito	1	1	44
悚	sǒng	assustador	19	1	\N
收買	shōu mǎi	conquistar	1	1	13
前任	qián rèn	ex	1	1	24
換取	huàn qǔ	obter	1	1	43
disrespect	disrespect	desrespeito	1	1	\N
智者	zhì zhě	sábio	1	1	43
呼喊	hū hàn	gritar	3	1	14
凱厄斯	Kǎi è sī	Cayo	1	1	34
續	xù	prosseguir	18	1	\N
別墅	bié shù	villa	4	1	24
罷	bà	parar	3	1	\N
即	jí	mesmo	25	1	\N
一半	yī bàn	metade	4	1	14
詐騙	zhà zà	fraude	3	1	44
陽	yáng	yang	1	1	\N
痿	wěi	impotente	1	1	\N
費爾南多	Fernánduō	Fernando	1	1	\N
轆轆	luò luò	ruidosamente	1	1	44
光環	guāng huán	aura	1	1	12
受了	shòu le	sofreu	1	1	45
過分	guò fèn	excessivo	1	1	44
異性	yì xìng	gênero diferente	1	1	44
諷刺	fěng cì	sátira	1	1	34
飢	jī	fome	1	1	\N
腸	cháng	intestino	1	1	\N
让	ràng	fazer	4	1	\N
吞噬	shì tú	devorar	3	1	42
慮	lǜ	consideração	1	1	\N
烏木	wū mò	ébano	11	1	14
趣	qù	interesse	5	1	\N
有一個	yǒu yī gè	tem um	9	1	31
官能	guān néng	funcional	3	1	12
帝國	dì guó	império	1	1	42
最初	chū zǒu	inicial	2	1	13
时候	shí hòu	hora	4	1	24
講座	jiǎng zuò	palestra	1	1	34
不容易	bù róng yì	não fácil	1	1	42
雕塑	sù diǎo	escultura	1	1	43
噪音	zǒng xiào	ruído	4	1	34
丑	chǒu	palhaço	2	1	\N
剛剛	gāng gāng	acabei de	53	1	11
辦公	bàn gōng	escritório	1	1	41
主顧	zhǔ gù	cliente	1	1	34
損失	sǔn shī	perda	9	1	31
woman	nǚ	mulher	11	1	\N
爛	làn	ruim	6	1	\N
駛	shǐ	navegar	2	1	\N
鬧得	nào dé	causou tumulto	1	1	42
雞飛狗跳	jī fēi gǒu tiào	alvoroço	1	1	11
愚	yú	tolo	1	1	\N
肉	ròu	carne	17	1	\N
徒	tú	em vão	11	1	\N
勞	láo	trabalho	1	1	\N
宰	zǎi	controlar	1	1	\N
增添	zēngtiān	adicionar	1	1	\N
乘船	chéng chuán	navegar de barco	1	1	22
出遊	chū yóu	passeio	1	1	12
削減	xiāo jiǎn	redução	1	1	13
香水	xiāng shuǐ	perfume	1	1	13
顧忌	gù jì	consideração	1	1	44
石頭	shí tóu	pedra	1	1	22
友誼	yǒu yì	amizade	16	1	34
爆	bào	explodir	3	1	\N
審美	shěn mèi	estética	1	1	34
僵化	jiāng huà	rigidez	1	1	14
身分	shēn fèn	identidade	0	1	14
奉獻	fèng xiàn	dedicação	5	1	44
恩怨	ēn yuàn	rixas	0	1	14
邦	bāng	robusto	1	1	\N
翹	qiào	levantado	1	1	\N
臀	tún	nádegas	1	1	\N
鍾情	zhōng qíng	love at first sight	3	1	12
冊子	cè zi	brochura	1	1	45
福音	fēng yīn	boas novas	17	1	11
馬里利亞斯	Mǎ lǐ lì yà sī	Marília	1	1	33
該不會	gāi bù huì	não deveria	1	1	14
狠狠地	hěn hěn de	severamente	1	1	33
漫	màn	amplo	3	1	\N
世間	shì jiān	mundo	21	1	41
師表	shī biǎo	modelo	14	1	13
的路	de lù	caminho	9	1	54
有道	yǒu dào	correto	9	1	34
一分	yī fēn	minuto	9	1	11
不顧	bù gù	ignorar	15	1	44
永别	yǒng bié	despedida eterna	14	1	32
厚祿	hòu lù	alta remuneração	14	1	44
天下	tiān xià	mundo	26	1	14
周遊	zhōu yóu	viajar	14	1	12
太子	tài zǐ	príncipe herdeiro	15	1	43
後世	hòu shì	posteridade	14	1	44
百姓	bǎi xìng	pessoas comuns	31	1	34
終日	zhōng rì	todos os dias	16	1	14
幾年	jǐ nián	quantos anos	10	1	32
口中	kǒu zhōng	boca	9	1	31
又要	yào yòu	ainda precisa	21	1	44
俱備	jù bèi	possuir	15	1	44
三吋	sān cùn	três polegadas	14	1	14
俱足	jù zú	completo	14	1	42
是故	shì gù	portanto	15	1	44
石	shí	pedra	16	1	\N
衰老	shuāi lǎo	envelhecimento	21	1	13
覺悟	jué wù	perceber	9	1	24
十六	shí liù	dezesseis	31	1	24
富貴	fù guì	riqueza	15	1	44
;	ponto e vírgula	;	14	1	55
大同	dà tóng	grande unidade	9	1	42
歸去	guī qù	voltar	14	1	14
列國	liè guó	países	14	1	42
榮華	róng huá	glória	15	1	22
無情	wú qíng	implacável	24	1	22
戰得勝	zhàn dé shèng	vencer	9	1	42
一國	yī guó	um país	15	1	12
重用	chóng yòng	valorizado	14	1	24
萬世	wàn shì	eterno	14	1	44
章	zhāng	capítulo	16	1	\N
釋迦	shì jiā	Shakyamuni	15	1	41
坎坷	kǎn kě	dificuldades	14	1	33
辛酸	xīn suān	amargura	14	1	11
有義	yǒu yì	justo	11	1	34
高官	gāo guān	cargo elevado	14	1	11
天地	tiān dì	mundo	35	1	14
化了	huà le	tornou	1	1	45
着	zhe	com	14	1	\N
热情	rè qínɡ	paixão	1	1	42
提昇	tíshēng	elevação	10	1	\N
謂	wèi	chamado	32	1	\N
SHIRLEY	xiāng lì léi	Shirley	3	1	14
壁虎	bì hǔ	lagarto	1	1	43
悟	wù	compreensão	84	1	\N
啦啦隊	lā lā duì	torcida	1	1	11
賈內特	Jiǎ Nèi Jùt	Janet	1	1	34
修道	xiūdào	cultivar o Dao (caminho)	11	1	\N
美麗的	měi lì de	belo	1	1	34
仔	zǎi	jovem	16	1	\N
鏘鏘	qiāng qiāng	clang clang	1	1	11
插入	chuān sè	inserir	1	1	14
本該	běn gāi	deveria	1	1	31
上週	shàng zhōu	semana passada	1	1	41
弗雷德里科	Fú lè dé lǐ kuò	Frederico	1	1	24
才不是	cái bù shì	nem	1	1	24
童話	tóng huà	conto de fadas	1	1	24
毕竟	bì jǐng	afinal	1	1	43
提出了	tí chū le	fez	1	1	21
清口	qīngkǒu	purificar a boca	10	1	\N
下三濫	xià sān làn	desavergonhado	1	1	41
跟你	gēn nǐ	com você	1	1	13
中常見	zhōng cháng jiàn	comum	1	1	12
道過	dào guò	pedido	1	1	44
同性戀	tóng xìng liàn	lésbica	3	1	24
賠	péi	perder	24	1	\N
碌	lù	com trabalho	9	1	\N
昏	hūn	escuro	10	1	\N
賣力	mài lì	trabalhar duro	1	1	44
市中心	chéng zhōng xīn	centro da cidade	1	1	21
比擬	bǐ nǐ	comparar	1	1	33
糾纏不清	jiū zān bù qīng	complicado	1	1	11
目	mù	olho	25	1	\N
廳	tīng	sala	3	1	\N
析	xī	análise	14	1	\N
印可	yìnkě	aprovação	10	1	\N
外表	wài biǎo	aparência	13	1	43
君	jūn	senhor	45	1	\N
搞懂	gǎodǒng	entender	1	1	\N
印證	yìnzhèng	confirmação	10	1	\N
胎	tāi	pneu	1	1	\N
迴	huí	retorno	13	1	\N
婦	fù	ginecologia	4	1	\N
來頭	láitou	origem	1	1	\N
更容易	róngyì	mais fácil	1	1	\N
核	hé	núcleo	1	1	\N
果子	guǒ zi	fruto	12	1	35
苟延	gǒu yán	prolongar	15	1	32
有意義	yǒu yì yì	significado	21	1	34
云	yún	diz	11	1	\N
本能	běn néng	instinto	24	1	32
無私	wú sī	desinteressado	9	1	21
生命力	shēng mìng lì	vitalidade	24	1	14
荊棘	jīng jí	espinheiro	19	1	12
葡萄	pú tao	uva	19	1	25
宿	sù	abrigo	15	1	\N
天命	tiān mìng	destino	11	1	14
不恥下問	bù hì xià wèn	não se envergonhar de perguntar aos inferiores	12	1	44
其身	qí shēn	sua vida	9	1	21
樞機	shū jī	chave	18	1	11
含含糊糊	hán hán hū hū	confuso	10	1	22
塵	chén	poeira	20	1	\N
親情	qīn qíng	parentesco	19	1	12
慎	shèn	cuidado	16	1	\N
慈悲	cí bēi	misericórdia	26	1	21
栽	zāi	plantar	32	1	\N
狹小	xiá xiǎo	pequeno	16	1	23
修行	xiū xíng	prática espiritual	34	1	12
千萬世	qiān wàn shì	milhares de vidas	16	1	14
茫茫	máng máng	vasto	27	1	22
善果	shànguǒ	bons frutos	17	1	\N
鄉	xiāng	aldeia	22	1	\N
發揚	fāyáng	promover	19	1	\N
佛	fó	Buda	42	1	\N
是有	yǒu shì	tem significado	10	1	34
吞	tūn	engolir	7	1	\N
羊	yáng	ovelha	17	1	\N
相見	xiāng jiàn	encontrar	14	1	14
藉著	jiè zhe	aproveitar	10	1	45
又一次	yòu yī cì	outra vez	14	1	41
短暫的	duǎn zàn de	breve	10	1	34
悲	bēi	compaixão	18	1	\N
紀	jì	idade	16	1	\N
際	jì	limite	12	1	\N
里程	líng chéng	jornada	16	1	22
樹	shù	árvore	15	1	\N
捨	shě	sacrificar	31	1	\N
遷	qiān	mudar	14	1	\N
眠	mián	dormir	16	1	\N
長存	cháng cún	perdurar	16	1	22
淒	qī	triste	11	1	\N
頃	qǐng	medida de área	16	1	\N
班會	bānhuì	reunião de classe	23	1	\N
轉捩	zhuǎnliè	ponto de virada	22	1	\N
顯微鏡	xiǎn wēi jìng	microscope	42	1	31
懵	měng	confuso	14	1	\N
尋訪	xún fǎng	procurar	15	1	23
削弱	shuānghuò	enfraquecer	1	1	\N
愛護	ài hù	cuidar	9	1	44
提拔	tí pú	promover	11	1	22
虛	xū	ilusório	22	1	\N
開悟	kāi wù	iluminação	15	1	14
道務	dào wù	caminho dos assuntos	9	1	44
良	liáng	bom	18	1	\N
分辨	fēn biàn	distinguish	26	1	14
那一個	nà yī gè	aquele	9	1	41
愿志	yuàn zhì	vontade	9	1	44
望遠鏡	wàng yuǎn jìng	telescópio	37	1	43
明辨	míng biàn	discernimento claro	18	1	24
恒	héng	constante	9	1	\N
好古	hǎo gǔ	apreciar o antigo	18	1	33
敏學	mǐn xué	estudar com diligência	18	1	32
正業	zhèng yè	ocupação honrada	16	1	44
兼能	jiān néng	também ser capaz	12	1	12
透視	tòu shì	ver através	15	1	44
轉世	zhuǎn shì	reencarnação	9	1	34
也不堪	yě bù kān	também não	9	1	34
永恆的	yǒng héng de	eterno	10	1	32
受傷	shòu shāng	machucado	21	1	41
旅客	lǚ tú	viajantes	9	1	32
聖業	shèng yè	obra divina	15	1	44
長遠	cháng yuǎn	longo prazo	20	1	23
縱	zòng	mesmo	17	1	\N
師	shī	mestre	237	3	\N
佛堂	fó táng	templo budista	18	1	22
光景	guāng jǐng	cena	19	1	13
逆旅	nì lǚ	jornada difícil	9	1	43
牧	mù	pastor	24	1	\N
就有	jiù yǒu	então tem	17	1	43
同見	tóng jiàn	ver juntos	14	1	24
須臾	xū yú	breve momento	24	1	12
無常	wú cháng	imprevisível	23	1	22
局限	xiànjú	limitado	23	1	\N
無花果	wú huā guǒ	figo	18	1	21
你要	nǐ yào	you want	10	1	34
牧養	mù yǎng	to pastor	19	1	43
渡化	dù huà	redimir	18	1	44
明師	míng shī	mestre iluminado	17	1	21
境	jìng	situação	20	1	\N
瞬	shùn	instante	16	1	\N
進一步	yì fù jìn	adicionalmente	15	1	44
永生者	yǒng shēng zhě	imortal	9	1	31
的生命	de shēng mìng	vida	9	1	51
反射鏡	fǎn shè jìng	reflecting mirror	45	1	34
引	yǐn	guiar	9	1	\N
之道	zuò dào	método	19	1	44
遵	zūn	seguir	15	1	\N
天上	tiān shàng	céu	10	1	14
餐	cān	refeição	23	1	\N
萬代	wàn dài	milhares de gerações	9	1	44
擁有的	yǒu de	possuir	9	1	35
虛花	xū huā	ilusão	11	1	11
付出的	fù chū de	dar	9	1	41
墜	duò	cair	9	1	\N
萬物	wàn wù	todas as coisas	10	1	44
真傳	zhēn chuán	ensinamento verdadeiro	18	1	12
得遇	dé yù	encontrar	16	1	24
指教	zhǐ jiào	instrução	18	1	34
幻景	huàn jǐng	visões ilusórias	10	1	43
思量	sī liang	think	45	1	15
看破	kàn pò	ver através	10	1	44
視透	shì tòu	ver claramente	9	1	44
自覺	zì jué	autoconsciência	11	1	42
生機	shēng jī	vitalidade	33	1	11
孤	gū	solitário	11	1	\N
程	chéng	jornada	11	1	\N
宇宙	yǔ zhòu	universo	9	1	34
確立	què lì	estabelecer	18	1	44
乃是	nǎoshì	é	38	1	\N
民	mín	pessoas	23	1	\N
豪傑	háo jié	heróis	15	1	22
關照	guān zhào	cuidar	9	1	14
橋	qiáo	ponte	10	1	\N
短短	duǎn duǎn	curto	25	1	33
明理	mínglǐ	compreensão clara	15	1	\N
除此之外	chú cǐ zhī wài	além disso	9	1	23
成全	chéngquán	completar	31	1	\N
栽種	zāi zhòng	plantar	14	1	14
陰	yīn	sombra	15	1	\N
上昇	shàng shēng	ascender	9	1	41
渡	dù	atravessar	34	1	\N
樑	liáng	viga	10	1	\N
紮	zhā	firmar	16	1	\N
開創	kāi chuàng	iniciar	10	1	14
一體	yī tǐ	um todo	10	1	13
濟	jì	Ji	24	1	\N
流轉	liú zhuǎn	transmigração	9	1	23
煙	yān	fumaça	26	1	\N
神蹟	shénjì	milagre	24	1	\N
謬	miù	errado	17	1	\N
繼	jì	continuar	10	1	\N
享	xiǎng	desfrutar	11	1	\N
錘	chui	martelo	16	1	\N
邯	hán	Handan	15	1	\N
鄲	dāo	(onomatopeia, não possui tradução direta)	15	1	\N
壽	shòu	longevidade	24	1	\N
諸	zhū	vários	9	1	\N
廣	guǎng	amplo	18	1	\N
乃	nǎi	is	41	1	\N
景	jǐng	cena	51	1	\N
闊	kuò	vasto	18	1	\N
電光	diàn guāng	relâmpago	9	1	41
心境	xīn jìng	estado de espírito	10	1	14
普渡	pǔ dù	salvar a todos	5	1	34
不為	bù wéi	não fosse	5	1	42
不恥	bù chǐ	não ficar acanhado	5	1	43
的大同	de dàtóng	ideal de	4	1	54
而後	ér hòu	depois	5	1	24
糊	hū	vago	6	1	\N
昔	xī	antigo	4	1	\N
盡心	jìn xīn	com dedicação	5	1	41
掌	zhǎng	dominar	1	1	\N
焚	fén	queimar	4	1	\N
廈	xià	edifício	16	1	\N
三餐	sāncān	refeições	2	1	\N
光明	guāngmíng	luz	3	1	\N
萬事	wàn shì	todas as coisas	7	1	44
無窮	wú qióng	infinito	18	1	22
靈修	líng xiū	espiritualidade	15	1	21
擁有了	yōngyǒu le	possuir	0	1	15
無邊際	wú biān jì	sem fim	4	1	21
穌	sū		7	1	\N
蒺藜	t ji lí	cardo	1	1	55
計較	jì jiào	calcular	5	1	44
蛾	é	mariposa	4	1	\N
Minus two	èr línghūn	-2-	4	1	42
的話語	de huà yǔ	palavras	7	1	54
的工作	de gōng zuò	trabalho	6	1	51
紅塵	hóng chén	poeira vermelha	7	1	22
徹悟	chè wù	iluminação	72	1	44
的能力	de néng lì	habilidade	9	1	52
若果	ruò guǒ	se	1	1	43
淫	yín	imoral	4	1	\N
大器量	dà qì liàng	grandeza de espírito	9	1	44
兼	jiān	e	5	1	\N
劃	huà	planejar	2	1	\N
開荒	kāi huāng	desbravar	7	1	11
假如	jiǎ rú	supor	14	1	32
昏沉	hūn chén	entorpecido	2	1	12
来了	lái le	veio	4	1	25
道親	dàoxīn	parentes próximos	11	1	\N
淒涼	qī liáng	triste	4	1	12
了一切	le yī qiè	tudo	4	1	51
石火	shí huǒ	fagulha de pedra	9	1	23
所謂	suǒ wèi	chamado	6	1	34
含糊	hán hū	confuso	4	1	21
僻	pì	remoto	6	1	\N
闢	bì	limpar	6	1	\N
渺	miǎo	vasto	24	1	\N
體現	tǐ xiàn	manifestação	16	1	34
故鄉	gù xiāng	pátria	7	1	41
邁進	mài jìn	avançar	0	1	44
出自	chū zì	vem de	16	1	14
羊群	yáng qún	rebanho de ovelhas	8	1	22
Compreender	tongji	entender	4	1	\N
憂	yōu	tristeza	6	1	\N
廣闊	guǎng kuò	amplo	0	1	34
壤	rǎng	terra	6	1	\N
是非常	shì fēi cháng	é muito	7	1	41
生老病死	shēng lǎo bìng sǐ	nascimento, envelhecimento, doença e morte	16	1	13
釘	dīng	prego	16	1	\N
立	lì	estabelecer	4	1	\N
永別	yǒng bié	despedir-se	1	1	32
基業	jī yè	fundação	1	1	14
下問	xià wèn	pedir orientações	5	1	44
器量	qì liàng	capacidade	15	1	44
Vida	shenghuo	vida	4	1	\N
精神人生	jīng shén rén shēng	vida espiritual	9	1	12
肮髒	āng zāng	sujo	0	1	11
.birth	shēng	nascimento	4	1	\N
在世	zài shì	no mundo	9	1	44
立愿	lìyuàn	estabelecer um voto	10	1	\N
的心靈	de xīn líng	mente	9	1	51
的一天	de yī tiān	um dia	1	1	51
修辦	xiū bàn	cultivar e realizar	1	1	14
邊際	biān jì	limite	0	1	14
捩	liè	ponto	0	1	\N
諸徒	zhū tú	discípulos	0	1	12
假景	jiǎ jǐng	cenário falso	0	1	33
賢	xián	virtuoso	0	1	\N
人人	rénrén	todos	5	1	\N
Forma	xingzhi	forma	4	1	\N
愿	yuàn	desejo	6	1	\N
邯鄲	Hán Dān	Handan	0	1	21
夢不	mèng bù	sonho não	0	1	44
轉境	zhuǎn jìng	mudar a situação	0	1	34
可貴	kě guì	valioso	0	1	34
吋	cun	polegada	2	1	\N
Clara	qingming	claro	4	1	\N
Plena	man	pleno	4	1	\N
靈光	líng guāng	luz divina	5	1	21
IV	IV	IV	4	1	\N
圓	yuán	completo	6	1	\N
帳幕	zhàng mù	tenda	16	1	44
的精神	de jīng shén	do espírito	9	1	51
甚麼	shén me	o que	14	1	25
「	」		14	1	\N
」	」	]	5	1	\N
鐵	tiě	ferro	35	1	\N
窮	qióng	pobre	9	1	\N
自身	zìshēn	próprio	6	1	\N
愈	yù	quanto mais	6	1	\N
臾	yú	breve	1	1	\N
轉捩點	zhuǎnlièdiǎn	ponto de virada	0	1	\N
務	wù	dever	1	1	\N
等同	děngtóng	igual	1	1	\N
death	sǐ	morte	0	1	\N
示	shì	mostrar	28	1	\N
超脫	chāoduò	libertação	1	1	\N
曾說	céng shuō	disse uma vez	0	1	21
話語	huàyǔ	palavras	0	1	\N
印記	yìnjì	marca	0	1	\N
道 (dào		caminho	0	1	\N
物質的	wù zhí de	material	1	1	42
骯髒	āng zāng	sujo	1	1	11
見不到	jiàn bù dào	não ver	1	1	44
大路	dà lù	caminho grande	1	1	44
賺得	zhuàn dé	ganhar	1	1	42
賠上	péi shàng	perder	1	1	24
濟公活佛	Jìgōng Huófó	Buda Vivo Jigong	1	1	42
師尊	shī zūn	venerável mestre	1	1	11
老大人	lǎo dà rén	ancião	1	1	34
數十年	shù shí nián	várias décadas	1	1	42
泡影	pào yǐng	bolha sombra	1	1	43
大廈	dà shà	grandes edifícios	0	1	44
夜眠	yè mián	dormir à noite	0	1	42
又 (yòu		novamente	0	1	\N
七尺	qī chǐ	sete pés	0	1	13
此世	cǐ shì	este mundo	0	1	34
合而為一	hé ér wéi yī	unir-se em um	1	1	22
捨離	shě lí	renunciar e deixar	1	1	32
觀透	guān tòu	ver através	1	1	14
遷流	qiān liú	fluxo transitório	1	1	12
困苦	kùn kǔ	sofrimento	1	1	43
得道	dé dào	obter o caminho	0	1	24
覺他	jué tā	despertar os outros	1	1	21
二行	èr xíng	duas práticas	0	1	42
莹     (yíng)	repetição	brilhante	0	1	\N
一靈	yī líng	one spirit	0	1	12
出   (chū)	repetição	sair	0	1	\N
處處	chù chù	em todos os lugares	7	1	44
靜   (jìng)	repetida	quieto	0	1	\N
人力資源部	rén lì zī yuán bù	departamento de recursos humanos	4	1	24
莹      (repetição)	yíng	brilhante	0	1	\N
郵件	yóu jiàn	correio	2	1	24
的      (neste caso, usado para formar uma pergunta)	de		0	1	\N
馬德萊娜	Mǎ Délǎinà	Madalena	2	1	32
撫慰	fǔ wèi	conforto	2	1	34
修道人	xiūdào rén	cultivador do caminho	0	1	12
很好吃	hěn hǎo chī	muito gostoso	2	1	33
家門	jiā mén	porta de casa	2	1	12
我相信	wǒ xiàng xìng	eu acredito	2	1	34
niece	nǚ sǎo	sobrinha	0	1	33
好比	hǎo bǐ	assim como	0	1	33
隨起隨滅	suí qǐ suí miè	surge e desaparece instantaneamente	0	1	23
卒	zú	soldado raso	0	1	\N
cool	kù	legal	0	1	\N
泥土	ní tǔ	lama	1	1	23
「loser」		perdedor	0	1	\N
烏龜	wū guī	tartaruga	1	1	11
爛泥土	làn ní tǔ	lama podre	1	1	42
維維	wéi wéi	Wei Wei	1	1	22
良田	liáng tián	boas terras	0	1	22
萬頃	wàn qǐng	dez mil hectares	0	1	43
瞬息之內	shùn xī zhī nèi	num instante	0	1	41
皆休	jiē xiū	terminam	0	1	11
縱有	zòng yǒu	mesmo tendo	0	1	43
仇	chóu	inimigo	0	1	\N
敵	dí	inimigo	0	1	\N
染	rǎn	tingir	0	1	\N
難買	nán mǎi	difícil comprar	0	1	23
侄	zhí	sobrinho	0	1	\N
萬民	wàn mín	todas as pessoas	1	1	42
名利	míng lì	fama e riqueza	1	1	24
的     (de)	neste caso, usado para formar uma pergunta		0	1	55
坦誠相待	tǎn chéng xiāng dài	tratar com sinceridade mútua	2	1	32
搬遷	bān qiān	mover	0	1	11
敬畏	jìng wèi	reverência	0	1	44
體育場	tǐ yù chǎng	estádio	2	1	34
ROXELLE	ROXELLE	ROXELLE	4	1	\N
弗魯米嫩塞	FÚ LÚ MÌ NÈ NÈ SAI	Fluminense	2	1	22
歸來	guī lái	voltar	0	1	12
格里高利	gélǐ gāolì	Gregory	2	1	21
桑廷巴洛克風格	Sāng tíng bǎi luò kè fēng gé	estilo barroco de Sant'Ana	2	1	12
幸災樂禍	xìng zāi lè huò	regozijar-se com a desgraça	2	1	41
讓我	ràng wǒ	me faz	5	1	43
過客	guò kè	passageiro	0	1	44
滾滾	gǔn gǔn	rolando	0	1	33
另一個人	líng yī gè rén	outra pessoa	0	1	21
鼓掌	gǔ zhǎng	aplaudir	0	1	33
老板	lǎo bǎn	chefe	1	1	33
懺悔	chuàng huǐ	arrepender	0	1	43
紫色	zǐ sè	roxo	0	1	34
家務	jiā wù	tarefa doméstica	0	1	14
小心點	xiǎo xīn diǎn	cuidado	0	1	31
说服	shuō fú	convencer	0	1	12
老二	lǎo èr	irmão mais novo	0	1	34
請便	qǐng biàn	à vontade	0	1	34
結城	jié chéng	unir cidade	0	1	22
遺跡	yí jì	vestígio	0	1	24
有事	yǒu shì	ter algo	0	1	34
對我	duì wǒ	comigo	2	1	43
不希望	bù xī wàng	não desejar	2	1	41
霞	xiá	névoa	4	1	\N
reveals	reveals	revela	0	1	\N
頸	jǐng	pescoço	0	1	\N
熟悉的	fú xí de	familiar	0	1	22
揭示	rèn shì	revelar	0	1	44
浮雕	fúdiāo	baixo-relevo	0	1	\N
樣式	yàng shì	estilo	0	1	44
個人化	gèrénhuà	personalizado	0	1	\N
模型	mó xíng	modelo	0	1	22
字體	zì tǐ	fonte	0	1	43
雯	wén	névoa	1	1	\N
日誌	rì zhì	log	0	1	44
意義	yì yì	significado	86	1	44
賓	bīn	hóspede	0	1	\N
死死地	sǐsǐde	firmemente	0	1	\N
磨	mó	esfregar	0	1	\N
和其他	hé qǐ tā	e	0	1	23
紹	shào	apresentar	0	1	\N
策	cè	estratégia	0	1	\N
插圖	chā tú	ilustração	0	1	12
羅克爾	Luò kē ěr	Rokel	5	1	41
lyrics	lì jǔ	letra	0	1	43
司	sī	empresa	2	1	\N
金色	jīn sè	dourado	0	1	14
套用	tào yòng	aplicação	0	1	44
搬到	bǎo dào	mudar para	0	1	34
Cambucá村	Cànbùcā cūn	Cambucá aldeia	0	1	41
的位置	de wèi zhǐ	localização	0	1	54
否決	fǒu jué	rejeitado	0	1	32
茶會	chá huì	reunião de chá	7	1	24
惡作劇	è zuò jù	travessura	0	1	44
下馬威	xià mǎ wēi	choque	0	1	43
西米	xī mǐ	sorgo	0	1	13
巴斯提安	Bā sī tàniān	Sebastian	0	1	11
名义	míng yì	nome	0	1	24
100%	yībǎi zhāo	100%	0	1	11
塑造	shù zào	moldar	0	1	44
身形	xíng shēn	forma física	0	1	21
會計	huì jì	contabilidade	1	1	44
開除	kāi chú	demitir	15	1	12
嘉嘉	jiā jiā	Jiā Jiā	1	1	11
牆角	qiáng jiǎo	canto da parede	1	1	23
倘若	tǎng ruò	se	0	1	34
小姐	xiǎo jiě	senhorita	52	2	33
給予	jǐ yǔ	dar	16	1	33
唐	táng	Tang	5	1	\N
秘	mì	secreto	0	1	\N
密	mì	segredo	0	1	\N
厚顏	hòu yán	sem-vergonha	0	1	42
無恥	wú chǐ	desavergonhada	0	1	23
遊	yóu	passear	0	1	\N
哨子	shào zi	apito	0	1	45
Jorge	Jorge	Jorge	2	1	\N
matte	matte	matte	0	1	\N
重要的	zhòng yào de	importante	3	1	44
巧	qiǎo	coincidência	0	1	\N
alias	ˈeɪlɪəs	apelido	0	1	\N
音調	yīn diào	tom	0	1	14
謨	mó	conselho	0	1	\N
印刷廠	yìn xiàng chǎng	gráfica	0	1	44
錢款	qián kuǎn	pagamento	0	1	23
JAYME	JIE1 MEI1	Jayme	5	1	55
roxelle...		roxelle...	0	1	\N
sebastian	sebastian	sebastian	0	1	\N
vibes	vibes	vibrações	0	1	\N
瑭	táng	jades	0	1	\N
的新	de xīn	da nova	2	1	51
晚了	wǎn le	tarde	0	1	35
砸	zá	fracasso	3	1	\N
康	kāng	bem-estar	0	1	\N
tones	tīng	tons	0	1	\N
高興的	gāo xìng de	feliz	0	1	14
absolveu	bō suō luò	absolveu	0	1	11
打開了	dǎ kāi le	abriu	0	1	31
開關	kāi guān	interruptor	0	1	11
般配	bān pèi	compatíveis	0	1	14
賽巴斯頓	Sài Bǎsītùn	Sebastian	0	1	43
另一件事	óu yī jiàn shì	outra coisa	0	1	21
邀請函	yāo qǐng hàn	convite	3	1	13
复原	fù yuán	recuperar	0	1	42
保守	bǎo shou	conservador	1	1	35
遺憾地	yí hàn de	infelizmente	0	1	24
佔有	zhàn yǒu	ocupar	0	1	43
相比	bǐ jiào	comparado	0	1	34
巧合	xiǎo hé	coincidência	0	1	32
銀色	yín sè	prateado	2	1	24
悠	yōu	calmo	3	1	\N
我家	wǒ jiā	minha casa	2	1	31
並不	bìng bù	não	12	1	44
超越	chāo yuè	superar	17	1	14
糾正	jiū zhèng	corrigir	3	1	14
彷彿	fǎng fú	como se	20	1	32
羅德里戈	luó dé lǐ gē	Rodrigo	8	1	22
罪過	zuì guò	pecados	4	1	44
辦	bàn	lidar	120	1	\N
毫無	háo wú	completamente sem	31	1	22
羅克斯	luó kuò sī	Rocks	4	1	24
豈	qǐ	como	3	1	\N
barber刀	bànrú dāo	tesoura de barbeiro	0	1	41
exaggerar	exaggerar	exagerar	0	1	\N
姪	zhí	sobrinho	0	1	\N
勤快	qín kuài	diligente	0	1	24
破爛	pòlàn	bagunça	0	1	\N
復活	fù huó	ressurreição	0	1	42
与	yǔ	com	0	1	\N
AH...		AH...	0	1	\N
琪	qí	jade	0	1	\N
玉	yù	jade	0	1	\N
蟲	chóng	inseto	0	1	\N
鄭	Zhèng	Zheng	0	1	\N
偶	ǒu	ocasional	0	1	\N
航	háng	navegação	0	1	\N
殘	cán	deficiente	0	1	\N
障	zhàng	deficiência	0	1	\N
鴻	hóng	grande	0	1	\N
溝	gōu	lacuna	0	1	\N
踐	jiàn	prática	1	1	\N
舒斯特	Shū sù tè	Schuster	0	1	14
奧斯卡	ào sù kǎ	Oscar	0	1	44
學位	xuéwèi	grau acadêmico	0	1	\N
不應該	bù yīng gāi	não deve	0	1	41
就知道	jiù zhī dào	já sabemos	0	1	41
神圣	shèng hóng	sagrado	0	1	42
无关	wú guān	não relacionado	0	1	21
绝	jué	absoluto	0	1	\N
hypocrites	hipócritas	hipócritas	0	1	\N
跳出	tiào chū	pular para fora	0	1	41
奇基	qí jī	GIGI	0	1	21
收到了	shòu dào le	recebeu	0	1	44
鼻	bí	nariz	0	1	\N
驕	jiāo	orgulho	0	1	\N
發來	fā lái	enviou	0	1	12
apartments	apartments	apartamentos	0	1	\N
Arraial	Àrrǎijiāl	Arraial	0	1	\N
do	duō	de	0	1	\N
Cabos	Cābō	Cabo	0	1	\N
島	dǎo	ilha	0	1	\N
vilacambucá	vila cam bu ca	vilacambucá	1	1	55
阿娜·露西亞	Ānà Lùxīyà	Ana Luzia	0	1	14
山姆	Shānmǔ	Samuel	0	1	\N
並將	bìng jiāng	também	0	1	41
一類	yī lèi	tipo	0	1	14
惑	huò	perplexidade	0	1	\N
土味	tǔ wèi	sabor local	0	1	34
愛麗絲	Àilìsī	Alice	0	1	\N
寓	yù	apartamento	0	1	\N
飽	bǎo	cheio	0	1	\N
嘉  (repetida)	jiā	apenas aparece duas vezes na frase	0	1	\N
類別	lèi bié	categoria	0	1	42
徒勞	tú láo	em vão	0	1	22
yes	是的, shì de	sim	0	1	54
有助手	yǒu zhù shǒu	tem assistente	0	1	34
Marco		Marco	0	1	\N
16%	shí liù shí	16%	0	1	24
15%	shí wǔ zhāo	15%	0	1	23
衰	shuāi	declínio	0	1	\N
冬	Dōng	inverno	2	1	\N
20%	èr shí zhōng	20%	0	1	42
賤人	jiàn rén	pessoa desprezível	2	1	42
出    (repetição)	chū	sair	0	1	\N
靜    (repetida)	jìng	quieto	0	1	\N
YTS.MX	YTS.MX	YTS.MX	0	1	\N
YIFY	YIFY	YIFY	0	1	\N
YTS	YTS	YTS	0	1	\N
MX	MX	MX	0	1	\N
以下是	zhè shì shì	aqui estão	1	1	44
肚臍眼	dù jǐ yǎn	umbigo	0	1	43
只需要	zhǐ yào	apenas precisamos	0	1	34
險	xiǎn	risco	2	1	\N
節省	jié shěng	economizar	0	1	23
小東西	xiǎo dōngxī	pequeno objeto	0	1	31
椰子水	yē zǐ shuǐ	água de coco	0	1	13
一只	yī zhī	uma	0	1	11
小海龜	xiǎo hǎi guī	pequeno tartaruga	0	1	33
海裡	hǎi lǐ	no mar	0	1	33
小LUQUINHAS	xiǎo LUQUINHAS	pequenas LUQUINHAS	0	1	35
維拉·坎布卡	wēi lā kǎn bù kǎ	Vera Cumbica	0	1	11
田園	tián yuán	campestre	0	1	22
質樸	zhì pǔ	simples	0	1	43
上下文	shàng xià wén	contexto	1	1	44
巴斯蒂安	bà sì dān	Sebastian	0	1	44
幸樹	xìng shù	Kōkaku	0	1	44
艾米莉亞	ài mǐ lì yà	Emília	0	1	43
揭露出	jiē lu chū	revelar	0	1	15
人的	rén de	de pessoas	1	1	25
徵收	zhēng shōu	cobrar	0	1	11
那一刻	nà yī gè kè	aquele momento	0	1	41
矮人	ǎi rén	dwarf	0	1	32
好課	hǎo kè	boa aula	0	1	34
潛意識	qiǎn yì shì	subconsciente	3	1	34
整個人	zhěng gè rén	toda a pessoa	5	1	34
早洩	zǎo xiè	ejaculação precoce	3	1	34
艾爾頓	Ài ěr dūn	Elton	5	1	43
25、26歲	èr shí wǔ、èr shí liù suì	25, 26 anos	2	1	42
網站	wǎng zhàn	site	0	1	34
蕾	lěi	(não tem tradução direta, parte do nome)	7	1	\N
姐	jiě	irmã	2	1	\N
零用	líng yòng	mesada	2	1	24
適	shì	adequado	1	1	\N
Alberto	Alberto	Alberto	1	1	\N
括	kuò	incluir	2	1	\N
GERSON		Gerson	2	1	\N
菲斯克	fēi sī kè	Fisk	0	1	11
高跟鞋	gāo gēn xié	salto alto	0	1	11
草叢	cǎo cóng	grama	0	1	32
安詳	ān xiáng	serenamente	0	1	12
⋯⋯	⋯⋯	...	0	1	\N
? (?		?)	0	1	\N
第五	dì wǔ	quinto	0	1	43
西德	xī dé	Alemanha Ocidental	1	1	12
鮮花	xiān huā	flores frescas	0	1	11
絕食	jué shí	greve de fome	0	1	22
嚓	cā	estalo	7	1	\N
嘣	bēng	estrondo	5	1	\N
法蘭克	fǎ lán kè	Frank	0	1	32
映	yìng	refletir	0	1	\N
衛生局長	wèi shēng jú zhǎng	diretor do departamento de saúde	0	1	41
香菸	xiāng yān	cigarro	5	1	11
鴨子	yā zi	pato	1	1	15
哈哈哈	hā hā hā	hahaha	3	1	11
給你的	gěi nǐ de	te dão	0	1	33
貝利	bèi lì	Bailey	0	1	44
不在了	bù zài le	não estar mais aqui/faleceu	0	1	44
計時器	jì shí qì	temporizador	0	1	42
吸鐵石	xī tiě shí	ímã	0	1	13
瓊斯	Qióng sī	Jones	0	1	21
那首	nà shǒu	aquela	0	1	43
一點也不	yì diǎn yě bù	nem um pouco	1	1	43
小曲	xiǎo qǔ	cantiga	0	1	33
捉迷藏	zhuō mí cáng	esconde-esconde	0	1	12
茉莉	mò lì	jasmim	15	1	44
嗅	xiù	cheirar	1	1	\N
廚藝	chú yì	habilidades culinárias	0	1	24
檸檬糖	níng méng táng	bala de limão	0	1	22
初學者	chū xué zhě	iniciante	0	1	12
珍妮	Zhēn nī	Jenny	10	1	11
IS-IS	IS-IS	IS-IS	0	1	\N
面試	miàn shì	entrevista	0	1	44
煙囪	yān cōng	chaminé	0	1	11
就在那裡	jiù zài nà lǐ	exatamente ali	0	1	44
博洛尼亞香腸	bó luò ní yà xiāng cháng	salsicha de Bolonha	0	1	24
核桃	hé táo	noz	0	1	22
鬆餅	sōng bǐng	muffin	0	1	13
威爾瑪	wēi ěr mǎ	Wilma	0	1	13
親切感	qīn qiè gǎn	sensação de carinho	0	1	14
波隆那	bō lóng nà	Bolonha	0	1	12
幾副	jǐ fù	alguns pares	0	1	34
薯條	shǔ tiáo	batata frita	0	1	32
矮胖	ǎi pàng	baixo e gordo	1	1	34
強森	qiáng sēn	Johnson	0	1	21
嗖嗖聲	sōu sōu shēng	silvo, assobio, zunido	0	1	11
誕	dàn	nascer	2	1	\N
辜	gū	culpa	2	1	\N
哦吼	ò hǒu	oh uau	0	1	43
強調	qiáng diào	enfatizar	0	1	24
參賽者	cān sài zhě	participantes	0	1	14
叮叮	dīng dīng	tinindo	0	1	11
遣散費	qiǎn sǎn fèi	indenização demissional	0	1	33
班次	bān cì	horários	0	1	14
霍普金斯	huò pǔ jīn sī	Hopkins	0	1	43
酪梨	luò lí	abacate	0	1	42
總統	zǒng tǒng	presidente	1	1	33
在座	zài zuò	presente	0	1	44
每一個	měi yī gè	cada um	0	1	31
促成	cù chéng	promover	0	1	42
噗噗	pū pū	onomatopeia (som)	0	1	11
露薏絲	Lù yì sī	Luísa	1	1	44
俯視	fǔ shì	olhando para baixo	0	1	34
響了	xiǎng le	tocou	0	1	35
艾森豪威爾	Ài Sēn Háo Wēi Ěr	Eisenhower	0	1	41
委內瑞拉	wěi nèi ruì lā	Venezuela	0	1	34
阿根廷	ā gēn tíng	Argentina	0	1	11
莫莉	Mò lì	Molly	60	1	44
僅供	jǐn gōng	apenas para	0	1	31
泡泡糖	pào pào táng	chiclete (bolha)	0	1	44
推薦信	tuī jiàn xìn	carta de recomendação	1	1	14
辛格	Xīn gé	Singer	22	1	12
重要性	zhòng yào xìng	importância	2	1	44
炸薯塊	zhà shǔ kuài	batata frita	0	1	43
戴維斯	Dài wéi sī	Davis	2	1	42
帽子	mào zi	chapéu	1	1	45
嘎吱	gā zī	rangido	0	1	11
七歲	qī suì	sete anos de idade	0	1	14
思維方式	sī wéi fāng shì	forma de pensar	0	1	12
星期日	xīng qī rì	domingo	0	1	11
新歡	xīn huān	novo amor	0	1	11
啜飲	chuò yǐn	sorver	0	1	43
你的笑容	nǐ de xiào róng	seu sorriso	0	1	35
EVE	EVE	EVE	0	1	\N
莫林	mò lín	Mo Lin	1	1	42
安妮	Ān nī	Annie	1	1	11
辣	là	picante	1	1	\N
老傢伙	lǎo jiā huo	velhaco	0	1	31
割傷	gē shāng	corte	0	1	11
走調	zǒu diào	desafinado	0	1	34
輕快	qīng kuài	leve e rápido	0	1	14
餐館	cān guǎn	restaurante	1	1	13
SID	SID	SID	1	1	\N
燉	dùn	cozinhar em fogo brando	0	1	\N
夢境	mèng jìng	sonho	0	1	44
回饋	huí kuì	feedback	0	1	24
薪資	xīn zī	salário	4	1	11
周身	zhōu shēn	todo o corpo	0	1	11
後座	hòu zuò	banco traseiro	0	1	44
摸摸	mō mō	acariciar	0	1	11
薯	shǔ	batata	0	1	\N
鋪滿	pū mǎn	coberto de	0	1	13
帶出	dài chū	trazer à tona	0	1	41
五步格	wǔ bù gé	pentâmetro	1	1	34
沙槌	shā chuí	chocalho	0	1	12
咚	dōng	batida	3	1	\N
莫兒	mò ér	Mo'er (nome próprio)	1	1	42
柯瑞娜	kē ruì nà	Corena	14	1	14
雪兒	xuě ér	Sher	1	1	32
席德	Xí dé	Sid	2	1	22
桃瑞絲	Táo ruì sī	Doris	0	1	24
旋律	xuán lǜ	melodia	2	1	24
曼尼	màn ní	Manny	23	1	42
剛剛好	gāng gāng hǎo	perfeito	0	1	11
餡餅	xiàn bǐng	torta	0	1	43
杏子	xìng zi	damasco	0	1	45
邦特	bāng tè	bundt	0	1	14
桌布	zhuō bù	toalha de mesa	0	1	14
縈繞	yíng rào	pairar	5	1	24
莫琳奇卡	mò lín qí kǎ	Morin Chica	0	1	42
配套	pèi tào	conjunto/combinando	0	1	44
搖籃曲	yáo lán qǔ	canção de ninar	1	1	22
瘀傷	yū shāng	contusão	0	1	11
碘酒	diǎn jiǔ	tintura de iodo	0	1	33
軍旅	jūn lǚ	militar	0	1	13
好想	hǎo xiǎng	muito querer	0	1	33
笑臉	xiào liǎn	rosto sorridente	0	1	43
小羊排	xiǎo yáng pái	costeleta de cordeiro	0	1	32
薩斯伯里牛排	sà sī bó lǐ niú pái	bife à Salisbury	0	1	41
小牛肉	xiǎo niú ròu	vitela	0	1	32
帕瑪森	pà mǎ sēn	parmesão	0	1	43
不盡	bù jìn	sem fim	0	1	44
這句話	zhè jù huà	esta frase	0	1	44
吃過	chī guò	comido	1	1	14
研讀	yán dú	estudo	0	1	22
水上	shuǐ shàng	sobre a água	0	1	34
蘇菲亞·羅蘭	sū fēi yà · luó lán	Sophia Loren	0	1	11
喪偶	sàng ǒu	viúvo	0	1	43
卡萊·葛倫	kǎ lái · gé lún	Cary Grant	0	1	32
無私地	wú sī de	desinteressadamente	0	1	21
至親	zhì qīn	parente muito próximo	0	1	41
至愛	zhì ài	muito amado	0	1	44
維尼	wéi ní	Ursinho Pooh	0	1	22
日語	rì yǔ	língua japonesa	0	1	43
歸家	guī jiā	voltar para casa	0	1	11
飄來	piāo lái	flutuando/vindo flutuando	0	1	12
活像	huó xiàng	exatamente como	0	1	24
瓊西	Qióng xī	panquecas famosas de Johnny	0	1	21
煎餅	jiān bǐng	panqueca	0	1	13
砂鍋	shā guō	panela de barro	0	1	11
躲貓貓	duǒ māo māo	esconde-esconde	0	1	31
科琳娜	kē lín nà	Carolina	4	1	12
多了	duō le	muito mais	0	1	15
履歷	lǚ lì	currículo	0	1	34
戈登	gē dēng	Gordon	0	1	11
叭叭	bā bā	buzina	0	1	11
筆跡	bǐ jì	caligrafia	0	1	34
梳妝台	shū zhuāng tái	penteadeira	0	1	11
老手	lǎo shǒu	veterano, experiente	0	1	33
輕彈	qīng tán	dedilhar	0	1	12
剎車	shā chē	freio	0	1	11
沉默寡言	chén mò guǎ yán	silencioso e reservado	0	1	24
嘻哈	xī hā	hip-hop	0	1	11
泰瑞	tài ruì	Terry	0	1	44
威瑪	wēi mǎ	Weimar	0	1	13
何不	hé bù	por que não	1	1	24
側面	cè miàn	lateral/lado	0	1	44
薯球	shǔ qiú	bolinho de batata	1	1	32
輕量級	qīng liàng jí	leve	0	1	14
入門	rù mén	iniciante	0	1	42
搭配	dā pèi	combinar	0	1	14
乾酪	gān lào	queijo seco	0	1	14
水煮蛋	shuǐ zhǔ dàn	ovo cozido	0	1	33
擦擦	cā cā	limpe	0	1	11
太陽眼鏡	tài yáng yǎn jìng	óculos de sol	2	1	42
風味	fēng wèi	sabor	0	1	14
稍有	shāo yǒu	ligeiramente	0	1	13
偏差	piān chā	desvio	0	1	11
凹凸不平	āo tū bù píng	irregular/áspero	0	1	11
笨重	bèn zhòng	pesado/desajeitado	0	1	44
靈犀	líng xī	sintonia	0	1	21
抑揚	yì yáng	iâmbico	1	1	42
哦呼	ò hū	oh puxa	0	1	41
哈利	hā lì	Harry	2	1	14
強人所難	qiǎng rén suǒ nán	forçar alguém a fazer algo difícil	0	1	32
空軍	kōng jūn	força aérea	0	1	11
喪生	sàng shēng	perder a vida	0	1	41
10	shí	dez	0	1	\N
拿好	ná hǎo	segurar firmemente	0	1	23
洛伊絲	Luò yī sī	Lois	0	1	41
手下留情	shǒu xià liú qíng	ter misericórdia	0	1	34
篇	piān	artigo (classificador)	0	1	\N
無神論者	wú shén lùn zhě	ateia	0	1	22
全麥	quán mài	integral	0	1	24
增	zēng	aumentar	0	1	\N
脫口秀	tuō kǒu xiù	talk show	0	1	13
有關聯	yǒu guān lián	estar associado	0	1	31
查理	chá lǐ	Charlie	1	1	23
？ (?		?	0	1	\N
天空	tiān kōng	céu	3	1	11
數據	shù jù	dados	1	1	44
吸菸者	xī yān zhě	fumante	0	1	11
肺癌	fèi ái	câncer de pulmão	1	1	42
南美	nán měi	América do Sul	0	1	23
實地	shí dì	local	0	1	24
考察	kǎo chá	investigação	0	1	32
副總統	fù zǒng tǒng	vice-presidente	0	1	43
特倫頓	tè lún dùn	Trenton	0	1	42
樂句	yuè jù	frase musical	0	1	44
31	sān shí yī	trinta e um	0	1	12
輕舉妄動	qīng jǔ wàng dòng	agir precipitadamente	0	1	13
薄荷	bò he	hortelã-pimenta	0	1	45
冰鎮	bīng zhèn	gelado	0	1	14
火焰	huǒ yàn	chamas	0	1	34
繽紛	bīn fēn	vibrante	0	1	11
補救	bǔ jiù	remediar	1	1	34
摩爾	mó ěr	mole	2	1	23
豬腳	zhū jiǎo	pé de porco	0	1	13
再說	zài shuō	falar de novo	0	1	41
沉穩	chén wěn	calmo	0	1	23
自若	zì ruò	tranquilo	0	1	44
薯頭先生	shǔ tóu xiān shēng	Sr. Cabeça de Batata	0	1	32
長子	zhǎng zǐ	filho mais velho	0	1	33
哈哈哈哈哈	hā hā hā hā hā	hahahaha	1	1	11
中風	zhòng fēng	derrame cerebral	0	1	41
藍色的	lán sè de	azul	0	1	24
悲劇	bēi jù	tragédia	2	1	14
已然	yǐ rán	já	0	1	32
午睡	wǔ shuì	soneca	0	1	34
釀成	niàng chéng	acontecido	0	1	42
吵鬧	chǎo nào	fazer barulho	0	1	34
產假	chǎn jià	licença-maternidade	0	1	34
空無	kōng wú	vazio	0	1	12
一物	yī wù	uma coisa	0	1	14
四月	sì yuè	abril	0	1	44
伏爾泰	fú ěr tài	Voltaire	0	1	23
玩伴	wán bàn	companhia para brincar	0	1	24
手提箱	shǒu tí xiāng	mala	0	1	32
彩虹	cǎi hóng	arco-íris	3	1	32
爹地	diē dì	papai	0	1	14
之旅	zhī lǚ	viagem	1	1	13
櫻桃	yīng táo	cereja	2	1	12
香草	xiāng cǎo	baunilha	1	1	13
卡拉馬祖	kǎ lā mǎ zǔ	Kalamazoo	1	1	31
露易絲	lù yì sī	Luís	4	1	44
珀西	pò xī	Percy	10	1	41
達成	dá chéng	alcançar	6	1	22
失望	shī wàng	decepcionar	13	1	14
接受了	jiē shòu le	aceitou	3	1	14
億	yì	cem milhões	1	1	\N
弄成了	nòng chéng le	foi feito	0	1	42
嚐過	cháng guò	provei	0	1	24
格特魯德·斯坦	gé tè lǔ dé · sī tān	Gertrude Stein	0	1	24
娘娘腔	niáng niang qiāng	afeminado	0	1	25
險勝	xiǎn shèng	vencer por pouco	0	1	34
非常 (fēi cháng		extremamente	0	1	\N
揮手	huī shǒu	acenando	0	1	13
馬拉穆特犬	mǎ lā mù tè quǎn	cão malamute	0	1	31
艾德	ài dé	Ed	0	1	42
專輯	zhuān jí	álbum	5	1	12
沿	yán	ao longo	0	1	\N
盒	hé	caixa	0	1	\N
菸	yān	cigarro	3	1	\N
揍	zòu	bater	0	1	\N
拳	quán	soco	0	1	\N
小丘	xiǎo qiū	pequenas colinas	0	1	31
強項	qiáng xiàng	ponto forte	0	1	24
背面	bèi miàn	verso	0	1	44
共話	gòng huà	conversar juntos	0	1	44
蠟質	là zhì	ceroso	0	1	44
詩歌	shī gē	poesia	0	1	11
5	wǔ	cinco	0	1	\N
裁判	cái pàn	juiz	0	1	24
2-2	èr èr	dois dois	0	1	44
時辰	shí chén	hora certa/momento	0	1	22
小費	xiǎo fèi	gorjeta	0	1	34
埃里克·薩蒂	āi lǐ kè·sà dì	Erik Satie	0	1	13
愛德華	ài dé huá	Edward	3	1	42
柯琳娜	kē lín nà	Corina	17	1	12
咳咳	ké ké	tosse	1	1	22
波西	bō xī	Percy	1	1	11
作曲家	zuò qǔ jiā	compositor	0	1	43
笨手笨腳	bèn shǒu bèn jiǎo	desajeitado	0	1	43
敢於	gǎn yú	ousar	0	1	32
許願	xǔ yuàn	fazer um desejo	0	1	34
許願星	xǔ yuàn xīng	estrela dos desejos	0	1	34
醒來時	xǐng lái shí	ao acordar	0	1	32
雲朵	yún duǒ	nuvens	0	1	23
遠在	yuǎn zài	longe em	0	1	34
天邊	tiān biān	beira do céu	0	1	11
人兒	rén ér	pessoa (carinhoso)	0	1	22
蜂鳴器	fēng míng qì	campainha	0	1	12
火雞	huǒ jī	peru	1	1	31
酪梨醬	luò lí jiàng	guacamole	0	1	42
嘗過	cháng guò	experimentou	0	1	24
巴巴魯	bā bā lǔ	Babaru	0	1	11
嚕 嚕 嚕	lū lū lū	ruído onomatopeico (cantarolando/tarareando)	0	1	11
中場	zhōng chǎng	intervalo	0	1	13
嘶嘶聲	sī sī shēng	sibilo	1	1	11
格特魯德	gé tè lǔ dé	Gertrude	0	1	24
搭車	dā chē	pegar carro	0	1	11
坦白說	tǎn bái shuō	francamente	0	1	32
並不太	bìng bù tài	não muito	0	1	44
Tater Tots	Tater Tots	Tater Tots	0	1	55
薯頭	shǔ tóu	Sr. Cabeça de Batata	3	1	32
法語	fǎ yǔ	língua francesa	0	1	33
霍華德	huò huá dé	Howard	3	1	42
照過	zhào guò	ter olhado/ter refletido	0	1	44
抬頭	tái tóu	levantar a cabeça	0	1	22
挺胸	tǐng xiōng	estufar o peito	0	1	31
華納	huá nà	Warner	0	1	24
霸佔	bà zhàn	monopolizar	0	1	44
侍女	shì nǚ	serva	0	1	43
呆頭鵝	dāi tóu é	pateta; bobo	0	1	12
蠟筆	là bǐ	lápis de cera	1	1	43
蘇利文	sū lì wén	Sullivan	0	1	14
競選	jìng xuǎn	concorrer a	0	1	43
有助於	yǒu zhù yú	contribuir para	0	1	34
俄羅斯	é luó sī	Rússia	0	1	22
雜技	zá jì	acrobacia	0	1	24
收銀機	shōu yín jī	caixa registradora	0	1	12
大象	dà xiàng	elefantes	0	1	44
停在	tíng zài	parados	0	1	24
白膠	bái jiāo	cola branca	0	1	21
咯咯笑	gē gē xiào	risada gargalhada	1	1	11
拼死拼活	pīn sǐ pīn huó	lutar desesperadamente	0	1	13
山上	shān shàng	montanha	0	1	14
都沒	dōu méi	não	0	1	12
埃文斯	āi wén sī	Evans	0	1	12
清澈	qīng chè	claro	0	1	14
寫的	xiě de	escreveu	0	1	35
內頁	nèi yè	contracapa	2	1	44
專欄	zhuān lán	coluna	0	1	12
高帽	gāo mào	cartola	0	1	14
刊登	kān dēng	publicar	1	1	11
油氈	yóu zhān	oleado	0	1	21
清除	qīng chú	limpar	1	1	12
堆積	duī jī	acumular	0	1	11
首歌	shǒu gē	canção	0	1	31
答對	dá duì	responder corretamente	0	1	24
平手	píng shǒu	empate	1	1	23
號笛	hào dí	apito	1	1	42
聽好了	tīng hǎo le	ouça bem	0	1	13
水手	shuǐ shǒu	marinheiro	3	1	33
潔維娜	Jié wéi nà	Jevina	0	1	22
一份子	yī fèn zǐ	membro	0	1	14
報酬	bào chou	remuneração	0	1	45
贈送	zèng sòng	presentear	0	1	44
蘇菲亞	sū fēi yà	Sofia	0	1	11
輕微	qīng wēi	leve	0	1	11
基本上	jī běn shàng	basicamente	1	1	13
傘	sǎn	guarda-chuva	0	1	\N
飛過	fēi guò	voou por	0	1	14
發燒	fā shāo	febre	0	1	11
配不上	pèi bù shàng	não está à altura	1	1	44
說好了	shuō hǎo le	combinamos	0	1	13
HOOTERS	HOOTERS	HOOTERS	0	1	\N
羅傑斯太太	luó jié sī tài tai	Sra. Rogers	0	1	22
埃絲特·威廉斯	āi sī tè wēi lián sī	Esther Williams	0	1	11
務必	wù bì	indispensável	0	1	44
顛倒	diān dǎo	invertido	0	1	13
伍丁	wǔ dīng	Wuding (nome próprio)	0	1	31
白佬	bái lǎo	branco (termo pejorativo)	0	1	23
圖丁	tú dīng	Tooting (nome próprio)	0	1	21
叭	bā	bip	1	1	\N
同仁	tóng rén	colega	0	1	22
犰狳	qiú yú	tatu	1	1	22
果凍	guǒ dòng	gelatina	2	1	34
波霸	bō bà	tapioca com bolhas de pérola	0	1	14
叭-咚	bā-dōng	barulho de tambor	0	1	\N
夜色	yè sè	cenário noturno	0	1	44
平局	píngjū	empate	1	1	\N
驢子	lǘ zi	burro	1	1	25
希米	xī mǐ	Ximi	0	1	13
阿姆斯特朗	Ā mǔ sī tè lǎng	Armstrong	0	1	13
馬卡龍	mǎ kǎ lóng	macaron	0	1	33
付出	fù chū	pagar	18	1	41
代價	dài jià	custo	13	1	44
簿	bù	lista/caderno	1	1	\N
洋芋片	yáng yù piàn	batata chips	0	1	24
荒	huāng	absurdo	37	1	\N
雇用	gù yòng	empregar	4	1	44
態度	tài dù	atitude	42	1	44
凌	líng	pairar	0	1	\N
駕	jià	conduzir	0	1	\N
聖代	shèng dài	sundae	0	1	44
詮釋	quán shì	interpretar	0	1	24
幽默感	yōu mò gǎn	senso de humor	1	1	14
即食	jí shí	instantâneo	0	1	22
銀色的	yín sè de	prateado	0	1	24
低唱	dī chàng	cantar baixo	0	1	14
六月	liù yuè	junho	0	1	44
勁兒	jìn er	força	0	1	45
呼拉圈	hū lā quān	bambolê	2	1	11
壽星	shòu xīng	aniversariante	0	1	41
隨心所欲	suí xīn suǒ yù	como quiser	0	1	21
享用	xiǎng yòng	desfrutar	1	1	34
拼字	pīn zì	soletração	1	1	14
拼寫	pīn xiě	soletrar	0	1	13
冰桶	bīng tǒng	balde de gelo	0	1	13
輕聲	qīng shēng	voz suave	1	1	11
連衣裙	lián yī qún	vestido	0	1	21
變裝	biàn zhuāng	transformação/vestir-se de forma diferente	0	1	41
鑽戒	zuàn jiè	anel de diamante	0	1	44
聞起來	wén qǐ lái	cheira	0	1	23
完人	wán rén	pessoa perfeita	0	1	22
路易斯·阿姆斯特朗	Lù yì sī · ā mǔ sī tè lǎng	Louis Armstrong	0	1	44
不散	bù sàn	não dissipar	1	1	44
揮之不去	huī zhī bù qù	inesquecível	1	1	11
副歌	fù gē	refrão	1	1	41
咒語	zhòu yǔ	feitiço	0	1	43
指出	zhǐ chū	apontar	0	1	31
課堂	kè táng	sala de aula	0	1	42
晚些	wǎn xiē	mais tarde	0	1	31
格雷戈里	gé léi gē lǐ	Gregory	1	1	22
布丁	bù dīng	pudim	15	1	41
莫林奇卡	mò lín qí kǎ	Morinchka	2	1	42
退縮	tuì suō	recuar	3	1	41
閃閃發亮	shǎn shǎn fā liàng	brilhante e reluzente	0	1	33
花錢	huā qián	gastar dinheiro	0	1	12
後院	hòu yuàn	quintal	0	1	44
錢幣	qián bì	moeda	3	1	24
聽不見	tīng bù jiàn	não ouvir	0	1	14
悸動	jì dòng	palpitação	0	1	44
上學	shàng xué	ir à escola	0	1	42
枚	méi	(classificador para anéis, medalhas)	1	1	\N
共識	gòng shí	consenso	2	1	42
寫出	xiě chū	escrever	0	1	31
尊嚴	zūn yán	dignidade	3	1	12
協議	xié yì	acordo	5	1	24
餓死了	è sǐ le	morrendo de fome	0	1	43
真空	zhēn kōng	vácuo	0	1	11
胡佛	hú fó	Hoover	0	1	22
瀟灑	xiāo sǎ	descontraído	0	1	13
同類	tóng lèi	mesmo tipo	0	1	24
受過	shòu guò	ter sofrido	2	1	44
款式	kuǎn shì	estilos	0	1	34
截然不同	jié rán bù tóng	completamente diferente	0	1	22
學習	xué xí	aprender	61	2	22
無名	wú míng	anônima	0	1	22
有色人種	yǒu sè rén zhǒng	de cor	0	1	34
呼咿	hū yī	(onomatopeia para som de canção)	0	1	11
愛好者	ài hào zhě	entusiasta	1	1	44
老外	lǎo wài	estrangeiro	0	1	34
醜陋	chǒu lòu	feiura	0	1	34
溴化物	xiù huà wù	brometo	0	1	44
中央	zhōng yāng	centro	0	1	11
比莉·哈樂黛	bǐ lì · hā lè dài	Billie Holiday	0	1	34
巴羅斯	bā luó sī	Barros	14	1	12
抽煙	chōu yān	fumar	0	1	11
仿聲鳥	fǎng shēng niǎo	pássaro imitador	0	1	31
鑽石	zuàn shí	diamante	1	1	42
可琳娜	kě lín nà	Corina	0	1	32
料到	liào dào	previsto	1	1	44
風	fēng	vento	7	1	\N
用錯了	yòng cuò le	usou errado	0	1	44
肥皂	féi zào	sabonete	0	1	24
清潔	qīng jié	limpeza	0	1	12
閃閃發光	shǎn shǎn fā guāng	brilhante	0	1	33
溜走	liū zǒu	escapar	0	1	13
大師	dà shī	mestre	0	1	41
抽空	chōu kòng	arranjar tempo	0	1	14
墨菲太太	Mò fēi tài tai	Sra. Murphy	0	1	41
墨菲	Mò fēi	Murphy	0	1	41
築巢	zhù cháo	fazer ninho/ninhar	0	1	42
唱著歌	chàng zhe gē	cantando uma música	0	1	45
知更鳥	zhī gēng niǎo	tordo	1	1	11
鳥兒	niǎo er	pássaro	1	1	35
修復	xiū fù	reparar	7	1	14
俊安	jùn ān	Jùn Ān	1	1	41
邀請	yāo qǐng	convidar	32	1	13
指導	zhǐ dǎo	orientar	3	1	33
揭曉	jiē xiǎo	revelar	8	1	13
露西亞	lù xī yà	Lúcia	68	1	41
撲	pū	atirar-se	1	1	\N
蘊含	yùn hán	conter	1	1	42
♪ ()		♪	1	1	\N
財運	cái yùn	sorte financeira	0	1	24
阿瑪吉爾歐	ā mǎ jí ěr ōu	Armadillo	0	1	13
公園	gōng yuán	parque	1	1	12
眉毛	méi máo	sobrancelha	0	1	22
歡笑	huān xiào	riso alegre	0	1	14
德國	dé guó	Alemanha	0	1	22
相擁	xiāng yōng	se abraçar	0	1	11
剩菜	shèng cài	sobras de comida	0	1	44
瘦	shòu	magro	2	1	\N
押韻	yā yùn	rimar	1	1	14
繳	jiǎo	pagar	0	1	\N
盞	zhǎn	medida para lâmpadas	13	1	\N
最傑出	zuì jié chū	mais destacado	0	1	42
校園	xiào yuán	campus escolar	0	1	42
論文	lùn wén	artigos/teses	0	1	42
沒時間	méi shí jiān	não ter tempo	3	1	22
一看	yī kàn	dar uma olhada	3	1	14
流暢	liú chàng	fluido	0	1	24
叮	dīng	gota	0	1	\N
走到	zǒu dào	chegar a	2	1	34
撥	bō	discar	0	1	\N
演唱	yǎn chàng	cantar	1	1	34
精選	jīng xuǎn	selecionado	1	1	13
片段	piàn duàn	fragmento	1	1	44
突尼斯	tū ní sī	Tunísia	1	1	12
版本	bǎn běn	versão	1	1	33
加班費	jiā bān fèi	taxa de horas extras	1	1	11
? ()		?	0	1	\N
抬	tái	levantar	0	1	\N
未眠	wèi mián	não dormir	1	1	42
稍作	shāo zuò	um pouco	0	1	14
巨塊	jù kuài	bloco gigante	0	1	44
奔過	bēn guò	correr através	0	1	14
亞伯拉罕·林肯	yà bó lā hǎn lín kěn	Abraham Lincoln	1	1	42
不止	bù zhǐ	não apenas	3	1	43
咪咪	mī mī	seios (gíria)	0	1	11
路途	lù tú	jornada	2	1	42
晴	qíng	claro	1	1	\N
模糊	mó hu	desfocado	0	1	25
點亮	diǎn liàng	acender	0	1	34
一息	yī xī	um sopro de vida	1	1	11
點燃	diǎn rán	acender	0	1	32
版權	bǎn quán	direitos autorais	0	1	32
寫了	xiě le	escreveu	0	1	35
鮑勃	Bào bó	Bob	0	1	42
喝完	hē wán	beber até acabar	0	1	12
描寫	miáo xiě	descrever	0	1	23
爵士樂	jué shì yuè	jazz	0	1	24
瓶頸	píng jǐng	bloqueio criativo	0	1	23
和善	hé shàn	amigável	0	1	24
曼弗雷德	màn fú léi dé	Manfred	1	1	42
沙盒	shā hé	caixa de areia	0	1	12
順暢	shùn chàng	suave/fluido	2	1	44
打從	dǎ cóng	desde	0	1	32
搖擺感	yáo bǎi gǎn	sensação de balanço	0	1	23
火熱	huǒ rè	ardente	0	1	34
無關緊要	wú guān jǐn yào	irrelevante	0	1	21
新穎	xīn yǐng	novo	0	1	13
哦哦	ò ò	oh oh	0	1	44
甜美	tián měi	doce	1	1	23
數十萬	shù shí wàn	centenas de milhares	0	1	42
總監	zǒng jiān	diretor	0	1	31
杏仁	xìng rén	amêndoas	0	1	42
草莓	cǎo méi	morango	0	1	32
吸塵	xī chén	aspirar pó	0	1	12
水費	shuǐ fèi	conta de água	0	1	34
聲樂	shēng yuè	vocal/música vocal	0	1	14
鄉間	xiāng jiān	interior/zona rural	0	1	11
高等	gāo děng	superior	0	1	13
禮服	lǐ fú	vestidos	0	1	32
HIGH HAT	HIGH HAT	high hat	0	1	55
致謝	zhì xiè	agradecer	0	1	44
懷堤	huái dī	quebra-mar	0	1	21
烤雞	kǎo jī	frango assado	0	1	31
匆忙	cōng máng	apressado	0	1	12
心頭	xīn tóu	coração/mente	1	1	12
刻薄	kè bó	mordaz	1	1	42
酸性	suān xìng	acidez	0	1	14
你說	nǐ shuō	você diz	3	1	31
酷炫	kù xuàn	descolado	0	1	44
噠啦	dā lā	(onomatopeia) tra-la	0	1	11
布羅米德	bù luó mǐ dé	Bromide	0	1	42
卡翠娜	Kǎ cuǐ nà	Katrina	0	1	33
撒哈拉沙漠	sā hā lā shā mò	deserto do Saara	1	1	11
一倍半	yī bèi bàn	uma vez e meia	0	1	14
水漬	shuǐ zì	mancha de água	0	1	34
詩作	shī zuò	poemas	0	1	14
封面	fēng miàn	capa	0	1	14
羅傑斯	Luó jié sī	Rogers	0	1	22
清空	qīng kōng	esvaziar	0	1	11
煙灰缸	yān huī gāng	cinzeiro	0	1	11
鬆綁	sōng bǎng	soltar as amarras	0	1	13
裂縫	liè fèng	rachaduras	0	1	44
裂痕	liè hén	rachaduras	0	1	42
涼了	liáng le	esfriar	0	1	25
某某人	mǒu mǒu rén	fulano	0	1	33
省油的燈	shěng yóu de dēng	pessoa fácil de lidar	0	1	32
蔬菜	shū cài	legumes	0	1	14
徹夜	chè yè	a noite toda	1	1	44
歇息	xiē xī	descansar	0	1	11
出路	chū lù	saída, solução	9	1	14
奇景	qí jǐng	paisagem extraordinária	2	1	23
尚存	shàng cún	ainda existir	1	1	42
面紗	miàn shā	véu	2	1	41
融	róng	fusão	0	1	\N
永無止境	yǒng wú zhǐ jìng	sem fim	1	1	32
相当	shènguāng	bastante	0	1	\N
韁	jiāng	freio	0	1	\N
水域	shuǐ yù	área de água	3	1	34
尾	wěi	fim	0	1	\N
字幕	zì mù	legenda	1	1	44
捲	juǎn	envolvido	0	1	\N
第一	dì yī	primeiro	29	1	41
黠	xiá	esperteza	0	1	\N
穩穩	wěn wěn	firmemente	0	1	33
庇	bì	proteção	0	1	\N
持久	chǔ jǔ	duradouro	0	1	33
投入了	tòu rù le	investiu	0	1	44
提供了	tígōng le	forneceu	0	1	25
給了	gěi le	deu	0	1	35
付出了	fù chū le	pagou	0	1	41
順從	shùn cóng	obediente	1	1	42
辜負	gū fù	decepcionar	0	1	14
標誌	biāo zhì	símbolo	1	1	14
改變了	biàn zhěng le	mudou	1	1	43
異彩	yì cǎi	destacar	1	1	43
悉	xī	familiar	2	1	\N
自尋	zì xún	procurar por si mesmo	0	1	42
危	wēi	perigoso	1	1	\N
放蕩	fàng dàng	libertino	0	1	44
不羈	bù jī	desregrado	0	1	41
徑	jìng	caminho	1	1	\N
露營	lù yíng	acampar	0	1	42
親生的	qīn shēng de	biológico	0	1	11
綜	zōng	abrangente	0	1	\N
繩	shéng	corda	0	1	\N
咗	zo	[onomatopeia de clique]	4	1	\N
太多	tài duō	demais	43	1	41
弗塔多	Fùtǎduō	Furtado	0	1	\N
至	zhì	a	8	1	\N
貶	piǎn	depreciar	0	1	\N
歸咎	guījiù	culpar	0	1	\N
生物	shēng wù	criatura	2	1	14
掩耳	yǎn ěr	tapar os ouvidos	0	1	33
盜鈴	dào líng	roubar o sino	0	1	42
向來	xiàng lái	sempre	3	1	42
撐住	chēng zhù	segurar	2	1	14
軟弱	ruǎn ruò	fraco	7	1	34
都不	dōu bù	nada	0	1	14
整	zhěng	inteiro	16	1	\N
提出的	tí'qǐ de	proposto	0	1	25
擔任	dān rèn	assumir	9	1	14
鬼	guǐ	fantasma	15	1	\N
戀人	liàn rén	amantes	0	1	42
痛楚	tòng chǔ	dor	2	1	43
放任	fàng rèn	permitir	7	1	44
插手	chā shǒu	interferir	14	1	13
骨子裡	gǔ zi lǐ	no fundo	0	1	35
非常高興	fēi hóng xìng	muito feliz	11	1	12
迷失	mí shī	perder	18	1	21
拚	pīn	lutar	0	1	\N
并不	bù néng	não parece	0	1	42
教父	jiào fù	padrinho	45	1	44
方向	fāng xiàng	direção	7	1	14
支	zhī	suportar	44	1	\N
法比奧	Fǎ bǐ ào	Fábio	8	1	33
作為	zuò wéi	como	65	2	42
support	suì	apoiar	0	1	\N
夠	gòu	suficiente	104	1	\N
厲	lì	rigoroso	0	1	\N
楣	méi	azar	0	1	\N
王	wáng	rei	0	1	\N
全家	quán jiā	toda a família	8	1	21
幹	gàn	fazer	27	1	\N
溫迪	Wēn dí	Wendy	0	1	12
得出	dé chū	chegar a	2	1	21
考	kǎo	considerar	0	1	\N
安娜露西亞	ān nà lù xī yà	Anastácia	37	1	14
安妮露西	Ānnī Lùsī	Anne Lucy	0	1	14
要是	yào shì	se	33	1	44
想象	xiǎng xiàng	imaginar	7	1	34
懷孕	huái yùn	engravidar	167	1	24
雜	zá	misturado	0	1	\N
han	han	omitido	0	1	\N
誌	zhì	revista	0	1	\N
孕	yùn	fértil	15	1	\N
時機	shí jī	momento	4	1	21
辦理	bàn lǐ	processar	5	1	43
靠近	kào jìn	aproximar-se	15	1	44
發送	fā sòng	enviar	4	1	14
別的	bié de	outro	35	1	25
屁股	pì gu	bunda	14	1	45
俱樂部	jù lè bù	clube	8	1	44
盯著	dīng zhe	encarando	8	1	15
那样的	nà yàng de	assim	0	1	44
抹去	mǒ qù	apagar	1	1	34
正確	zhèng què	correto	70	1	44
JÃO	JÃO	Jão	6	1	\N
我不放		não desvia de mim	0	1	\N
卡伊歐	Kǎiyōu	Kayoe	0	1	\N
忍受到	rěn shòu dào	suportar	1	1	34
完整	wán zhěng	completa	12	1	23
無所事事	wú suǒ shì shì	ocioso	0	1	23
年紀	nián jí	idade	35	1	22
拉斐拉	lā fěi lā	Rafaela	-58	1	13
大洋	dà yáng	oceano	0	1	42
寒酸	hán suān	miserável	1	1	21
凱歐	Kǎi Ōu	Kaio	7	1	31
茶	chá	chá	31	1	\N
詭計	guǐ jì	truque	4	1	34
逼	bī	pressionar	14	1	\N
奶奶	nǎi nai	avó	46	1	35
露	lù	orvalho	46	1	\N
心碎	xīn suì	partir o coração	3	1	14
傷	shāng	machucar	17	1	\N
安慰	wèiài	conforto	3	1	\N
祖母	zǔ mǔ	avó	18	1	33
索妮雅	Suǒ nì yà	Sonia	0	1	34
自然	zì rán	natural	26	1	42
海洋	hǎi yáng	oceano	0	1	32
畢竟	bì jìng	afinal	12	1	44
鞭炮	biān pào	fogos de artifício	4	1	14
grandson	xiao zuì	neto	16	1	54
創造	chuàng zào	criar	56	1	44
計算	jì suàn	cálculo	9	1	44
感受	gǎn shòu	sentimento	29	1	34
受害	shòu hài	vítima	1	1	44
告诉	gào sù	contar	1	1	44
詩意	shī yì	poético	0	1	14
何故	hé gù	por que razão	0	1	24
插	chā	inserido	7	1	\N
孩子的	hái zi de	da criança	2	1	25
的眼睛		olhos	0	1	\N
處	chù	lugar	139	1	\N
緒	xù	fio	8	1	\N
Carla	Kǎ lā	Carla	9	1	31
織	zhī	tecer	2	1	\N
掩	yǎn	cobrir	2	1	\N
卡洛塔	Kǎluōtǎ	Cloetta	14	1	\N
揭	jiē	revelar	21	1	\N
琳	lín	lindamente	12	1	\N
蓋	gài	cobrir	11	1	\N
樣的	yàng de	tipo	1	1	45
徹底	chè dǐ	completamente	13	1	43
紫藤	zǐ téng	wisteria	17	1	32
的所有	suǒ yǒu	de todos	0	1	33
卡拉	Kǎ lā	Carla	90	1	31
揭露	jiē lù	revelar	7	1	14
餐廳	cān tīng	restaurante	17	1	11
卡卡	kǎ kǎ	Kaka	61	1	33
Caio		Caio	10	1	\N
虛假	xū jiǎ	falso	3	1	13
毛羅	Máo luó	Mauro	5	1	22
懶散	lǎ sǎn	preguiçoso	0	1	33
離得很遠	lí de hěn yuǎn	longe	0	1	25
布魯諾	bù lǔ nuò	Bruno	-103	1	43
思考	sī kǎo	pensar	27	1	13
顯	xiǎn	aparecer	3	1	\N
腦海	nǎo hǎi	mente	12	1	33
聲色	shēng sè	pistas	0	1	14
嘸	mò	não	1	1	\N
奧斯馬	Ào sī mǎ	Osma	66	1	41
嘛	ma	partícula final	36	1	\N
MAURO	MAURO	MAURO	0	1	\N
隔	gé	separar	1	1	\N
很久	hěn jiǔ	muito tempo	39	1	33
活潑	huó pō	vivaz	3	1	21
項	xiàng	item	24	1	\N
之中	zhī zhōng	entre	39	1	11
客廳	kè tīng	sala de estar	2	1	41
置信	zhì xìn	acreditar	6	1	44
將是	jiāng shì	será	0	1	14
懷	huái	grávida	33	1	\N
訓練	xùn liàn	treinamento	10	1	44
打賭	dǎ dǔ	apostar	10	1	33
世界上	shì jiè shàng	no mundo	29	1	44
軟	ruǎn	macio	2	1	\N
存	cún	guardar	44	1	\N
薇	wēi	rosa	5	1	\N
![喬	qiáo	Qiao	1	1	\N
、	、	e	23	1	\N
癒	yù	cura	0	1	\N
敗	bài	derrotar	5	1	\N
論	lùn	discutir	17	1	\N
哲人	zhé rén	sábio	1	1	22
懦夫	nuò fū	covarde	6	1	41
索妮亞	suǒ ní yà	soninha	0	1	32
淡定	dàn dìng	calma	1	1	44
不知	bù zhī	não saber	7	1	41
敞開	chǎng kāi	abrir	19	1	31
瘦瘦小小	shòu shòu xiǎo xiǎo	magrinho	0	1	44
緣故	yuán gù	razão	14	1	24
一同	yī tóng	juntos	4	1	12
善	shàn	bondade	54	1	\N
拘	jū	restringir	6	1	\N
索妮婭	Suǒ nī yà	Sônia	1	1	31
戰	zhàn	lutar	11	1	\N
負重	fù zhòng	carregar peso	2	1	44
英勇	yīng yǒng	valente	1	1	13
听到	tīng dào	ouvir	2	1	14
戰士	zhàn shì	guerreiro	1	1	44
雞	jī	frango	2	1	\N
桑巴	sāng bā	samba	6	1	11
病態	bìng tài	doentio	7	1	44
憐	lián	piedoso	7	1	\N
隊	duì	equipe	22	1	\N
納入	nà rù	incluir	0	1	44
好些	hǎo xiē	melhor	1	1	31
當得	dāng dé	merece	0	1	12
療程	liáo chéng	tratamento	3	1	22
伴侶	bàn lǚ	parceiro	18	1	43
雖然	suī rán	embora	30	1	12
蛤	gé	mexilhão	0	1	\N
覺得很	jué de hěn	sinto-me muito	0	1	25
內疚	nèi jiù	culpado	8	1	44
無關	wú guān	não relacionado	2	1	21
才會	cái huì	só então	8	1	24
冒險	mào xiǎn	aventura	12	1	43
終結	zhōng jié	conclusão	2	1	12
令人	lìng rén	fazer as pessoas	38	1	42
婉惜	wǎn xī	lamentar	0	1	31
鍛鍊	duàn liàn	exercitar	4	1	44
周圍	zhōu wéi	ao redor	3	1	12
鏡子	jìng zi	espelho	5	1	45
雙臂	shuāng bì	braços	0	1	14
頭暈	tóu yūn	tontura	0	1	21
沒辦法	méi bàn fǎ	não tem jeito	25	1	24
巴斯	bǎ sī	(parte de Sebastian)	13	1	31
長久	cháng jiǔ	longamente	0	1	23
尤	yóu	especialmente	1	1	\N
刮	guā	raspar	4	1	\N
施	shī	aplicar	4	1	\N
小麗	xiǎo lì	Xiao Li	1	1	34
運動	yùn dòng	exercício	23	1	44
桑妮亞	Sānnià	Sanya	0	1	\N
穎	yǐng	ponta afiada	6	1	\N
明達	míng dá	clarividência	3	1	22
導師	dǎo shī	mentor	1	1	31
還是	hái shì	ainda	184	2	24
繁西亞	Fán xī yà	Vasia	1	1	21
伤害	shāng huài	ferir	1	1	14
兩天	liǎng tiān	dois dias	8	1	31
臥床	wò chuáng	cama	0	1	42
暈船	yūn chuán	enjoo do mar	0	1	12
那兒	nàr	aí	16	1	\N
痛苦	tòng kǔ	sofrimento	87	1	43
那一天	nà yī tiān	aquele dia	4	1	41
約定	yuē dìng	acordo	13	1	14
帕	pā	Patricia	0	1	\N
米拉多	Mǐ là duō	Milardo	1	1	34
鬍子	hú zi	barba	10	1	25
每次	měi cì	cada vez	10	1	34
就要	jiù yào	vou	31	1	44
可真	kě zhēn	realmente	0	1	31
同時	tóng shí	ao mesmo tempo	24	1	22
的日子	de rì zi	dos dias	1	1	54
下去	xià qù	seguir em frente	50	2	44
米蘭	mǐ lán	(nome próprio)	3	1	32
大大的	dà dà de	grande	1	1	44
堅強	jiān qiáng	forte	21	1	12
詩	shī	poesia	2	1	\N
装	zhuāng	fingir	1	1	\N
堅	jiān	forte	5	1	\N
互	hù	mútuo	0	1	\N
傳說	chuán shuō	lenda	2	1	21
打算	dǎ suàn	planejar	70	2	34
上床	shàng chuáng	ir para a cama	3	1	42
或者	huò zhě	ou	37	1	43
晚點	wǎn diǎn	mais tarde	28	1	33
戈森	Gē sēn	Gosen	1	1	11
麗塔	lì tǎ	Rita	2	1	43
報復	bào fù	retaliar	11	1	44
人生	rén shēng	vida	267	2	21
等著	děng zhe	esperar	18	1	35
拉法	Lā fǎ	Rafaela	5	1	13
米蘭達	mǐ lán dá	Miranda	21	1	32
替	tì	substituir	8	1	\N
採	cǎi	adotar	2	1	\N
優	yōu	elegante	3	1	\N
挖	wā	cavar	1	1	\N
煩	fán	incomodar	23	1	\N
繼續	jì xù	continuar	128	1	44
校	xiào	escola	1	1	\N
帽	mào	chapéu	3	1	\N
麻	má	ma	4	1	\N
補	bǔ	suplementar	6	1	\N
復仇	fùchou	vingança	0	1	\N
書	shū	livro	13	1	\N
代	dài	no lugar de	7	1	\N
監獄	jiān yù	prisão	15	1	14
口哨	kǒu shào	apito, assobio	5	1	34
明白	míng bái	entender	206	2	22
氛	fēn	atmosfera	11	1	\N
乾杯	gān bēi	brinde	17	1	11
「唯一無二」		único	1	1	\N
破壞	pò huài	destruiu	10	1	44
一本	yī běn	um	2	1	13
帳	zhàng	contas	37	1	\N
至關重要	zhì guān zhòng yào	extremamente importante	2	1	41
讀書	dú shū	estudar	13	1	21
代理	dài lǐ	agência	2	1	43
一份	yī fèn	uma porção	28	1	14
年來	nián lái	anos	1	1	22
時代	shí dài	era	8	1	24
未來	wèi lái	futuro	15	1	42
負	fù	assumir responsabilidade	1	1	\N
單	dān	formulário	9	1	\N
同學	tóng xué	colega	0	1	22
误会	huài wù	mal-entendido	1	1	44
西爾維亞	xī ěr wéi yà	Sylvia	11	1	13
擦	cā	esfregar	7	1	\N
化療	huà liáo	quimioterapia	9	1	42
弟弟	dì di	irmão mais novo	5	1	45
超級	chāo jí	super	27	1	12
頓	dùn	pausa	32	1	\N
最好的	zuì hǎo de	melhor	5	1	43
mother	mǔ qīn	mãe	6	1	31
塞巴斯蒂ão	Sāibàsītiāo	Sebastião	1	1	\N
拜	bài	implorar	2	1	\N
伊斯	yì sī	Is	15	1	41
高興	gāo xìng	feliz	92	1	14
慶祝	qìng zhù	celebrar	54	1	44
迎	yíng	receber	10	1	\N
償	cháng	compensação	0	1	\N
难	nán	dificuldade	0	1	\N
迫	pò	forçar	6	1	\N
夏	xià	verão	0	1	\N
精彩	jīng cǎi	brilhante	13	1	13
moral	mò lún	moral	1	1	42
對嗎	duì ma	está certo	13	1	45
同樣	tóng yàng	mesmo	28	1	24
義大利	Yì dà lì	Itália	1	1	44
夏天	xià tiān	verão	1	1	41
同名	tóng míng	com o mesmo nome	0	1	22
資助	zī zhù	financiar	0	1	14
瓶裝	píng zāng	engarrafado	0	1	21
坑	kēng	buraco	1	1	\N
干涉	gāng xié	interferir	0	1	12
在此	zài cǐ	aqui	15	1	43
追尋	zhuī xún	procurar	2	1	12
風險	fēng xiǎn	risco	32	1	13
吹	chuī	soprar	8	1	\N
權	quán	direito	16	1	\N
情況下	qìngkuàngxià	situação	3	1	\N
受盡	shòu jǐn	sofreu muito	0	1	43
苦難	kǔ nàn	sofrimento	1	1	34
預	yù	prever	2	1	\N
保安	bǎo ān	segurança	1	1	31
小寶貝	xiǎo bǎo bèi	queridinha	7	1	33
回憶	huí yì	lembranças	13	1	24
冬天	dōng tiān	inverno	2	1	11
火爆	huǒ bào	explosivo/fervoroso	1	1	34
的男人	de nán rén	homem	3	1	52
可口可樂	kě kǒu kě luò	Coca-Cola	0	1	33
有所不同	xiǎng bié	differ	0	1	32
測	cè	detecção	4	1	\N
黃金	huáng jīn	ouro	5	1	21
夾	jiā	prendido	4	1	\N
義務	yì wù	obrigação	2	1	44
彌補	mí bǔ	compensar	0	1	23
溪	xī	riacho	1	1	\N
竟然	jìng rán	surpreendentemente	65	1	42
戰鬥	zhàn dòu	batalha	7	1	44
邊緣	biān yán	borda	1	1	12
輕輕地	qīng qīng de	suavemente	1	1	11
埃及式	Aì jí xì shì	estilo egípcio	1	1	42
附靈	fù líng	possessão espiritual	1	1	42
故意	gù yì	de propósito	3	1	44
那樣	nà yàng	daquele jeito	54	1	44
坎布卡	kǎn bù kǎ	Kambuka (transliteração)	6	1	34
碰	pèng	tocar	14	1	\N
獄	yù	prisão	5	1	\N
哥	gē	irmão mais velho	120	1	\N
店	diàn	loja	40	1	\N
損害	sǔn hài	danificar	11	1	34
群	qún	grupo	36	1	\N
安靜地	ān jìng de	silenciosamente	3	1	14
歐斯馬	ōu sī mǎ	Osmar	44	1	11
奧斯馬爾	ào sī mǎ ěr	Osmare	-172	1	41
闆	bǎn	chefe	4	1	\N
焉	yān	distraído	6	1	\N
橫	héng	atravessar	1	1	\N
lights	lights	luzes	1	1	\N
社區	shè qū	comunidade	40	1	41
智	zhì	sabedoria	2	1	\N
mansion	mansion	mansão	1	1	\N
各	gè	cada	28	1	\N
根	gēn	unidade para objetos longos e finos	32	1	\N
絕不會	jué bù huì	definitivamente não	7	1	24
積極性	jī jí xìng	positividade	1	1	12
振奮	zhèn fèn	animado	2	1	44
如果不	bù shì ... fǒu	se não	7	1	44
訊號	xùn hào	sinal	1	1	44
錄製	lù zhì	gravar	2	1	44
哈云	Hā Yún	[nome próprio]	1	1	12
夥伴	huǒ bàn	parceiro	33	1	34
姑娘	gū niáng	garota	33	1	12
粗魯	cū lǔ	grosseiro	13	1	13
哈雲	hā yún	[Ha Yun]	0	1	12
爭論	zhēng lùn	discutir	17	1	14
阿里巴巴	Ā Lǐ Bā Bā	Alibaba	0	1	13
德	dé	virtude	75	1	\N
原諒	yuán liàng	perdoar	79	1	24
植物	zhí wù	plantas	4	1	24
保佑	bǎo yòu	proteger	10	1	34
核對	hé duì	verificar	1	1	24
喜悅	xǐ yuè	alegria	7	1	34
益處	yì chù	benefício	27	1	44
證明	zhèng míng	certificado	70	1	42
加油	jiā yóu	força	31	1	12
確信	què xìn	estar convencido	31	1	44
敢	gǎn	ousar	65	1	\N
開心	kāi xīn	felizes	45	1	11
成功	chéng gōng	bem-sucedida	67	1	21
交通	jiāo tōng	transporte	20	1	11
原	yuán	originalmente	4	1	\N
升級	shēng jí	atualização	7	1	12
馬科	mǎ kē	Marco	1	1	31
車輛	chē liàng	veículo	15	1	14
決	jué	decidir	12	1	\N
她是	tā shì	ela é	0	1	14
姓氏	xìng shì	sobrenome	4	1	44
摔	shuāi	cair	5	1	\N
朝	cháo	voltado para	10	1	\N
以下	yǐ xià	a seguir	9	1	34
算了	suàn le	deixar para lá	14	1	45
卡奧	kǎ ào	Cao	9	1	34
通行	tōng xíng	passagem	1	1	12
繁體中文	fán tǐ zhōng wén	chinês tradicional	1	1	23
翻譯結果	fān yì jié guǒ	resultado da tradução	1	1	14
歐斯馬爾	ōu sī mǎ ěr	Osmael	11	1	11
甜心	tián xīn	querido	7	1	21
的一部分	de yī bù fèn	parte	0	1	51
阿馬斯	Ā Mǎsī	Amas	1	1	13
基基	Jī Jī	Kiki	32	1	11
禁止	jìn zhǐ	proibido	7	1	43
分心	fēn xīn	distrair	4	1	11
喬伊斯	qiáo yī sī	Joyce	60	1	21
擺	bǎi	fazer	4	1	\N
最後	zuì hòu	final	181	1	44
臉	liǎn	rosto	44	1	\N
村	cūn	vila	19	1	\N
另外	lìng wài	além disso	14	1	44
喬治	qiáo zhì	George	51	1	24
發誓	fā shì	jurar	43	1	14
瓜	guā	melão	7	1	\N
詭	guǐ	estranho	1	1	\N
登	dēng	registrar	0	1	\N
這場	zhè chǎng	este	11	1	43
爭執	zhēng zhí	disputa	5	1	12
人工智能	rén gōng zhì néng	inteligência artificial	134	1	21
趾高	zhǐ gāo	orgulhoso	1	1	31
氣揚	qì yáng	arrogante	1	1	42
破產	pò chǎn	falência	1	1	43
「Cambucá村莊」	cǎnbùjiā cūnzhuāng	Cambucá aldeia	1	1	31
工作室	gōng zuò shì	estúdio	9	1	14
排練	pái liàn	ensaio	12	1	24
哈娜	Hā Nà	Hana	10	1	14
像是	xiàng shì	parecer	17	1	44
區域	qū yù	área	16	1	14
足夠	zú gòu	suficiente	10	1	24
喬	qiáo	Joe	-238	1	\N
豪	háo	Hao	11	1	\N
教訓	jiào xùn	ensinar	27	1	44
供	gōng	fornecer	15	1	\N
雲	yún	nuvem	39	1	\N
studio	studio	estúdio	1	1	\N
趕	gǎn	expulsar	7	1	\N
發布	fā bù	publicar	1	1	14
策略	cè luò	estratégia	1	1	44
了解	liǎo jiě	compreender	58	1	33
包裝	bāo zhuāng	embalagem	0	1	11
出發	chū fā	partir	9	1	11
約會	yuē huì	encontro	30	1	14
創作	chuàng zuò	criar	5	1	44
南部	nán bù	sul	6	1	24
計劃	jì huà	plano	57	1	44
諒	liàng	perdoar	1	1	\N
盜	dào	roubado	6	1	\N
粗	cū	rude	0	1	\N
獨自	dú zì	sozinha	26	1	24
錯誤	cuò wù	erro	62	1	44
舞蹈	wǔ dǎo	dança	9	1	33
行程	xíng chéng	itinerário	3	1	22
孫女	sūn nǚ	neta	7	1	13
寶庫	bǎo kù	tesouro	0	1	34
捕獲	bǔ huò	capturar	0	1	34
瓦解	wǎ jiě	desmantelar	0	1	33
行銷	xíng xiāo	marketing	3	1	21
事物	shì wù	coisas	22	1	44
迅速	sù shùn	rápido	1	1	44
待了	dài le	fiquei	7	1	45
短的	duǎn de	curto	1	1	35
吠聲	fèi shēng	latido	1	1	41
事業	shì yè	carreira	28	1	44
折磨	zhé mó	sofrimento	3	1	22
地區	dì qū	região	1	1	41
暴發戶	bào fā hù	nouveau riche	1	1	41
祖萊卡	zǔ lái kǎ	Zulaika	19	1	32
看到了	kàn dào le	viram	11	1	44
安排	ān pái	organizar	53	1	12
週	zhōu	semana	33	1	\N
莎	shā	grama	115	1	\N
賊	zéi	ladrão	0	1	\N
十	shí	dez	63	3	\N
驕傲	jiāo ào	orgulhoso	22	1	14
團	tuán	grupo	4	1	\N
ROSE	rōuz	rosa	0	1	\N
巴克提亞	Bākètítāyà	Buckthia	0	1	\N
帥	shuài	bonito	12	1	\N
米納斯吉拉斯州	Mǐ nà sī jí lǎ sī zhōu	Minas Gerais	0	1	34
繩子	shéng zi	corda	0	1	25
撫養	fǔ yǎng	criar	5	1	33
舒伯坦	Shū bó tǎn	Shubert	0	1	12
麼了	me le	aconteceu	0	1	55
在地上	zài dì shàng	no chão	0	1	44
needles	bēi zi	agulha	0	1	15
暈過去	yūn guò qù	desmaiar	0	1	14
卡卡助手	kǎ kǎ zhī zhù	Kaka Assistant	0	1	33
一把	yī bǎ	com força	6	1	13
宣傳	xuān chuán	propaganda	0	1	12
通情達理	tōng qíng dá lǐ	compreensivo	0	1	12
喉嚨	hóu lāng	garganta	10	1	21
到處	dào chù	em todos os lugares	23	1	44
毫髮	háo fà	cabelo	1	1	24
他的	tā de	dele	72	3	15
卡約	Kǎ yuē	Caio	15	1	31
心軟	xīn ruǎn	ceder	2	1	13
够	gòu	suficiente	1	1	\N
险	xiǎn	perigoso	0	1	\N
格森	Gé sēn	Gerson	145	1	21
儘	jǐn	apenas	4	1	\N
们	men	(indicador de plural)	21	1	\N
當時	dāng shí	naquela época	117	1	12
入	rù	entrar	27	1	\N
阻	zǔ	impedir	0	1	\N
chill	chill	relaxar	0	1	\N
噠	dā	som onomatopaico	15	1	\N
禦	yù	proteger	0	1	\N
團伙	tuán huǒ	gangue	2	1	23
五花八門	wǔ huā bā mén	variado	0	1	31
因此	yīn cǐ	por isso	22	1	13
財富	cáihuò	riqueza	1	1	\N
坎布卡村	kǎn bù kǎ cūn	Vila Kambuka	8	1	34
拯救	zhěng jiù	salvar	5	1	34
職業生涯	zhí yè shēng yá	carreira profissional	9	1	24
指引	zhǐ yǐn	orientação, diretriz	3	1	33
天堂	tiān táng	paraíso	27	1	12
巴拉達蒂茹卡	Bālā dá dì Yù kǎ	Barra da Tijuca	0	1	12
品味	pǐn wèi	gosto	6	1	34
物品	wù pǐn	item	8	1	43
老兄	lǎo xiōng	mano	113	2	31
樓梯間	lóu tī jiān	espaço entre os andares	0	1	21
混亂	hùn luàn	confusão	30	1	44
晉	jìn	JIN	4	1	\N
祖	zǔ	ancestral	24	1	\N
筆	bǐ	medida para transações	68	1	\N
商店	shāng diàn	loja	3	1	14
多麼	duō me	quão	81	2	15
界	jiè	campo	15	1	\N
父	fù	Pai	36	1	\N
賣	mài	vender	8	1	\N
Tabriz	Tabriz	Tabriz	0	1	\N
簡直	jiǎn zhí	simplesmente	88	1	32
藝術	yì shù	arte	5	1	44
地毯	dì tǎn	tapete	5	1	43
多拉莉絲	duō lā lì sī	Doralice	31	1	11
塔布里茲	Tá bù lǐ zī	Tabriz	0	1	24
德羅薩	dé luō sā	Pedrosa	0	1	21
佩德羅薩	Pèi dé luō suō	Pedroza	6	1	42
至於	zhì yú	quanto a	3	1	42
多人	duō rén	muitas pessoas	0	1	12
金	jīn	ouro/dinheiro	149	2	\N
塔蒂	Tǎdì	Tati	-43	1	\N
瑞秋	Ruìqiū	Rachel	18	1	\N
萊	lái	parte do nome	15	1	\N
製作	zhì zuò	fabricar	27	1	44
这样	zhèyàng	assim	8	1	\N
終於	zhōng yú	finalmente	42	1	12
多拉西	duō lā xī	Drax	11	1	11
拾	shí	pegar	4	1	\N
巴克提亞爾	Bākètíyǎ'ēr	Bakhtiary	0	1	\N
佩	pèi	usar	7	1	\N
效率	xiào lǜ	eficiência	0	1	44
尺寸	chǐ cùn	dimensões	5	1	34
澤維爾	zé wéi ěr	Xavier	8	1	22
经	jīng	experiência	3	1	\N
生意	shēng yì	negócios	10	1	14
自制力	zì zhì lì	autocontrole	1	1	44
想到	xiǎng dào	pensei	18	1	34
很清楚	hěn qīng xǐng	muito claro	6	1	31
哈	hā	ha	63	1	\N
史蒂芬	shǐ dì fēn	Stephen	-37	1	34
同夥	tóng huǒ	cúmplice	1	1	23
成人	chéng rén	adultos	1	1	22
失去了	shī qù le	perdi	16	1	14
根本不	bù gēn běn lái	absolutamente não	2	1	41
英雄	yīng xióng	herói	18	1	12
後果	hòu guǒ	consequências	10	1	43
生氣	shēng qì	bravo	80	1	14
盹	dǔn	cochilo	1	1	\N
塞巴斯蒂安	sāi bā sī dì ān	Sebastião	173	1	11
旅行	lǚ xíng	viagem	32	1	32
老闆	lǎo bǎn	chefe	54	1	33
陷	xiàn	cair	0	1	\N
祈求	qí qiú	suplicar	6	1	22
之後	zhī hòu	depois	126	2	14
孕吐	yùn tù	enjoo matinal	0	1	44
RÔMULO	Rômulo	Rômulo	0	1	\N
瑪爾塔	Mǎ ěr tǎ	Marta	-264	1	33
瓦爾基麗	wǎ ěr jī lì	Valquíria	38	1	33
都市	dù shì	cidade	11	1	44
警察	jǐng chá	polícia	46	1	32
上面	shàng miàn	em cima	5	1	44
魚	yú	peixe	11	1	\N
傢伙	jiā huo	cara	117	1	15
手機	shǒu jī	celular	52	3	31
基	jī	base	193	1	\N
紫	zǐ	roxo	278	1	\N
鬧	nào	fazer barulho	6	1	\N
留意	liú yì	prestar atenção	9	1	24
捕	bǔ	capturado	10	1	\N
祐	yòu	proteger	26	1	\N
多次	duō cì	muitas vezes	3	1	14
客戶	kè hù	cliente	80	2	44
勇氣	yǒng qì	coragem	25	1	34
祐基	yòu jī	[Yao Ji]	3	1	41
伯	bó	bo	61	1	\N
瓦爾	wǎ ěr	Val	13	1	33
混蛋	hún dàn	idiota	22	1	24
法律	fǎ lǜ	lei	7	1	34
約瑟琳	yuē sè lín	Josephine	2	1	14
逃避	táo bì	fugir de	10	1	24
心目中	xīn mù zhōng	na minha mente	0	1	14
形象	xiàng xiàng	imagem	0	1	44
謝爾比恩	xiè ěr bǐ ēn	Shelby	3	1	43
VAL	val	VAL	1	1	\N
坦	tǎn	plano	10	1	\N
Yuki	Yuki	Yuki	22	1	\N
尼	ní	freira	72	1	\N
不可	bù kě	imperdoável	16	1	43
瓦爾基里	wǎ ěr jī lǐ	Valquíria	21	1	33
差不多	chà bu duō	mais ou menos	8	1	45
成交	chéng jiāo	fechar negócio	0	1	21
公寓	gōng yù	apartamento	16	1	14
谷口	gǔ kǒu	vale da boca	2	1	33
委員會	wěi yuán huì	comitê	0	1	32
裝修	zhuāng xiū	reformando	2	1	11
HELENA	hē lén à	Helena	23	1	12
恐嚇	kǒng xià	ameaçar	8	1	34
凍結	dòng jié	congelar	1	1	42
擊敗	jī bài	derrotar	1	1	14
自我	zì wǒ	si mesma	53	1	43
行事	xíng shì	agir	17	1	24
忘了	wàng le	esqueci	22	1	45
提升	tí shēng	elevação	16	1	21
束縛	shù fù	restrições	2	1	44
相當	xiāng dāng	equivalente	16	1	11
陪	péi	acompanhar	30	1	\N
社	shè	sociedade	5	1	\N
網	wǎng	teia	7	1	\N
辦法	bàn fǎ	método	83	1	43
重新	chóng xīn	novamente	85	1	21
防	fáng	defender	0	1	\N
暴露	bào lù	expostos	3	1	44
逞	chěng	agir como	0	1	\N
損	sǔn	dano	2	1	\N
脫	tuō	tirar	29	1	\N
餘	yú	restante	3	1	\N
餅乾	bǐng gān	biscoito	7	1	31
嶄新	zhǎn xīn	novo	6	1	31
肩上	jiān shàng	nos ombros	0	1	14
背負	bēi fù	carregar	0	1	14
適合	shì hé	adequado	16	1	42
漸漸	jiàn jiàn	gradualmente	3	1	44
害羞的	xiū hǎi de	tímido	0	1	13
並非	bìng fēi	não é	34	1	41
就好	jiù hǎo	seria bom	10	1	43
激烈	jī liè	intenso	2	1	14
登記	dēng jì	registrar	12	1	14
份額	fèn é	quota	1	1	42
匯入	huì rù	depositados	2	1	44
剝削	bōxuē	explorar	0	1	\N
喘息	chuǎn xī	respiro	13	1	31
大膽	dà dǎn	ousado	3	1	43
很高兴	hěn gāo xìng	ficarei feliz	1	1	31
姑姑	gū gū	tia	7	1	11
阿基里斯	Ā jī lǐ sī	Aquiles	35	1	11
對付	duì fu	lidar com	5	1	45
機	jī	máquina	35	1	\N
逃	táo	escapar	13	1	\N
男	nán	homem	60	1	\N
能力	néng lì	habilidade	34	1	24
羅克斯勒	Luó Kè Sī Lè	Roksler	122	1	24
森	sēn	Sen	99	1	\N
羞	xiū	vergonha	1	1	\N
将	jiāng	vai	1	1	\N
追	zhuī	perseguir	30	1	\N
變得	biàn dé	tornou-se	53	1	42
羅	luó	Luo	298	1	\N
卡	kǎ	cartão	322	1	\N
迷人的	mí rén de	fascinantes	1	1	22
繼承人	jì chéng rén	herdeiro	1	1	42
舊日	jiù rì	antigo	0	1	44
重擔	chóng dān	fardo	0	1	21
段	duàn	segmento	61	1	\N
密謀	mì móu	conspirar	2	1	42
說服	shuō fú	persuadir	13	1	12
動物	dòng wù	animal	2	1	44
无法	wú fǎ	não pode	1	1	23
良心	liáng xīn	consciência	0	1	21
深感	shēn gǎn	profundamente	2	1	13
沉重	chén zhòng	pesado	4	1	24
提供的	tí gōng de	fornecido	1	1	21
鈴聲	líng shēng	toque	117	1	21
馬克	mǎ kè	Marco	75	1	34
害	hài	prejudicar	7	1	\N
星	xīng	estrelas	10	1	\N
能夠	néng gòu	conseguir	91	1	24
仍	réng	ainda	17	1	\N
的心	de xīn	coração	8	1	51
做出	zuò chū	fazer	45	1	41
富	fù	rico	28	1	\N
丟	diū	jogar	18	1	\N
超	chāo	super	96	1	\N
拒絕 (j absolute		recusar	0	1	\N
翻译	fānyì	tradução	3	1	\N
喂	wèi	ei	139	1	\N
凱	kǎi	triunfante	66	1	\N
雇主	guǎngyè	empregador	0	1	\N
一部分	yī bù fèn	uma parte	8	1	14
浪費	làng fèi	desperdício	14	1	44
巴基	bā qī	paquistão	0	1	11
哈薩克	hā sà kè	cazaque	0	1	14
想知道	xiǎng zhī dào	querer saber	7	1	31
玩具	wán jù	brinquedo	1	1	24
條	tiáo	medidor para itens longos e estreitos	24	1	\N
總會	zǒng huì	sempre vai	3	1	34
性別	xìng bié	gênero	23	1	42
抱著	bào zhe	abraçando	7	1	45
手腕	shǒu wàn	pulso	3	1	34
個人	gè rén	pessoal	116	2	42
觉	jué	sentir	1	1	\N
勒	lè	lè	32	1	\N
蓮	lián	lótus	0	1	\N
stan	stan	estan	1	1	\N
麻煩	má fan	incomodar-se	41	1	25
禮物	lǐ wù	presente	40	1	34
父母	fù mǔ	pais	54	1	43
忘恩負義	wàng ēn fù yì	ingratidão	4	1	41
攝影	shè yǐng	fotografia	5	1	43
具体	jù tǐ	específico	1	1	43
往事	wǎng shì	passado	4	1	34
帮助	bāng zhù	ajudar	1	1	14
碼	mǎ	código	9	1	\N
格	gé	G	46	1	\N
第二	dì èr	segunda	17	1	44
母親	mǔ qīn	mãe	146	2	31
海倫娜	hǎi lún nà	Helena	-250	1	32
我知道了	wǒ zhī dào le	eu entendi	6	1	31
教子	jiào zǐ	afilhado	0	1	43
得知	dé zhī	ficar sabendo	26	1	21
有了	yǒu le	ter	10	1	35
所願	suǒ yuàn	desejar	2	1	34
且	qiě	e	41	1	\N
興趣	xìng qù	interesse	22	1	44
唉	āi	ai	146	1	\N
說話	shuō huà	falar	132	2	14
安逸	ānyì	conforto	0	1	\N
壓	yā	pressionar	0	1	\N
惱	nǎo	preocupada	0	1	\N
隨意	suí yì	à vontade	17	1	24
坦白	tǎn bái	confessar	9	1	32
近期	jìn qī	recente	0	1	41
受害者	shòu hài zhě	vítima	1	1	44
公正	gōng zhèng	justo	1	1	14
旨意	zhǐ yì	vontade	1	1	34
時分	shí fēn	momento	3	1	21
香氣	xiāng qì	aroma	2	1	14
西爾瓦納	xī ěr wǎ nà	Silva	18	1	13
成為	chéng wéi	tornar-se	75	1	22
涉及	shè jí	envolver	11	1	42
JOYCE	JOYCE	JOYCE	-11	1	\N
址	zhǐ	localização	2	1	\N
定	dìng	fixo	84	1	\N
拋	pāo	jogar	13	1	\N
帝	dì	Deus	119	2	\N
衝	chōng	avançar	2	1	\N
肯	kěn	estar disposto a	1	1	\N
抗	kàng	resistir	1	1	\N
嫉	jí	inveja	0	1	\N
妒	dù	inveja	1	1	\N
超出	chāo chū	exceder	3	1	11
教育	jiào yù	educação	27	1	44
深夜	shēn yè	tarde da noite	1	1	14
食慾	shí yù	apetite	3	1	24
避	bì	evitar	3	1	\N
卡洛斯	Kǎ luò sī	Carlos	-108	1	34
準時	zhǔn shí	pontual	7	1	32
答	dá	responder	1	1	\N
身後	shēn hòu	atrás	2	1	14
武器	wǔ qì	armas	12	1	34
致命	zhì mìng	fatal	13	1	44
借	jiè	emprestar	23	1	\N
殘酷	cán kù	cruel	6	1	24
認識	rèn shi	conhecer	98	2	45
權利	quán lì	direito	43	1	24
湯	tāng	sopa	2	1	\N
破	pò	romper	34	1	\N
喬伊絲	qiáo yī sī	Joyce	-226	1	21
妳	nǐ	você	432	2	\N
没	méi	não ter	10	1	\N
瓦	wǎ	telha	59	1	\N
麵	miàn	pão	4	1	\N
飛	fēi	voar	15	1	\N
躲	duǒ	escondendo	16	1	\N
豆	dòu	feijão	2	1	\N
碎	suì	quebrado	2	1	\N
臣	chén	vassalo	0	1	\N
仰	yǎng	depender	1	1	\N
擠	jǐ	espremer	0	1	\N
卡伊奧	kǎ yī ào	Caio	22	1	31
希爾瓦娜	xī ěr wǎ nà	Sylvanas	31	1	13
嘆氣	tàn qì	suspirar	306	1	44
達爾瓦	dá ěr wǎ	Dalva	29	1	23
劊子手	duì zǐ shǒu	carrasco	0	1	43
偏愛	piān ài	preferir	1	1	14
西爾瓦娜	Xī ěr wǎ nà	Silvana	-21	1	13
滾	gǔn	fervura	17	1	\N
Joyce	Joyce	Joyce	67	1	\N
算	suàn	considerar	43	1	\N
輕鬆	qīng sōng	relaxar	25	1	11
世	shì	mundo	102	2	\N
充	chōng	preencher	20	1	\N
百	bǎi	cem	26	1	\N
球球		bola	0	1	\N
和好	hé hǎo	reconciliar	3	1	23
羅蘭	luó lán	laranja	0	1	22
不必	bú bì	não é necessário	19	1	24
有一項	yǒu yī xiàng	tem uma	0	1	31
狀態	zhuàng tài	estado	18	1	44
處於	chǔ yú	estar em	16	1	32
內戰	nèizhàn	guerra civil	0	1	\N
!	exclamação	!	12	1	\N
探訪	tàn fǎng	visitar	0	1	43
黃金時代	huáng jīn shí dài	era de ouro	0	1	21
察	chá	examinar	1	1	\N
200	èr bǎi	200	0	1	43
行李	xíng li	bagagem	4	1	25
戰爭	zhàn zhēng	guerra	2	1	41
馬上	mǎ shàng	imediatamente	124	2	34
姪子	zhí zi	sobrinho	0	1	25
瑩	yíng	Ying	0	1	\N
多久	duō jiǔ	quanto tempo	24	1	13
是最小的	zuì xiǎo de	é o menor	5	1	43
觀	guān	visão	19	1	\N
的地方	de de dì fāng	lugar	6	1	55
驚喜	jīng xǐ	surpresa	43	1	13
及	jí	e	19	1	\N
份	fèn	parte	78	1	\N
坎	kǎn	dique	0	1	\N
海關	hǎiguān	alfândega	0	1	\N
寫	xiě	escrever	36	1	\N
便	biàn	então	28	1	\N
穩固	wěn gù	estável	0	1	34
得多	dé duō	muito mais	4	1	21
交互	jiāo huò	interação	0	1	14
股票	guǒ piào	ações	0	1	34
號碼	hào mǎ	número	21	1	43
臍	qí	umbigo	2	1	\N
金屬	jīn shǔ	metal	8	1	13
大家	dà jiā	todos	135	3	41
喊叫	hǎn jiào	gritar	5	1	34
濕	shī	molhado	0	1	\N
加	jiā	adicionar	30	1	\N
干	gàn	secar	0	1	\N
乾	gān	seco	7	1	\N
轉	zhuǎn	dar uma volta	74	1	\N
崩	bēng	desmoronar	1	1	\N
盤	pán	prato	0	1	\N
Jamie	ˈdʒeɪmi	Jamie	0	1	\N
博	bó	amplo	0	1	\N
資深	zī shēn	experiente	0	1	11
成員	chéng yuán	membro	7	1	22
不僅僅	bù jǐn jǐn	não apenas	4	1	43
力行	lì xíng	praticar	0	1	42
可口	kě kǒu	Coca	0	1	33
車站	chē zhàn	estação	2	1	14
直接	zhí jiē	direto	33	1	21
就在	jiù zài	então	1	1	44
清	qīng	liquidar	14	1	\N
大概	dà gài	provavelmente	18	1	44
中間	zhōng jiān	no meio	13	1	11
西琳	Xī lín	Xilin	1	1	12
若	ruò	se	174	1	\N
翻	fān	virar	33	1	\N
隨時	suí shí	a qualquer momento	36	1	22
�	tài	também	2	1	\N
妈妈	māma	mãe	0	1	\N
Barros	Barros	Barros	0	1	\N
Lilian	Lilian	Lilian	0	1	\N
概	gài	aproximadamente	5	1	\N
灘	tān	praia	0	1	\N
准	zhǔn	permitir	10	1	\N
了嗎	le ma	partícula interrogativa	13	1	55
夾子	jiā zi	grampo	1	1	15
肚	dù	barriga	2	1	\N
願意	yuàn yì	desejar	115	1	44
小心	xiǎo xīn	cuidado	49	1	31
弄	nòng	fazer	23	1	\N
看過	kàn guò	viu	10	1	44
即將	jí jiāng	prestes a	11	1	21
完成	wán chéng	concluído	61	1	22
愛人	ài rén	amor	30	1	42
根本	gēn běn	simplesmente	103	1	13
還沒有	hái méi yǒu	ainda não	1	1	22
這部	zhè bù	este	0	1	44
電影	diàn yǐng	filme	13	1	43
麻醉	má zuì	anestesia	9	1	24
叮噹	dīng dāng	tilintar	13	1	11
大学	dà xué	universidade	0	1	42
小孩	xiǎo hái	criança	12	1	32
材料	cái liào	material	6	1	24
哼	hēng	hum	55	1	\N
可憐	kě lián	pobre	53	1	32
束	shù	fim	11	1	\N
阿姨	ā yí	tia	37	1	12
股	gǔ	parte	8	1	\N
後面	hòu miàn	atrás/parte de trás	20	1	44
很棒	hěn bàng	ótimo	15	1	34
約	yuē	acordo	249	1	\N
方	fāng	lado/parte	40	1	\N
日子	rì zi	dia	31	1	45
做到	zuò dào	realizar	34	1	44
李	lǐ	li (nome de uma pessoa ou lugar, não se aplica aqui)	3	1	\N
X	X	X	0	1	\N
對了	duì le	certo	10	1	45
衣柜	yì guì	armário	0	1	44
承受	chéng shòu	suportar	25	1	24
的力量	de lì liàng	força	0	1	54
馬里亞娜	Mǎ lǐ yà nà	Mariana	0	1	33
妮蒂	nī dì	Nidu	0	1	14
勇敢	yǒng gǎn	corajoso	9	1	33
女寶	nǚ bǎo	bebê menina	0	1	33
老太太	lǎo tài tai	senhora idosa	4	1	34
九點	jiǔ diǎn	nove horas	0	1	33
托兒所	tuō ér suǒ	creche	2	1	12
彩色	cǎi sè	colorido	5	1	34
鉛筆	qiān bǐ	lápis	6	1	13
幸亏	xìng kuī	graças a	0	1	41
投訴	tóu sù	reclamação	25	1	24
巨大	jù dà	enorme	11	1	44
櫃	guì	armário	3	1	\N
那邊	nà biān	lá	105	1	41
Judite	Judite	Judite	0	1	\N
皂	zào	sabão	2	1	\N
預約	yù yuē	agendamento	46	1	41
洗澡	xǐ zǎo	tomar banho	13	1	33
尋	xún	buscar	30	1	\N
PSIU	pī suí wū	PSIU	0	1	12
困扰	kǔ nǎo	perturbar	0	1	33
兩年	liǎng nián	dois anos	0	1	32
手提包	shǒu tí bāo	bolsa	0	1	32
猶底	yóu dǐ	por quê	0	1	23
起床	qǐ chuáng	levantar	12	1	32
肥	féi	gordo	3	1	\N
壞	huài	ruim	56	1	\N
打開	dǎ kāi	abrir	21	1	31
拿起	nǐqǐ	levantar	0	1	\N
携	xié	levar	0	1	\N
發生了	fā shēng le	aconteceu	21	1	11
什麼事	shén me shì	que coisa	77	2	25
以來	yǐ lái	desde então	16	1	32
經常	jīng cháng	frequentemente	9	1	12
條件	tiáo jiàn	condição	17	1	24
馬利安娜	Mǎ Lìnián nà	Mariana	0	1	34
棒	bàng	excelente	88	1	\N
不在	bù zài	não estar	8	1	44
非	fēi	não	130	2	\N
这	zhè	este	9	1	\N
棄	qì	abandonar	21	1	\N
普	pǔ	geral	10	1	\N
MARIANA		Mariana	0	1	\N
私	sī	privado	32	1	\N
朱蒂	Zhū dì	Júdi	0	1	14
復原	fù yuán	restaurar	0	1	42
吃飽	chī bǎo	comer até ficar cheio	1	1	13
學生	xué shēng	estudante	17	1	21
空白	kòng bái	em branco, vazio	7	1	42
舊	jiù	velho	10	1	\N
伴郎	bàn láng	padrinho	0	1	42
伴娘	bàn niáng	madrinha	0	1	42
鋼琴	gāng qín	piano	16	1	12
乳腺	xiàng jiān	mama	1	1	41
分泌	fēn mì	secreção	0	1	14
幸福	xìng fú	feliz	43	1	42
句	jù	frases	18	1	\N
共	gòng	juntos	12	1	\N
妹	mèi	irmã	5	1	\N
为	wèi	por	0	1	\N
寢	qǐn	dormir	0	1	\N
哺乳	bǔrǔ	amamentar	2	1	\N
milk	nǎi	leite	0	1	\N
我们	wǒmen	nós	0	1	\N
试试	shìshì	tentar	0	1	\N
不了	bù liǎo	não poder	28	1	43
而別	ér bié	partir sem se despedir	0	1	22
查看	chá kàn	verificar	5	1	24
取笑	qǔ xiào	fazer troça	0	1	34
怪物	guài wu	monstro	1	1	45
有助	yǒu zhù	ajuda	0	1	34
生中	shēng zhōng	na vida	0	1	11
這一	zhè yī	este	22	1	41
儘管	jǐn guǎn	embora	36	1	33
之類的	zhī lèi de	e assim por diante	2	1	14
職能	zhí néng	função	0	1	22
JAIME		Jaime	0	1	\N
安靜	ān jìng	silêncio	31	1	14
同	tóng	juntos	49	1	\N
時刻	shí kè	momento	58	1	24
助理	zhù lǐ	assistente	127	1	43
正常	zhèng cháng	normal	42	1	42
不同	bù tóng	diferente	32	1	42
遍	biàn	difundido	2	1	\N
短	duǎn	curto	15	1	\N
益	yì	benefício	0	1	\N
parte	parte	parte	0	1	\N
公平	gōng píng	justo	14	1	12
試試	shì shì	tente	24	1	44
母乳	mǔ rǔ	leite materno	2	1	33
銀行	yín háng	banco	9	1	22
擔	dān	carregar	18	1	\N
漂亮	piào liàng	bonita	100	2	44
瞧	qiáo	veja	27	1	\N
牛	niú	vaca	5	1	\N
奶	nǎi	leite	3	1	\N
擁	yōng	ter	47	1	\N
願望	yuàn wàng	desejo	4	1	44
漂亮的	piàoliang de	bonita	0	1	45
不得不	bù dé bù	ter que	22	1	42
地面	dì miàn	chão	12	1	44
朱麗葉	Zhū Lìyè	Julieta	0	1	14
收藏	shōu cáng	coleção	5	1	12
掉了	diào le	vendi	1	1	45
也就是說	yě jiù shì shuō	isto é	4	1	34
劳	láo	trabalho	0	1	\N
媽	mā	mãe	143	3	\N
向	xiàng	para	172	1	\N
道歉	dàoqiàn	pedir desculpas	41	1	\N
只是	zhǐ shì	só que	342	2	34
最好	zuì hǎo	melhor	132	2	43
會議	huì yì	reunião	30	1	44
燒	shāo	queimar	7	1	\N
哮	xiào	uivar	0	1	\N
吠	fèi	latir	11	1	\N
既	jì	tanto	31	1	\N
姐姐	jiě jie	irmã mais velha	27	1	35
娜伊	Nà Yī	Nai	0	1	41
無語	wú yǔ	sem palavras	3	1	23
什么	shénme	o quê	3	1	\N
產後	chǎn hòu	pós-parto	0	1	34
頭	tóu	cabeça	54	1	\N
類似	lèi sì	similar	2	1	44
辦公室	bàn gōng shì	escritório	45	1	41
談談	tán tán	conversar	174	2	22
孤單	gū dān	solitário	10	1	11
的朋友	de péng yǒu	dos amigos	4	1	52
整理	zhěng lǐ	organizar	22	1	33
薩拉	Sàlā	Sara	2	1	\N
并	bìng	e	2	1	\N
depression	depression	depressão	0	1	\N
按照	àn zhào	de acordo com	3	1	44
我要	wǒ yào	eu vou	10	1	34
白痴	bái chī	idiota	17	1	21
也就是	yě jiù shì	isto é	4	1	34
街道	jiē dào	rua	9	1	14
防禦	fáng yù	defesa	0	1	24
害羞	xiū huài	tímido	0	1	14
主	zhǔ	Senhor	50	1	\N
一大	yī dà	muito	2	1	14
滿意	mǎn yì	satisfeita	10	1	34
是否	shì fǒu	se	111	2	43
X的	X de	obsceno	0	1	55
馬麗娜	Mǎ Lí nà	Marina	0	1	32
重要	zhòng yào	importante	116	1	44
抱怨	bào yuàn	reclamar	31	1	44
幾	jǐ	algumas	103	2	\N
午	wǔ	meio-dia	7	1	\N
投	tóu	investir	1	1	\N
jokes	jokes	piadas	0	1	\N
傑麥	jié mài	Jack Ma	0	1	24
信任	xìn rèn	confiar	33	1	44
幼兒	yòu ér	criança	0	1	42
喜	xǐ	gostar	37	1	\N
回家	huí jiā	voltar para casa	70	2	21
剩	shèng	restar	5	1	\N
泰米	tài mǐ	Tammy	0	1	43
真是	zhēn shì	realmente é	292	2	14
香煙	xiāng yān	incenso	12	1	11
记	jì	lembrar	0	1	\N
謊言	huǎng yán	mentira	26	1	32
大堂	dà táng	hall	0	1	42
很快	hěn kuài	logo	28	1	34
瑟拉蒂娜	sè lā dì nà	Serradina	0	1	41
不及	bù jí	não conseguir	5	1	42
jalmir	pinyin não encontrado	Jalmir	0	1	55
前往	qián wǎng	para	3	1	23
天氣	tiān qì	clima	11	1	14
對吧	duì ba	certo	574	3	45
走廊	zǒu láng	corredor	2	1	32
睡著	shuì zháo	adormecer	6	1	42
昨天	zuó tiān	ontem	47	1	21
公主	gōng zhǔ	princesa	7	1	13
歡	huān	gostar	38	1	\N
嬰	yīng	bebê	4	1	\N
变态	bi àn	pervertido	0	1	54
愚蠢	yú chǔn	estúpido	15	1	23
得了	dé le	contraiu	9	1	25
特倫馬	tè lún mǎ	Trelonma	0	1	42
夢想	mèng xiǎng	sonho	36	1	43
更好	gèng hǎo	melhor	41	1	43
dedication	dédānshì	dedicação	1	1	\N
切	qiè	tudo	48	1	\N
进行	jìnxíng	realizar	0	1	\N
boss	bōsī	chefe	2	1	\N
可怕	kě pà	terrível	37	1	34
堂	táng	aula	30	1	\N
粉紅色	fěn hóng sè	rosa	0	1	32
戶外	hù wài	ao ar livre	1	1	44
睡覺	shuì jiào	dormir	41	1	44
育	yù	procriar	8	1	\N
患有	huàn yǒu	sofre de	1	1	43
濕疹	shī zhěn	eczema	0	1	13
取消	tǎo xiāo	cancelamento	13	1	31
在家裡	zài jiā lǐ	em casa	8	1	41
焦慮	jiāo lǜ	ansiedade	8	1	14
的小	de xiǎo	do(a) meu(minha)	7	1	53
饒了	ráo le	poupe	0	1	25
低聲	dī shēng	em voz baixa	2	1	11
謝娜	xiè nà	Xie Na	0	1	44
姐妹	jiě mèi	irmãs	24	1	34
差點	chà diǎn	quase	9	1	43
廣播	guǎng bō	transmissão, radiodifusão	15	1	31
兄弟	xiōng dì	irmão	166	1	14
驚	jīng	surpreender	32	1	\N
甜	tián	doce	5	1	\N
講	jiǎng	falar	28	1	\N
彼此	bǐ cǐ	um ao outro	16	1	33
nervous	nervous	nervoso	2	1	\N
腦	nǎo	cérebro	7	1	\N
措	cuò	medida	0	1	\N
探	tàn	detetive	17	1	\N
bye, bye, bye		bye, bye, bye	0	1	\N
售	shòu	vender	5	1	\N
狀況	zhuàng kuàng	situação	23	1	44
哨	shào	apito	4	1	\N
任何事	rèn hé shì	qualquer coisa	16	1	42
什麼都	shén me dōu	nada	4	1	25
魔法	mó fǎ	magia	4	1	23
有趣	yǒu qù	interessante	31	1	34
怎麼樣	zěn me yàng	como está	150	3	35
寧靜	níng jìng	tranquilidade	10	1	24
魂	hún	alma	1	1	\N
朝上	cháo shàng	para cima	0	1	24
維納	wēi nà	Weiner	0	1	14
抑郁	yì yù	depressão	0	1	44
想像	xiǎng xiàng	imaginar	84	2	34
妹妹	mèi mei	irmã mais nova	57	1	45
取	qǔ	pegar	11	1	\N
過去	guò qù	ir	79	1	44
近	jìn	perto	20	1	\N
剛	gāng	recém	66	1	\N
此	cǐ	isto	194	2	\N
真的	zhēn de	realmente	460	3	15
Sherman	謝爾曼	Sherman	0	1	\N
咕嚕聲	gū lū shēng	grunhido	0	1	11
情緒	qíng xù	emoção	12	1	24
澀	sè	seco	2	1	\N
事件	shì jiàn	evento	15	1	44
concrete	kǎn tè nèi	concreto	0	1	34
都不確定	dōu bù què suǒ	não tenho certeza	0	1	14
簽署	qiān shǔ	assinar	21	1	13
釋放	shì fàng	liberar	14	1	44
戴托拉馬塔	dài tuō lā mǎ tà	Detolamata	0	1	41
管理	guǎn lǐ	gerenciamento	3	1	33
跟著	gēn zhe	seguir	4	1	15
坐	zuò	sente-se	85	3	\N
賈梅	jiǎ méi	Jia Mei	8	1	32
呼	hū	sopro	7	1	\N
經歷	jīng lì	passar por	73	1	14
也不	bù yě	também não	62	1	43
混	hùn	passar tempo/sair	3	1	\N
螢幕	yíng mù	tela	4	1	24
延遲	yán chí	atrasar	4	1	22
文件	wén jiàn	documento	39	1	24
維拉	wéi lā	Vera	18	1	21
瑟莉娜	sè lì nà	Serena	0	1	44
塔米亞	tǎ mǐ yà	Tamia	0	1	33
放棄了	fàng qì le	desistiu de	1	1	44
遲疑	chí yí	hesitação	0	1	22
偶然	ǒu rán	acidentalmente	6	1	32
呈現	chéng xiàn	apresentar	1	1	24
稍	shāo	ligeiramente	36	1	\N
況	kuàng	condição	5	1	\N
慢	màn	devagar	40	1	\N
求	qiú	imploro	102	1	\N
五	wǔ	cinco	59	1	\N
瑟西塔	sè xī tǎ	Sertisa	1	1	41
聯絡	lián luò	entrar em contato	4	1	24
塔索·蒙泰羅	Tǎ suǒ méng tè luó	Tasso Montelro	0	1	33
話題	huà tí	tópico	35	1	42
尊敬	zūn jìng	respeito	9	1	14
產	cǎn	propriedade	29	1	\N
clinic	klinik	clínica	0	1	\N
談話	tán huà	conversa	49	1	24
度假	dù jià	férias	5	1	44
幅	fú	medida para pinturas	4	1	\N
經歷了	jīng lì le	passou por	10	1	14
擔憂	dān yōu	preocupar	9	1	11
超過	chāo guò	mais de	30	1	14
抑鬱	yì yù	depressão	8	1	44
保羅	bǎo luó	Paulo	1	1	32
更長	gèng cháng	mais longo	0	1	42
家族	jiā zú	família	13	1	12
出院	chū yuàn	alta hospitalar	15	1	14
不需要	bù xū yào	não precisa	22	1	41
微	wēi	ligeiro	14	1	\N
變化	biàn huà	mudança	21	1	44
嚴	yán	severo	2	1	\N
情	qíng	sentimento	61	1	\N
不信	bù xìng	não acreditar	2	1	44
關注	guān zhù	foco	12	1	14
詹	zhān	chamar	4	1	\N
姆斯	mǔsī	senhor	1	1	\N
常規	cháng guī	rotina	9	1	21
窗台	chuāng tái	janela	0	1	12
元素	yuán sù	elemento	3	1	24
深刻	shēn kè	profundo	0	1	14
啟動	qǐ dòng	iniciar	19	1	34
測試	cè shì	teste	16	1	44
隨	suí	seguir	88	1	\N
臥室	wò shì	quarto	4	1	44
先生	xiān sheng	senhor	235	2	15
信賴	xìnlài	confiará	3	1	\N
則	zé	então	76	2	\N
評估	píng gū	avaliar	11	1	21
編造	biān zào	inventar	9	1	14
的事實	de shìshí	fato	5	1	54
分裂	fēn liè	dividir	1	1	14
畫面	huà miàn	cena	1	1	44
存在	cún zài	existir	79	1	24
隔離	gé lí	isolamento	5	1	22
發明	fā míng	inventar	6	1	12
戀愛	liàn ài	apaixonar-se	18	1	44
安全	ān quán	segurança	37	1	12
怎麼做	zěn me zuò	como fazer	0	1	35
莉莉安	Lí Lí Ān	Lillian	4	1	22
談論	tán lùn	discutir	48	1	24
小聲	xiǎo shēng	baixo	11	1	31
daughter	nǚ ér	filha	21	1	32
鮑	bào	baiacu	0	1	\N
據	jù	de acordo	18	1	\N
突	tū	súbito	9	1	\N
Jaime	Jaime	Jaime	8	1	\N
印	yìn	selo	35	1	\N
過程	guò chéng	processo	50	1	42
所稱	suǒ chēng	chamado	0	1	31
鮑伯	Bào bō	Bob	0	1	41
哺	bǔ	amamentar	0	1	\N
乳	rǔ	leite	2	1	\N
許可	xǔ kě	permissão	3	1	33
再見	zài jiàn	adeus	115	2	44
不太	bù tài	não muito	29	1	44
親自	qīn zì	pessoalmente	18	1	14
搞	gǎo	fazer	56	1	\N
期	qī	período	10	1	\N
選擇	xuǎn zé	escolha	83	1	32
房子	fáng zi	casa	109	2	25
媳	xíf	cunhada	0	1	\N
弟	dì	irmão mais novo	11	1	\N
精	jīng	espermatozoide	17	1	\N
浪	làng	onda	0	1	\N
遊戲	yóu xì	jogo	13	1	24
這段	zhè duàn	este pedaço	16	1	44
出色	chū sè	destacado/excelente	6	1	14
私奔	sī bēn	fugir juntos	0	1	11
高斯	Gāo Sī	Gauss	0	1	11
她們	tā men	elas	30	1	15
婦女	fù nǚ	mulher	2	1	43
評判	píng pàn	julgar	11	1	24
嫂子	sǎo zi	cunhada	0	1	35
組	zǔ	grupo	3	1	\N
狗	gǒu	cachorro	19	1	\N
故事	gù shi	história	116	1	45
使	shǐ	fazer	45	1	\N
賈	Jia	Jia	14	1	\N
海	hǎi	mar	18	1	\N
假	jiǎ	falso	82	1	\N
消沉	xiāochén	deprimido	2	1	\N
安娜	ān nà	Ana	1	1	14
升遷	shēngqiān	promoção	0	1	\N
墅	shù	villa	0	1	\N
朱迪特	Zhūdìtè	Judith	1	1	\N
內衣	nèiyī	roupa íntima	0	1	\N
的一切	quán jié	tudo	4	1	22
逃走	táo zǒu	fugir	2	1	23
里約	lǐ yuē	Rio (de Janeiro)	20	1	31
發現	fā xiàn	descobrir	104	1	14
耐心	nài xīn	paciência	24	1	41
裡面	lǐ miàn	dentro	22	1	34
進去	jìn qù	entrar	44	1	44
文字	wén zì	texto	4	1	24
奮	fèn	entusiasmo	9	1	\N
所做	suǒ zuò	feito	0	1	34
猶太	yōu tài	judeu	1	1	14
吹風機	chuī fēng jī	secador de cabelo	0	1	11
拿出	nà chū	tirar	0	1	41
cris	cris	cris	2	1	\N
瑪	mǎ	má (parte do nome)	46	1	\N
在这里	zài zhè lǐ	aqui	3	1	44
棟	dòng	(classificador para edifícios)	13	1	\N
客	kè	hóspede	42	1	\N
記得	jì dé	lembrar	104	2	42
興奮	xīng fèn	animado/entusiasmado	28	1	14
勇	yǒng	corajoso	5	1	\N
bedroom	bedroom	quarto	0	1	\N
抽	chōu	puxar	9	1	\N
屜	chǔ	gaveta	2	1	\N
感謝	gǎn xiè	agradecer	130	1	34
護理	hù lǐ	cuidado	8	1	43
關於	guān yú	sobre	161	1	12
偷腥	tōu xīng	não cometi atos impróprios	0	1	11
觸摸	chù mō	tocar	6	1	41
碰觸	pèng chǔ	tocar	0	1	43
做愛	zuò ài	fazer amor	9	1	44
回	huí	vez	146	2	\N
興	xìng	alegre	20	1	\N
hospital	yuàn	hospital	0	1	\N
休息	xiū xí	descansar	83	1	12
...		...	9	1	\N
曬	shài	secar	1	1	\N
屎	shǐ	fezes	1	1	\N
猶	yóu	ainda	1	1	\N
停下來	tíng xià lái	parar	27	1	24
假期	jià qī	férias	4	1	41
敏感	měi gǎn	sensível	2	1	33
嫉妒	jí dù	invejar	32	1	24
談過	tán guò	conversamos	5	1	24
馬麗安娜	Mǎ Lì'ān nà	Maria Ana	10	1	34
馬里阿娜	Mǎ lǐ ā nà	Mariana	9	1	33
記	jì	anotar	74	1	\N
Panties	pāntī	calcinhas	4	1	\N
管	guǎn	cuidar	27	1	\N
影響	yǐng xiǎng	influência	68	1	33
幾乎	jī hū	quase	51	1	11
谷歌	Google	Google	0	1	\N
桌	zhuō	mesa	4	1	\N
喊	hǎn	gritar	20	1	\N
抓住	zhuā zhù	agarrar	22	1	14
總算	zǒng suàn	finalmente	2	1	34
幽默	yōu mò	humor	2	1	14
困惑	kùn huò	confuso	15	1	44
都不是	dōu bú shì	não é	0	1	12
我不知道	wǒ bù zhī dào	eu não sei	6	1	34
么	me		2	1	\N
大叫	dà jiào	gritar	3	1	44
楚	chǔ	claro	3	1	\N
碧	bì	jade	9	1	\N
夜班	yè bān	turno noturno	1	1	41
背叛	bèi pàn	trair	8	1	44
忘	wàng	esqueci	68	1	\N
結束	jié shù	terminar	144	1	24
閒	xián	ocioso	9	1	\N
哎呀	āi yā	ai	211	1	11
擔心	dān xīn	preocupar-se	83	1	11
什	shén	que	21	1	\N
麥	mài	trigo	2	1	\N
憶	yì	lembrar	1	1	\N
安東尼亞	āndōngnià	Antónia	0	1	\N
親愛	qīn ài	querido	13	1	14
藍色	lán sè	azul	0	1	24
電報	diàn bào	telegrama	0	1	44
你是	nǐ shì	você é	2	1	34
回答	huí dá	responder	9	1	22
熟	shú	maduro	9	1	\N
不用	bú yòng	não precisa	45	1	24
已	yǐ	já	101	2	\N
靠	kào	depender	64	1	\N
娃	wá	bebê	2	1	\N
澡	zǎo	banho	19	1	\N
祝	zhù	desejar	61	1	\N
譯文	yì wén	tradução	64	1	42
杯	bēi	copo	79	2	\N
士	shì	pessoa	9	1	\N
撞	zhuàng	bater/colidir	18	1	\N
專	zhuān	profissional	0	1	\N
業	yè	indústria	37	1	\N
謙	qiān	humilde	3	1	\N
機器	jī qì	máquina	14	1	14
夜晚	yè wǎn	noite	32	1	43
薩	sà	Sa (parte do nome)	15	1	\N
否認	fǒu rèn	negar	7	1	34
理由	lǐ yóu	razão	47	1	32
說謊	shuō huǎng	mentir	21	1	13
窗	chuāng	janela	8	1	\N
十五	shí wǔ	quinze	8	1	23
瑟西	sè xī	Ceres	2	1	41
常見	cháng jiàn	comum	8	1	24
隻	zhī	classificador para animais	28	1	\N
譯者	yì zhě	tradutor	7	1	43
貝殼	bèi qiào	concha	0	1	44
第八	dì bā	oitavo	0	1	41
娃娃	wá wa	boneca	7	1	25
關係	guān xì	relacionamentos	106	1	14
長大	zhǎng dà	crescer	12	1	34
朱	zhū	Judy	0	1	\N
迪	dí	Di	9	1	\N
容	róng	conter	2	1	\N
殼	qiào	casca	4	1	\N
層	céng	camada	25	1	\N
瑟西娜	sè xī nà	Sercina	0	1	41
深深	shēn shēn	profundo	64	1	11
嘆了口氣	tàn le kǒu qì	suspirou	0	1	45
了一個	le yī gè	um	0	1	51
入侵	rù qīn	invadiram	4	1	41
可怕的	kě pà de	terrível	6	1	34
方便	fāng biàn	conveniente	18	1	14
度過	dù guò	passar (tempo)	11	1	44
生病	shēng bìng	ficar doente	12	1	14
共處	gòng chǔ	coexistir	1	1	43
另	lìng	outra	40	1	\N
蒂	dì	talo	44	1	\N
置	zhì	colocar	2	1	\N
累	lèi	cansado	47	1	\N
難	nán	difícil	108	1	\N
哦	ò	oh	406	2	\N
談	tán	falar	209	1	\N
的事情	de shì qing	coisas	11	1	54
良好	liáng hǎo	bom	24	1	23
通知	tōng zhī	avisar	65	1	11
信	xìng	acreditar	30	1	\N
制	zhì	sistema	19	1	\N
承	chéng	compromisso	11	1	\N
朱迪思	Zhū Dí Sī	Judith	0	1	12
早上	zǎo shang	manhã	35	1	35
提前	tí qián	adiantar	11	1	22
弗蘭	fú lán	Franklin	0	1	22
personal	pārsonāl	pessoal	0	1	\N
怎麼了	zěn me le	o que houve	119	3	35
鳴叫	míng jiào	canto	2	1	24
車子	chē zi	carro	4	1	15
健身房	jiàn shēn fáng	academia	17	1	41
瑪麗安娜	Mǎ lì ān nà	Mariana	29	1	34
馬里安娜	Mǎ Lí'Ān nà	Mariana	1	1	32
訪	fǎng	visitar	3	1	\N
老	lǎo	velha	338	3	\N
街	jiē	rua	11	1	\N
電話	diàn huà	telefone	322	3	44
哪裡	nǎ lǐ	onde	188	3	33
人員	rén yuán	pessoal	63	1	22
你好	nǐ hǎo	olá	52	1	33
不錯	bú cuò	boa	45	1	24
推	tuī	empurrar	7	1	\N
放	fàng	colocar	182	1	\N
鎖	suǒ	trancar	13	1	\N
紐	niǔ	cordão	17	1	\N
慧	huì	sabedoria	0	1	\N
歌	gē	canção	36	1	\N
律	lǜ	lei	0	1	\N
鋼	gāng	aço	0	1	\N
琴	qín	instrumento musical	0	1	\N
來自	lái zì	de/provir de	105	2	24
窗戶	chuāng hù	janela	10	1	14
譚美	tán měi	Tammy	1	1	23
想法	xiǎng fǎ	ideia	35	1	33
蛋白質	dàn bái zhí	proteína	5	1	42
馬路	mǎ lù	estrada	2	1	34
邊上	biān shàng	ao lado	0	1	14
瘋	fēng	louco	32	1	\N
戶	hù	registro	8	1	\N
貝	bèi	pérola	61	1	\N
這麼	zhè me	tão	342	2	45
蘭	lán	orquídea	70	1	\N
兄	xiōng	irmão mais velho	20	1	\N
唱歌	chàng gē	cantar	25	1	41
穿	chuān	vestir	46	1	\N
丫	yā	dedo do pé	0	1	\N
唱	chàng	cantar	21	1	\N
退	tuì	aposentar	7	1	\N
锁	suǒ	tranca	0	1	\N
LILIAN	LILIAN	LILIAN	0	1	\N
TELMA	TELMA	TELMA	4	1	\N
傻子	shǎ zi	tolo	0	1	35
喊道	hǎn dào	gritou	0	1	34
疫情	yì qíng	pandemia	0	1	42
嬰兒	yīng ér	bebê	42	1	12
很漂亮	hěn piàoliang	muito bonita	1	1	34
莉安	Lǐ ān	Ana	32	1	31
啟	qǐ	revelação	18	1	\N
的時候	de shí hou	quando	29	1	52
圖	tú	desenho	23	1	\N
丽	lì	lily	0	1	\N
莲	lián	lótus	0	1	\N
輛	liàng	medida para veículos	30	1	\N
米	mǐ	arroz	7	1	\N
紅	hóng	vermelho	27	1	\N
護	hù	cuidado	12	1	\N
哈囉	hā luó	olá	48	1	12
娜	nà	Ana	41	1	\N
唔	wú	hum	8	1	\N
救	jiù	salvamos	42	1	\N
doctors	doctors	médicos	0	1	\N
找到了	zhǎo dào le	encontrado	6	1	34
波	bō	onda	13	1	\N
蟋蟀	xī shuài	grilo	33	1	14
沃	wò	Vo	1	1	\N
髮	fā	cabelo	0	1	\N
哪里	nǎ lǐ	onde	0	1	33
兌現	duì xiàn	cumprir	1	1	44
Panty	pán tí	calcinha	1	1	22
體操	tǐ cāo	ginástica	7	1	31
猶太人	yóu tài rén	judeu	5	1	24
警	jǐng	polícia	9	1	\N
別人	bié rén	outras pessoas	45	1	22
古斯塔沃	Gǔ Sù Tǎ Wò	Gustavo	14	1	34
保羅琳	Bǎo Luó Lín	Paulo Lin	0	1	32
琳娜	lín nà	Lína	0	1	24
有一段時間	yǒu yī duàn shíjiān	um tempo	0	1	31
亞當	Yà dāng	Adão	0	1	41
喇叭	lǎ ba	buzina	14	1	35
門口	mén kǒu	entrada, portão	11	1	23
瑰	guī	joia	0	1	\N
大聲	dà shēng	alto	10	1	41
搬	bān	mudar-se	23	1	\N
移動	yí dòng	mover	1	1	24
戈	gē	arma	4	1	\N
Paulinha	pāulīn	Paulinha	0	1	\N
甲	jiǎ	jia	12	1	\N
費	fèi	custar	16	1	\N
那個	nà ge	aquele	293	3	45
報	bào	relatar	12	1	\N
絲	sī	fio	111	1	\N
樣子	yàng zi	aparência	60	1	45
回來	huí lái	voltar	113	3	22
看到	kàn dào	ver	302	2	44
拜託	bài tuō	por favor	211	2	41
伴	bàn	acompanhar	417	1	\N
襪	wà	meia	0	1	\N
奏	zòu	tocar	400	1	\N
站	zhàn	ficar	46	1	\N
預測	yù cè	previsões	9	1	44
附近	fù jìn	proximidade	23	1	44
特爾馬	Tè ěr mǎ	Tâmera	1	1	43
一個月	yī gè yuè	um mês	2	1	14
保罗	Bǎo luò	Paulo	2	1	34
女儿	nǚ ér	filha	0	1	32
特尔玛	tè ěr mǎ	Thérèse	0	1	43
回應	huí yìng	responder	10	1	24
泰爾馬	Tài ěr mǎ	Thérèse	1	1	43
緊	jǐn	apertado	15	1	\N
限	xiàn	limitar	7	1	\N
歸	guī	pertencer a	33	1	\N
花	huā	flores	85	2	\N
極	jí	extremamente	20	1	\N
那裡	nà lǐ	lá	260	3	43
又	yòu	e/ainda	309	2	\N
達	dá	Da (parte do nome)	119	1	\N
鑰	yuè	chave	0	1	\N
匙	shi	chave	0	1	\N
斯塔	stā	estrela	0	1	\N
田	tián	campo	17	1	\N
更衣室	gēng yī shì	vestiário	0	1	11
各種	gè zhǒng	vários tipos	7	1	43
抓	zhuā	agarrar	24	1	\N
喜欢	xǐ huān	gostar	22	1	31
文本	wén běn	texto	7	1	23
塊	kuài	yuans	44	1	\N
的眼淚	de yǎn lèi	das lágrimas	0	1	53
種植	zhòng zhí	cultivo	0	1	42
具體	jù tǐ	específico	5	1	43
向上	xiàng shàng	ascendente	4	1	44
角落	jiǎo luò	canto	3	1	34
只能	zhǐ néng	só pode	12	2	32
取下	qǔ xià	remover	0	1	34
喘	chuǎn	respirar	21	1	\N
Fatima	Fatima	Fatima	0	1	\N
月亮	yuè liàng	lua	3	1	44
稍微	shāo wēi	um pouco	62	1	11
種子	zhǒng zi	semente	0	1	35
春藥	chūn yào	afrodisíaco	0	1	14
內容	nèi róng	conteúdo	11	1	42
瑩瑩	yíng yíng	yíng yíng	0	1	22
患者	huàn zhě	pacientes	13	1	43
恭喜	gōng xǐ	parabéns	82	1	13
世界的	shì de zhōng de	do mundo	0	1	45
各個	gè gè	cada	1	1	44
不過	bù guò	no entanto	64	1	44
路易斯	lù yì sī	Luís	-124	1	44
起來	qǐ lái	levantar	176	2	32
容易	róng yì	fácil	67	1	24
持	chí	sustentar	18	1	\N
習	xí	praticar	12	1	\N
斷	duàn	quebrado	35	1	\N
太陽	tài yáng	sol	2	1	42
偏	piān	tendendo a	28	1	\N
日食	rì shí	comer diariamente	1	1	42
該死的	gāi sǐ de	maldito	22	1	13
赤裸	chì luǒ	nu	0	1	43
全身	quán shēn	corpo inteiro	20	1	21
處女	chǔ nǚ	virgem	13	1	33
活	huó	viver	373	2	\N
等等	děng děng	et cetera	108	1	33
反應	fǎn yìng	reagir	18	1	34
快	kuài	rápido	282	2	\N
噢	ō	oh	214	1	\N
月	yuè	mês	72	2	\N
轟動	hōngdòng	sensação	0	1	\N
年	nián	anos	145	3	\N
衣	yī	roupa	10	1	\N
兒童	ér tóng	crianças	13	1	22
檢	jiǎn	teste	6	1	\N
三	sān	três	97	3	\N
良性	liáng xìng	benigno	0	1	24
惡性	è xìng	maligno	0	1	44
活檢	huó jiǎn	biópsia	0	1	23
以為	yǐ wéi	pensei	173	2	32
癌症	ái zhèng	câncer	8	1	24
電子	diàn zǐ	eletrônico	29	1	43
蘇打	sū dǎ	bicarbonato	0	1	13
連續	lián xù	contínuos	5	1	24
不幸地	bù xìng de	infelizmente	0	1	44
模範	mó fàn	modelo	0	1	24
辯論	biàn lùn	debate	0	1	44
優先	yōu xiān	prioridade	2	1	11
統計	tǒng jì	estatísticas	2	1	34
宽容度	kuāng róng dù	tolerância	0	1	12
排	pái	fila	3	1	\N
兩個	liǎng gè	duas	103	3	34
意	yì	significado	85	1	\N
本	běn	originalmente	64	1	\N
末	mò	final	0	1	\N
球	qiú	bola	47	1	\N
鳴	míng	canto	15	1	\N
腺	xiàn	glândula	4	1	\N
蜂	fēng	abelha	2	1	\N
阿夫蘭紐	āfúlánniǔ	Afranio	0	1	\N
巴西	bā xī	Brasil	20	1	11
嬰幼兒	yīng yòu ér	infantil	0	1	14
死亡	sǐ wáng	morte	31	1	32
求求	qiú qiú	imploro	3	1	22
幸运	xìng yùn	sorte	0	1	44
外交	wài jiāo	diplomacia	1	1	41
美味	měi wèi	delicioso	18	1	34
印度支那	Yìndù zhī nà	Indochina	0	1	41
靈魂操作	líng hún cuò zuò	operação da alma	0	1	22
決定	jué dìng	decidir	167	1	24
注射	zhù shè	injetar	2	1	44
功課	gōng kè	lição de casa	0	1	14
每	měi	cada	109	2	\N
酒店	jiǔ diàn	hotel	14	1	34
apartment	apartment	apartamento	5	1	\N
莹	yíng	brilhante	68	1	\N
即使	jí shǐ	mesmo que	53	1	23
同意	tóng yì	consentir	66	1	24
得很	de hěn	muito	29	1	53
阿塔維奧		ā tà wēi au: Ataúlio	0	1	\N
們	men	partícula plural	130	3	\N
譯	yì	traduzir	96	1	\N
文	wén	dinheiro	112	1	\N
必	bì	necessariamente	97	2	\N
須	xū	deve	42	1	\N
高溫	gāowēn	alta temperatura	0	1	\N
官	guān	oficial	3	1	\N
諾	nuò	prometer	11	1	\N
咳	ké	tosse	0	1	\N
表示	biǎo shì	indica	16	1	34
小時	xiǎo shí	horas	59	2	32
油	yóu	óleo	6	1	\N
媒體	méi tǐ	mídia	7	1	23
恐慌	kǒng huāng	pânico	2	1	31
以及	yǐ jí	bem como	41	1	32
批	pī	lote	3	1	\N
順便	shùn biàn	por acaso	30	1	44
市場	shì chǎng	mercado	23	1	43
選	xuǎn	escolher	10	1	\N
愉快	yú kuài	agradável, prazeroso	30	1	24
solemnemente	sōng mèn jìng	solenemente	0	1	14
出了	chū le	saiu	2	1	15
特別	tè bié	especial	28	1	42
晚餐	wǎn cān	jantar	51	1	31
定居	dìng jū	morar fixo	0	1	41
有什麼	yǒu shén me	o que há	1	1	32
幕	mù	cortina	40	1	\N
終	zhōng	fim	80	1	\N
支付	zhī fù	pagar	37	1	14
斯	sī	este	224	1	\N
通	tōng	passar	23	1	\N
錢	qián	dinheiro	144	3	\N
一家	yī jiā	uma clínica	34	1	11
媒	méi	médium	0	1	\N
思	sī	pensar	20	1	\N
萬	wàn	dez mil	90	1	\N
MARTA	MARTA	MARTA	11	1	\N
北京	Běijīng	Pequim	0	1	\N
鵝	é	ganso	1	1	\N
這樣的	zhèyàng de	assim	7	1	45
納	nà	aceitar	21	1	\N
念	niàn	recitar	15	1	\N
詞	cí	palavra	13	1	\N
尽	jìn	esforçar	0	1	\N
請問	qǐng wèn	por favor, pergunte	19	1	34
sorrow	sāng	tristeza	0	1	\N
列	liè	listar	2	1	\N
總之	zǒng zhī	em resumo	6	1	31
結束了	jié shù le	terminei	2	1	24
緊急	jǐn jí	urgente	28	1	32
挑	tiāo	escolher	2	1	\N
之前	zhī qián	antes	97	1	12
許多	xǔ duō	muitos	37	1	31
隊伍	duì wǔ	fila	0	1	43
公立	gōng lì	público	2	1	14
心靈	xīn líng	coração	21	1	12
recente	rè xīn	recente	0	1	41
年代	nián dài	era	3	1	24
生產	shēng chǎn	produção	3	1	13
弗	fú	não	29	1	\N
瑟翠絲塔	sè cuì sī tǎ	Sertsisita	0	1	44
不存在	bù cún zài	não existe	7	1	42
等待	děng dài	esperar	49	1	34
痛	tòng	dor	57	1	\N
這件事	zhè jiàn shì	este assunto	6	1	44
異	yì	variar	5	1	\N
每個	měi gè	cada	73	1	34
奇怪	qí guài	estranho	42	1	24
常	cháng	frequente	149	2	\N
翠	cuì	esmeralda	3	1	\N
典	diǎn	graça	2	1	\N
[雷諾托]	léinuòtuō	[Renault]	0	1	\N
好吧	hǎo ba	ok	156	2	35
担心	dānxīn	preocupar	9	1	\N
易	yì	fácil	19	1	\N
煤	méi	carvão	0	1	\N
議	yì	discussão	0	1	\N
磚	brán	tijolo	0	1	\N
疼	téng	doer	9	1	\N
病人	bìng rén	paciente	104	1	42
信仰	xìn yǎng	fé	6	1	43
柴油	dí yóu	óleo diesel	0	1	22
徵兆	zhēng zhào	sinal	3	1	14
治愈	zhì yù	curar	2	1	44
天真	tiān zhēn	ingênuo	13	1	11
證	zhèng	comprovar	7	1	\N
councils	kè lái bǎn	conselhos	0	1	42
間諜	jiàn dié	espião	1	1	42
一件事	yī jiàn shì	uma coisa	9	1	14
恨	hèn	odeio	36	1	\N
深	shēn	profundamente	23	1	\N
部門	bù mén	departamento	6	1	42
在一起	zài yī qǐ	juntos	88	2	41
喜歡	xǐ huān	gostar	288	2	31
留	liú	ficar	143	1	\N
員	yuán	membro	33	1	\N
曾	céng	já/uma vez	92	1	\N
父親	fù qīn	pai	156	1	41
艱辛	jiān xīn	árduo	2	1	11
區	qū	distrito	16	1	\N
勞動	láodòng	trabalho	2	1	\N
皮膚	pí fū	pele	13	1	21
催眠	cuī miàn	hipnose	0	1	14
孕妇	w gravida	grávida	1	1	55
操作	cāo zuò	operação	12	1	14
撕	sī	rasgar	2	1	\N
天真無邪	tiān zhēn wú xié	inocente	0	1	11
因为	yīn wèi	porque	2	1	14
trance	trance	transe	0	1	\N
到此為止	dào cǐ wéi zhǐ	até aqui	0	1	43
兒科	ér kē	pediatria	1	1	21
命	mìng	vida	56	1	\N
主任	zhǔ rèn	diretor	2	1	34
的眼中	de yǎn zhōng	olhos	0	1	53
菌	jūn	bactéria	0	1	\N
沉沒	chén mò	afundar	0	1	24
安妮爾	Ān nī ěr	Annel	0	1	11
高高的	gāo gāo de	alto	0	1	11
解釋	jiě shì	explicar	71	1	34
南	nán	sul	25	1	\N
責任	zé rèn	responsabilidade	71	1	24
是一個	shì yīgè	é um	10	1	41
啦	la	partícula modal	126	1	\N
的女孩	de nǚ hái	garota	12	1	53
北	běi	norte	1	1	\N
稅	shuì	imposto	0	1	\N
拒	jù	recusar	0	1	\N
絕	jué	absolutamente	62	1	\N
去世	qù shì	falecer	14	1	44
謎團	mì tuán	mistério	1	1	42
白	bái	branco	50	1	\N
三次	sān cì	três vezes	2	1	14
期望	qī wàng	expectativas	3	1	14
第	dì	número	68	1	\N
協定	xié dìng	acordo	0	1	24
財務	cái wù	finanças	4	1	24
公眾	gōng zhòng	público	1	1	14
很多事情	měi shì qīng qìng	muitas coisas	0	1	34
不见	bù jiàn	not see	1	1	44
脾氣	pí qì	temperamento	15	1	24
伊莉莎白	Yī lì shā bái	Elizabeth	0	1	14
亞當斯	yà dāng sī	Adams	1	1	41
賽道	sài dào	pista de corrida	0	1	44
孩	hái	criança	14	1	\N
華盛頓	huá shèng dùn	Washington	8	1	24
電	diàn	elétrico	47	1	\N
千	qiān	mil	29	1	\N
聊天	liáo tiān	conversar	39	1	21
到達	dào dá	chegar	14	1	42
結婚	jié hūn	casar	71	1	21
往	wǎng	em direção a	36	1	\N
資	zī	fundos	2	1	\N
堪	kān	vale	9	1	\N
鈴	líng	sino	20	1	\N
明	míng	brilhante	97	2	\N
午饭	wǔfàn	almoço	0	1	\N
東京	Dōngjīng	Tóquio	0	1	\N
非洲	Fānzhōu	África	0	1	\N
瑪麗	Mǎ lì	Maria	-47	1	34
巴黎	bā lí	Paris	19	1	12
即便	jí biàn	mesmo que	4	1	24
除了	chú le	além de	56	1	25
我知道	wǒ zhī dào	eu sei	37	1	31
不公平	bù gōng píng	injusto	4	1	41
直到	zhí dào	até	47	1	24
感染	gǎn rǎn	infecção	15	1	33
阿弗蘭尼	Ā fú lán ní	Afurani	3	1	12
卓越	zhuó yuè	excepcional	0	1	24
典範	diǎn fàn	modelo	11	1	34
干擾	gān rǎo	interferência	10	1	13
聘用	huì yòng	contratar	0	1	44
資格	zī gé	qualificação	3	1	12
經	jīng	passar por	65	1	\N
錯	cuò	erro	149	2	\N
培	péi	treinar	1	1	\N
可愛	kě ài	fofo	43	1	34
雨	yǔ	chuva	19	1	\N
消息	xiāo xi	notícia	94	1	15
床	chuáng	cama	46	1	\N
訓	xùn	repreender	9	1	\N
力	lì	força	103	1	\N
之間	zhī jiān	entre	101	1	11
果	guǒ	fruto	71	2	\N
帶來	dài lái	trazer	53	1	42
明天	míng tiān	amanhã	154	3	21
薪	xīn	salário	3	1	\N
低	dī	baixo	31	1	\N
分開	fēn kāi	separação	22	1	11
祝融	Zhùróng	Zhu Rong	0	1	\N
未	wèi	não	71	1	\N
派	pài	enviar	29	1	\N
安寧	ān níng	paz	9	1	12
保存	bǎo cún	guardar	12	1	32
發放	fā fàng	distribuir	0	1	14
頭套	tóu tào	touca	0	1	24
接觸	jiē chǔ	contato	1	1	13
育嬰室	yù yīng shì	berçário	6	1	41
惹	rě	causar	16	1	\N
危險	wēi xiǎn	perigoso	53	1	13
生病的	shēng bìng de	doente	0	1	14
保	bǎo	manter	27	1	\N
第一次	dì yī cì	primeira vez	29	1	41
平靜	píng jìng	calmo	18	1	24
彩	cǎi	colorido	13	1	\N
看起來	kàn qǐ lái	parece	74	1	43
怎	zěn	como	106	1	\N
麼	me	(partícula)	163	3	\N
首先	shǒu xiān	primeiro	31	1	31
員工	yuán gōng	funcionários	36	1	21
團隊	tuán duì	equipe	26	1	24
都不能	bùnéng	não podem	0	1	\N
極端	jíduān	extremo	0	1	\N
訪問	fǎng wèn	visitar	8	1	34
夫人	fū rén	senhora	162	2	12
七	qī	sete	41	1	\N
尊	zūn	respeitoso	237	1	\N
玻璃	bō li	vidro	7	1	15
多功能	duō néng gōng	multifuncional	0	1	12
微不足道	wēi bù zú dào	trivial	1	1	14
減少	jiǎn shǎo	reduzir	8	1	33
親屬	qīn shǔ	parente	0	1	13
拿到	ná dào	conseguir	8	1	24
透過	tòu guò	através	4	1	44
歉	qiàn	desculpas	18	1	\N
強制	qiáng zhì	forçar	0	1	24
NICU	pinyin não disponível	unidade de cuidados intensivos neonatais	0	1	55
罩	zhào	máscara	2	1	\N
鞋	xié	sapato	15	1	\N
照顧	zhào gù	cuidar	76	1	44
新生兒	xīn shēng ér	recém-nascido	2	1	11
主要	zhǔ yào	principalmente	34	1	34
入院	rù yuàn	admissão	0	1	44
懷疑	huái yí	suspeitar	48	1	22
自毀	zì huǐ	autodestruir	4	1	43
很好	hěn hǎo	muito bom	19	1	33
幫忙	bāng máng	ajudar	47	1	12
母	mǔ	mãe	42	1	\N
威脅	wēi xié	ameaçando	17	1	12
檢查	jiǎn chá	exame	207	1	32
佑	yòu	abençoar	6	1	\N
衣服	yī fú	roupa	50	1	12
新的	xīn de	novo	43	1	15
毒	dú	veneno	2	1	\N
舞	wǔ	dança	14	1	\N
親	qīn	beijo	154	1	\N
貨	huò	mercadoria	5	1	\N
建議	jiàn yì	conselho	33	1	44
階段	jiē duàn	fase	16	1	14
難道	nán dào	será que	84	1	24
Exu	Èxu	Exu	0	1	\N
職位	zhí wèi	posição	20	2	24
嚴重	yán zhòng	grave	79	1	24
抱	bào	abraçar, segurar	40	1	\N
並且	bìng qiě	e também	30	1	43
題	tí	questão	22	1	\N
作	zuò	fazer	91	1	\N
如果你	rúguǒ nǐ	se você	11	1	23
負責	fù zé	responsabilizar-se	24	1	42
竟	jìng	na verdade	15	1	\N
教	jiāo	ensinar	34	1	\N
不舒服	bù shū fu	desconfortável	11	1	41
莫扎	Mò zā	Mazat	0	1	41
感動	gǎn dòng	comovido	16	1	34
塔維	tǎ wēi	Octávio	0	1	31
Cruz	Cuī suǒ	Cruz	0	1	13
卸	xiè	remover	1	1	\N
家人	jiā rén	família	62	1	12
里奧特	lǐ ào tè	Liotte	0	1	34
風暴	fēng bào	tempestade	0	1	14
晚	wǎn	noite	50	1	\N
野餐	yě cān	piquenique	0	1	31
街上	jiē shàng	rua	26	1	14
新	xīn	novo	130	2	\N
剛才	gāng cái	há pouco	48	1	12
冷淡	lěng dàn	falta de desejo sexual	2	1	34
分手	fēn shǒu	terminar relacionamento	4	1	13
肮臟	āng zāng	sujo	0	1	11
阻止	zǔ zhǐ	impedir	17	1	33
洞	dòng	caverna	5	1	\N
幫	bāng	ajudar	229	2	\N
畢	bì	conclusão	1	1	\N
吵架	chǎo jià	brigar	35	1	34
Úrsula	Úrsul	Úrsula	0	1	\N
Silvana	Silvana	Silvana	1	1	\N
肚子	dù zi	barriga	22	1	45
放棄	fàng qì	desistir	71	1	44
出現	chū xiàn	surgimento	63	2	14
born	bǎo	bebê	0	1	\N
毀滅	huǐ miè	destruição	1	1	34
散發	sàn fā	exalar	5	1	41
深沉	shēn chén	profundo	1	1	12
臭	chòu	fedor	3	1	\N
靈魂	líng hún	alma	10	1	22
怪	guài	culpar	23	1	\N
怎樣	zěn yàng	como	52	1	34
偷	tōu	roubar	34	1	\N
消毒劑	dísuò jì	desinfetante	0	1	24
沙沙	shā shā	farfalhar	6	1	11
打電話	dǎ diàn huà	telefonar	24	1	34
晚期	wǎn qī	tardio	0	1	31
立即	lì jí	imediatamente	20	1	42
的方法	de de fǎ	método	0	1	55
而不是	ér bú shì	em vez de	15	1	22
扔	rēng	jogar	12	1	\N
光	guāng	luz	117	2	\N
周	zhōu	semana	6	1	\N
藏	cáng	esconder	17	1	\N
名字	míng zì	nome	84	3	24
早	zǎo	cedo	93	3	\N
使用	shǐ yòng	usar	39	1	34
♪		música	31	1	\N
沙	shā	areia	6	1	\N
處理	chǔ lǐ	lidar	185	1	33
寧	níng	pacífico	41	1	\N
件	jiàn	item/coisa	298	2	\N
女兒	nǚ ér	filha	237	2	32
出去	chū qù	sair	93	2	14
色	sè	cor	96	1	\N
宏	hóng	grande	0	1	\N
紙	zhǐ	papel	27	1	\N
裂	liè	rachar	6	1	\N
料	liào	prever	8	1	\N
亮	liàng	clarear	14	1	\N
服	fú	tomar	16	1	\N
角	jiǎo	canto	11	1	\N
接受	jiē shòu	aceitar	105	1	14
桶	tǒng	barril	2	1	\N
刻	kè	momento	27	1	\N
小媽媽	xiǎo māma	mamãe pequena	0	1	31
不要臉的	bù yào liǎn de	sem vergonha	0	1	44
對我來說	duì wǒ lái shuō	para mim	1	1	43
雨果	yǔ guò	Hugo	0	1	34
年輕人	nián qīng rén	jovem	18	1	21
推移	tuī yí	passar	1	1	12
祝福	zhù fú	abençoar	6	1	42
詛咒	zǔ zhòu	maldição	0	1	34
唯一	wéi yī	único	51	1	21
還有	hái yǒu	ainda tem	197	2	23
一會兒	yī huǐ er	um momento	48	2	13
醫療	yī liáo	médico	12	1	12
六	liù	seis	16	1	\N
收集	shōu jí	coletar	2	1	12
清潔工	qīng jié gōng	faxineiro	5	1	12
都是	dōu shì	todos são	43	1	14
手套	shǒu tào	luva	4	1	34
衛生紙	wèi shēng zhǐ	papel higiênico	0	1	41
箱	xiāng	caixa	8	1	\N
回收	huí shōu	reciclar	0	1	21
忘記	wàng jì	esquecer	31	1	44
毀	huǐ	arruinar	17	1	\N
先	xiān	primeiro	113	2	\N
玩	wán	brincar	45	1	\N
哥哥	gē ge	irmão mais velho	76	1	15
强	qiáng	forte	0	1	\N
烈	liè	intenso	0	1	\N
需	xū	precisar	44	1	\N
生活	shēng huó	vida	262	2	12
留在	liú zài	permanecer	67	1	24
現在	xiàn zài	agora	829	3	44
幾個	jǐ gè	alguns	18	1	34
城市	chéng shì	cidade	87	1	24
滅	miè	apagar	30	1	\N
恩賜	ēn shì	bênção	0	1	14
青春	qīng chūn	juventude	9	1	11
活力	huó lì	vitalidade	7	1	24
渐渐	jiàn jiàn	gradualmente	0	1	44
意識	yì shí	consciência	13	1	42
稍等	shāo děng	aguardar um momento	17	1	13
普通	pǔ tōng	comum	4	1	31
廢物	fèi wù	inútil/lixo	11	1	44
不能	bù néng	não pode	282	3	42
垃圾	lā jī	lixo	13	1	11
魔	mó	demônio	0	1	\N
般	bān	como	41	1	\N
芒	máng	raio	6	1	\N
打擾	dǎ rǎo	perturbar	53	1	33
棕	zōng	castanho	1	1	\N
水管	shuǐ guǎn	cano de água	2	1	33
謎	mystery	enigma	0	1	\N
必要	bì yào	necessário	35	1	44
神秘	shén mì	misterioso	10	1	24
腳	jiǎo	pé	16	1	\N
哀求	āiqǐu	implorar	2	1	\N
巴	bā	bar	20	1	\N
幻	huàn	ilusão	49	1	\N
進入	jìn rù	entrar	58	1	44
包	bāo	bolsa	19	1	\N
笑著	xiào zhe	rindo	9	1	45
味	wèi	sabor	6	1	\N
開始	kāi shǐ	começar	280	2	13
分	fēn	dividir	50	1	\N
由	yóu	por	60	1	\N
完全	wán quán	completamente	164	2	22
總	zǒng	sempre	105	1	\N
造成	zào chéng	causar	18	1	42
利	lì	lucro	28	1	\N
抱歉	bào qiàn	desculpas	125	1	44
造	zào	construir	12	1	\N
裡	lǐ	dentro	484	3	\N
張	zhāng	unidades (para bilhetes)	108	2	\N
地板	dì bǎn	piso	4	1	43
範圍	fàn wèi	alcance	3	1	44
今後	jīn hòu	de agora em diante	1	1	14
牆壁	qiáng bì	parede	4	1	24
804	bā líng sì	804	0	1	12
子宮	zǐ gōng	útero	36	1	31
排斥	chàng pò	rejeição	1	1	44
尾巴	wěi ba	cauda	1	1	35
他人	tā rén	outros	21	1	12
江湖	jiāng hú	mundo do crime	0	1	12
站在	zhàn zài	ficar de pé em	2	1	44
音	yīn	som	11	1	\N
事實	shì shí	fato	15	1	42
輔助	fǔ zhù	auxiliar	0	1	34
堵塞	sāng ì	entupido	2	1	14
動き	yundong	movimento	0	1	\N
遠離	yuǎn lí	afastar-se de	8	1	32
子	zǐ	Filho	178	2	\N
院	yuàn	hospital	9	1	\N
全	quán	todo	86	1	\N
進來	jìn lái	entrar	68	2	42
提	tí	mencionar	67	1	\N
iang	liáng	(não aplicável, pinyin incorreto)	0	1	\N
瑟	sè	Joseph	14	1	\N
找到	zhǎo dào	encontrar	81	2	34
兩	liǎng	dois	89	3	\N
絶	jué	absoluto	3	1	\N
傑	jié	talentoso	4	1	\N
懂	dǒng	entender	293	2	\N
郎	láng	jovem	0	1	\N
住	zhù	ficar	113	2	\N
動	dòng	mexer	50	1	\N
欺	qī	enganar	6	1	\N
工	gōng	trabalhador	63	1	\N
次	cì	vez	152	2	\N
託	tuō	favor	3	1	\N
所以	suǒ yǐ	então	240	3	33
遠	yuǎn	longe	42	1	\N
清理	qīng lǐ	limpar	5	1	13
口	kǒu	boca	17	1	\N
布	bù	tecido	9	1	\N
願	yuàn	desejar	107	1	\N
這一邊	zhè yī biān	este lado	5	1	41
傷害	shāng hài	machucar	40	1	14
藥物	yào wù	medicamento	11	1	44
有效	yǒu xiào	eficaz	11	1	34
關懷	guān huái	cuidado	6	1	12
案件	àn jiàn	caso	0	1	44
Renato	Rēn à nuò tōng	Renato	0	1	14
龍頭	lóng tóu	torneira	0	1	22
流動	liú dòng	fluente	27	1	24
確	què	garantir	24	1	\N
理	lǐ	razão	55	1	\N
離	lí	longe de	82	1	\N
妻子	qī zi	esposa	75	1	15
騙	piàn	enganar	21	1	\N
關心	guān xīn	se importar	17	1	11
展示	zhǎn shì	demonstração	11	1	34
量	liàng	quantidade	16	1	\N
世界	shì jiè	mundo	108	2	44
原因	yuán yīn	razão	82	1	21
助	zhù	ajudar	20	1	\N
哪儿	nǎr	onde	0	1	\N
真相是		a verdade é	0	1	\N
溺	nì	afogar	0	1	\N
力量	lì liàng	força	21	1	44
外交官	wài jiāo guān	diplomata	1	1	41
平衡	píng héng	equilíbrio	3	1	22
評論	píng lùn	comentar	3	1	24
隨著	suí zhe	junto com	14	1	25
年齡	nián líng	idade	18	1	22
認為	rèn wéi	acreditar	205	2	42
輕率	qīng shuài	leviano	6	1	14
。	.	ponto final	43	1	\N
以前	yǐ qián	antigamente	83	2	32
注意	zhù yì	atenção	58	1	44
神	shén	Espírito	74	2	\N
奧塔維O	ào tǎ wēi yī	Octavio	2	1	43
寧願	nìng yuàn	preferir	24	1	44
所能	suǒ néng	capacidade	0	1	32
重	zhòng	importante	89	1	\N
家庭	jiā tíng	família	60	1	12
逝	shì	desaparecer	16	1	\N
糟	zāo	pior	49	1	\N
高	gāo	alto	72	1	\N
確定	què dìng	certo	108	1	44
快樂	kuài lè	felicidade	100	2	44
糕	gāo	bolo	4	1	\N
酒	jiǔ	bebida alcoólica	24	1	\N
塞	sāi	enfiar	24	1	\N
維護	wéi hù	defender	4	1	24
有史以來	yǒu shǐ yǐ lái	desde a história	0	1	33
溫柔	wēn róu	gentileza	12	1	12
我是	wǒ shì	eu sou	10	1	34
開會	kāi huì	reunião	0	1	14
一般	yì bān	como	14	1	41
轉移	zhuǎn yí	metástase	0	1	32
完整的	wán zhěng de	completo	3	1	23
準確的	zhǔn què de	precisa	0	1	34
疾病	jí bìng	doença	16	1	24
蔓延	màn yán	espalhar	0	1	42
發展	fā zhǎn	desenvolver	13	1	13
出其不意	chū qí bù yì	inesperadamente	0	1	12
打敗	dǎ bài	derrotar	1	1	34
男性	nán xìng	masculino	9	1	24
科學	kē xué	ciência	2	1	12
溫	wēn	quente	1	1	\N
柔	róu	suave	0	1	\N
女人	nǚ rén	mulher	237	2	32
dress	drès	vestido	1	1	\N
my		meu	0	1	\N
冰	bīng	gelo	3	1	\N
廁	cè	banheiro	0	1	\N
而且	ér qiě	além disso	257	2	23
婚禮	hūn lǐ	casamento	39	1	13
最	zuì	mais	245	2	\N
變	biàn	tornar-se	80	1	\N
就是	jiù shì	é isso	462	3	44
後悔	hòu huǐ	se arrepender	45	1	43
巨	jù	enorme	2	1	\N
少	shǎo	diminuir	73	1	\N
才	cái	apenas	386	2	\N
公	gōng	justo	73	1	\N
的事	de shì	da coisa	86	1	54
並	bìng	e	220	2	\N
解決	jiě jué	resolver	84	1	32
影	yǐng	sombra	21	1	\N
荫	yīn	sombra	0	1	\N
劇	jù	peça	455	1	\N
事情	shì qíng	coisa, assunto	327	2	42
越	yuè	quanto mais	37	1	\N
梅	méi	ameixeira	9	1	\N
反	fǎn	oposto	18	1	\N
來的	lái de	vim	9	1	25
尋求	xún qiú	buscar	11	1	22
意見	yì jiàn	opinião	26	1	44
對手	duì shǒu	adversário	2	1	43
形狀	xíng zhuàng	forma	0	1	24
器官	qì guān	órgãos	8	1	41
句子	jù zi	frase	5	1	45
護理學	hù lǐ xué	enfermagem	0	1	43
準確	zhǔn què	preciso	2	1	34
疏忽	shū hū	descuidado	5	1	11
提起	tí qǐ	levantar	5	1	23
訴訟	sù sòng	processo judicial	7	1	44
證實	zhèng shí	confirmar	2	1	42
傷口	shāng kǒu	ferida	2	1	13
病	bìng	doença	39	1	\N
傳染病	chuán rǎn bìng	doença infecciosa	0	1	23
爆發	bào fā	estourar	8	1	41
結果	jié guǒ	resultado	110	1	23
本人	běn rén	eu mesmo	8	1	32
必要的	bìyào de	necessário	2	1	45
carcinoma	carcinoma	carcinoma	0	1	\N
山	shān	montanha	7	1	\N
檔案	dàng àn	arquivo	8	1	44
自行	zì xíng	por conta própria	1	1	42
糟糕	zāo gāo	terrível	58	1	11
服藥	fú yào	tomar remédio	0	1	24
肯定	kěn dìng	certo	40	1	34
措施	cuò shī	medida	14	1	41
蔡	Cài	Cai	0	1	\N
快速	kuài sù	rápido	6	1	44
釋	shì	perdoado	3	1	\N
業務	yè wù	negócios	10	1	44
消失	xiāo shī	desaparecer	42	1	11
罪	zuì	culpa	9	1	\N
您	nín	você	839	3	\N
否	fǒu	negar	11	1	\N
字	zì	palavra	36	1	\N
場	chǎng	campo	104	1	\N
你們	nǐ men	vocês	470	3	35
討論	tǎo lùn	discutir	56	1	34
看看	kàn kàn	olhar	175	3	44
出生	chū shēng	nascimento	94	2	11
生命	shēng mìng	vida	201	2	14
戲	xì	drama	448	1	\N
您的	nín de	seu (formal)	88	3	25
專業	zhuān yè	profissional	26	1	14
健康	jiàn kāng	saúde	57	1	41
piritual的	pí lín guó de	espiritual	0	1	22
要看	kě yào kàn	precisa ver	0	1	34
返回	fǎn huí	retornar	3	1	32
純粹	chún cuì	puramente	5	1	24
塞西莉亞	Sài xī lì yà	Cecília	1	1	41
過度	guò dù	excessivo	19	1	44
甚至	shèn zhì	até mesmo	189	2	44
顧	gù	considerar	9	1	\N
預防	yù fáng	prevenção	2	1	42
醫院	yī yuàn	hospital	73	2	14
畢業	bì yè	se formar	28	1	44
成功地	chéng gōng de	com sucesso	6	1	21
性感	xìng gǎn	sexy	5	1	43
觀點	guān diǎn	ponto de vista	8	1	13
醫	yī	medicina	15	1	\N
健康的	jiàn kāng de	saudável	1	1	41
文獻	wén xiàn	literatura	0	1	24
如果您	rúguǒ nín	se você	8	1	22
中文	zhōng wén	chinês	8	1	12
任務	rèn wu	tarefa	29	1	45
功能	gōng néng	função	20	1	12
控	kòng	acusar	3	1	\N
的一	de yī	de um	47	1	51
支持	zhī chí	apoiar	44	1	12
不再	bù zài	não mais	65	1	44
想要	xiǎng yào	querer	278	2	34
確實	què shí	realmente	137	1	42
地方	dì fāng	lugar	118	2	41
聊	liáo	conversar	43	1	\N
些	xiē	alguns/algumas	83	2	\N
幫助	bāng zhù	ajudar	129	1	14
如何	rú hé	como	147	2	22
者	zhě	aquele que	63	1	\N
跟	gēn	com	522	3	\N
保護	bǎo hù	proteger	52	1	34
盡	jìn	esgotar	44	1	\N
解	jiě	resolver	25	1	\N
戀	liàn	amor	0	1	\N
殺	shā	matar	33	1	\N
無限	wúxiàn	ilimitado	0	1	\N
僅	jǐn	apenas	30	1	\N
人們	rén men	pessoas	91	2	25
舍	shě	abandonar	6	1	\N
這點	zhè diǎn	este ponto	9	1	43
這一點	zhè yī diǎn	este ponto	8	1	41
化	huà	-ização	35	1	\N
杜爾西	Dù ěr sī	Dürsi	0	1	43
弗蘭尼	fú lán ní	Alfani	4	1	22
那位	nà wèi	aquela	31	2	44
當然	dāng rán	claro	269	2	12
氛圍	fēn wéi	atmosfera	108	1	12
宣誓	xuān shì	juramento	0	1	14
純	chún	puro	2	1	\N
多年來	duō nián lái	ao longo de muitos anos	3	1	12
症狀	zhèng zhuàng	sintomas	3	1	44
障礙	zhàng ài	obstáculo	5	1	44
試圖	shì tú	tentar	42	1	42
根據	gēn jù	de acordo com	11	1	14
然	rán	então	130	1	\N
醫學	yī xué	medicina	15	1	12
專長	zhuān cháng	especialidade	4	1	12
葡萄牙語	pú táo yá yǔ	português	7	1	22
咨询	zī xún	consultar	0	1	12
女性	nǚ xìng	mulher	141	2	34
具备	jù bèi	possuir	0	1	44
大多數	dà duō shù	maioria	6	1	41
compulsão	bāo jīng	compulsão	0	1	11
追求	zhuī qiú	buscar	5	1	12
進食	jìn shí	comer	0	1	42
需求	xū qiú	necessidade	4	1	12
碼頭	mǎ tóu	cais	12	1	32
暴力	bàoli	violência	1	1	\N
症	zhèng	doença	11	1	\N
部分	bù fèn	parte	26	1	44
安眠藥	ān mián yào	remédio para dormir	0	1	12
放鬆	fàng sōng	relaxar	32	1	41
猛烈	měng liè	violentamente	4	1	34
忍耐	rěn nài	tolerar	7	1	34
滿足	mǎn zú	satisfação	27	1	32
承擔	chéng dān	arcar	56	1	21
名	míng	nome	77	2	\N
許	xǔ	permitir	19	1	\N
熱	rè	quente	27	1	\N
吃	chī	comer	165	3	\N
忍受	rěn shòu	suportar	35	1	34
件事	jiàn shì	assunto	123	1	44
考慮	kǎo lǜ	considerar	69	1	34
學	xué	estudo/estudar	68	1	\N
所有	suǒ yǒu	todos	274	2	33
物	wù	coisa	56	1	\N
提供	tí gōng	forneceu	60	1	21
苦	kǔ	amargura	75	1	\N
認	rèn	reconhecer	42	1	\N
其他	qí tā	outros, outras	109	2	21
連	lián	nem mesmo	133	1	\N
系	xì	conexão	9	1	\N
案例	àn lì	casos	11	1	44
這個	zhè ge	este	841	3	45
的人	de rén	pessoas	65	1	52
它	tā	ele	206	2	\N
最近	zuì jìn	recentemente	42	1	44
相關	xiāng guān	relacionado	8	1	11
史	shǐ	história	6	1	\N
翻譯	fān yì	tradução	43	1	14
狂	kuáng	louco	13	1	\N
阿弗蘭紐	Ā fú lán niǔ	Afrolanew	6	1	12
邏輯	luó jí	lógica	4	1	22
鬥爭	dòu zhēng	luta	0	1	41
貪婪	tān lán	ganância	0	1	12
保密	bǎo mì	manter em segredo	1	1	34
達到	dào dá	alcançar	2	1	42
維多利亞	Wéi Duō Lì Yà	Vitória	9	1	21
增長	zēng zhǎng	crescer	7	1	13
張力	zhāng lì	tensão	0	1	14
到底	dào dǐ	afinal	143	2	43
答案	dá àn	resposta	12	1	24
烏爾蘇拉	Wū ěr sū lā	Úrsula	4	1	13
才能	cái néng	só então pode	24	1	22
摩擦	mó cā	atrito	11	1	21
至少	zhì shǎo	pelo menos	80	1	43
瑟蒂娜	sè dì nà	Sertina	1	1	44
進	jìn	entrar	77	1	\N
暴風雨	bào fēng yǔ	tempestade	0	1	41
觸碰	chù pèng	tocar	1	1	44
通常	tōng cháng	normalmente	13	1	12
中的	zhōng de	do	8	1	15
始終	shǐ zhōng	sempre	20	1	31
必須	bì xū	deve	461	2	41
不起	bù qǐ	não pode pagar	5	1	43
如果	rú guǒ	se	644	3	23
卻	què	mas	120	1	\N
該	gāi	dever	345	2	\N
意思	yì si	significado	183	2	45
可以	kě yǐ	pode	581	3	33
行	xíng	pode	305	2	\N
一樣	yī yàng	igual	198	2	14
高峰	gāo fēng	pico	2	1	11
權力	quán lì	poder	18	1	24
強	qiáng	Qiang	29	1	\N
激	jī	estimular	0	1	\N
瑟拉	sè lā	(nome próprio)	0	1	41
衡	héng	equilíbrio	0	1	\N
對於	duì yú	para	9	1	42
相	xiāng	mutuamente	28	1	\N
食物	shí wù	comida	46	1	24
強迫	qiǎng pò	forçar	10	1	34
類	lèi	tipo	3	1	\N
止境	zhǐ jìng	fim	0	1	34
的需求	de xūqiú	necessidade	2	1	51
個	gè	um	768	3	\N
主義者	zhǔ yì zhě	ideólogo	3	1	34
偏見	piān jiàn	preconceito	5	1	14
公司	gōng sī	empresa	58	1	11
一種	yī zhǒng	um tipo de	85	2	13
方式	fāng shì	maneira	92	1	14
美麗	měi lì	bela	58	1	34
政府	zhèng fǔ	governo	1	1	43
罪惡感	zuì è gǎn	culpa	2	1	44
一天	yī tiān	dia	74	2	11
懼怕	jù pà	medo	0	1	44
混在一起	hùn zài yī qǐ	andar junto	1	1	44
忍	rěn	suportar	2	1	\N
而	ér	e	1177	3	\N
恐怖	kǒng bù	terror	7	1	34
失去	shī qù	perder	49	1	14
瑟夏	sè xià	Ser Xia	1	1	44
笨蛋	bèn dàn	idiota	12	1	44
感到	gǎn dào	sentir	167	2	34
真	zhēn	realmente	483	3	\N
成	chéng	tornar-se	152	1	\N
之	zhī	de	402	2	\N
前	qián	antes	202	3	\N
受	shòu	receber	81	1	\N
那	nà	aquele	1111	3	\N
素	sù	substância	2	1	\N
暗示	suggest	insinuar	3	1	\N
慌	huāng	pânico	1	1	\N
永	yǒng	eterno	106	1	\N
底	dǐ	fundo	13	1	\N
得到	dé dào	conseguir	77	2	24
另一	lìng yī	outro	32	1	41
瘋狂	fēng kuáng	louco	74	1	12
嗶	bī	bipe	3	1	\N
尋找	xún zhǎo	procurar	23	1	23
久	jiǔ	longo tempo	72	1	\N
不吃	bù chī	não comer	4	1	41
受苦	shòu kǔ	sofrer	19	1	43
配	pèi	merecer	18	1	\N
比	bǐ	comparar	238	2	\N
金錢	jīn qián	dinheiro	11	1	12
畫	huà	pintura	11	1	\N
怕	pà	temer	44	1	\N
如	rú	como	195	2	\N
多	duō	muito	389	3	\N
為了	wèi le	para	289	2	45
調查	diào chá	investigar	10	1	42
心理	xīn lǐ	psicológico	7	1	13
鐘	zhōng	relógio	13	1	\N
學家	xué jiā	especialista	0	1	21
甚至是	shèn zhì shì	até mesmo	0	1	44
精神	jīng shén	energia	59	1	12
就像	jiù xiàng	assim como	32	1	44
母女	mǔ nǚ	mãe e filha	0	1	33
歐塔維奧	ōu tǎ wēi ōu	Otávio	0	1	13
激情	jī qíng	paixão	2	1	12
可能	kě néng	possível	284	2	32
弗蘭紐	Fú lán niǔ	Afrânio	3	1	22
透頂	tòu dǐng	extremamente	1	1	43
診所	zhěn suǒ	clínica	223	1	33
沮喪	jǔ sàng	desanimado	10	1	34
傷痛	shāng tòng	dor	1	1	14
領域	lǐng yù	áreas	17	1	34
明顯	míng xiǎn	óbvio	19	1	23
外遇	wài yù	caso extraconjugal	0	1	44
隱藏	yǐn cáng	esconder	21	1	32
荒謬	huāng miù	absurdo	45	1	14
某	mǒu	algum	10	1	\N
充滿	chōng mǎn	cheio de	52	1	13
危機	wēi jī	crise	23	1	11
起	qǐ	casos	125	2	\N
一直	yī zhí	sempre	179	2	12
丈夫	zhàng fū	marido	118	1	41
或	huò	ou	74	1	\N
完	wán	terminar	39	1	\N
像	xiàng	como	315	2	\N
insecurity	insecurity	insegurança	0	1	\N
一次	yī cì	uma vez	120	2	14
恐	kǒng	medo	6	1	\N
覺得	jué dé	acha	684	2	22
洗	xǐ	lavar	31	1	\N
自己	zì jǐ	próprio	472	3	43
時候	shí hòu	quando	211	2	24
打	dǎ	ligar	197	3	\N
科	kē	ciência	31	1	\N
情況	qíng kuàng	situação	199	1	24
別	bié	não	429	2	\N
響	xiǎng	tocar	8	1	\N
其	qí	sua	192	1	\N
問	wèn	perguntar	140	2	\N
與	yǔ	com	525	2	\N
這樣	zhè yàng	assim	934	3	44
一些	yī xiē	alguns	157	2	11
怎麼	zěn me	como	375	3	35
道德	dào dé	moralidade	34	1	42
噯	ài	oh	19	1	\N
嚏	tì	espirro	5	1	\N
應	yīng	dever	43	1	\N
絕對	jué duì	absolutamente	90	1	24
換	huàn	trocar	69	1	\N
但是	dàn shì	mas	153	3	44
歲	suì	anos de idade	101	2	\N
60	liù shí	sessenta	0	1	42
老婆	lǎo pó	esposa	33	1	32
30	sān shí	trinta	8	1	12
2	èr	dois	1	1	\N
恐懼	kǒng jù	medo	7	1	34
年輕	nián qīng	jovem	61	1	21
徹	chè	completo	80	1	\N
由於	yóu yú	devido a	21	1	22
上帝	shàng dì	Deus	280	1	44
飛奔	fēi bēn	correndo rapidamente	0	1	11
證據	zhèng jù	evidência	1	1	44
起初	qǐ chū	inicialmente	2	1	31
前夫	qián fū	ex-marido	0	1	21
今	jīn	hoje	44	1	\N
抽泣	chōu qì	soluçar	1	1	14
留下	liú xià	ficar	42	1	24
還	hái	ainda	626	3	\N
缺席	quē xí	ausência	9	1	12
誠實	chéng shí	honesto	15	1	22
更	gèng	mais	366	2	\N
突然	tū rán	de repente	34	1	12
因	yīn	devido a	164	2	\N
清楚	qīng chǔ	claro	96	1	13
這些	zhè xiē	estes	276	2	41
改變	gǎi biàn	mudar	57	1	34
悲傷	bēi shāng	tristeza	27	1	11
可	kě	mas	369	2	\N
全部	quán bù	tudo	62	1	24
托	tuō	tuo	12	1	\N
害怕	hài pà	com medo	91	1	44
能	néng	poder	568	3	\N
離開	lí kāi	deixar	308	2	21
被	bèi	ser (voz passiva)	364	1	\N
為	wèi	por	1115	3	\N
現	xiàn	atual	325	2	\N
鏈	liàn	corrente	0	1	\N
不要	bù yào	não	346	2	44
討厭	tǎo yàn	detestar	28	1	34
理解	lǐ jiě	compreender	82	1	33
路	lù	estrada	79	2	\N
傻	shǎ	bobo	18	1	\N
照	zhào	de acordo com	64	1	\N
如此	rú cǐ	assim	209	2	23
長	cháng	longo	95	1	\N
待	dāi	ficar	138	2	\N
地	de	partícula adverbial	225	2	\N
掉	diào	cair	50	1	\N
試	shì	tentar	77	1	\N
嘆口氣	tàn kǒu qì	suspirar	23	1	43
雷	léi	trovão	18	1	\N
噴	pēn	espirrar	7	1	\N
敲詐	qiāo zhà	extorsão	3	1	14
約瑟芬	yuē sè fēn	Josefina	10	1	14
藥	yào	remédios/drogas	47	1	\N
就能	jiù néng	então posso	8	1	42
完蛋	wán dàn	estar acabado	2	1	24
何況	hé kuàng	quanto mais	2	1	24
两个人	liǎng gè rén	duas pessoas	0	1	34
家	jiā	lar	264	3	\N
你知道	nǐ zhī dào	você sabe	10	1	31
著迷	zháo mí	fascinante	4	1	22
衝動	chōng dòng	impulso	22	1	14
較	jiào	comparar	21	1	\N
哽咽	gěng yè	sufocado	26	1	34
抵抗	dǐ dáng	resistir	2	1	32
抑制	yì zhì	suprimir	1	1	44
原始	y primitivo	primitivo	0	1	55
部	bù	medidor para filmes	9	1	\N
直	zhí	direto	35	1	\N
一定	yī dìng	definitivamente	114	2	14
實	shí	realizar	100	1	\N
笑聲	xiào shēng	risada	614	3	41
己	jǐ	eu	39	1	\N
女	nǚ	mulher	65	1	\N
內	nèi	dentro	132	1	\N
忠	zhōng	leal	0	1	\N
一段	yī duàn	um pedaço	50	1	14
計	jì	calcular	21	1	\N
行為	xíng wéi	comportamento	18	1	22
買	mǎi	comprar	74	3	\N
位	wèi	posição/classificador para pessoas	218	2	\N
麗	lì	belo	47	1	\N
送	sòng	enviar	41	1	\N
寶貝	bǎo bèi	querida	78	1	34
應該	yīng gāi	deveria	369	1	11
點	diǎn	ponto	238	3	\N
ursula		Ursula	9	1	\N
renato	rəˈnato	renato	2	1	\N
朋友	péng yǒu	amigo	186	3	23
為什麼	wèi shén me	por que	315	3	42
相信	xiāng xìn	acreditar	202	2	14
告訴	gào sù	contar	604	2	44
兒子	ér zi	filho	294	2	25
水	shuǐ	água	77	3	\N
貼	tiē	colar	2	1	\N
美	měi	bela	150	2	\N
冒險家	mào xiǎn jiā	aventureiros	0	1	43
泣	qì	chorar	29	1	\N
吸引了	xiāng qǔ le	atraiu	0	1	13
奧塔維奧	ào tǎ wéi ào	Otávio	-96	1	43
馬塔	mǎ tà	MARTA	11	1	34
人類	rén lèi	humano	18	1	24
勝	shèng	vencer	17	1	\N
不是	bù shì	não é	600	3	44
迷	mí	perder	11	1	\N
控制	kòng zhì	controle	34	1	44
pursuit	pursuit	perseguição	10	1	\N
雙方	shuāng fāng	ambos	3	1	11
我的	wǒ de	meu	720	3	35
都	dōu	todos	1045	3	\N
烏蘇拉	wū sū lǎ	Úrsula	13	1	11
裡邊	lǐ biān	dentro	0	1	31
親愛的	qīn ài de	querido	283	2	14
身	shēn	corpo	105	1	\N
血型	xuè xíng	tipo sanguíneo	5	1	42
誰	shéi	quem	341	2	\N
維娜	wéi nà	Viena	2	1	24
爸爸	bà bà	pai	174	3	44
地上	dì shàng	chão	24	1	44
血液庫	xuè yè kù	banco de sangue	0	1	44
來說	lái shuō	dizer	159	2	21
血液	xuè yè	sangue	14	1	44
雷諾托	Léinuò tuō	Renault	2	1	21
吼	hǒu	rugir	2	1	\N
哀	āi	lamentar	0	1	\N
嘆	tàn	suspirar	8	1	\N
西西莉亞	Xīxīlìyà	não disponível	0	1	\N
呼吸	hū xī	respirar	27	1	11
真相	zhēn xiàng	verdade	82	1	14
怒	nù	furioso	3	1	\N
氣	qì	irritado	115	1	\N
那些	nà xiē	aqueles	137	2	41
正	zhèng	exatamente	153	3	\N
啊	a	ah	1117	3	\N
醉	zuì	bêbado	33	1	\N
承認	chéng rèn	admitir	75	1	24
倒	dào	ao contrário	34	1	\N
AI	AI	IA	53	1	\N
天	tiān	céu	292	3	\N
評	píng	crítica	1	1	\N
四	sì	quatro	59	1	\N
交	jiāo	ter (relacionamentos)	38	1	\N
自	zì	desde	122	2	\N
因為	yīn wèi	porque	597	3	14
不知道	bù zhī dào	não sei	151	3	41
要求	yāo qiú	exigir	77	1	12
忠實	zhōng shí	leal	7	1	12
袋	dài	saco	2	1	\N
太	tài	muito	504	3	\N
片	piàn	pedaço, unidade para objetos planos	24	1	\N
邊	biān	borda	115	1	\N
伊	yī	ele	55	1	\N
哪	nǎ	qual	141	2	\N
沒	méi	não ter	517	3	\N
事	shì	assunto	894	3	\N
發生	fā shēng	acontecer	366	2	11
級	jí	nível	5	1	\N
引擎	yǐn qíng	motor	21	1	32
司機	sī jī	motorista	15	1	11
鑰匙	yào shi	chave	31	1	45
打破了	dǎ suì le	quebrei	0	1	34
維多莉亞	wéi duō lì yà	Vitória	2	1	21
友	yǒu	amigo	13	1	\N
亞	yà	Ásia	65	1	\N
整形	zhěng xíng	plástico/cirurgia plástica	8	1	32
把	bǎ	partícula para objeto direto	614	2	\N
隔离	g Pé	isolamento	0	1	52
抗生素	kàng shēng sù	antibiótico	4	1	41
加速	jiā sù	aceleração	4	1	14
犯罪	fàn zuì	crime	13	1	44
非常	fēi cháng	extremamente	506	3	12
也	yě	também	806	3	\N
保證	bǎo zhèng	garantir	67	1	34
懷抱	huái bào	abraço	24	1	24
二	èr	dois	79	3	\N
艾	ài	Ai	12	1	\N
局	jú	departamento	5	1	\N
在	zài	em	3329	3	\N
接	jiē	atender	114	1	\N
今天	jīn tiān	hoje	222	3	11
急	jí	apressar	17	1	\N
診	zhěn	consulta	16	1	\N
滿	mǎn	completo	36	1	\N
室	shì	sala	19	1	\N
下	xià	para baixo	199	3	\N
間	jiān	entre	140	1	\N
不會	bù huì	não vou	380	3	44
胸口	xiōngkǒu	peito	0	1	\N
注	zhù	injetar	1	1	\N
後	hòu	depois	190	3	\N
灌	guàn	irrigar	0	1	\N
液	yè	líquido	1	1	\N
備	bèi	provisões	11	1	\N
停止	tíng zhǐ	parar	61	1	23
奪	duó	tomar	2	1	\N
止	zhǐ	parar	23	1	\N
歎	tàn	suspirar	6	1	\N
息	xī	respiração	29	1	\N
停	tíng	parar	90	1	\N
裝	zhuāng	contém	47	1	\N
嚕	lu	ruido	28	1	\N
車	chē	carro	79	3	\N
媽媽	mā mā	mãe	349	3	11
一起	yì qǐ	juntos	272	3	43
那麼	nà me	tão	249	2	45
声	shēng	som	0	1	\N
他們	tā men	eles	549	3	15
午夜	wǔ yè	meia-noite	11	1	34
螢太	yíng tài	telona	0	1	24
性	xìng	sexual	502	1	\N
克	kè	grama	72	1	\N
再	zài	novamente	594	2	\N
外科	wài kē	cirurgia	2	1	41
頻	pín	frequência	0	1	\N
率	lǜ	taxa	6	1	\N
貝斯	bēi sī	base	0	1	11
晚上	wǎn shang	noite	34	1	35
受到	shòu dào	receber	48	1	44
婴儿	yīng'ér	bebê	0	1	\N
消	xiāo	desaparecer	18	1	\N
房間	fáng jiān	quarto	81	1	21
130	yī sān líng	130	0	1	11
瑟瑞塔	sè ruì tǎ	Serreta	3	1	44
幣	bì	moeda	0	1	\N
更多	gèng duō	mais	63	1	41
衝擊	chōng jī	impacto	16	1	11
ゆっくり	yukkuri	lentamente	0	1	\N
幼	yòu	jovem	0	1	\N
譚馬	tán mǎ	Tan Ma	3	1	23
薛	Xuē	Xuē	18	1	\N
上升	shàng shēng	ascensão	0	1	41
压缩	yā suō	compressão	0	1	11
安耐爾	ānnà'ěr	Annel	14	1	\N
鎮	zhèn	vila	1	1	\N
其中	qí zhōng	entre/dentre	14	1	21
順利	shùn lì	suave	78	1	44
唯	wéi	somente	15	1	\N
一下	yī xià	um pouco	548	2	14
笑	xiào	riso	322	2	\N
歐	ōu	eu	172	1	\N
儿	ér	sufixo diminutivo	1	1	\N
譚	tán	Tan	42	1	\N
準備	zhǔn bèi	preparar	118	1	34
音樂	yīn yuè	música	1051	3	14
寶寶	bǎo bǎo	bebê	312	2	33
語	yǔ	fala	29	1	\N
給	gěi	para	779	3	\N
拆	chāi	desmontar	0	1	\N
維	wéi	(parte do nome)	54	1	\N
特梅	tè méi	Temme	0	1	42
保濕	bǎo shī	umidificação	0	1	31
拿走	ná zǒu	levar embora	3	1	23
違反	wéi fǎn	violar	1	1	23
發揮	fā huī	exercer	20	1	11
寶	bǎo	tesouro	17	1	\N
需要	xū yào	preciso	606	2	14
接近	jiē jìn	aproximar-se	22	1	14
瑞	ruì	auspicioso	35	1	\N
過來	guò lái	venha aqui	198	2	42
一點	yī diǎn	um pouco	214	3	13
化學	huà xué	químico	5	1	42
對不起	duì bù qǐ	desculpe	172	2	44
然後	rán hòu	então	147	1	24
奇蹟	qí jī	milagre	22	1	21
去	qù	ir	973	3	\N
將會	jiāng huì	irá	36	1	14
呢	ne	partícula interrogativa	560	3	\N
安	ān	tranquilo	132	2	\N
一切	yī qiè	tudo	605	2	14
用	yòng	usar	240	3	\N
小	xiǎo	pequeno	465	3	\N
永遠	yǒng yuǎn	sempre	107	1	33
她	tā	ela	2019	3	\N
兒	ér	criança	47	1	\N
中	zhōng	dentro	381	3	\N
忙	máng	ocupado	78	2	\N
傷心	shāng xīn	desgosto	10	1	11
女孩	nǚ hái	menina	213	1	32
想念	xiǎng niàn	sentir saudades	47	1	34
好了	hǎo le	pronto	115	3	35
生死攸關	shēng sǐ yōu guān	vida ou morte	0	1	13
哔	bī	beep	1	1	\N
時	shí	quando	382	2	\N
博士	bó shì	doutor	50	1	24
克里斯	Kè Lǐ Sī	Chris	-143	1	43
布條	bù tiáo	atadura	0	1	42
感	gǎn	sentir	107	1	\N
喃喃	nán nán	balbuciar	1	1	22
爾	ěr	assim	183	1	\N
浴室	yù shì	banheiro	5	1	44
嘎	gā	grasnar	7	1	\N
特	tè	especial	42	1	\N
切除	qiē chú	remover	8	1	12
術	shù	técnica	6	1	\N
大部分	dà bù fèn	maior parte	3	1	44
放射	fàng shè	radiação	4	1	44
朋	péng	amigo	8	1	\N
克里斯蒂娜	kè lǐ sī dì nà	Cristina	-140	1	43
鐮子	yánuǐ	foice	0	1	\N
compress	kǎngbù	compressa	0	1	\N
已經	yǐ jīng	já	926	3	31
所	suǒ	que	433	2	\N
一个	yī gè	um	3	1	14
会	huì	será	7	1	\N
樣	yàng	aparência	143	2	\N
緊張	jǐn zhāng	nervosa	356	1	31
扇	shàn	porta (classificador)	9	1	\N
拿	ná	levar	191	1	\N
問題	wèn tí	problemas	402	2	42
採取	cǎi qǔ	tomar	33	1	33
帶	dài	trouxe	262	2	\N
這	zhè	isto	2835	3	\N
哭泣	kū qì	chorando	115	1	14
女士	nǚ shì	senhora	468	2	34
得	dé	partícula auxiliar	813	2	\N
候	hòu	momento	10	1	\N
的話	de huà	partícula condicional	99	1	54
的情況	de qíng kuàng	situação	13	1	52
喃	nán	balbuciar	2	1	\N
好的	hǎo de	ok	236	3	35
莉	lì	jasmim	112	1	\N
流	liú	fluir	53	1	\N
血	xuè	sangue	34	1	\N
希望	xī wàng	esperar	237	1	14
生	shēng	dar à luz	681	3	\N
準	zhǔn	preparar	9	1	\N
房	fáng	quarto	22	1	\N
做	zuò	fazer	989	3	\N
心	xīn	coração	280	3	\N
哭	kū	chorar	75	1	\N
夫	fū	marido	62	1	\N
孩子	hái zi	criança	473	2	25
就	jiù	exatamente	1118	3	\N
過	guò	partícula de experiência passada	697	3	\N
耐	nài	paciência	11	1	\N
大	dà	grande	251	3	\N
號	hào	dia/número	49	1	\N
找	zhǎo	procurar	199	3	\N
只	zhǐ	apenas	467	2	\N
話	huà	palavras	196	2	\N
失	shī	perder	46	1	\N
出來	chū lái	sair	63	2	12
器	qì	dispositivo	105	1	\N
沉默	chén mò	silêncio	29	1	24
等	děng	entre outros	395	2	\N
吧	ba	partícula final indicando suposição	1131	3	\N
你的	nǐ de	seu	474	3	35
治療	zhì liáo	tratamento	49	1	42
度	dù	passar	11	1	\N
謝謝	xiè xiè	obrigado	328	3	44
死	sǐ	morrer	213	1	\N
助手	zhù shǒu	assistente	143	1	43
瑞莎	Ruì shā	Rui Sha	15	1	41
族	zú	tribal	6	1	\N
作用	zuò yòng	efeito	24	1	44
走	zǒu	ir embora	537	2	\N
手術	shǒu shù	cirurgia	133	1	34
腫瘤	zhǒng yóu	tumor	2	1	32
下來	xià lái	para baixo	109	2	42
但	dàn	mas	1538	3	\N
拖延	tuō yán	procrastinar	1	1	12
不利	bù lì	desfavorável	7	1	44
道	dào	Dao	534	3	\N
你	nǐ	você	7716	3	\N
工作	gōng zuò	trabalho	260	3	14
稍後	shāo hòu	mais tarde	7	1	14
到	dào	até/para	704	3	\N
瑟莉塔	sè lǐ tǎ	Sèlǐtǎ	7	1	43
嗨	hāi	oi	237	1	\N
聲	shēng	som	442	2	\N
於	yú	em	343	1	\N
無法	wú fǎ	incapaz	230	1	23
顫抖		tremendo	2	1	\N
眼	yǎn	olho	63	1	\N
睛	jing	olho	4	1	\N
叫	jiào	chama	186	3	\N
靜	jìng	silêncio	45	1	\N
法	fǎ	posso	58	1	\N
靜一靜	jìng yī jìng	acalmar-se	8	1	41
奧圖沃	Ào tú wō	Otavio	0	1	42
一個人	yī gè rén	sozinho	118	2	14
奧	ào	profundo	165	1	\N
我	wǒ	eu	13083	3	\N
和	hé	e	873	3	\N
不想	bù xiǎng	não querer	117	2	43
會	huì	vai	1688	3	\N
靈	líng	espírito	78	1	\N
想	xiǎng	querer	1319	3	\N
看	kàn	ver	839	3	\N
我們	wǒ men	nós	2261	3	35
了	le	partícula verbal	4237	3	\N
很	hěn	muito	1027	3	\N
有	yǒu	ter	1596	3	\N
無	wú	sem	232	1	\N
種	zhǒng	tipo	206	1	\N
不	bù	não	2845	3	\N
的	de	partícula possessiva	8231	3	\N
心臟	xīn zàng	coração	63	1	14
認真的	rèn zhēn de	sério	9	1	41
當	dāng	quando	560	2	\N
這裡	zhè lǐ	aqui	935	3	43
說	shuō	disse	1226	3	\N
謊	huǎng	mentira	15	1	\N
歎息	tàn xī	suspiro	9	1	41
掩蓋	yǎn gài	cobrir	1	1	34
致	zhì	para	17	1	\N
來	lái	para	1104	3	\N
著	zhe	partícula indicando ação contínua	519	2	\N
吗	ma	partícula interrogativa	24	1	\N
從來	cóng lái	sempre	79	2	22
正在	zhèng zài	no momento	236	2	44
西	xī	oeste	186	2	\N
吻	wěn	beijo	98	1	\N
微笑	wēi xiào	sorrir	4	1	14
行動	xíng dòng	ação	33	1	24
將	jiāng	irá	411	1	\N
對	duì	certo	1046	3	\N
訴	sù	contar	26	1	\N
覺	jiào	sono	91	1	\N
視	shì	ver	28	1	\N
沒有	méi yǒu	não ter	892	3	23
何	hé	que	70	1	\N
開	kāi	abrir	434	2	\N
服務	fú wù	servir	134	1	24
從	cóng	de	531	2	\N
嘆息	tàn xī	suspiro	215	1	41
聽	tīng	ouvir	389	2	\N
總得	zǒng děi	sempre deve	3	1	33
公里	gōng lǐ	quilômetros	0	1	13
零	líng	zero	3	1	\N
遵守	zūn shǒu	cumprir	4	1	13
嘘	xū	shh	1	1	\N
知	zhī	saber	224	2	\N
阿馬里奧	ā mǎ lì ōu	Amaro	0	1	13
碰撞	pèng zhuàng	colisão	4	1	44
慢慢	màn màn	devagar	19	1	44
發	fā	emitir	136	1	\N
出	chū	sair	195	2	\N
婚	hūn	casamento	25	1	\N
讓	ràng	deixar	918	2	\N
以	yǐ	de	427	2	\N
請	qǐng	convidar	539	2	\N
什麼	shén me	o quê	1603	3	25
馬	mǎ	Ma	544	1	\N
關	guān	fechar	195	2	\N
要	yào	necessário	1433	3	\N
面	miàn	face	61	1	\N
謝	xiè	agradecer	234	2	\N
上	shàng	em cima	543	3	\N
好	hǎo	bom	1618	3	\N
醫生	yī shēng	médico	956	3	11
嗎	ma	partícula interrogativa	3086	3	\N
哇	wā	uau	234	1	\N
推薦	tuī jiàn	recomendar	24	1	14
塔	tǎ	ta (parte do nome)	101	1	\N
拉	lā	puxar	188	1	\N
機會	jī huì	oportunidade	57	1	14
外	wài	externo	60	1	\N
步	bù	passo	90	1	\N
驟	zhòu	etapa	76	1	\N
承諾	chéng nuò	promessa	44	1	24
只有	zhǐ yǒu	somente	123	2	33
進行	jìn xíng	realizar	138	2	42
有人	yǒu rén	há pessoas	50	3	32
訪客	fǎngkè	visitante	0	1	\N
克莉絲蒂娜	Kè lì sī dì nà	Cristina	26	1	44
瑪塔	mǎ tǎ	Marta	-112	1	33
瓷	cí	porcelana	0	1	\N
烏	wū	Wu	14	1	\N
蘇	sū	su (nome de uma pessoa ou lugar, não se aplica aqui)	12	1	\N
歧	qí	distorção	2	1	\N
介紹	jiè shào	apresentar	10	1	44
骨折	guā shé	fratura óssea	0	1	12
男人	nán rén	homem	171	3	22
glance	glance	olhar	0	1	\N
觸	chù	tocar	0	1	\N
握	wò	agarrar	4	1	\N
一	yī	um	843	3	\N
聲音	shēng yīn	som	75	1	11
睡眠	mèi miàn	sono	0	1	44
任	rèn	deixar	10	1	\N
敵人	dí rén	inimigos	13	1	22
他	tā	ele	1890	3	\N
倫	lún	ética	5	1	\N
幸	xìng	sorte	24	1	\N
知道	zhī dào	saber	1442	3	14
人	rén	pessoas	995	3	\N
整個	zhěng gè	todo	73	1	34
是	shì	é	4535	3	\N
任何	rèn hé	qualquer	340	2	42
一位	yī wèi	um	153	2	14
躺	tǎng	deitar	15	1	\N
阿	ā	partícula	41	1	\N
門	mén	porta	404	3	\N
感覺	gǎn jué	sentir	178	1	32
敲	qiāo	bater	38	1	\N
見	jiàn	ver	193	2	\N
跑	pǎo	correr	39	1	\N
燃燒	rán shāo	queimar	3	1	21
睡	shuì	dormir	58	1	\N
時間	shí jiān	tempo	278	2	21
家裡	jiā lǐ	casa	57	2	13
東西	dōng xī	coisas	301	3	11
運	yùn	sorte	50	1	\N
簡單	jiǎn dān	simples	39	1	31
告	gào	processar	24	1	\N
里	lǐ	interior	26	1	\N
嗯	ń	hmm	827	3	\N
結	jié	amarrar	87	1	\N
一個	yī gè	um	815	3	14
愛	ài	amor	411	3	\N
身體	shēn tǐ	corpo	95	2	13
手	shǒu	mão	119	2	\N
\.


--
-- TOC entry 3050 (class 0 OID 41026)
-- Dependencies: 206
-- Data for Name: word_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.word_translation (id, word, translation) FROM stdin;
1	瑪塔醫生	Dr. Marta
2	瑪塔醫生	Marta Doctor
\.


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 205
-- Name: word_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.word_translation_id_seq', 2, true);


--
-- TOC entry 2914 (class 2606 OID 16398)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 2912 (class 2606 OID 16393)
-- Name: hanzi pk_hanzi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hanzi
    ADD CONSTRAINT pk_hanzi PRIMARY KEY ("character");


--
-- TOC entry 2916 (class 2606 OID 16428)
-- Name: word pk_word; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word
    ADD CONSTRAINT pk_word PRIMARY KEY (word);


--
-- TOC entry 2918 (class 2606 OID 41034)
-- Name: word_translation pk_word_translation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_translation
    ADD CONSTRAINT pk_word_translation PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 41035)
-- Name: word_translation fk_word_translation_word_word; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.word_translation
    ADD CONSTRAINT fk_word_translation_word_word FOREIGN KEY (word) REFERENCES public.word(word);


-- Completed on 2025-10-10 15:24:10 UTC

--
-- PostgreSQL database dump complete
--

