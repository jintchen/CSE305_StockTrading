/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Connector.JdbcConnector;
import java.sql.ResultSet;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Tian
 */
public class JdbcConnectorTest {
    
    public JdbcConnectorTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of excuteQuery method, of class JdbcConnector.
     */
    @Test
    public void testExcuteQuery() {
        System.out.println("excuteQuery");
        String query = "";
        ResultSet expResult = null;
        ResultSet result = JdbcConnector.excuteQuery(query);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of excuteUpdate method, of class JdbcConnector.
     */
    @Test
    public void testExcuteUpdate() {
        System.out.println("excuteUpdate");
        String query = "";
        boolean expResult = false;
        boolean result = JdbcConnector.excuteUpdate(query);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
