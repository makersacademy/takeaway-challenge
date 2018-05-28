require './lib/menu.rb'
require './lib/restaurant.rb'
require './lib/order_system.rb'

describe OrderSystem do

  subject(:order) { described_class.new }
  let(:item) { double :item }

  context '#order_request' do
    it 'responds to an order request' do
      expect { order.order_request }.not_to raise_error
    end
    it 'asks user for their order' do
      order_intro = 'What would you like to order?'
      expect(order.order_request).to eq order_intro
    end
  end

  context '#add_to_order' do
    let(:item) { double :item }
    it 'allows user to add an item to their order' do
      order.add_to_order("Chicken Tikka", 1)
      expect(order.pending_order).to include "Chicken Tikka"
    end
    it 'adds the item to pending order' do
      number = 1
      message = "#{number} #{item}(s) added to your order."
      expect(order.add_to_order(item, number)).to eq message
    end
    it 'totals up the pending order' do
      expect { order.add_to_order("Chicken Tikka", 3) }.to change { order.total_cost }.by 26.97
    end
  end

  context '#confirm_order' do
    it 'returns an error if the total submitted is not the correct total cost' do
      text_double = double(send_message: "Message sent.")
      menu_double = double(dishes: { "Dry Meat" => 10.99 })
      order = OrderSystem.new(menu_double, text_double)
      allow(order).to receive(:total_cost) { 2 }
      total_submitted = 12
      message = "Your submitted order total of #{total_submitted} is not correct."
      expect { order.confirm_order(total_submitted) }.to raise_error message
    end
    it 'returns confirmation' do
      text_double = double(send_message: "Message sent.")
      menu_double = double(dishes: { "Dry Meat" => 10.99 })
      order = OrderSystem.new(menu_double, text_double)
      allow(order).to receive(:total_cost) { 10.99 }
      total_submitted = 10.99
      message = "Total cost is #{order.total_cost}. Thank you for your order."
      expect(order.confirm_order(total_submitted)).to eq message
    end
    it 'allows user to receive a text message confirming estimated delivery time' do
      text_double = double(send_message: "Message sent.")
      menu_double = double(dishes: { "Dry Meat" => 10.99 })
      order = OrderSystem.new(menu_double, text_double)
      allow(order).to receive(:total_cost) { 21.98 }
      message = "Total cost is #{order.total_cost}. Thank you for your order."
      expect(order.confirm_order(21.98)).to eq message
    end
  end

  context '#order_placed' do
    it 'marks order as being in progress' do
      text_double = double(send_message: "Message sent.")
      menu_double = double(dishes: { "Dry Meat" => 10.99 })
      order = OrderSystem.new(menu_double, text_double)
      order.add_to_order("Dry Meat", 2)
      order.order_placed
      expect(order.order_in_progress).to eq true
    end
  end

end
