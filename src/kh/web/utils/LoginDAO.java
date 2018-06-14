package kh.web.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
}
