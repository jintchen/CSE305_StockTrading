package Beans;


import java.io.Serializable;


/**
 * Location class
 * relate zip code to city and state
 * @author Tian
 */
public class Location implements Serializable{
    private int zipCode;
    private String state;
    private String city;
    public Location(){
        
    }
    
    public void setZipCode(int newZip){ zipCode = newZip;}
    public int getZipCode(){ return zipCode;}
    
    public void setState(String s){ state=s;}
    public String getState(){ return state;}
    
    public void setCity(String c){ city = c;}
    public String getCity(){ return city;}
    
}
