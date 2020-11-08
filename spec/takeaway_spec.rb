# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require 'takeaway'
require 'menu'

describe Takeaway do
  portuguese_menu = Menu.new
  portuguese_menu.add_dish("Bacalhau com natas", 7.5)
  takeaway = Takeaway.new(portuguese_menu)
  it "will present a menu with a list of dishes and prices" do
    expect(takeaway.print_menu).to eq("Bacalhau com natas: 7.5\n")
  end
end
