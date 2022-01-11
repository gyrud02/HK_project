package Comment;

import java.sql.Timestamp;

public class CommentBean {

	private int commentnum; // 댓글번호
	private String id; // 댓글 작성 아이디
	private String comment; // 댓글 내용
	private Timestamp repdate; // 작성일자
	
	public int getCommentnum() {return commentnum;}
	public void setCommentnum(int commentnum) {this.commentnum = commentnum;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getComment() {return comment;}
	public void setComment(String comment) {this.comment = comment;}
	public Timestamp getRepdate() {	return repdate;}
	public void setRepdate(Timestamp repdate) {this.repdate = repdate;}
	
	@Override
	public String toString() {
		return "CommentBean [commentnum=" + commentnum + ", id=" + id + ", comment=" + comment + ", repdate=" + repdate
				+ "]";
	}
	
}
