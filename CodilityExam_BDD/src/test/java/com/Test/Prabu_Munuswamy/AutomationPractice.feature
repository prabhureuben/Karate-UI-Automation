Feature: Karate BDD UI Automation
	
	
 Background:
  
	Given configure driver = {type: 'chromedriver'}
    Given driver 'http://automationpractice.com'
	And driver.maximize()
	#And driver.fullscreen()
	And def urlvalue = driver.url
	And match urlvalue == 'http://automationpractice.com/index.php'
    Then click("{}Sign in")
	And input("#email", "praburosary@gmail.com")
	And input("#passwd", "abc123")
	And click("//span[text()[normalize-space()='Sign in']]") 
	
	

Scenario: TC1 - Order T-shrit and Verify in Order History

	And click("/(//a[@title='T-shirts'])[2]")
	And click("//a[@title='List']")
	And click("#color_2")
	Then scroll("//span[text()='Add to cart']")
	And click("//span[text()='Add to cart']")

	And click("//span[text()[normalize-space()='Proceed to checkout']]")
		Then scroll("//span[text()='Proceed to checkout']")
	And click("//span[text()='Proceed to checkout']")
			Then scroll("//span[text()='Proceed to checkout']")
	And click("//span[text()='Proceed to checkout']")
	And click("#cgv")
	And click("/(//span[text()[normalize-space()='Proceed to checkout']])[2]")
			Then scroll("//a[@title='Pay by bank wire']")
	And click("//a[@title='Pay by bank wire']")
	And click("//span[text()='I confirm my order']")
	Then screenshot()
	Then scroll("div#center_column>div")
	Then screenshot("div#center_column>div")
	And def myorder = driver.text("div#center_column>div")
	And def str1 = myorder.split("reference")
	And def myorder_ref = str1[1].split("in")
	Then print 'Order Reference number is ', myorder_ref[0]
	And click("//a[@title='Back to orders']")
	Then scroll("//tr[@class='first_item ']//td[1]")
	Then screenshot()
	And def orderhistory = driver.text("//tr[@class='first_item ']//td[1]")

	And match myorder_ref[0].trim() == orderhistory.trim()
	
	
	Scenario: TC2 - Update Personal Information (FirstName) in - My Account
	
	And def randomname = 
"""
function generateRandomNumber(numberOfCharacters) {
   var randomValues = '';
   var stringValues = 'ABCDEFGHIJKLMNOabcdefghijklmnopqrstuvwxyzPQRSTUVWXYZ';  
   var sizeOfCharacter = stringValues.length;  
for (var i = 0; i < numberOfCharacters; i++) {
      randomValues = randomValues+stringValues.charAt(Math.floor(Math.random() * sizeOfCharacter));
   }
   return randomValues;
} 
  """
  And def firstname = call randomname '7'
	And click("{}My account")
	And click("//span[text()='My personal information']")
		Then scroll("div#center_column>div>h1")
		Then print 'Set the Frist Name as: ', firstname
	And clear('#firstname')
	And input("#firstname", firstname)
	And input("#old_passwd", "abc123")
		Then screenshot()
	And click("//span[text()='Save']")
	And assert exists("//p[@class='alert alert-success']")
	Then screenshot()
	
	
	
	
	