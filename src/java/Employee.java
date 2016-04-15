
import java.io.Serializable;
import java.sql.Date;


/**
 *
 * @author Tian
 */
public class Employee extends Person implements Serializable{
    private Date startDate;
    private float hourlyRate;
    public Employee(){
        
    }
    
    public void setStartDate(Date s){ startDate = s;}
    public Date getStartDate(){ return startDate;}
    
    public void setHourlyRate(float h){ hourlyRate = h;}
    public float getHourlyRate(){ return hourlyRate;}
}
