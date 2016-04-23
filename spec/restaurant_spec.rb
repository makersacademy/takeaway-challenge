require 'restaurant'

describe Restaurant do
  let(:dish) { double(:dish, name: (0...8).map { (65 + rand(26)).chr }.join) }
  let(:menu) { double(:menu, view: {dish => rand(10)}) }
  subject(:restaurant) { described_class.new(menu) }

  describe '#initialize' do
    subject(:restaurant_class) { described_class }
    it "is initialized with 1 argument" do
      expect(restaurant_class.new(menu)).to be_a restaurant_class
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
end
