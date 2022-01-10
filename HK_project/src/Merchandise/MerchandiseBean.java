package Merchandise;

public class MerchandiseBean {

	int md_idx; // 품번호
    String md_name; // 품명
    String md_category; // 카테고리
    String md_description; // 상품 설명
    int md_price; // 금액
    String md_image; // 상품이미지
    String md_filename; // 상품 파일명
	
    public int getMd_idx() {
		return md_idx;
	}
	public void setMd_idx(int md_idx) {
		this.md_idx = md_idx;
	}
	public String getMd_name() {
		return md_name;
	}
	public void setMd_name(String md_name) {
		this.md_name = md_name;
	}
	public String getMd_category() {
		return md_category;
	}
	public void setMd_category(String md_category) {
		this.md_category = md_category;
	}
	public String getMd_description() {
		return md_description;
	}
	public void setMd_description(String md_description) {
		this.md_description = md_description;
	}
	public int getMd_price() {
		return md_price;
	}
	public void setMd_price(int md_price) {
		this.md_price = md_price;
	}
	public String getMd_image() {
		return md_image;
	}
	public void setMd_image(String md_image) {
		this.md_image = md_image;
	}
	public String getMd_filename() {
		return md_filename;
	}
	public void setMd_filename(String md_filename) {
		this.md_filename = md_filename;
	}
	
	@Override
	public String toString() {
		return "MerchandiseBean [md_idx=" + md_idx + ", md_name=" + md_name + ", md_category=" + md_category
				+ ", md_description=" + md_description + ", md_price=" + md_price + ", md_image=" + md_image
				+ ", md_filename=" + md_filename + "]";
	}
    
}
