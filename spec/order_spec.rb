require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }
  let(:dishes) { { pizza: 1, pasta: 2 } } 

  before do
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(true)
    allow(menu).to receive(:has_dish?).with(:pasta).and_return(true) 
    allow(menu).to receive(:price).with(:pizza).and_return(1.00)
    allow(menu).to receive(:price).with(:pasta).and_return(2.00) 
  end

  it "stores the customers order" do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "stops customers from adding items that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:potato).and_return(false)
    expect { order.add(:potato, 1) }.to raise_error "potato is not available"
  end

  it "calculates the total for the order" do
    create_order
    total = 5.00
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:pizza, 1)
    order.add(:pasta, 2)
  end
end
