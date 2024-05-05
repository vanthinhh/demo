from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By

# Set the path to your webdriver (you can use ChromeDriver, GeckoDriver, etc.)
driver_path = '/path/to/chromedriver'
driver = webdriver.Chrome(executable_path=driver_path)

# Open the webpage
driver.get("https://practicetestautomation.com/practice-test-login/")

# Find the username and password fields, and the login button
username_field = driver.find_element(By.ID, "username")
password_field = driver.find_element(By.ID, "password")
login_button = driver.find_element(By.NAME, "login")

# Enter username and password
username_field.send_keys("your_username")
password_field.send_keys("your_password")

# Click the login button
login_button.click()

# Wait for a few seconds to see the result before closing the browser
driver.implicitly_wait(5)

# Close the browser
driver.quit()
