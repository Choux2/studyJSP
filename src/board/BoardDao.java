package board;

import java.sql.*;
import java.util.ArrayList;

public class BoardDao {

    private Connection conn;
    private ResultSet rs;

    // db 접속
    public BoardDao() {
        try {
            String url = "jdbc:mysql://localhost:3306/board_db";
            String userName = "root";
            String password = "yerim486";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //현재 시간 가져오기
    public String getDate() {
         String SQL = "SELECT NOW()";
         try {
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             rs = pstmt.executeQuery();
             if (rs.next()) {
                 return rs.getString(1);
             }
         } catch (Exception e) {
             e.printStackTrace();
         }
         return ""; //데이터베이스 오류
    }

    //게시글 번호 지정
    public int getNext() {
        String SQL = "SELECT BOARD_NUM FROM BOARD ORDER BY BOARD_NUM DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1; //첫번째 게시물인 경우
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }

    //게시글 작성
    public int write(String BOARD_TITLE, String USER_ID, String BOARD_CONTENT) {
        String SQL = "INSERT INTO board VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext()); //게시글 번호
            pstmt.setString(2, BOARD_TITLE);
            pstmt.setString(3, USER_ID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, BOARD_CONTENT);
            pstmt.setInt(6, 1); //글이 작성된 상태
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }

    //게시글 불러오기 (페이지)
    public ArrayList<BoardVo> getList(int pageNumber) {
        String SQL = "SELECT * FROM board WHERE BOARD_NUM < ? AND BOARD_AVAILABLE = 1 ORDER BY BOARD_NUM DESC LIMIT 10";
        ArrayList<BoardVo> list = new ArrayList<BoardVo>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardVo board = new BoardVo();
                board.setBOARD_NUM(rs.getInt(1));
                board.setBOARD_TITLE(rs.getString(2));
                board.setUSER_ID(rs.getString(3));
                board.setBOARD_DATE(rs.getString(4));
                board.setBOARD_CONTENT(rs.getString(5));
                board.setBOARD_AVAILABLE(rs.getInt(6));

                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //페이징 처리
    public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM board WHERE BOARD_NUM < ? AND BOARD_AVAILABLE = 1;";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    //글 내용 불러오기
    public BoardVo getBoard(int BOARD_NUM) {
        String SQL = "SELECT * FROM board WHERE BOARD_NUM = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,BOARD_NUM);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                BoardVo board = new BoardVo();
                board.setBOARD_NUM(rs.getInt(1));
                board.setBOARD_TITLE(rs.getString(2));
                board.setUSER_ID(rs.getString(3));
                board.setBOARD_DATE(rs.getString(4));
                board.setBOARD_CONTENT(rs.getString(5));
                board.setBOARD_AVAILABLE(rs.getInt(6));
                return board;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; //글이 없는 경우
    }

    //글 수정
    public int update(int BOARD_NUM, String BOARD_TITLE, String BOARD_CONTENT) {
        String SQL = "UPDATE board SET BOARD_TITLE = ?, BOARD_CONTENT = ? WHERE BOARD_NUM = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, BOARD_TITLE);
            pstmt.setString(2, BOARD_CONTENT);
            pstmt.setInt(3, BOARD_NUM);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }

    public int delete(int BOARD_NUM) {
        String SQL = "UPDATE board SET BOARD_AVAILABLE = 0 WHERE BOARD_NUM = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, BOARD_NUM);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }
}
