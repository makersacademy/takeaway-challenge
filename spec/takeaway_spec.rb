require 'takeaway'

describe Takeaway do
  let(:order) {double :order, add_items: 'Prawn Toast, 1', total: 4.50 }
  let(:order_class) { double :order_class, new: order }
  let(:menu){ double :menu, print_menu: { "Prawn Toast": 4.50, "Beef Chow Mein": 6.50 }, item_available?: true, items: { "Prawn Toast": 4.50, "Beef Chow Mein": 6.50 } }
  subject(:takeaway) { described_class.new(menu, order_class) }

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
      expect(takeaway.print_menu).to eq ({ "Prawn Toast": 4.50, "Beef Chow Mein": 6.50 })
    end
  end
  describe '#order_item(item,quantity)' do
    it 'will not allow user to order an item that is not available' do
      allow(menu).to receive(:item_available?).and_return(false)
      expect { takeaway.order_item("Pizza",1 ) }.to raise_error "Sorry, we do not sell this dish"
    end
    it 'creates a new order object, if no order in progress' do
      takeaway.order_item('Prawn Toast', 1)
      expect(order_class).to have_received(:new)
    end
    it 'returns a new order object, if no order in progress' do
      expect(takeaway.order_item('Prawn Toast', 1)).to eq 'Prawn Toast, 1'
    end
    it 'does not create a new order, if order in progress' do
      takeaway.order_item("Prawn Toast",1)
      takeaway.order_item("Prawn Toast",1)
      expect(order_class).to have_received(:new).once
    end
    it 'passes item and quantity to order object' do
      takeaway.order_item("Prawn Toast",1)
      expect(order).to have_received(:add_items).with("Prawn Toast",1, nil)
    end
  end
  describe '#verify_order' do
    it 'checks user input against order total and confirms if correct' do
      takeaway.order_item("Prawn Toast",1)
      expect(takeaway.verify_order(4.50).to eq "Total verified - order processed")
    end
  end
end
