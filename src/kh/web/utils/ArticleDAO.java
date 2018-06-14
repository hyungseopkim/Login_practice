package kh.web.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ArticleDAO {
	private Connection getConnetion()  throws Exception {
		Context context = new InitialContext();
		DataSource ds = (DataSource)context.lookup("java:/comp/env/oracle");
		return ds.getConnection();
	}
	public int insertData(String title,String contents,String writer)throws Exception{
		Connection con = this.getConnetion();
		String sql ="insert into article values(article_seq.nextval,?,?,?,sysdate)";
		PreparedStatement pstat = con.prepareStatement(sql);
		pstat.setString(1, title);
		pstat.setString(2, contents);
		pstat.setString(3, writer);
		int result = pstat.executeUpdate();
		con.commit();
		pstat.close();
		con.close();
		return result;
	}
	public List<ArticleDTO> selectData()throws Exception{
		Connection con = this.getConnetion();
		String sql ="select * from article";
		PreparedStatement pstat =  con.prepareStatement(sql);
		ResultSet rs = pstat.executeQuery();
		
		List<ArticleDTO> result = new ArrayList<>();
		while(rs.next()) {
			ArticleDTO dto = new ArticleDTO();
			dto.setArticle_seq(rs.getInt("article_seq"));
			dto.setTitle(rs.getString("title"));
			dto.setContents(rs.getString("contents"));
			dto.setWriter(rs.getString("writer"));
			dto.setWritedate(rs.getString("writedate"));
			result.add(dto);
		}
		con.close();
		pstat.close();
		rs.close();
		return result;
	}
}




