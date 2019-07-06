package Entidades;

import java.io.Serializable;

public class Obra implements Serializable {

    String ISBN = null;
    String titulo = null;
    String autor = null;
    String editorial = null;
    String operativo=null;
    

    public Obra(){}
    public Obra(String ISBN, String titulo, String autor, String editorial,String operativo) {

        this.ISBN = ISBN;
        this.titulo = titulo;
        this.autor = autor;
        this.editorial = editorial;
        this.operativo=operativo;   
    }
    
     public Obra(String ISBN, String titulo, String autor, String editorial) {

        this.ISBN = ISBN;
        this.titulo = titulo;
        this.autor = autor;
        this.editorial = editorial;
        this.operativo="si"; 
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public String getOperativo() {
        return operativo;
    }

    public void setOperativo(String operativo) {
        this.operativo = operativo;
    }

}