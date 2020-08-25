package com.edureka.webapptests;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.testng.Assert;
import org.testng.annotations.Test;

public class App {
	
	@Test
	
    public static void main( String[] args )
    {
    	System.setProperty("webdriver.chrome.driver","/usr/lib/chromium-browser/chromedriver");
    	ChromeOptions chromeOptions = new ChromeOptions();
    	chromeOptions.addArguments("--headless", "--no-sandbox", "--disable-dev-shm-usage");
    	WebDriver driver = new ChromeDriver(chromeOptions);
    	
    	driver.get("http://localhost/index.php");
    	driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
    	driver.findElement(By.id("About Us")).click();
    	Assert.assertEquals(driver.findElement(By.id("PID-ab2-pg")).isDisplayed(), true);
    	System.out.println("About Us link is working");
    	
    	driver.get("http://localhost/index.php");
    	driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
    	driver.findElement(By.id("Products")).click();
    	Assert.assertEquals(driver.findElement(By.id("PID-p4d-pg")).isDisplayed(), true);
    	System.out.println("Products link is working");
    	
    	driver.get("http://localhost/index.php");
    	driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
    	driver.findElement(By.id("Contact")).click();
    	Assert.assertEquals(driver.findElement(By.id("PID-c92-pg")).isDisplayed(), true);
    	System.out.println("Contact link is working");
    	
    	driver.quit();
    }

}
