package com.itwill.shop.board.init;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

public class BoardDataInsertMain {

	public static void main(String[] args) throws Exception {

		Connection con = null;
		Statement stmt = null;

		try {
			Properties properties = new Properties();

			properties.load(BoardDataInsertMain.class.getResourceAsStream("/jdbc.properties"));

			// Apache DataSource

			BasicDataSource basicDataSource = new BasicDataSource();
			basicDataSource.setDriverClassName(properties.getProperty("spring.datasource.driver-class-name"));
			basicDataSource.setUrl(properties.getProperty("spring.datasource.url"));
			basicDataSource.setUsername(properties.getProperty("spring.datasource.username"));
			basicDataSource.setPassword(properties.getProperty("spring.datasource.password"));

			DataSource dataSource = basicDataSource;

			con = dataSource.getConnection();
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

			con.setAutoCommit(false);

			for (int i = 1; i <= 149; i++) {
				stmt.addBatch("INSERT INTO board (b_no, b_title, b_writer, b_content,b_date, b_groupNo, b_step , m_id)" + " VALUES ("
						+ "board_sequence.nextval," + "'상품문제로 문의 드립니다'||board_sequence.currval ,"
						+ "'말썽쟁이'||board_sequence.currval," + "'상품에 문제가 발생했어요!!! 도와주세요!!'||board_sequence.currval,"
						+ "sysdate,"
						+ "board_sequence.currval," + "1," + "minsub1)");

			}

			int[] updateCounts = stmt.executeBatch();
			System.out.println("query 수:" + updateCounts.length);
			
			con.commit();

			System.out.println("success commit!!!!");

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();

				System.out.println("rollback !!!");
			} catch (SQLException e1) {

				System.out.println("rollback fail!!!");
			}
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {

				System.out.println("close 시 에러발생");
			}
		}

	}
}
