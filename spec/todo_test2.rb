require_relative '../scripts/lambdatest.rb'

describe "Sample Playground steps" do
  it "Check Playground" do

    itemName = 'Yey, Lets add it to list aparna'
    @driver.get("https://lambdatest.github.io/sample-todo-app/" )
    @driver.find_element(:name, 'li1').click
    @driver.find_element(:name, 'li2').displayed?
    @driver.find_element(:id, 'sampletodotext').send_keys itemName
    @driver.find_element(:id, 'addbutton').displayed?
    @driver.find_element(:id, 'addbutton').click
    textAddedItem = @driver.find_element(:css, "[class='list-unstyled'] li:nth-child(6) span").text
    expect(textAddedItem).to eq(itemName)

    @driver.get("https://www.lambdatest.com/selenium-playground/" )
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Simple Form Demo')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Checkbox Demo')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Radio Buttons Demo')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Select Dropdown List')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Input Form Submit')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Ajax Form Submit')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'JQuery Select dropdown')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
 
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Key Press')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Upload File Demo')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Download File Demo')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'JQuery Download Progress bars')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Progress bar')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Drag & Drop Sliders')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Alerts')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
 
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Modals')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Window Popup Modal')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Progress Bar Modal')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
 
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Javascript Alerts')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'File Download')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Date Picker')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Date Picker')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap List Box')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'JQuery List Box')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Data List Filter')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Pagination')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
 
 
 
 
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Data Search')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Filter')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Sort & Search')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Data Download')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
 
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Broken Image')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Drag and Drop')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Dynamic Data Loading')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Hover Demo')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Geolocation Testing')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Context Menu')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
 
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Status Codes')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Redirection')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Virtual DOM')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
    @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Shadow DOM')]")}.click
    @driver.get('https://www.lambdatest.com/selenium-playground/');
 
   end
end
