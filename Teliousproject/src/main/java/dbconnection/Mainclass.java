package dbconnection;
import java.sql.*;
import java.util.ArrayList;

public class Mainclass {

  dbconnection jdbc = new dbconnection();

	public ArrayList getData() {
		ArrayList retArrayList = new ArrayList();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql="SELECT S.CUSTNAME,S.PHONENUMBER,S.ENTDATE,I.ITEMNAME,I.MFGDATE,I.EXPDATE,S.NOS,P.PAYNAME FROM SUPERMARKET S,ITEMS I,PAYMENT P  WHERE S.ITEM=I.ITEMID AND S.PAYMENT=P.PAYID";
			con = jdbc.getConnection();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				ArrayList temp=new ArrayList();
				temp.add(rs.getString(1));
				temp.add(rs.getString(2));
				temp.add(rs.getString(3));
				temp.add(rs.getString(4));
				temp.add(rs.getString(5));
				temp.add(rs.getString(6));
				temp.add(rs.getString(7));
				temp.add(rs.getString(8));
				retArrayList.add(temp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		}
		return retArrayList;
	}

	public Integer save(String custName, String phoneNo, String entDate, String item, String nos, String pay) {
		int retString = 0;
		String sql = "INSERT INTO SUPERMARKET (CUSTNAME,PHONENUMBER,ENTDATE,ITEM,NOS,PAYMENT) VALUES (?,?,?,?,?,?)";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {

			con = jdbc.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, custName);
			ps.setString(2, phoneNo);
			ps.setString(3, entDate);
			ps.setString(4, item);
			ps.setString(5, nos);
			ps.setString(6, pay);

			retString = ps.executeUpdate();

		} catch (Exception e) {
			retString = 0;
			e.printStackTrace();// TODO: handle exception
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		}
		return retString;
	}

	public ArrayList getComboVals() {
		ArrayList arrayList = new ArrayList();
		ArrayList itemIds = new ArrayList();
		ArrayList itemNames = new ArrayList();
		ArrayList payIds = new ArrayList();
		ArrayList payNames = new ArrayList();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String name = "", id = "";
		try {
			con = jdbc.getConnection();
			ps = con.prepareStatement("SELECT ITEMID,ITEMNAME FROM ITEMS");
			rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getString(1);
				name = rs.getString(2);
				itemIds.add(id);
				itemNames.add(name);
			}
			arrayList.add(itemIds);
			arrayList.add(itemNames);
			ps.close();
			rs.close();
			ps = con.prepareStatement("SELECT PAYID,PAYNAME FROM PAYMENT");
			rs = ps.executeQuery();
			while (rs.next()) {
				id = rs.getString(1);
				name = rs.getString(2);
				payIds.add(id);
				payNames.add(name);
			}
			arrayList.add(payIds);
			arrayList.add(payNames);
		} catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();// TODO: handle exception
			}
		}

		return arrayList;
	}
}