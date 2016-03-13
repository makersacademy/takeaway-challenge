require 'order'
require 'byebug'

describe Order do

  subject(:order){ described_class.new(menu_klass: menu_klass) }
  let(:menu_klass) { double(:menu_klass, new: menu) }
  let(:menu) { double(:menu, display: {dish1=>dish1_price})}
  let(:dish1) { :dish1 }
  let(:dish1_price) {2.99}
  let(:quantity) { 4 }

  describe '#see_menu' do
    it 'Shows a list of dishes with prices' do
      expect(menu).to receive(:display)
      order.display_menu
    end
  end

  describe '#load_menu' do
      it 'allows another menu to be loaded' do
        expect{order.load_menu({})}.to change{order.display_menu}
      end
  end

  describe '#take_order' do
    it 'keeps track of the dishes ordered' do
      expect(order.take_order(dish1, quantity)).to include(dish1 => quantity)
    end
    it 'expects an error if dish is not available' do
      message = "That dish is not available"
      expect{ order.take_order(:non_existent_dish, quantity) }.to raise_error(message)
    end
    it 'expects an error when quantity invalid or not supplied' do
      message = "Quantity must be an integer"
      expect{ order.take_order(dish1, "3") }.to raise_error(message)
    end
  end

  describe '#view_current_order' do
    it 'should display the current order' do
      expect(order.view_current_order).to be_a(Array)
    end
  end

  describe '#place order' do
    it 'should raise error if amount given is less than the total' do
      order.take_order(dish1, quantity)
      message = "Not enough money given"
      expect{order.place_order(10)}.to raise_error(message)
    end
    it 'should not raise error if correct amount given' do
      order.take_order(dish1, quantity)
      expect{order.place_order(20)}.not_to raise_error
    end
  end

  describe 'confirms the order' do
    it 'clears the current order' do
      order.take_order(dish1, quantity)
      order.confirm_order
      expect(order.view_current_order).to eq []
    end

    it 'send an sms to customer' do
      expect(order).to receive(:send_sms)
      order.confirm_order
    end
  end
end
