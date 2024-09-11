package board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    // db 접속
    public BoardDao() {
        try {
            String url = "jdbc:mysql://localhost:3306/board_db";
            String userName = "root";
            String password = "yerim486";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //crud에 해당하는 쿼리들을 전송
    //삽입(C)
    public int insert(BoardVo vo) {
        Connection con = null;
        PreparedStatement pstmt;
        String query = "insert into board (title, writer, content, regdate, cnt) values (?, ?, ?, now(), 0)";
        int ret = -1;
        try {
            pstmt = con.prepareStatement(query);
            pstmt.setString (1, vo.getTitle());
            pstmt.setString(2, vo.getWriter());
            pstmt.setString(3, vo.getContent());
            ret = pstmt.executeUpdate();
            return ret;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ret;
    }

    //조회(R)
    public List<BoardVo> selectAll() {
        Connection con;
        Statement stmt;
        String query = "select * from board";
        ArrayList<BoardVo> ls = new ArrayList<BoardVo>();
        try {
//            con =
        } finally {

        }
        return null;
    }
}
