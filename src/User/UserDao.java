package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDao() {
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

    public int login(String userID, String userPW) {
        String SQL = "SELECT userPW FROM user WHERE userID";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString(1).equals(userPW)) {
                   return 1; //로그인 성공
                }
                else
                    return 0; //비밀번호 불일치
            }
            return -1; //아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; //데이터베이스 오류

    }
}
