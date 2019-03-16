require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(confirmation_sender) }
  let(:confirmation_sender) { double :confirmation_sender }
  
  describe "#menu" do
    it 'returns an array' do
      expect(takeaway.menu).to_not be_empty
    end
    xit 'should add more stuff in here' do
    end
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

    context 'the total is correct' do
      it 'returns true if the total is correct' do
        allow(confirmation_sender).to receive(:send)
        expect(takeaway.verify(@total)).to be true
      end

      it 'uses confirmation_sender to send a confirmation message' do
        one_hour_from_now = (Time.new + 3600).strftime("%H:%M")
        message = "Thank you! Your order was placed and will be delivered before #{one_hour_from_now}."
        expect(confirmation_sender).to receive(:send).with(message)
        takeaway.verify(@total)
      end
    end

    context 'the total is incorrect' do
      it 'raises an error if the total is wrong' do
        expect { takeaway.verify(@total - 1) }.to raise_error "Cannot verify order: the price was wrong. Check your maths! 😜"
      end
    end
  end
end
