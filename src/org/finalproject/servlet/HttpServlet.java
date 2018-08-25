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
		
		// submit a newlandmark
		if (tab_id.equals("0")) {
			System.out.println("Your Landmark has been submitted for review!");
			try {
				createNewLandmark(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
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

	private void createNewLandmark(HttpServletRequest request, HttpServletResponse 
			response) throws SQLException, IOException {
		DBUtility dbutil = new DBUtility();		
		String sql;
		
		// create new landmark
		int report_id = 0;
		String landmarkName = request.getParameter("LandMark Name");
		String landmarkType = request.getParameter("type");
		String lon = request.getParameter("longitude");
		String lat = request.getParameter("latitude");
		String message = request.getParameter("message");
		if (landmarkName != null) {landmarkName = "'" + landmarkName + "'";}
		if (landmarkType != null) {landmarkType = "'" + landmarkType + "'";}
		if (message != null) {message = "'" + message + "'";}

		//not needed for our DB
//		sql = "insert into landmarks (name, type, geom," +
//				" message) values (" + landmarkName + "," + landmarkType
//				+ ", ST_GeomFromText('POINT(" + lon + " " + lat + ")', 4326)" + "," + 
//				message + ")";

		
		//id | name | type | lat | long | user_created | user_saved | notes
		sql = "insert into landmarks ( name, type, lat,long,notes)" 
		+ "values (" + landmarkName + "," + landmarkType + "," + lat  + "," + lon   + "," + message + ")";

		
		dbutil.modifyDB(sql);
		
		// record report_id
		ResultSet res_1 = dbutil. queryDB("select last_value from landmarks_id_seq");
		res_1.next();
		report_id = res_1.getInt(1);
		
		System.out.println("Success! Landmark add created.");
		
		System.out.println(sql);
		
		
		
		
		// response that the report submission is successful
		JSONObject data = new JSONObject();
		try {
			data.put("status", "success");
		} catch (JSONException e) {
			e.printStackTrace();
		}	
		response.getWriter().write(data.toString());
		

	} //end of createReport	
	
	

	private void queryLandmarks(HttpServletRequest request, HttpServletResponse 
			response) throws JSONException, SQLException, IOException {
			JSONArray list = new JSONArray();
			DBUtility dbutil = new DBUtility();
			String sql = "";
			//get the type of landmark
			String type = request.getParameter("type");
			//When opening the webpage, no landmarks will be shown.
			if (!type.equals("none")){
				//if request is to show all then query all of them 
				if (type.equals("all")) {
					sql = "select * from landmarks";
				} 
				else { //otherwise select where type equals the clicked button
					sql = "select * from landmarks where type ='" + type+"'";
				}
	
				ResultSet res = dbutil.queryDB(sql);
				while (res.next()) {
					// this is where we list the data we want to get back
					HashMap<String, String> m = new HashMap<String,String>();
					m.put("type", res.getString("type"));
					m.put("longitude", res.getString("long"));
					m.put("latitude", res.getString("lat"));
					m.put("name", res.getString("name"));
					list.put(m);
				}
				
				response.getWriter().write(list.toString());
		}
	} // end of queryLandmarks
	
	public void main() throws JSONException {
	}
}