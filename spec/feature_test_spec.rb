require './lib/customer'

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
    customer.choose("bread", 5)
    customer.pay(9)
  end
end
