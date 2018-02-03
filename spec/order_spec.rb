require 'order'

describe Order do

  subject(:order) { described_class.new(menu)}
  let(:menu) { double 'a menu' }
  let(:test_menu) { { "Dish_1" => 3.50, "Dish_2" => 4 } }

  context "when created" do

    it "stores an empty basket" do
      expect(order.basket).to eq({})
    end

  end

  describe '#add' do
    it "adds item to basket if it's on the menu" do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(true)
      order.add("Dish_1")
      expect(order.basket).to include("Dish_1" => 3.50)
    end

    it "returns an error if item is not on the menu" do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(false)
      expect { order.add("Dish_3") }.to raise_error "This dish is not on the menu"
    end
  end

end
