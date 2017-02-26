require "order"

describe "Order" do
describe "amount of each item " do
  it "gives how many times a certain item on the menu was ordered" do
    order = Order.new
    order.amount("Aromatic Duck")
    order.amount("Aromatic Duck")
    expect(order.number_of_each_item_selected).to eq([2])
  end
end
describe "price" do
  it "gives th cost of each item" do
    order = Order.new
    menu =Menu.new
    order.amount("Aromatic Duck")
    order.amount("Aromatic Duck")
    expect(order.prices).to eq([menu.items_on_menu["Aromatic Duck"]])

  end
end
describe "cost of items" do
  it "gives the total cost for each type of item" do
    order = Order.new
    order.amount("Aromatic Duck")
    order.amount("Aromatic Duck")
    order.prices
    order.number_of_each_item_selected
    expect(order.cost_items). to eq([7.7*2])
  end
end
describe "total cost" do
  it "gives the total amount of money owed" do
    order = Order.new
    order.amount("Aromatic Duck")
    order.amount("Aromatic Duck")
    order.amount("Satay Chicken")
    order.prices
    order.number_of_each_item_selected
    expect(order.total).to eq("The total amount due is £#{7.7*2 + 4.70}")
  end
  end

end
