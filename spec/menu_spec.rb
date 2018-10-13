require 'menu'

describe Menu do
  it "displays a list of items" do
    menu = Menu.new
    menu.items
    expect(menu.list).to eq "1. Small Margarita: £4\n2. Medium Margarita: £6\n3. Large Margarita: £8\n4. Small Pepperoni: £5\n5. Medium Pepperoni: £7\n6. Large Pepperoni: £9\n7. Small Vegetarian: £6\n8. Medium Vegetarian: £8\n9. Large Vegetarian: £10"
  end

  it "creates a new order when requested" do
    menu = Menu.new
    menu.order("Small Pepperoni")
    expect(menu.new_order).to be_an_instance_of Order
  end

end
