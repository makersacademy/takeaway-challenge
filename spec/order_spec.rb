require 'order'

describe Order do

  subject(:order){ described_class.new(menu) }
  let(:menu){double :menu}
  let(:list) do
    {"mcchocolate": 2, "vegan mcchicken": 3}
  end

  it 'selects some number of several available dishes from the menu' do
    allow(menu).to receive(:dish_included?).with("vegan mcchicken".to_sym).and_return(true)
    order.select_order("vegan mcchicken", 3)
    allow(menu).to receive(:dish_included?).with("mcchocolate".to_sym).and_return(true)
    order.select_order("mcchocolate", 2)
    expect(order.list).to eq list
  end

  it "doesn't select items that aren't on the menu" do
    allow(menu).to receive(:dish_included?).with("pizza".to_sym).and_return(false)
    expect{ order.select_order("pizza", 2) }.to raise_error("Cannot select dish. Dish is not on the menu")
  end

  describe '#sum' do
    it 'returns the order total' do
      allow(menu).to receive(:price).with("vegan mcchicken".to_sym).and_return(5.55)
      allow(menu).to receive(:price).with("mcchocolate".to_sym).and_return(2.99)
      order.select_order("vegan mcchicken", 3)
      order.select_order("mcchocolate", 2)
      sum = 22.63
      expect(order.sum).to eq sum
    end
  end

end
