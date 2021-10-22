require 'order'
require 'item'
describe Order do
  it "add item should return total" do
    subject = Order.new
    dish = Dish.new("spaghetti",12)
    item = Item.new(dish, 20)
    expect(subject.order(item)).to eq (20 * 12)
  end
end
