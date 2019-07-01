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
//连接数据库，并按照指定sql语句查询数据库中的记录
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
			throw new RuntimeException("读取数据库配置文件异常！",e);
		}
		
	}
	public JdbcUtil() {
		
	}
	public Connection getConnection(){
		try{
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			System.out.println("数据库连接成功");
		}catch(Exception e){
			throw new RuntimeException("get connection error");
		}
		return connection;
	}
	public List<Map<String,Object>> findResult(String sql,List<?> params) throws SQLException{
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		int index = 1;
//		对参数SQL指定的SQL语句进行预编译处理，生成该数据底层的内部命令，并将该命令封装在PreparedStatement对象中
	
		pstmt = connection.prepareStatement(sql);
		if(params != null && !params.isEmpty()){
			for(int i = 0;i<params.size();i++){
				pstmt.setObject(index++, params.get(i));
			}
		}
//		用sql语句对象调用相应的方法查询数据库中的表，并将查询结果存放在一个ResultSet结果集中
		resultSet = pstmt.executeQuery();
//		返回一个结果集的元数据对象

		ResultSetMetaData metaData = resultSet.getMetaData();
//		返回结果集中列的数目

		int cols_len = metaData.getColumnCount();
		while(resultSet.next()){
			Map<String,Object> map = new HashMap<String,Object>();
			for(int i=0;i<cols_len;i++){
//				返回结果集第i+1列的名字

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
