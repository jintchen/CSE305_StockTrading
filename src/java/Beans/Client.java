package Beans;


import java.io.Serializable;

/**
 * Clinet
 * @author Tian
 */
public class Client extends Person implements Serializable{
    private String email;
    private float rating;
    private int creditCardNumber;
    
    public Client(){
        
    }
    
    public void setEmail(String e){email=e;}
    public String getEmail(){ return email;}
    
    public void setRating(float r){ rating = r;}
    public float getRating(){ return rating;}
    
    public void setCreditCardNumber(int c){creditCardNumber = c;}
    public int getCreditCardNumber(){return creditCardNumber;}
}
