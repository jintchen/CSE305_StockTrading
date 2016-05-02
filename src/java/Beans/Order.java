package Beans;


import java.io.Serializable;
import java.sql.Date;

/**
 * Order
 * @author Tian
 */
public class Order implements Serializable{
    private int orderId;
    private String orderType;
    private String priceType;
    private int numShares;
    private float percentage;
    private float pricePerShare;
    private Date date;
    private String stockSymbol;
    
    public Order(){
        
    }
    public void setStockSymbol(String ss){stockSymbol=ss;}
    public String getStockSymbol(){return stockSymbol;}
    
    public void setOrderId(int id){ orderId=id;}
    public int getOrderId(){return orderId;}
    
    public void setOrderType(String o){ orderType= o;}
    public String getOrderType(){return orderType;}
    
    public void setPriceType(String t){priceType=t;}
    public String getPriceType(){return priceType;}
    
    public void setNumShares(int num){ numShares=num;}
    public int getNumShares(){return numShares;}
    
    public void setPercentage(float p){ percentage=p;}
    public float getPercentage(){return percentage;}
    
    public void setPricePerShare(float pps){ pricePerShare=pps;}
    public float getPricePerShare(){return pricePerShare;}
    
    public void setDate(Date d){date=d;}
    public Date getDate(){return date;}
    
}
