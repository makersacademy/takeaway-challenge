require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }
  let(:foods) { {fries: 2, drink: 1} }

  before do
    allow(menu).to receive(:has_food?).with(:fries).and_return(true)
    allow(menu).to receive(:has_food?).with(:drink).and_return(true)

    allow(menu).to receive(:price).with(:fries).and_return(2.00)
    allow(menu).to receive(:price).with(:drink).and_return(1.00)
  end

  it "selects several dishes from the menu" do
    create_order
    expect(order.dishes).to eq(foods)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_food?).with(:beef).and_return(false)
    expect { order.make_order(:beef, 2) }.to raise_error "beef is not on the menu!"
  end

  it "calculates the total for the order" do
    create_order
    total = 5.00
    expect(order.total).to eq(total)
  end

  def create_order
    order.make_order(:fries, 2)
    order.make_order(:drink, 1)
  end
end
