require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:item) { double :item }
  let(:dishes) {{"Hamburger" => 3.99, "Pizza" => 9.99, "Fish and Chips" => 4.99, "Curry" => 5.99, "Deep Fried Mars Bar" => 0.99, "Coke Zero" => 1.99}}

  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(menu.dishes).to eq(dishes)
    end
  end

  describe '#view' do
    it 'prints a list of dishes with prices' do
      printed_menu = "Hamburger £3.99, Pizza £9.99, Fish and Chips £4.99, Curry £5.99, Deep Fried Mars Bar £0.99, Coke Zero £1.99"
      expect(menu.view).to eq(printed_menu)
    end
  end

  describe '#does_not_contain?' do
    it 'returns true if item not in dishes' do
      expect(menu.does_not_contain?(:item)).to eq true
    end

    it 'returns false if item in dishes' do
      expect(menu.does_not_contain?("Pizza")).to eq false
    end
  end
end
