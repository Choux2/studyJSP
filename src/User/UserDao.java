package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

    private Connection conn;
    private PreparedStatement pstmt; //SQL문 실행준비단계
    private ResultSet rs; //실행했을 때 나오는 결과

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

    public int login(String USER_ID, String USER_PW) {
        String SQL = "SELECT USER_PW FROM user WHERE USER_ID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, USER_ID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString(1).equals(USER_PW)) {
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

    public int join(UserVo user) {
        String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUSER_ID());
            pstmt.setString(2, user.getUSER_PW());
            pstmt.setString(3, user.getUSER_NAME());
            pstmt.setString(4, user.getUSER_GENDER());
            pstmt.setString(5, user.getUSER_EMAIL());
            return pstmt.executeUpdate();
        }   catch (Exception e) {
            e.printStackTrace();
        }
        return -1; //데이터베이스 오류
    }
}
