require './lib/customer'
require './lib/printer'
require './lib/order'
require './lib/messenger'

describe "features" do
  menu = {"rice" => 1,
          "pasta" => 1,
          "bread" => 1,}
  customer = Customer.new(menu)
  it "sees menu" do
    customer.see_menu
  end

  it "orders from menu and confirms with money" do
    customer.choose("rice", 4)
    customer.order.confirm(4)
  end
end
