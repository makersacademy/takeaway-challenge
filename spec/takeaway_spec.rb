require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double :menu, display: details, price_list: {dish => 5} }
  let(:details) { double :details1 }
  let(:dish) { double :dish }
  # let(:price) { double :price, }
  # let(:order) { double :order }

  it 'should initialize with a menu' do
    expect(takeaway.menu).to eq menu
  end

  describe '#display' do

    it 'should respond to the menu method' do
      expect(takeaway).to respond_to(:display)
    end

    it 'should print the menu for the customer' do
      expect(takeaway.display).to eq menu.display
    end
  end

  describe '#order' do
      it 'should respond to the order method' do
        expect(takeaway).to respond_to(:order)
      end

    context 'if the dish is not already in the basket' do
      it 'should add the dish and sub-total to the basket' do
        takeaway.order(dish, number = 1)
        takeaway.basket.include?(dish) == false
        expect(takeaway.basket).to include({dish => [1, 5] })
      end
    end

    context 'if the dish is already in the basket' do
      it 'should add the new sub-total to the dish already in the basket' do
        takeaway.basket = {dish => [1, 5]}
        takeaway.order(dish, number = 1)
        expect(takeaway.basket).to include({dish => [2, 10]})
      end
    end

    context 'if the dish is not available' do
      it 'should return "apologies that dish is not available"' do
        no_dishes = double
        allow(takeaway.menu).to receive(:price_list).and_return({no_dishes => [0, 0]})
        expect(takeaway.order(dish, number = 1)).to eq "apologies, that dish is not available"
      end
    end
  end

  describe '#basket_summary' do
    it 'should provide a summary of the dishes and running total' do
      takeaway.basket = {dish => [1, 5]}
      takeaway.order(dish, number = 1)
      expect(takeaway.basket_summary).to eq({dish => [2, 10]})
    end
  end
end
