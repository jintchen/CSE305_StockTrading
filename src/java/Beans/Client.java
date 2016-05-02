package Beans;


import java.io.Serializable;



public class Client extends Person implements Serializable{

    private int rating ;    
    private String credit;
    
    public Client(){

    }
    
    public void setRating(int r){ rating = r;}
    public int getRating(){ return rating;}
    
    public void setCCN(String c){ credit =c;}
    public String getCCN(){return credit;}
    
}
