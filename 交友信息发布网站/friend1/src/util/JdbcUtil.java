package util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
//�������ݿ⣬������ָ��sql����ѯ���ݿ��еļ�¼
public class JdbcUtil {
	private static String USERNAME;
	private static String PASSWORD;
	private static String DRIVER;
	private static String URL;
	private Connection connection;
	private PreparedStatement pstmt;
	private ResultSet resultSet;
	static{
		loadConfig();
	}
	public static void loadConfig(){
		
		try{
			InputStream inStream = JdbcUtil.class.getResourceAsStream("/jdbc.properties");
			Properties prop = new Properties();
			prop.load(inStream);
			USERNAME = prop.getProperty("jdbc.username");
			PASSWORD = prop.getProperty("jdbc.password");
			DRIVER=prop.getProperty("jdbc.driver");
			URL = prop.getProperty("jdbc.url");
		}catch(Exception e){
			throw new RuntimeException("��ȡ���ݿ������ļ��쳣��",e);
		}
		
	}
	public JdbcUtil() {
		
	}
	public Connection getConnection(){
		try{
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("���ݿ����ӳɹ�");
		}catch(Exception e){
			throw new RuntimeException("get connection error");
		}
		return connection;
	}
	public List<Map<String,Object>> findResult(String sql,List<?> params) throws SQLException{
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		int index = 1;
//		�Բ���SQLָ����SQL������Ԥ���봦�����ɸ����ݵײ���ڲ���������������װ��PreparedStatement������
	
		pstmt = connection.prepareStatement(sql);
		if(params != null && !params.isEmpty()){
			for(int i = 0;i<params.size();i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
//		��sql�����������Ӧ�ķ�����ѯ���ݿ��еı�������ѯ��������һ��ResultSet�������
		resultSet = pstmt.executeQuery();
//		����һ���������Ԫ���ݶ���

		ResultSetMetaData metaData = resultSet.getMetaData();
//		���ؽ�������е���Ŀ

		int cols_len = metaData.getColumnCount();
		while(resultSet.next()){
			Map<String,Object> map = new HashMap<String,Object>();
			for(int i=0;i<cols_len;i++){
//				���ؽ������i+1�е�����

				String cols_name = metaData.getColumnName(i+1);
				Object cols_value = resultSet.getObject(cols_name);
				if(cols_value==null){
					cols_value="";
				}
				map.put(cols_name,cols_value);
			}
			list.add(map);
		}
//		System.out.println(list.size());
		return list;
	}
		public void releaseConn(){
			if(resultSet!=null){
				try{
					resultSet.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
			if(connection != null){
				try{
					connection.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		}
}
