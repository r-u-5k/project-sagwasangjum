---------- INSERT ----------
-- 리뷰 작성
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (1, '만족만족 대만족이에영! 원래 아이폰12썼었는데 일상생활에 사용하기엔 좀 무거운 감이 있길래 이걸로 바꿨어요~! 신상이라 그런지 확실히 전의 기종보다는 가볍고 너무 예쁘고 ㅎㅎㅎ 아직 사용 이틀차지만 너무 만족하면서 사용하고 있습니다 ㅎㅎ', sysdate, '★★★★★', 1, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (2, '걍 그럼; 산지 일주일도 안됐는데 폰이 지멋대로 멈추고 이딴걸 왜 팜;; 비싸게 가격을 측정했으면 그 값어치를 했으면 좋겠음^^ 카툭튀는 언제 고치실 건가여? 배송박스도 엉망이라 기분 안좋았는데 제품자체도 에바네요', sysdate, '★☆☆☆☆', 1, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (3, '걍 그래여; 전거랑 딱히 다른 것도 모르겠고', sysdate, '★★☆☆☆', 2, 'minsub1');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (4, '성능에 비해 비싼감이 없지않아 있긴하지만 다른 명품시계 사는 것보다는 싸게 먹히고 기능도 다양하니 이만한 시계는 없는 것 같긴해여.', sysdate, '★★★★☆', 4, 'minsub2');
INSERT INTO review(r_no, r_content, r_date, r_star, p_no, m_id) VALUES (5, '드디어 겟-★했습니다 나의 겨울을 나게해줄 귀마개>< 음질이 진짜 너무 좋아서 저와 음악만 한 공간에 있는 기분이에요~ 이것만 있으면 뮤직이즈마이라이프 ~~!! 꺄핳ㅎ ', sysdate, '★★★★★', 6, 'minsub3');

---------- SELECT ----------
-- 리뷰 전체보기(all)
SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review; 

-- 한 회원이 작성한 리뷰 전체보기(m_id)
SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE m_id = 'minsub1';

-- 한 제품의 리뷰 전체보기(p_no)
SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE p_no = 2;

-- 한 제품의 리뷰 상세보기(r_no)
SELECT r_no, r_content, r_date, r_star, p_no, m_id FROM review WHERE r_no = 3;