require 'order'

describe Order do

  let(:order) { described_class.new }
  let(:dish) {double(:dish, :number => 3, :name => "Margherita", :price => 8.95) }
  let(:menu) {double(:menu)}
  before :each do
    allow(menu).to receive(:list).and_return([{:number => 3, :name => "Margherita", :price => 8.95}])
  end

  describe "defaults" do
    it "basket is an empty array to begin" do
      expect(order.basket).to be_empty
    end
  end

  describe "#add_dish" do
    it "saves the dish and quantity" do
      order.add_dish(3, menu)
      expect(order.basket).to eq({"Margherita" => 1})
    end

    it "adds 1 to the dish quantity if the selected dish is already in the basket" do
      2.times {order.add_dish(3, menu)}
      expect(order.basket).to eq({"Margherita" => 2})
    end
  end



end
