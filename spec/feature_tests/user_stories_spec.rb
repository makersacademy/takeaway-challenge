require "menu"

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe "User story 1" do
  it "displays a list of dishes with prices" do
    dishes = [{ name: "Pizza", price: 1000 }]
    menu = Menu.new(dishes)
    expect { menu.list }.to output("Pizza (£10)\n").to_stdout
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
describe "User story 2" do
  it "may order a certain number of each dish" do
    my_order = Order.new
    expect { my_order.add("Ribeye", 2) }.not_to raise_error
  end
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
describe "User story 3" do
  it "gives me the sum total price" do
    my_order = Order.new
    my_order.add("Porterhouse")
    my_order.add("Ribeye", 2)
    price = my_order.total_price
    expect(price).to eq(10_000)
  end
end
