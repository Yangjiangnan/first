package daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;

public class dbDeal {

	//���������
	public int[] cusNum() {
		Connection connection = null;
		Statement statement = null;
		int data[] = new int[7];
		try {
			connection = JdbcUtil.getConnection();
			statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs;
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, -1);
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH) + 1;
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			int t = 9;

			int i = 0;
			while (t <= 21) {
				/*
				 * rs = stmt.executeQuery(
				 * "select count(*) from tanzhen where  time BETWEEN '"
				 * +year+"-"+month+"-"+day+" " + t + ":00:00' and '"
				 * +year+"-"+month+"-"+day+" "+ (t + 1) +
				 * ":59:59' and rang<100;");
				 */
				rs = statement.executeQuery("select count(*) from tanzhen1 where  time BETWEEN '2017-05-28 " + t
						+ ":00:00' and '2017-05-28 " + (t + 1) + ":59:59' and rang<100;");
				rs.next();
				data[i] = rs.getInt(1);
				t += 2;
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return data;
	}

	//������������
	public int[] visCycle() {
		Connection connection = null;
		Statement statement = null;
		int data[] = new int[5];
		try {
			connection = JdbcUtil.getConnection();
			statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs;
			int t = 1;
			int i = 0;
			while (i < 5) {
				rs = statement
						.executeQuery("SELECT count(*) from first WHERE timex BETWEEN " + t + " and " + (t + 22) + ";");
				rs.next();
				data[i] = rs.getInt(1);
				t += 24;
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return data;
	}

	//������������
	public int visCycleMore() {
		Connection connection = null;
		Statement statement = null;
		int more = 0;
		try {
			connection = JdbcUtil.getConnection();
			statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs;

			rs = statement.executeQuery("SELECT count(*) from `first` WHERE timex >120;");
			rs.next();
			more=rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return more;
	}
	
}
