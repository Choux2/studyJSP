//package common;
//
//import javax.naming.InitialContext;
//import javax.naming.NamingException;
//import javax.sql.DataSource;
//import java.sql.Connection;
//import java.sql.SQLException;
//
//public class JdbcUtil {
//    private static JdbcUtil instance = new JdbcUtil();
//
//    private static DataSource ds;
//
//    static {
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            System.out.println("드라이버 로딩 성공!");
//            InitialContext ctx = new InitialContext();
//            ds = (DataSource)ctx.lookup("java:/comp/env");
//            System.out.println("Connection Pool 생성!");
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        } catch (NamingException e) {
//            e.printStackTrace();
//        }
//    }
//
//    private JdbcUtil() {}
//
//    public JdbcUtil getInstance() {
//        return instance;
//    }
//
//    public Connection getConnection() throws SQLException {
//       return ds.getConnection();
//    }
//
//}

