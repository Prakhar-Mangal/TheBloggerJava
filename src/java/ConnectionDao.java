
import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author prakhar
 */
public class ConnectionDao {
    java.sql.Connection con=null;
    public void connection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
    String cs="jdbc:mysql://localhost:3306/blogger?autoReconnect=true&useSSL=false";
             con=(java.sql.Connection) DriverManager.getConnection(cs,"root","root");
    
    }
    
    public boolean login(String uname,String upass) throws ClassNotFoundException, SQLException{
        connection();
        PreparedStatement ps=con.prepareStatement("select * from users where uname=? and upass=?");
        ps.setString(1, uname);
        ps.setString(2, upass);
        System.out.println(uname+"---"+upass);
        ResultSet rs=ps.executeQuery();
        if(rs.next())
            return true;
        return false;
        
    }
    
    public boolean signup(String uname,String cont,String email,String upass) throws ClassNotFoundException, SQLException{
        connection();
        PreparedStatement ps1=con.prepareStatement("select * from users where uname=?");
        ps1.setString(1,uname);
        ResultSet rs=ps1.executeQuery();
        if(rs.next()){
        return false;
        }
        else{
        
        PreparedStatement ps= con.prepareStatement("insert into users value(?,?,?,?)");
        ps.setString(1, uname);
        ps.setString(2, cont);
        ps.setString(3, email);
        ps.setString(4, upass);
        System.out.println(uname+"---"+upass);
        int i=ps.executeUpdate();
        if(i!=0)
            return true;
        
        }
        return false;
    }
    
    public boolean question(String uname,String que) throws ClassNotFoundException, SQLException{
        
        connection();
        PreparedStatement ps=con.prepareStatement("insert into question (que,uname) values(?,?);");
        ps.setString(1, que);
        ps.setString(2, uname);
        int i=ps.executeUpdate();
        if(i!=0)
            return true;
    
        return false;
    }
    public boolean queAns(int aid,int qid,String ans,String uname) throws ClassNotFoundException, SQLException{
        connection();
        PreparedStatement ps=con.prepareStatement("insert into answer values(?,?,?,?);");
        ps.setInt(1, aid);
        ps.setInt(2, qid);
        ps.setString(3, ans);
        ps.setString(4, uname);
        int i=ps.executeUpdate();
        if(i!=0)
            return true;
        return false;
    }
}
