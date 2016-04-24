require 'restaurant'

describe Restaurant do
  let(:dish) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:quantity) { rand(10) }
  let(:menu) { double(:menu, view: {dish => quantity}) }
  let(:order_class) { double(:order_class, new: order) }
  let(:order) { double(:order, add: nil) }
  subject(:restaurant) { described_class.new(menu, order_class) }

  describe '#initialize' do
    subject(:restaurant_class) { described_class }
    it "is initialized with 2 argument" do
      expect(restaurant_class.new(menu, order_class)).to be_a restaurant_class
    end
    it 'has an optional argument' do
      expect(restaurant_class.new(menu, order_class)).to be_a restaurant_class
    end
    it "raises an argument error if no argument is given" do
      expect{ restaurant_class.new }.to raise_error(ArgumentError)
    end
  end

  describe '#view_menu' do
    it 'returns the passed menu' do
      expect(restaurant.view_menu).to eq menu.view
    end
  end

  describe '#order' do
    it 'adds to the current order' do
      expect(order).to receive(:add)
      restaurant.order(dish, quantity)
    end
  end
end
