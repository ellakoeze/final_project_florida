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
			String sql = "select * from landmarks";
			
			//commented out for testing purposes
			// creating the landmarks 
			// this is the table == landmarks COLUMN ==  type 
			//String landmark_type = request.getParameter("type");
			
			//if(landmark_type == "airport" || landmark_type.equalsIgnoreCase("airport")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "airport");
			//}
			
			//if(landmark_type == "amusement" || landmark_type.equalsIgnoreCase("Amusement")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "Amusement");
			//}
			
			//if(landmark_type == "Beach" || landmark_type.equalsIgnoreCase("Beach")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "Beach");
			//}
			
			//if(landmark_type == "Campground" || landmark_type.equalsIgnoreCase("Campground")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "Campground");
			//}
			
			//if(landmark_type == "golf_course" || landmark_type.equalsIgnoreCase("golf_course")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "golf_course");
			//}
			
			//if(landmark_type == "hotel" || landmark_type.equalsIgnoreCase("hotel")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "hotel");
			//}
			
			//if(landmark_type == "nationa_forest_fed_land" || landmark_type.equalsIgnoreCase("nationa_forest_fed_land")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "nationa_forest_fed_land");
			//}
			
			//if(landmark_type == "national_park" || landmark_type.equalsIgnoreCase("national_park")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "national_park");
			//}
			
			//if(landmark_type == "shopping_center" || landmark_type.equalsIgnoreCase("shopping_center")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "shopping_center");
			//}
			
			//if(landmark_type == "state_local_park" || landmark_type.equalsIgnoreCase("state_local_park")) {
				//String sql = "select id, name, type, lat, long, user_created, user_saved, notes";
			//queryReportHelper(sql, list, "state_local_park");
			//}
			
			ResultSet res = dbutil.queryDB(sql);
			while (res.next()) {
				// add to response
				HashMap<String, String> m = new HashMap<String,String>();
				m.put("type:", res.getString("type"));
				m.put("longitude", res.getString("long"));
				m.put("latitude", res.getString("lat"));
				list.put(m);
			}
			
			response.getWriter().write(list.toString());
	}
	
	//private void queryReportHelper(String sql, JSONArray list, String type) throws SQLException {
		//DBUtility dbutil = new DBUtility();
		//if(type != null) {
			//sql += " and type = '" + type + "'";
		//}			
			//ResultSet res = dbutil.queryDB(sql);
			//while (res.next()) {
				// add to response
				//HashMap<String, String> m = new HashMap<String,String>();
				//m.put("type:", res.getString("type"));
				//m.put("longitude", res.getString("long"));
				//m.put("latitude", res.getString("lat"));
				//list.put(m);
			//}
	//}
	
	public void main() throws JSONException {
	}
}