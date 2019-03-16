require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new() }
  
  describe "#menu" do
    it 'returns an array' do
      expect(takeaway.menu).to_not be_empty
    end
    # anything else to check for here?
  end

  describe "#add_to_order" do
    it 'adds a dish to the order in the correct quantity' do
      item = takeaway.menu[3]
      takeaway.add_to_order(item, 2)
      expect(takeaway.basket.count(item)).to eq 2
    end
    
    it 'raises an error if the item is not on the menu' do
      expect { takeaway.add_to_order("", 1) }.to raise_error "Cannot add to order: item is not available. Select items from the menu."
    end
  end

  describe "#basket" do
    it 'is empty when initialised' do
      expect(takeaway.basket).to be_empty
    end

    context 'after adding some items to an order' do
      before do
        [[4, 1], [5, 1]].each do |item, quantity|
          takeaway.add_to_order(takeaway.menu[item], quantity)
        end
        @total = takeaway.basket.map { |item| item[:price] }.sum
      end
  
      it 'includes my items' do
        expect(takeaway.basket).to include(takeaway.menu[4], takeaway.menu[5])
      end
    end
  end

  describe "#verify" do
    before do
      [[4, 1], [5, 1]].each do |item, quantity|
        takeaway.add_to_order(takeaway.menu[item], quantity)
      end
      @total = takeaway.basket.map { |item| item[:price] }.sum
    end

    it 'returns true if the total is correct' do
      expect(takeaway.verify(@total)).to be true
    end

    it 'raises an error if the total is wrong' do
      expect { takeaway.verify(@total - 1) }.to raise_error "Cannot verify order: the price was wrong. Check your maths! 😜"
    end
  end
end
