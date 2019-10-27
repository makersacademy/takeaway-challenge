require 'order'
require 'menu'

describe Order do

  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu") }

  let(:dishes) do

    { coffee: 1,
      pizza: 2
    }
  end

  before do
    allow(menu).to receive(:price).with(:coffee).and_return(3.00)
    allow(menu).to receive(:price).with(:pizza).and_return(7.80)
  end

  it "selects a number of items from the menu" do
    order.add(:coffee, 1)
    order.add(:pizza, 2)
    expect(order.dishes).to eq(dishes)
  end

  it 'should calculate the total of all the items' do
    order.add(:coffee, 1)
    order.add(:pizza, 2)
    total = 18.60
    expect(order.total).to eq(total)
  end


end
