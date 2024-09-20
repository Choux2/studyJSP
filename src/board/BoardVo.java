package board;

public class BoardVo {

    private int BOARD_NUM;
    private String BOARD_TITLE;
    private String USER_ID;
    private String BOARD_DATE;
    private String BOARD_CONTENT;
    private int BOARD_AVAILABLE;

    public BoardVo() {
    }

    public int getBOARD_NUM() {
        return BOARD_NUM;
    }

    public void setBOARD_NUM(int BOARD_NUM) {
        this.BOARD_NUM = BOARD_NUM;
    }

    public String getBOARD_TITLE() {
        return BOARD_TITLE;
    }

    public void setBOARD_TITLE(String BOARD_TITLE) {
        this.BOARD_TITLE = BOARD_TITLE;
    }

    public String getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(String USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getBOARD_DATE() {
        return BOARD_DATE;
    }

    public void setBOARD_DATE(String BOARD_DATE) {
        this.BOARD_DATE = BOARD_DATE;
    }

    public String getBOARD_CONTENT() {
        return BOARD_CONTENT;
    }

    public void setBOARD_CONTENT(String BOARD_CONTENT) {
        this.BOARD_CONTENT = BOARD_CONTENT;
    }

    public int getBOARD_AVAILABLE() {
        return BOARD_AVAILABLE;
    }

    public void setBOARD_AVAILABLE(int BOARD_AVAILABLE) {
        this.BOARD_AVAILABLE = BOARD_AVAILABLE;
    }
}
