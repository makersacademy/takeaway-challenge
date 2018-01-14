require 'takeaway'

describe Takeaway do
  let(:order) { double :order, add_items: 'Prawn Toast, 1', verified?: true }
  let(:order_class) { double :order_class, new: order }
  let(:menu){ double :menu, print_menu: { "Prawn Toast" => 4.50, "Beef Chow Mein" => 6.50 }, item_available?: true, items: { "Prawn Toast" => 4.50, "Beef Chow Mein" => 6.50 } }
  sms_tool = FakeSms.new
  subject(:takeaway) { described_class.new(menu, order_class, sms_tool) }

  describe 'initialize' do
    it 'initializes with orders history' do
      expect(takeaway.order_history).to be_empty
    end
  end

  describe '#print_menu' do
    it 'calls #print_menu for menu object' do
      takeaway.print_menu
      expect(menu).to have_received(:print_menu)
    end
    it "returns a list of dishes available with price" do
      expect(takeaway.print_menu).to eq({ "Prawn Toast" => 4.50, "Beef Chow Mein" => 6.50 })
    end
  end

  describe '#order_item(item,quantity)' do
    it 'will not allow user to order an item that is not available' do
      item = "Pizza"
      allow(menu).to receive(:item_available?).and_return(false)
      expect { takeaway.order_item(item, 1) }.to raise_error "Sorry, we do not sell #{item}"
    end
    context 'item ordered is available' do
      before do
        takeaway.order_item('Prawn Toast', 1)
      end
      it 'creates a new order object, if no order in progress' do
        expect(order_class).to have_received(:new)
      end
      it 'returns a new order object, if no order in progress' do
        expect(takeaway.order_item('Prawn Toast', 1)).to eq 'Prawn Toast, 1'
      end
      it 'does not create a new order, if order in progress' do
        takeaway.order_item("Prawn Toast", 1)
        expect(order_class).to have_received(:new).once
      end
      it 'passes item and quantity to order object' do
        expect(order).to have_received(:add_items).with("Prawn Toast", 1, 4.5)
      end
    end
  end
  describe '#complete_order' do
    it 'raises error if user order total does not match actual order total' do
      allow(order).to receive(:verified?).and_return(false)
      expect { takeaway.complete_order(10) }. to raise_error "Total does not match current order, order not processed"
    end
    context 'correct order total provided' do
      before do
        takeaway.complete_order(4.50)
      end
      it 'sends text message confirmation if order total matches' do
        expect(sms_tool.messages).to eq ["Message sent"]
      end
      it 'saves verified order to order history' do
        expect(takeaway.order_history).to include order
      end
      it 'sends a payment confirmation text message' do
        expect(sms_tool).to receive(:send_message)
        takeaway.complete_order(4.50)
      end
    end
  end
end
