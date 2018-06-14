package kh.web.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LoginDAO {
	private Connection getConnetion()  throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:/comp/env/oracle");
		return ds.getConnection();
	}
	public int insertData(String id,String password ,String name)throws Exception {
		Connection con = this.getConnetion();
		String sql ="insert into login values(login_seq.nextval,?,?,?)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1,id);
		pstat.setString(2, password);
		pstat.setString(3, name);
		int result =pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	public boolean isIdExist(String id,String password)throws Exception{
		Connection con = this.getConnetion();
		String sql ="select * from login where id=? and password =?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);
		pstat.setString(2, password);

		ResultSet rs =	pstat.executeQuery();	
		boolean result =rs.next();
		con.close();
		pstat.close();
		rs.close();

		return result;		
	}
	public List<LoginDTO> selectData()throws Exception{
		Connection con = this.getConnetion();
		String sql ="select * from login";
		PreparedStatement pstat = con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();

		List<LoginDTO> result = new ArrayList<>();
		while(rs.next()) {
			LoginDTO dto = new LoginDTO();
			dto.setSeq(rs.getInt("seq"));
			dto.setId(rs.getString("id"));
			dto.setPassword(rs.getString("password"));
			dto.setName(rs.getString("name"));
			result.add(dto);
		}
		pstat.close();
		con.close();
		rs.close();
		return result;
	}
	
	public boolean idCheck(String id)throws Exception{
		Connection con = this.getConnetion();
		String sql ="select * from login where id=?";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, id);

		ResultSet rs =	pstat.executeQuery();
		
		boolean result =rs.next();
		con.close();
		pstat.close();
		rs.close();
		
		return result;		
	}
}











