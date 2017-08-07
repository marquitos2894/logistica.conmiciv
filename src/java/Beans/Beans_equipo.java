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
public class Beans_equipo {

    private int equipo_cd; 
    private String equipo_ds;
    private String modelo;
    private String marca;
    private String n_serie;
    private String n_fabri;
    private String estado;
    private String est;
    
    
    public Beans_equipo(int equipo_cd, String equipo_ds, String modelo, String marca, String n_serie, String n_fabri, String estado, String est) {
        this.equipo_cd = equipo_cd;
        this.equipo_ds = equipo_ds;
        this.modelo = modelo;
        this.marca = marca;
        this.n_serie = n_serie;
        this.n_fabri = n_fabri;
        this.estado = estado;
        this.est = est;
    }
    
    public Beans_equipo(){}
    
    public int getEquipo_cd() {
        return equipo_cd;
    }

    public void setEquipo_cd(int equipo_cd) {
        this.equipo_cd = equipo_cd;
    }

    public String getEquipo_ds() {
        return equipo_ds;
    }

    public void setEquipo_ds(String equipo_ds) {
        this.equipo_ds = equipo_ds;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getN_serie() {
        return n_serie;
    }

    public void setN_serie(String n_serie) {
        this.n_serie = n_serie;
    }

    public String getN_fabri() {
        return n_fabri;
    }

    public void setN_fabri(String n_fabri) {
        this.n_fabri = n_fabri;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }
    

}
