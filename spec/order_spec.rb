require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double 'a menu' }
  let(:test_menu) { { "Dish_1" => 3.50, "Dish_2" => 4 } }
  let(:test_summary) { "Order Summary\nDish_1 x2 £7.00\nDish_2 x1 £4.00\n" + test_total }
  let(:test_total) { "Order total is £11.00\n" }

  context "when created" do

    it "stores an empty basket" do
      expect(order.basket).to eq({})
    end

  end

  describe '#add' do

    before(:each) do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(true)
    end

    it "adds item to basket if it's on the menu" do
      order.add("Dish_1")
      expect(order.basket).to include("Dish_1" => 1)
    end

    it "returns an error if item is not on the menu" do
      allow(menu).to receive(:includes?).and_return(false)
      message = "This dish is not on the menu"
      expect { order.add("Dish_3") }.to raise_error message
    end

    it "adds several of the same item at once if specified" do
      order.add("Dish_1", 3)
      expect(order.basket).to eq({ "Dish_1" => 3 })
    end

    it 'combines duplicate items in the basket' do
      order.add("Dish_1", 2)
      order.add("Dish_1")
      expect(order.basket).to eq({ "Dish_1" => 3 })
    end

  end

  describe '#summary' do

    before(:each) do
      allow(menu).to receive(:dishes).and_return(test_menu)
      allow(menu).to receive(:includes?).and_return(true)
      order.add("Dish_1", 2)
      order.add("Dish_2")
    end

    it 'returns a summary of the basket with subtotals and total' do
      expect { order.summary }.to output(test_summary).to_stdout
    end

  end

end
