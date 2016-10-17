package Info;

import java.util.Date;

public class Books {
	private int AuthorID;
	private String BookName;
	private Date Publishing;
	private String PublishDate;
	private String Price;
	
	public String getPublishDate() {
		return PublishDate;
	}
	public void setPublishDate(String publishDate) {
		PublishDate = publishDate;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public int getAuthorID() {
		return AuthorID;
	}
	public void setAuthorID(int authorID) {
		AuthorID = authorID;
	}
	public String getBookName() {
		return BookName;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	public Date getPublishing() {
		return Publishing;
	}
	public void setPublishing(Date publishing) {
		Publishing = publishing;
	}

}
