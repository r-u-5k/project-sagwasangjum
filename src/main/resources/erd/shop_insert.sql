
--멤버 insert
insert into member(m_id,m_pw,m_name,m_phone,m_email,m_address,m_regdate) values('minsub1','1111','김민섭1','010-1233-4566','ms1@korea.com','서울시강남구아이티윌',sysdate);
insert into member(m_id,m_pw,m_name,m_phone,m_email,m_address,m_regdate) values('minsub2','2222','김민섭2','010-4566-1233','ms2@korea.com','안성시강남구아이티윌',sysdate);
insert into member(m_id,m_pw,m_name,m_phone,m_email,m_address,m_regdate) values('minsub3','3333','김민섭3','010-7899-1233','ms3@korea.com','부산시강남구아이티윌',sysdate);
insert into member(m_id,m_pw,m_name,m_phone,m_email,m_address,m_regdate) values('guard','1111','김경호','010-1111-1111','guard@gmail.com','서울시',sysdate);

--상품 카테고리 넣기 
insert into product_category(p_category_no,p_category_name) values(1,'아이폰');
insert into product_category(p_category_no,p_category_name) values(2,'맥북');
insert into product_category(p_category_no,p_category_name) values(3,'아이패드');
insert into product_category(p_category_no,p_category_name) values(4,'워치');
insert into product_category(p_category_no,p_category_name) values(5,'에어팟');

--insert
--상품 넣기

insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPhone 13',1100000,'iphone_13_500.png','아름답고 견고한 디자인, 놀라운 배터리 사용 시간, 풍부한 듀얼 카메라 시스템',1);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPhone 14',1090000,'iphone_14_500.png','여전한 놀라움, Super Retina XDR 디스플레이, 인물 사진 모드',1);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPhone 14 Plus',1250000,'iphone_14_plus_500.png','여전한 놀라움, 17.0cm 디스플레이, 인물 사진 모드',1);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPhone 15',1250000,'iphone_15_500.png','새로움 물씬, 막강한 성능, 떴다 떴다 Dynamic Island',1);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPhone 15 Plus',1350000,'iphone_15_plus_500.png','속속들이 스며든 색상, 구석구석 견고한 글래스, 새롭게 찾아온 카메라',1);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPhone 15 Pro',1550000,'iphone_15_pro_500.png','궁극의 iPhone, 기가 막히게 빠른 기가급 전송, 진정 프로다운 배터리 성능
',1);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPhone 15 Pro Max',1900000,'iphone_15_pro_max_500.png','티타늄을 두르다, 괴물 프로세서, 상상 이상의 카메라',1);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPhone se',880000,'iphone_se_500.png','거침없는 파워, 실속 있는 선택, 스피드는 집안 내력
',1);

insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iMac',1990000,'imac_500.png','이젠 더 파워풀, 당신을 표현하는 색깔, 얇다는 건 이런 것',2);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'MacBook Air 13 m3',1590000,'macbook_air13_m3_500.png','날렵하게, 강력하게, M3답게',2);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'MacBook Air 15 m3',1890000,'macbook_air15_m3_500.png','가뿐한 휴대성, 꿈같은 네 가지 컬러, 당신의 모든 최애 앱이 macOS에서 훨훨
',2);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'MacBook Pro 14 m3',2390000,'macbook_pro_14_m3_500.png','3나노미터 기술, GPU 아키텍처, 프로다운 성능과 역량',2);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'MacBook Pro 14 m3 Max',4790000,'macbook_pro_14_m3_max_500.png','게임의 판도를 바꾸는 그래픽 성능, 2.5배 빠른 렌더링, 하드웨어 가속형 레이 트레이싱
',2);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'MacBook Pro 14 m3 Pro',2990000,'macbook_pro_14_m3_pro_500.png','80% 더 빠른 CPU, Mac 사상 가장 긴 배터리 사용 시간, 노트북 사상 최고의 디스플레이',2);

insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPad Air',1249000,'ipad_air_500.png','전면적인 아름다움, 즐거움도 M1의 스피드로, 스트리밍도 공유도 이곳저곳에서',3);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPad Mini',769000,'ipad_mini_500.png','메가급 성능, 크기만 미니, iPad의 능력이 한 손 안에 쏙, 큰 아이디어가 현실이 되는 캔버스',3);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'iPad Pro',1749000,'ipad_pro_500.png','막강한 성능의 M2 칩 탑재, 빼어나고 찬란한 Liquid Retina XDR 디스플레이, 초고속 Wi-Fi로 쏜살같은 연결
',3);

insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'Apple Watch Series9',599000,'watch_series9_500.png','장 보면서 음악 재생하기, 보드 타는 중에 전화 받기, 국 젖는 동안 타이머 중단하기',4);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'Apple Watch Ultra2',1149000,'watch_ultra2_500.png','손끝을 톡톡, 시계를 척척, 한 차원 높은 모험
',4);

insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'AirPods 2세대',199000,'airpods2_500.png','선이 없다, 간결하다, 경이롭다, 진정한 의미의 무선
',5);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'AirPods 2세대 Magsafe',359000,'airpods2_magsafe_500.png','귀가 즐거워지는 성능, 올려두면 충전 시작, Siri는 오른팔
',5);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'AirPods 3세대',259000,'airpods3_500.png','온몸을 휘감는 3차원 오디오, 비가 와도 끄떡없는 생활 방수 기능, 베이스는 더 깊게, 하이톤은 더 맑게',5);
insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'AirPods 3세대 Magsafe',269000,'airpods3_magsafe_500.png','당신의 귀에 꼭 맞게 사운드를 조정해주는 적응형 EQ, 순식간에 완충되는 배터리, 바람까지 걸러주는 특수 마이크',5);

insert into product(p_no,p_name,p_price,p_image,p_content,p_category_no) values(product_p_no_seq.nextval,'AirPods Max',769000,'airpods_max_500.png','과감하고 독창적인 구조, 단조로움을 거부하는 5가지 색상, 지치지 않는 배터리로 앵콜 받습니다',5);



---------- INSERT ----------
-- 리뷰 작성
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '만족만족 대만족이에영! 원래 아이폰12썼었는데 일상생활에 사용하기엔 좀 무거운 감이 있길래 이걸로 바꿨어요~! 신상이라 그런지 확실히 전의 기종보다는 가볍고 너무 예쁘고 ㅎㅎㅎ 아직 사용 이틀차지만 너무 만족하면서 사용하고 있습니다 ㅎㅎ', sysdate, '★★★★★', 1, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '아이폰을 처음만난 순간♥ 저는 원래 갤럭시만 쓰다가 작년에 처음 아이폰을 구매했어용 원래 핸드폰에 크게 관심이 없었는데 세상에 보기만 해도 너무 좋고 새로운 제품들이 기대되는거 있죠?! 예쁘게 잘 쓰겠습당 ㅎㅎ',sysdate, '★★★★★', 1, 'minsub3');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '굳. 가격은 좀 비싼듯',sysdate, '★★★★☆', 1, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '이 값주고 이거 살거면 한단계 업그레이드 한 거 살듯. 차이가 조금밖에 안난다고 해서 그랬던건데 음...ㅋ..',sysdate, '★☆☆☆☆', 1, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, 'ㄱㅊㄱㅊ',sysdate, '★★★★☆', 2, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '기존에 아이폰12 사용했는데 128 썼다가 512로 지금 바꾸니까 용량도 크고 너무 좋네요 아이폰 디자인과 카메라는 말해 뭐해여 ㅋ 다만 배송이 좀..느렸어요^^',sysdate, '★★★★☆', 2, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '저는 처음 폰을 사용할 때부터 아이폰을 썼었는데 이제는 떠나보낼 때가 됐나봐요^^... 갈수록 나빠지면 나빠졌지 좋아지는 점들이 없네요',sysdate, '★★☆☆☆', 2, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '관리자의 권한으로 제한된 게시글입니다.',sysdate, '★☆☆☆☆', 2, 'minsub3');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '걍 그럼; 산지 일주일도 안됐는데 폰이 지멋대로 멈추고 이딴걸 왜 팜;; 비싸게 가격을 측정했으면 그 값어치를 했으면 좋겠음^^ 카툭튀는 언제 고치실 건가여? 배송박스도 엉망이라 기분 안좋았는데 제품자체도 에바네요', sysdate, '★☆☆☆☆', 1, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '걍 그래여; 전거랑 딱히 다른 것도 모르겠고', sysdate, '★★☆☆☆', 2, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '나이들어서 아이폰이 불편할거라고 주변에서 다들 그랬는데 뭐든 익숙해지면 불편한게 어디있나요^^~** 예뻐서 사용하는 내내 기분이 좋아용', sysdate, '★★★★★', 3, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '할많하않', sysdate, '★★☆☆☆', 3, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '다 좋은데 아직도 배송업체 바꾸실 생각이 없으신가봐요? 올때마다 그지같이 오는데 좀 해결 해주세요;;', sysdate, '★☆☆☆☆', 3, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '리뷰가 너무 안좋아서 고민하다 시켰는데 굳 갓 애플 아닙니까 하하하', sysdate, '★★★★★', 3, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '이렇게까지 뽑기에 실패할 줄은 몰랐어요 뭐 제대로 작동되는가 싶다가도 안되니까 화만나고 인내심키우기인가요 고객센터는 전화 받지도 않고 소비자 기만도 아니고 그럼 번호는 왜 있나요', sysdate, '★★☆☆☆', 4, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '딱히.. 좋지도 나쁘지도.. 그냥 쓰던거니까 씀', sysdate, '★★★☆☆', 4, 'minsub3');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '자급제는 처음 써보는데 느낌이 색다르네요 하핳ㅎ 사진을 많이 찍는 저로써는 용량이 큰 것도 마음에 들고 화질도 좋고 아이폰만의 갬성느낌이 살아있어서 조아요! 마! 싸롸있ㄴㅔ!', sysdate, '★★★★★', 4, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '공홈에서 이럴 줄은 몰랐어요 배송왔다길래 설레하면서 개봉했는데 세상에 빈박스라니. 사과상점인데 사과는 없네여 ㅋ 별 1점도 아깝습니다...', sysdate, '★☆☆☆☆', 5, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '아이폰is뭔들', sysdate, '★★★★☆', 6, 'minsub3');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '갤럭시 쓰다가 예쁜 폰케이스가 없어서 확 갈아탔는데 처음에는 이것저것 익숙치 않아 어려웠지만 금방 적응했습니당 잘쓸게요 힛', sysdate, '★★★★★', 6, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, 'GOOD', sysdate, '★★★★★', 7, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '프로라인이 부담스러우신 분들이 쓰기 딱 좋아요 세련된 아이폰은 원하지만 고스펙은 필요하지 않은 분들이 구매하시면 굳', sysdate, '★★★★☆', 8, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, 'soso', sysdate, '★★☆☆☆', 8, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '저는 오늘부터 잡스 아버지를 추앙하기로 했습니다.', sysdate, '★★★★★', 8, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '우선 작고 가벼워서 좋아용 저는 손이 작아서 요즘 나오는 큰 폰을 조작하기가 어려웠는데 딱 좋습니당', sysdate, '★★★★☆', 8, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '갬성 인테리어 용으로 딱. 사실 이렇게까지 사양 좋은건 필요없지만.. 존재만으로도 이유가 있다.', sysdate, '★★★★★', 9, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '노란색. 무조건 노란색 사세요 진심 개이쁨 ㅠ 미쳔나 지구 뿌셔뿌셔', sysdate, '★★★★★', 9, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '삼성 엘지가 확실히 편하긴한데 맥은 기술이...최고... 하지만 초보애플유저는 잘... 적응해보겠습니다', sysdate, '★★★★☆', 10, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '전자기기는 다 애플이라서 연동이 되서 편해여', sysdate, '★★★★☆', 10, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '배송 장난하나. 문 앞에 놓아달라했는데 중앙현관 앞에 놓아두셨네요? 가격이 싼 제품도 아닌데 이딴식으로 해도 되는건가요?', sysdate, '☆☆☆☆☆', 10, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '성능에 비해 비싼감이 없지않아 있긴하지만 다른 명품시계 사는 것보다는 싸게 먹히고 기능도 다양하니 이만한 시계는 없는 것 같긴해여.', sysdate, '★★★★☆', 4, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '드디어 겟-★했습니다 나의 겨울을 나게해줄 귀마개>< 음질이 진짜 너무 좋아서 저와 음악만 한 공간에 있는 기분이에요~ 이것만 있으면 뮤직이즈마이라이프 ~~!! 꺄핳ㅎ ', sysdate, '★★★★★', 24, 'minsub3');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '소프트웨어가 최신거라서 앞으로 몇년은 거뜬하네용 그렇지만 가격은 항상 아쉽 ㅠ', sysdate, '★★★★☆', 11, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '블랙보다는 스그 사고싶었지만 역시 스그의 인기는 식을 줄 모르네요...ㅠㅠㅠㅠ 그래도 만족..', sysdate, '★★★★★', 11, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '당신의 별점은! 별점도둑이 가져간다!', sysdate, '★☆☆☆☆', 11, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '화면이 크니까 확실히 무겁긴 한데 재택근무용으로 쓰는거라 상관없어용', sysdate, '★★★★☆', 12, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '쓸 때마다 기분 좋음. 영상편집하기도 좋고 굳 ', sysdate, '★★★★★', 12, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '비와서 택배상태 레전드; 다른제품들 리뷰보니까 배송 말이 많던데 왜 끝까지 고집하시는건가요 소비자랑 기싸움하는 것도 아니고ㅋ', sysdate, '★☆☆☆☆', 13, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, 'ㅂㄹ', sysdate, '★☆☆☆☆', 13, 'minsub3');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '괜찮아요 무난함', sysdate, '★★★☆☆', 14, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '결국 폰까지 애플로 넘어가야하나.. 맥 좋네여.....', sysdate, '★★★★★', 14, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '와이프가 너무 좋아해요! 만족', sysdate, '★★★★★', 15, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '아이패드 갖고싶은 병은 가질 때까지 못고친다더니.. 결국 질렀습니다 ㅋ 충동적이었지만 너무 만족', sysdate, '★★★★★', 15, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '솔~~~~~~~~~~직히 이것저것 부속품들 사다보면 개비싼데 로고빨 하나로 다 이해시킴', sysdate, '★★★☆☆', 15, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '아이패드 다들 있는데 나만 없어~그래서 구매완 자격증 공부를 핑계로 ...ㅎㅎㅎ 애플은 가격방어도 좋아서 잘 선택했다 싶어요 근데 배송은 진짜 에바', sysdate, '★★★★☆', 16, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '게임돌릴 땐 살짝 발열이 있긴한데 주로 드로잉용으로 사용해서 ㄱㅊㄱㅊ', sysdate, '★★★★☆', 16, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '굿굿', sysdate, '★★★☆☆', 17, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '애플의 모든 기능을 다 쓸 때까지 잘 써보겠습니당 배송 짱빠름', sysdate, '★★★★★', 17, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '첫째 생일이라 사줬는데 유용하게 잘 썼으면 좋겠네요', sysdate, '★★★★★', 17, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '러닝용으로 샀는데 굳. 사용하기도 편하고 근데 배터리 사용 시간이 길지 않아서 자주 충전해줘야함', sysdate, '★★★☆☆', 18, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '무난', sysdate, '★★★☆☆', 18, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '차기만해도 간지철철 워치 자체도 무겁지 않고 직업 특성상 일할 때 휴대폰을 못보는데 그런 점에서 워치로 볼 수 있는게 큰 장점입니다', sysdate, '★★★★★', 18, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '호적메이트한테 뜯어낸 워치 꺄핳ㅎ 너무 좋지만 단점을 굳이굳이 하나 뽑자면 역시 가격...프라이스...^^ 두 익스펜시브...', sysdate, '★★★★☆', 18, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '선물용으로 구매', sysdate, '★★★★☆', 19, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '어머니께 선물로 드렸습니다. 설날 선물로 드렸더니 너무 좋아하시네요', sysdate, '★★★★★', 20, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '음질, 노이즈캔슬링 만족. 줄이어폰 간지를 못놓다가 이번에 샀는데 굳', sysdate, '★★★★★', 20, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '충전 빨리돼요', sysdate, '★★★☆☆', 21, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '좋음', sysdate, '★★★★★', 21, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '방진기능이 있어서 좋아요 에어팟이야 뭐 항상 쓰던거라 딱히 다른 말 쓸 건 없음', sysdate, '★★★★☆', 21, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '뭐야 한짝 더줘요; 어디갔어요', sysdate, '★☆☆☆☆', 22, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '나름 큰 맘 먹고 구매했는데 3일만에 테이프 늘어지는 소리남 ㅠ', sysdate, '★☆☆☆☆', 22, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '터치가... 노터치... 돈땃쥐미...', sysdate, '★★☆☆☆', 22, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '1세대 계속 쓰다가 추위에 금방 꺼지고 배터리도 금방 닳아서 샀어용 굳굳 만족 이번에도 오래쓰장', sysdate, '★★★★★', 23, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '오디오 기술 탑재해서 더 생동감있고 깊어졌어요 굳 이거 쓰다가 다른거 쓰면 만족못함', sysdate, '★★★★★', 23, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '남편에게 줄 선물로 샀어요^^ 완전 서프라이즈~ @)---- ', sysdate, '★★★★★', 23, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '가격 때문에 망설여져서 가성비제품 쓰다가 귀도 아프고 성능도 별로라 결국 샀습니다... 무겁긴한데 만족', sysdate, '★★★★☆', 24, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '애플유저 아니시라면 굳이 안사셔도 될듯 다른 회사거 사도 ㄱㅊ', sysdate, '★★★☆☆', 24, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '스그 외쳤다가 실물보고 그린샀어요 진짜 색 잘 뽑음 ㅠ', sysdate, '★★★★★', 24, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '퇴사선물로 구매함 만족', sysdate, '★★★★★', 24, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (review_r_no_SEQ.nextval, '생각보다 사용 잘 안하게 됨...하지만 성능은 좋은듯', sysdate, '★★★★☆', 24, 'minsub1');


--order insert 
--제품상세보기에서주문
INSERT INTO orders (order_no, order_date, order_desc, order_price, m_id, order_addr, order_name, order_phone) VALUES (orders_order_no_SEQ.nextval, sysdate  , '아이폰외 1종', 123123, 'minsub1','서울시','김수환','010-4996-2719');
INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, 3, orders_order_no_SEQ.currval, 2);


--카트에서주문
INSERT INTO orders (order_no, order_date, order_desc, order_price, m_id, order_addr, order_name, order_phone) VALUES (orders_order_no_SEQ.nextval, sysdate  , '아이폰외 1종', 123123, 'minsub1','서울시','김수환','010-4996-2719');
INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, 3, orders_order_no_SEQ.currval, 2);
INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, 3, orders_order_no_SEQ.currval, 3);
INSERT INTO order_item (oi_no, oi_qty, order_no, p_no) VALUES (order_item_oi_no_SEQ.nextval, 3, orders_order_no_SEQ.currval, 4);




--cart insert
INSERT INTO CART(C_NO, C_QTY, P_NO, M_ID) VALUES(CART_C_NO_SEQ.NEXTVAL, 1, 1, 'guard');
INSERT INTO CART(C_NO, C_QTY, P_NO, M_ID) VALUES(CART_C_NO_SEQ.NEXTVAL, 1, 2, 'guard');
INSERT INTO CART(C_NO, C_QTY, P_NO, M_ID) VALUES(CART_C_NO_SEQ.NEXTVAL, 1, 3, 'guard');

--board insert
/*
insert into board (b_no,b_title,b_writer,b_content,b_date,b_groupNo,b_step,b_depth) 
values (board_sequence.nextval , 
'타이틀'||board_sequence.currval,
'글쓴이'||board_sequence.currval,
'내용'||board_sequence.currval,
sysdate,
board_sequence.currval,
1,0); 

-- 답글 쓰기
/*현재글의 데이타를 기반으로 작업한다.
    1. boardno : 시퀀스증가
    2. groupno : 현재글의 groupno
    3. step    : 현재글의 step  + 1
    4. depth   : 현재글의 depth + 1
 

-- 현재 글의 step보다 큰 step을 가진 게시물들의 step + 1씩 증가 
update board set b_step = b_step+1 where b_step > 1 and b_groupNo = 1;
-- 답글 쓰기
insert into board (b_no , b_title , b_writer , b_content , b_date , b_groupNo , b_step , b_depth)
values (board_sequence.nextval , 
'타이틀'||board_sequence.currval,
'글쓴이'||board_sequence.currval,
'내용'||board_sequence.currval,
sysdate,
1,
2,1); 
*/