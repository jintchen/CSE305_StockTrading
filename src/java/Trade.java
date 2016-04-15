
import java.io.Serializable;
import java.sql.Date;


/**
 * Trade
 * @author Tian
 */
public class Trade implements Serializable{
    private int clientId;
    private int employeeId;
    private int transactionId;
    private int orderId;
    private Date date;
    private float fee;
    
    public Trade(){
        
    }
    
    public void setClientId(int cId){clientId=cId;}
    public int getClientId(){return clientId;}
    
    public void setEmployeeId(int eId){employeeId=eId;}
    public int getEmployeeId(){return employeeId;}
    
    public void setTransacationId(int tId){transactionId=tId;}
    public int getTransactionId(){return transactionId;}
    
    public void setOrderId(int oId){orderId=oId;}
    public int getOrderId(){return orderId;}
    
    public void setDate(Date d){date=d;}
    public Date getDate(){return date;}
    
    public void setFee(float f){fee=f;}
    public float getFee(){return fee;}
}
