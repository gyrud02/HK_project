package Merchandise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MerchandiseDAO {

	private static Connection con = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;
	private static String sql = "";
	
	private Connection getConnection() throws Exception{
		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		
		return con;
	} // getConnection()
	
	public List<MerchandiseBean> getOuterList(){
		List<MerchandiseBean> outerList = new ArrayList<>();
		
		try {
			con = getConnection();
			System.out.println("DB 연결 성공!");
			
			sql = "SELECT * FROM merchandise WHERE md_category = '상의/아우터'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			while(rs.next()){
				MerchandiseBean mdbean = new MerchandiseBean();
				mdbean.setMd_idx(rs.getInt("md_idx"));
				mdbean.setMd_name(rs.getString("md_name"));
				mdbean.setMd_category(rs.getString("md_category"));
				mdbean.setMd_description(rs.getString("md_description"));
				mdbean.setMd_filename(rs.getString("md_filename"));
				mdbean.setMd_image(rs.getString("md_image"));
				mdbean.setMd_price(rs.getInt("md_price"));
			
				outerList.add(mdbean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return outerList;
	} // getOuterList()

	public List<MerchandiseBean> getPantList(){
		List<MerchandiseBean> pantsList = new ArrayList<>();
		
		try {
			con = getConnection();
			System.out.println("DB 연결 성공!");
			
			sql = "SELECT * FROM merchandise WHERE md_category = '하의/팬츠'";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			while(rs.next()){
				MerchandiseBean mdbean = new MerchandiseBean();
				mdbean.setMd_idx(rs.getInt("md_idx"));
				mdbean.setMd_name(rs.getString("md_name"));
				mdbean.setMd_category(rs.getString("md_category"));
				mdbean.setMd_description(rs.getString("md_description"));
				mdbean.setMd_filename(rs.getString("md_filename"));
				mdbean.setMd_image(rs.getString("md_image"));
				mdbean.setMd_price(rs.getInt("md_price"));
				
				pantsList.add(mdbean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return pantsList;
	} // getPantList()
	
	public void closeDB(){
		try {
			if(rs != null){rs.close();}
			if(ps != null){ps.close();}
			if(con != null){con.close();}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // closeDB()

}
