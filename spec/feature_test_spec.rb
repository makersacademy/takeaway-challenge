require './lib/customer'
require './lib/printer'
require './lib/order'
require './lib/confirm'
require './lib/message'

describe "seeing the menu" do
  menu = {"rice" => 1,
          "pasta" => 1,
          "bread" => 1,}
  customer = Customer.new(menu)
  customer.see_menu
end
