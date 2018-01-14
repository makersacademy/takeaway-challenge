require 'order'

describe Order do
  subject(:order) {described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      eggs: 5,
      milk: 8
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:eggs).and_return(true)
    allow(menu).to receive(:has_dish?).with(:milk).and_return(true)

    allow(menu).to receive(:price).with(:eggs).and_return(1.50)
    allow(menu).to receive(:price).with(:milk).and_return(4.50)
  end


  it "chooses several dishes from menu" do
    order.add(:eggs, 5)
    order.add(:milk, 8)
    expect(order.dishes).to eq(dishes)
  end

  it 'adds up total price for order' do
    order.add(:eggs, 5)
    order.add(:milk, 8)
    total = 43.50
    expect(order.total).to eq(total)
  end


end
