require_relative '../scripts/lambdatest.rb'

describe "ToDo App Tests" do
  before(:each) do
    @test_url = "https://lambdatest.github.io/sample-todo-app/"
  end

  it "should check off todo items" do
    @driver.get(@test_url)
    
    # Wait for first item to be displayed
    @wait.until { @driver.find_element(:name, 'li1').displayed? }
    puts "Navigated to ToDo app"

    # Click on first checkbox (li4)
    checkbox_li4 = @driver.find_element(:name, 'li4')
    checkbox_li4.click
    # Wait for the checkbox to be checked
    @wait.until { checkbox_li4.selected? }
    puts "Clicked first checkbox (li4)"

    # Click on second checkbox (li5)
    checkbox_li5 = @driver.find_element(:name, 'li5')
    checkbox_li5.click
    # Wait for the checkbox to be checked
    @wait.until { checkbox_li5.selected? }
    puts "Clicked second checkbox (li5)"

    # Verify two items are checked using the selected? property
    all_checkboxes = @driver.find_elements(:css, 'input[type="checkbox"]')
    checked_items = all_checkboxes.select { |cb| cb.selected? }
    expect(checked_items.count).to eq(2)
    puts "Verified 2 items are checked"
  end

  it "should add a new todo item" do
    @driver.get(@test_url)
    
    # Wait for first item to be displayed
    @wait.until { @driver.find_element(:name, 'li1').displayed? }
    puts "Navigated to ToDo app"

    new_item_text = "New Todo Item from RSpec Test"

    # Enter text in the input box
    @driver.find_element(:id, 'sampletodotext').send_keys(new_item_text)
    puts "Entered text: #{new_item_text}"

    # Click add button
    @driver.find_element(:id, 'addbutton').click
    puts "Clicked add button"

    # Verify the new item appears in the list
    @wait.until do
      items = @driver.find_elements(:css, "ul.list-unstyled li span")
      items.any? { |item| item.text.strip == new_item_text }
    end
    
    last_item = @driver.find_element(:css, "[class*='list-unstyled'] li:nth-child(6) span")
    expect(last_item.text.strip).to eq(new_item_text)
    puts "Verified '#{new_item_text}' appears in the list"
  end

  it "should complete multiple todos and add new item" do
    @driver.get(@test_url)
    
    # Wait for first item to be displayed
    @wait.until { @driver.find_element(:name, 'li1').displayed? }
    puts "Navigated to ToDo app"

    # Check off first two items with waits
    checkbox_li1 = @driver.find_element(:name, 'li1')
    checkbox_li1.click
    @wait.until { checkbox_li1.selected? }
    puts "Clicked checkbox li1"
    
    checkbox_li2 = @driver.find_element(:name, 'li2')
    checkbox_li2.click
    @wait.until { checkbox_li2.selected? }
    puts "Clicked checkbox li2"

    # Add a new todo item
    new_item_text = "Complete this task"
    @driver.find_element(:id, 'sampletodotext').send_keys(new_item_text)
    puts "Entered text: #{new_item_text}"
    
    @driver.find_element(:id, 'addbutton').click
    puts "Clicked add button"

    # Verify the new item appears
    @wait.until do
      items = @driver.find_elements(:css, "ul.list-unstyled li span")
      items.any? { |item| item.text.strip == new_item_text }
    end
    
    last_item = @driver.find_element(:css, "[class*='list-unstyled'] li:nth-child(6) span")
    expect(last_item.text.strip).to eq(new_item_text)
    puts "Verified '#{new_item_text}' appears in the list"

    # Verify checked items using selected? property
    all_checkboxes = @driver.find_elements(:css, 'input[type="checkbox"]')
    checked_items = all_checkboxes.select { |cb| cb.selected? }
    expect(checked_items.count).to be >= 2
    puts "Verified at least 2 items are checked"
  end
end
