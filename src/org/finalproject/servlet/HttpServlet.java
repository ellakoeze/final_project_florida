package org.finalproject.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.finalproject.servlet.DBUtility;

/** Servlet implementation class HttpServlet*/


@WebServlet("/HttpServlet")
public class HttpServlet extends javax.servlet.http.HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see javax.servlet.http.HttpServlet#javax.servlet.http.HttpServlet()
     */
    public HttpServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse 
			response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		String tab_id = request.getParameter("tab_id");
		
		// create a report
//		if (tab_id.equals("0")) {
//			System.out.println("A report is submitted!");
//			try {
//				//where we will eventually call the create here
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		} 
		
		
		
		// query reports
		if (tab_id.equals("1")) {
			try {
					queryLandmarks(request, response);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

	private void queryLandmarks(HttpServletRequest request, HttpServletResponse 
			response) throws JSONException, SQLException, IOException {
			JSONArray list = new JSONArray();
			DBUtility dbutil = new DBUtility();
			String sql;
			if(request.getParameter("type") != null) {
				String landmarkType = request.getParameter("type");
				sql = "select type from landmarks where type='"+landmarkType+"' LIMIT 1";
			}
			//query is happening here
			else sql = "select * from landmarks";
			ResultSet res = dbutil.queryDB(sql);
			if (res.next()) {
				// add to response
				HashMap<String, String> m = new HashMap<String,String>();
				m.put("type:", res.getString("type"));
				list.put(m);
			}
			
			
			response.getWriter().write(list.toString());
	}
	
	public void main() throws JSONException {
	}
}
