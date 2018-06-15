package kh.web.utils;

public class ArticleDTO {
	private int article_seq;
	private String title ;
	private String contents;
	private String writer;
	private String writedate;
	
	
	public ArticleDTO(int article_seq, String title, String contents, String writer, String writedate) {
		super();
		this.article_seq = article_seq;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.writedate = writedate;
	}
	
	public ArticleDTO() {
		
	}
	
	public int getArticle_seq() {
		return article_seq;
	}
	public void setArticle_seq(int article_seq) {
		this.article_seq = article_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}
