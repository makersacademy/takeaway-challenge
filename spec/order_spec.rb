require 'order'
describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu)}
  let(:dishes) do
    {
      avocado: 2,
      lentils: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:avocado).and_return(true)
    allow(menu).to receive(:has_dish?).with(:lentils).and_return(true)
  end

  it "selects dishes from the menu" do
    order.add(:avocado, 2)
    order.add(:lentils, 1)
    expect(order.dishes).to  eq(dishes)
  end
  
  it 'does not allow item to be added that are not on the menu' do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end
end
