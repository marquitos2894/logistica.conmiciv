
package Models;

import Beans.Beans_componentes;
import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Marco
 */
public class Compo_models 

{
    
        public ArrayList<Beans_componentes> getAllCompo_models()
    {
        ArrayList<Beans_componentes> compo = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try
        {       Connection cn;
            Conexion con = new Conexion();
            cn =  con.conectar();
            
            String sql = "call V_COMPO()";
            pst =cn.prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next())
            {
                compo.add(new Beans_componentes(rs.getInt("compo_cd"),rs.getString("compo_ds"),rs.getString("descripcion"),rs.getString("nparte"),rs.getString("nparte_2"),rs.getInt("stock"),rs.getInt("stock_min"),rs.getString("marca"),rs.getString("modelo"),rs.getString("n_serie"),rs.getString("estado"),rs.getString("ubicacion"),rs.getInt("cat_cd"),rs.getString("cat_ds"),rs.getInt("alm_cd"),rs.getString("alm_ds"),rs.getString("est")));
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
        
        return compo;
    }
    
    
    
    
}
