require 'takeaway'
describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, send_sms: send_sms, config: {}) }

  let(:menu) { double(:menu, print_menu: printed_menu) }
  let(:order) { instance_double("Order", total: 10.00) }
  let(:send_sms) { instance_double("SMS", deliver: nil) }
  let(:printed_menu) { "Fries: £2.00" }
  let(:foods) { {fries: 2, drink: 1} }
  before do
    allow(order).to receive(:make_order)
  end
  context 'when i want to order somethigs' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.view_menu).to eq(printed_menu)
    end
  end
  context 'order a meal' do
    it 'selct some number of avaliable dishes' do
      expect(order).to receive(:make_order).twice
      takeaway.place_order(foods)
    end
  end
  context 'verify my order' do
    it 'checks that total price given matches sum of sishes ordered' do
      total = takeaway.place_order(foods)
      expect(total).to eq(10.00)
    end
  end
  context 'check order will be delivered on time' do
    it 'sends a text when order is placed' do
      expect(send_sms).to receive(:deliver)
      takeaway.place_order(foods)
    end
  end
end
