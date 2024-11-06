from selenium import webdriver
from selenium.webdriver.common.by import By

browser = webdriver.Firefox()
browser.get('http://localhost:8000')

# Find the <main> element
main_element = browser.find_element(By.TAG_NAME, "main")

# Get the text content of the <main> element
main_text = main_element.text

# Check if the text contains "Congratulations!"
assert "Congratulations!" in main_text
print("OK")

