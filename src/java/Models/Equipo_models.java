
package Models;

import Beans.Beans_equipo;
import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Marco
 */
public class Equipo_models {
    
     public ArrayList<Beans_equipo> getAllEquipo_models()
    {
        ArrayList<Beans_equipo> equipos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try
        {   Connection cn;
            Conexion con = new Conexion();
            cn =  con.conectar();
            
            String sql = "call V_EQUIPO()";
            pst =cn.prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next())
            {
                equipos.add(new Beans_equipo(rs.getInt("equipo_cd"),rs.getString("equipo_ds"),rs.getString("modelo"),rs.getString("marca"),rs.getString("n_serie"),rs.getString("a_fabri"),rs.getString("estado_equipo"),rs.getString("est")));
            }
            
        } catch (Exception e){
        
        }
        finally
        {
            try 
            {
                if(rs != null) rs.close();
                if(pst != null) pst.close();
            
            } catch (Exception e){    
            }
        
        }
        
        return equipos;
    }
    
    
}
