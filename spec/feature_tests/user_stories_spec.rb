require "menu"

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

describe "User story 1" do
  expect(menu.list).not_to raise_error
end