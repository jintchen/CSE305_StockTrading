package Beans;


import java.io.Serializable;

/**
 * @author Tian
 */
public class Person implements Serializable{
    private String SSN;
    private String lname;
    private String fname;
    private String address;
    private String city;
    private String state;
    private int zipCode;
    private String telephone;
    public Person(){
        
    }
    public void setCity(String c){city=c;}
    public String getCity(){return city;}
    public void setState(String s){ state=s;}
    public String getState(){return state;}
    public void setSSN(String newSSN){ SSN = newSSN;}
    public String getSSN(){ return SSN;}
    
    public void setLname(String lname){ this.lname = lname;}
    public String getLname(){ return lname;}
    
    public void setFname(String fname){ this.fname = fname;}
    public String getFname(){ return fname;}
    
    public void setAddress(String newAdd){ address=newAdd;}
    public String getAddress(){ return address;}
    
    public void setZipCode(int zip){ zipCode=zip;}
    public int getZipCode(){ return zipCode;}
    
    public void setTelephone(String phone){ telephone=phone;}
    public String getTelephone(){ return telephone;}
}
