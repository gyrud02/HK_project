package JoinMember;

import java.sql.Timestamp;

public class MemberBean { // 회원 관리하는 DTO클래스

	private Timestamp Joindate ; // 가입일자
	private int idx; // 회원번호
	private String name; // 회원이름
	private String id; // 회원 아이디
	private String pwd; // 회원 비밀번호
	private String gender; // 회원 성별
	private String age; // 회원 나이
	private String phone; // 회원 전화번호
	private String email; // 회원 이메일
	private String postcode; // 우편번호
	private String address; // 회원 주소
	private String etc; // 회원 기타사항
	
	public Timestamp getJoindate() {return Joindate;}
	public void setJoindate(Timestamp joindate) {Joindate = joindate;}
	public int getIdx() {return idx;}
	public void setIdx(int idx) {this.idx = idx;}
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}
	public String getPwd() {return pwd;}
	public void setPwd(String pwd) {this.pwd = pwd;}
	public String getGender() {return gender;}
	public void setGender(String gender) {this.gender = gender;}
	public String getAge() {return age;}
	public void setAge(String age) {this.age = age;}
	public String getPhone() {return phone;}
	public void setPhone(String phone) {this.phone = phone;}
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}
	public String getPostcode() {return postcode;}
	public void setPostcode(String postcode) {this.postcode = postcode;}
	public String getAddress() {return address;}
	public void setAddress(String address) {this.address = address;}
	public String getEtc() {return etc;}
	public void setEtc(String etc) {this.etc = etc;}
	
	@Override
	public String toString() {
		return "MemberBean [Joindate=" + Joindate + ", idx=" + idx + ", name=" + name + ", id=" + id + ", pwd=" + pwd
				+ ", gender=" + gender + ", age=" + age + ", phone=" + phone + ", email=" + email + ", postcode="
				+ postcode + ", address=" + address + ", etc=" + etc + "]";
	}
}
