require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order, messenger: messenger) }
  let(:menu) { double(:menu, print: printed_menu) }
  let(:order) { instance_double("Order", total: 18.50) }
  let(:messenger) { instance_double("Messenger", send_message: nil) }


  let(:printed_menu) { "soup, £3.50" }
  let(:dishes) { {dumplings: 3, soup: 1} }

  describe '#display_menu' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.display_menu).to eq(printed_menu)
    end
  end

  describe '#select_dishes' do
    it 'select some number of several available dishes' do
      expect(order).to receive(:add).twice
      takeaway.select_dishes(dishes)
    end

    it 'verifies the order total' do
      allow(order).to receive(:add)
      total = takeaway.select_dishes(dishes)
      expect(total).to eq(18.50)
    end
  end

  describe '#send_delivery_message' do
    it 'sends a text to confirm the order' do
      allow(order).to receive(:add)
      expect(messenger).to receive(:send_message)
      takeaway.select_dishes(dishes)
    end
  end

end
