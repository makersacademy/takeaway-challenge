require "order"
require "menu"

require "menu"

describe Order do

  it "selects several dishes from the menu" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end

  it "calculates the total for the order" do
    create_order
    total = 8.50
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:chicken, 2)
    order.add(:fish, 1)
  end
end
