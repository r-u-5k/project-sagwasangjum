package com.itwill.shop.board.util;

import com.itwill.shop.board.Board;

public class BoardUtils {

	public static String convertHtmlBr(String comment) {

		if (comment == null)
			return "";
		int length = comment.length();
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < length; i++) {
			String tmp = comment.substring(i, i + 1);
			if ("\r".compareTo(tmp) == 0) {
				tmp = comment.substring(++i, i + 1);
				if ("\n".compareTo(tmp) == 0)
					buffer.append("<br>\r");
				else
					buffer.append("\r");
			}
			buffer.append(tmp);
		}
		return buffer.toString();
	}

	public String getTitleString(Board board) {
		StringBuilder title = new StringBuilder(128);
		String t = board.getBTitle();
		if (t.length() > 15) {

			t = String.format("%s...", t.substring(0, 15));
		}
		// 답글공백삽입

		for (int i = 0; i < board.getBDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}

		if (board.getBDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}

		title.append(t.replace(" ", "&nbsp;"));

		return title.toString();
	}

}
