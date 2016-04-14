
import java.io.Serializable;

/**
 * @author Tian
 */
public class Person implements Serializable{
    private int SSN;
    private String lName;
    private String fName;
    private String address;
    private int zipCode;
    private int telephone;
    public Person(){
        
    }
    
    public void setSSN(int newSSN){ SSN = newSSN;}
    public int getSSN(){ return SSN;}
    
    public void setLName(String lname){ lName = lname;}
    public String getLName(){ return lName;}
    
    public void setFName(String fname){ fName = fname;}
    public String getFName(){ return fName;}
    
    public void setAddress(String newAdd){ address=newAdd;}
    public String getAddress(){ return address;}
    
    public void setZipCode(int zip){ zipCode=zip;}
    public int getZipCode(){ return zipCode;}
    
    public void setTelephone(int phone){ telephone=phone;}
    public int getTelephone(){ return telephone;}
}
