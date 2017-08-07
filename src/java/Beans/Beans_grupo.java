/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author Marco
 */
public class Beans_grupo {

    private int grupo_cd;
    private String grupo_ds;
    private String est;
    
    public Beans_grupo(int grupo_cd, String grupo_ds, String est) {
        this.grupo_cd = grupo_cd;
        this.grupo_ds = grupo_ds;
        this.est = est;
    }
    public Beans_grupo(){}

    public int getGrupo_cd() {
        return grupo_cd;
    }

    public void setGrupo_cd(int grupo_cd) {
        this.grupo_cd = grupo_cd;
    }

    public String getGrupo_ds() {
        return grupo_ds;
    }

    public void setGrupo_ds(String grupo_ds) {
        this.grupo_ds = grupo_ds;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }
    

    
}
