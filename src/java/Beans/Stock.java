package Beans;


import java.io.Serializable;


/**
 * Stock
 * @author Tian
 */
public class Stock implements Serializable{
    private String stockSymbol;
    private String companyName;
    private String type;
    private int numShares;
    private float pricePerShare;
    
    public Stock(){
    
    }
    
    public void setStockSymbol(String ss){stockSymbol=ss;}
    public String getStockSymbol(){return stockSymbol;}
    
    public void setCompanyName(String cn){companyName=cn;}
    public String getCompanyName(){return companyName;}
    
    public void setType(String t){type=t;}
    public String getType(){return type;}
    
    public void setNumShares(int ns){numShares=ns;}
    public int getNumShares(){return numShares;}
    
    public void setPricePerShare(float pps){pricePerShare=pps;}
    public float getPricePerShare(){return pricePerShare;}
    
}
