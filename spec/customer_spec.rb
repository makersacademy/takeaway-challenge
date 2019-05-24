require "customer"

describe Customer do
  subject(:customer) { described_class.new(menu_class, order_class) }
  let(:menu_class) { double(:menu_class, :new => menu) }
  let(:menu) { double(:menu) }
  let(:order_class) { double(:order_class, :new => order) }
  let(:order) { double(:order) }
  let(:dish) { double(:dish, :name => "Soup") }

  it "looks at the nemu" do
    expect(menu).to receive(:show)
    customer.look
  end
  it "selects dishes" do
    expect(order).to receive(:add)
    customer.choice(dish, 2)
  end
end
