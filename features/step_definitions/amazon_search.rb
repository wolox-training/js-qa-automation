Given("I am on Amazon home page") do
  navigate_to($app_path)
end

When("I enter the text {string} on the top search bar") do |search|
  top_search_bar = $driver.find_element(id: 'twotabsearchtextbox')
  top_search_bar.send_keys search
  top_search_bar.submit
end

When("I select Polycarbonate as Cell Phone Case Material") do
  $driver.find_element(xpath: '//*[@id="p_n_feature_ten_browse-bin/17731940011"]/span/a/div/label/i').click
end

When("I sort the results by {string}") do |sortBy|
  sort_search_results(sortBy)
end

Then("I get the results in the correct order") do
  prices = $driver.find_elements(css: 'div.a-row.a-size-base.a-color-secondary > span.a-color-base').map { |price| price.text.delete(',')[/\d+(\.\d+)?/].to_i }
  expect(prices).to eq(prices.sort.reverse)
end
