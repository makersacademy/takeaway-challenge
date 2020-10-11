require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  #list of food in hash
  let(:food) do
    {
      pizza: 3,
      soup: 4
    }
  end

  #confirms hashes list of food to be accepted in a while loop
  before do
    allow(menu).to receive(:avilable_food?).with(:pizza).and_return(true)
    allow(menu).to receive(:avilable_food?).with(:soup).and_return(true)
  end

  it 'orders 2 dishes' do
    order.add_order(:pizza, 3)
    order.add_order(:soup, 4)
    expect(order.food).to eq(food)
  end

  it "checks food for avilability" do
    allow(menu).to receive(:avilable_food?).with(:cheese).and_return(false)
    expect { order.add_order(:cheese, 5) }.to raise_error("cheese is not on the menu!")
  end

end
