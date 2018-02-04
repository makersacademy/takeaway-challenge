require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double 'a menu' }
  let(:test_menu) { { "Dish_1" => 3.50, "Dish_2" => 4 } }
  let(:test_summary) { "Order Summary\n----------\nDish_1 x2 £7.00\nDish_2 x1 £4.00\n----------\n" + test_total }
  let(:test_total) { "Order total is £11.00\n" }

  context "when created" do

    it "stores an empty basket" do
      expect(order.basket).to eq({})
    end

  end

  context "when item is on menu" do

    describe '#add' do

      before(:each) do
        allow(order).to receive(:on_menu?).and_return(true)
      end

      it "adds item to basket if it's on the menu" do
        order.add("Dish_2")
        expect(order.basket).to include("Dish_2" => 1)
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

  end

  context "when item is not on menu" do

    describe '#add' do

      it "returns an error if item is not on the menu" do
        allow(menu).to receive(:dishes).and_return(test_menu)
        message = "This dish is not on the menu"
        expect { order.add("Dish_3") }.to raise_error message
      end

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
