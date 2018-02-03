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
      expect(order.basket).to include("Dish_1" => 1)
    end

    it "returns an error if item is not on the menu" do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(false)
      expect { order.add("Dish_3") }.to raise_error "This dish is not on the menu"
    end

    it "adds several of the same item at once if specified" do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(true)
      order.add("Dish_1", 3)
      expect(order.basket).to eq({ "Dish_1" => 3 })
    end

    it 'combines duplicate items in the basket' do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(true)
      order.add("Dish_1", 2)
      order.add("Dish_1")
      expect(order.basket).to eq({ "Dish_1" => 3 })
    end

  end

  describe '#includes?' do
    it 'returns true if an item is already in the basket' do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(true)
      order.add("Dish_1")
      expect(order.order_includes?("Dish_1")).to be true
    end

    it 'returns false if item is not already in the basket' do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(true)
      expect(order.order_includes?("Dish_1")).to be false
    end
  end

end
