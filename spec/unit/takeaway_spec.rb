require 'takeaway'

describe Takeaway do
  let(:messager) { double :messager }
  let(:menu) { double :menu, on_menu?: true, add_dish: true }
  let(:order) { double :order, add: true, total: '£9' }
  let(:takeaway) { described_class.new(messager) }
  let(:dish1) { double :dish, name: 'pizza', price: 5 }
  let(:dish2) { double :dish, name: 'pasta', price: 4 }

  before do
    allow(messager).to receive(:send_message)
  end

  context '#new_order' do
    it 'sets @order = order' do
      takeaway.new_order(order)
      expect(takeaway.order).to eq order
    end
  end

  context '#complete_order' do
    it 'sends sms' do
      menu.add_dish(dish1)
      menu.add_dish(dish2)
      order.add(dish1)
      order.add(dish2)
      takeaway.new_order(order)
      message = "Thank you for your order: £9. Your order will arrive at"\
      " #{(Time.now.utc + 3600).strftime("%H:%M")}"
      expect(messager).to receive(:send_message).with(message)
      takeaway.complete_order
    end

    it 'raises an error if order is nil' do
      expect { takeaway.complete_order }.to raise_error 'No order made!'
    end
  end
end
