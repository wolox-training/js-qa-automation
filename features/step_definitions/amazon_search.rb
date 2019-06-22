Given("I am on Amazon home page") do
  navigate_to($app_path)
end

When("I enter the text {string} on the top search bar") do |search|
  enter_text(:id, search, 'twotabsearchtextbox')
  submit(:id, 'twotabsearchtextbox')
end

When("I select {string} as {string} filter") do |option, filter|
  check_checkbox(:xpath, "//*[@id='filters']/div[contains(span/text(), '#{filter}')]/following-sibling::ul[1]/li/span/a[contains(span/text(), '#{option}')]")
end

When("I sort the search results by {string}") do |sortBy|
  select_option_from_dropdown(:id, :text, sortBy, 's-result-sort-select')
end

Then("I get the results in the correct order") do
  prices = $driver.find_elements(css: 'div.a-row.a-size-base.a-color-secondary > span.a-color-base').map { |price| price.text.delete(',')[/\d+(\.\d+)?/].to_i }
  expect(prices).to eq(prices.sort.reverse)
end
