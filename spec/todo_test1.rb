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
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Checkbox Demo')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Radio Buttons Demo')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Select Dropdown List')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Input Form Submit')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Ajax Form Submit')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'JQuery Select dropdown')]")}.click

   @wait.until { @driver.find_element(:xpath, "//p[contains(text(),'Alert & Modals')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Alerts')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Modals')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Window Popup Modal')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Progress Bar Modal')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Javascript Alerts')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'File Download')]")}.click

   @wait.until { @driver.find_element(:xpath, "//p[contains(text(),'Data Pickers')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Date Picker')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'JQuery Date Picker')]")}.click

   @wait.until { @driver.find_element(:xpath, "//p[contains(text(),'Table')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Pagination')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Data Search')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Filter')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Sort & Search')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Table Data Download')]")}.click

   @wait.until { @driver.find_element(:xpath, "//p[contains(text(),'Progress Bar & Sliders')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'JQuery Download Progress bars')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap Progress bar')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Drag & Drop Sliders')]")}.click

   @wait.until { @driver.find_element(:xpath, "//p[contains(text(),'List Box')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Bootstrap List Box')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'JQuery List Box')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Data List Filter')]")}.click

   @wait.until { @driver.find_element(:xpath, "//p[contains(text(),'Others')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Drag and Drop')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Dynamic Data Loading')]")}.click
   @wait.until { @driver.find_element(:xpath, "//a[contains(text(),'Hover Demo')]")}.click
   end
end
