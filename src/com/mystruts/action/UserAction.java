package com.mystruts.action;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.List;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;

import data.JDBCTest;
import Info.Author;
import Info.Books;

public class UserAction implements Action{
	private String Name;
	private String BookName;
	private String Age;
	private String Country;
	private String Publishing;
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


	public ArrayList<String> getSHOWWRITER() {
		return SHOWWRITER;
	}


	public void setSHOWWRITER(ArrayList<String> sHOWWRITER) {
		SHOWWRITER = sHOWWRITER;
	}


	ArrayList<String> BOOKLITE;
	ArrayList<String> SHOWBOOK;
	ArrayList<String> SHOWWRITER;
	public String getAge() {
		return Age;
	}


	public ArrayList<String> getSHOWBOOK() {
		return SHOWBOOK;
	}


	public void setSHOWBOOK(ArrayList<String> sHOWBOOK) {
		SHOWBOOK = sHOWBOOK;
	}


	public void setAge(String age) {
		Age = age;
	}


	public String getCountry() {
		return Country;
	}


	public void setCountry(String country) {
		Country = country;
	}


	public String getPublishing() {
		return Publishing;
	}


	public void setPublishing(String publishing) {
		Publishing = publishing;
	}


	private Map request;

	public UserAction(){
		request = (Map)ActionContext.getContext().get("request");
	}


	public String getName() {
		return Name;
	}


	public void setName(String name) {
		Name = name;
	}



	public String getBookName() {
		return BookName;
	}


	public void setBookName(String bookName) {
		BookName = bookName;
	}

	public ArrayList<String> getBOOKLITE() {
		return BOOKLITE;
	}

	public void setBOOKLITE(ArrayList<String> bOOKLITE) {
		BOOKLITE = bOOKLITE;
	}

	public Map getRequest() {
		return request;
	}


	public void setRequest(Map request) {
		this.request = request;
	}


	public String search(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		BOOKLITE = new ArrayList<String>();
		try {
			conn = JDBCTest.getConnection();
			String sql = "SELECT a.BookName FROM books as a inner JOIN author  as b on a.AuthorID = b.AuthorID WHERE b.Name=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,Name);
			rs = stmt.executeQuery();
			while (rs.next()) {
				BOOKLITE.add(rs.getString("BookName"));
			}
			request.put("BOOKLITE", BOOKLITE);
			if(BOOKLITE == null || BOOKLITE.size()==0)
				return ERROR;
			else
			    return SUCCESS;
		} catch (Exception ex) {
			ex.printStackTrace();
			return ERROR;
		} finally {
			// 閲婃斁鏁版嵁闆嗗璞�
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 閲婃斁鏁版嵁瀵硅薄
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			
			if (conn != null) {
				try {
					conn.close();
					conn=null;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
}
	
	public String show(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		SHOWBOOK = new ArrayList<String>();
		try {
			conn = JDBCTest.getConnection();
			String sql =  "SELECT * FROM books WHERE BookName=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,BookName);
			rs = stmt.executeQuery();
			while (rs.next()) {
				SHOWBOOK.add(rs.getString("BookName"));
				SHOWBOOK.add(rs.getString("Publishing"));
				SHOWBOOK.add(rs.getString("PublishDate"));
				SHOWBOOK.add(rs.getString("Price"));
			}
		    return SUCCESS;
		} catch (Exception ex) {
			ex.printStackTrace();
			return ERROR;
		} finally {
			// 閲婃斁鏁版嵁闆嗗璞�
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 閲婃斁鏁版嵁瀵硅薄
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
					conn=null;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
		}
}

	public String showWriter(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		SHOWWRITER = new ArrayList<String>();
		try {
			conn = JDBCTest.getConnection();
			String sql =  "SELECT * FROM author WHERE Name=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,Name);
			rs = stmt.executeQuery();
			while (rs.next()) {
				SHOWWRITER.add(rs.getString("Name"));
				SHOWWRITER.add(rs.getString("Age"));
				SHOWWRITER.add(rs.getString("Country"));
			}
		    return SUCCESS;
		} catch (Exception ex) {
			ex.printStackTrace();
			return ERROR;
		} finally {
			// 閲婃斁鏁版嵁闆嗗璞�
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 閲婃斁鏁版嵁瀵硅薄
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if (conn != null) {
			try {
				conn.close();
				conn=null;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		}
}
	
	
	public String delete(){
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = JDBCTest.getConnection();
			String sql = "delete from books where books.BookName=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, BookName);
			stmt.executeUpdate();
			return SUCCESS;
		} catch (Exception ex) {
			ex.printStackTrace();
			return ERROR;
		}	
		finally {
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
					conn=null;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
		}
	}		

	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
}