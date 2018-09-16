require 'takeaway'

describe Takeaway do
  let(:messager) { double :messager }
  let(:menu) { double :menu, on_menu?: true, add_dish: true }
  let(:order) { double :order, add: true, total: '£9' }
  let(:takeaway) { described_class.new(messager, order) }
  let(:dish1) { double :dish, name: 'pizza', price: 5 }
  let(:dish2) { double :dish, name: 'pasta', price: 4 }

  before do
    allow(messager).to receive(:send_message)
  end

  context '#complete_order' do
    it 'sends sms' do
      menu.add_dish(dish1)
      menu.add_dish(dish2)
      order.add(dish1)
      order.add(dish2)

      expect(messager).to receive(:send_message).with("Thank you for your order: £9")
      takeaway.complete_order
    end
  end
end
