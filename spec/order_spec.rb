require 'order'
require 'menu'

RSpec.describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { instance_double("Menu") }
  let(:dishes) do
    { congee: 2,
      wonton: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:congee).and_return(true)
    allow(menu).to receive(:has_dish?).with(:wonton).and_return(true)
    
    allow(menu).to receive(:price).with(:congee).and_return(5)
    allow(menu).to receive(:price).with(:wonton).and_return(10)
  end

  it 'selects several dishes from the menu' do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:pizza).and_return(false)
    expect { order.add(:pizza, 2) }.to raise_error NoItemError, "Pizza is not on the menu!"
  end

  it 'calculates the total for the order' do
    create_order
    total = 20
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:congee, 2)
    order.add(:wonton, 1)
  end
end
