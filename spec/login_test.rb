require_relative '../scripts/lambdatest.rb'

describe "Login Page Tests" do
  before(:each) do
    @test_url = "https://the-internet.herokuapp.com/login"
  end

  it "should login successfully with valid credentials" do
    @driver.get(@test_url)
    
    # Wait for username field to be displayed
    @wait.until { @driver.find_element(:id, 'username').displayed? }
    puts "Navigated to Login page"

    # Enter username
    username_field = @driver.find_element(:id, 'username')
    username_field.clear
    username_field.send_keys("tomsmith")
    puts "Entered username: tomsmith"

    # Enter password
    password_field = @driver.find_element(:id, 'password')
    password_field.clear
    password_field.send_keys("SuperSecretPassword!")
    puts "Entered password"

    # Click login button
    login_button = @driver.find_element(:css, "button[type='submit']")
    login_button.click
    puts "Clicked Login button"

    # Verify success message
    @wait.until { @driver.find_element(:id, 'flash').displayed? }
    flash_message = @driver.find_element(:id, 'flash')
    message_text = flash_message.text
    
    expect(message_text).to include("You logged into a secure area!")
    puts "Verified flash message contains: You logged into a secure area!"

    # Verify URL contains /secure
    expect(@driver.current_url).to include("/secure")
    puts "Verified URL contains: /secure"
  end

  it "should show error message with invalid username" do
    @driver.get(@test_url)
    
    @wait.until { @driver.find_element(:id, 'username').displayed? }
    puts "Navigated to Login page"

    # Enter invalid username
    username_field = @driver.find_element(:id, 'username')
    username_field.clear
    username_field.send_keys("invaliduser")
    puts "Entered username: invaliduser"

    # Enter password
    password_field = @driver.find_element(:id, 'password')
    password_field.clear
    password_field.send_keys("SuperSecretPassword!")
    puts "Entered password"

    # Click login button
    login_button = @driver.find_element(:css, "button[type='submit']")
    login_button.click
    puts "Clicked Login button"

    # Verify error message
    @wait.until { @driver.find_element(:id, 'flash').displayed? }
    flash_message = @driver.find_element(:id, 'flash')
    message_text = flash_message.text
    
    expect(message_text).to include("Your username is invalid!")
    puts "Verified error message contains: Your username is invalid!"
  end

  it "should show error message with invalid password" do
    @driver.get(@test_url)
    
    @wait.until { @driver.find_element(:id, 'username').displayed? }
    puts "Navigated to Login page"

    # Enter valid username
    username_field = @driver.find_element(:id, 'username')
    username_field.clear
    username_field.send_keys("tomsmith")
    puts "Entered username: tomsmith"

    # Enter invalid password
    password_field = @driver.find_element(:id, 'password')
    password_field.clear
    password_field.send_keys("wrongpassword")
    puts "Entered password"

    # Click login button
    login_button = @driver.find_element(:css, "button[type='submit']")
    login_button.click
    puts "Clicked Login button"

    # Verify error message
    @wait.until { @driver.find_element(:id, 'flash').displayed? }
    flash_message = @driver.find_element(:id, 'flash')
    message_text = flash_message.text
    
    expect(message_text).to include("Your password is invalid!")
    puts "Verified error message contains: Your password is invalid!"
  end
end
