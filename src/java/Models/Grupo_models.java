/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;
import Beans.Beans_grupo;
import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/**
 *
 * @author Marco
 */
public class Grupo_models {
    
    public ArrayList<Beans_grupo> getAllgrupo()
    {
        ArrayList<Beans_grupo> grupo = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try{
            Connection cn;
            Conexion con = new Conexion();
            cn=con.conectar();
            
            String sql="call V_GRUPO";
            pst = cn.prepareCall(sql);
            rs = pst.executeQuery();
            while(rs.next())
            {
                grupo.add(new Beans_grupo(rs.getInt("grupo_cd"),rs.getString("grupo_ds"),rs.getString("est")));
            }
          
            
        
        }catch (Exception e)
        {
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
    return grupo;
    }
    
    
}
