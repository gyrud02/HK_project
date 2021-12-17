package QnABoard;

import java.sql.Timestamp;

public class BoardBean { // 게시판 관리하는 DTO클래스

	private int num; // 글번호
	private String name; // 작성자
	private String subject; //글제목
	private String content; //글내용
	private int readcount; //조회수
	private Timestamp writedate; // 작성일
	private int re_ref; // 주글의 그룹번호
	private int re_lev; // 주글의 들여쓰기 정도값
	private int re_seq; // 주글들 내의  조회한 주글의 순서값
	private String ip; // IP주소
	
	
	// getter/setter메소드
	public int getNum() {return num;}
	public void setNum(int num) {this.num = num;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getSubject() {return subject;}
	public void setSubject(String subject) {this.subject = subject;}
	public String getContent() {return content;}
	public void setContent(String content) {this.content = content;}
	public int getReadcount() {return readcount;}
	public void setReadcount(int readcount) {this.readcount = readcount;}
	public Timestamp getWritedate() {return writedate;}
	public void setWritedate(Timestamp writedate) {this.writedate = writedate;}
	public int getRe_ref() {return re_ref;}
	public void setRe_ref(int re_ref) {this.re_ref = re_ref;}
	public int getRe_lev() {return re_lev;}
	public void setRe_lev(int re_lev) {this.re_lev = re_lev;}
	public int getRe_seq() {return re_seq;}
	public void setRe_seq(int re_seq) {this.re_seq = re_seq;}
	public String getIp() {return ip;}
	public void setIp(String ip) {this.ip = ip;}
	
	@Override
	public String toString() {
		return "BoardBean [num=" + num + ", name=" + name + ", subject=" + subject + ", content=" + content
				+ ", readcount=" + readcount + ", writedate=" + writedate + ", re_ref=" + re_ref + ", re_lev=" + re_lev
				+ ", re_seq=" + re_seq + ", ip=" + ip + "]";
	}

}
