require 'takeaway'

describe Takeaway do

  let(:test_menu_list) { "MENU:\nItem 1 -- Price\nItem 2 -- Price" }
  let(:menu) { double :menu, view_items: test_menu_list,
    items: { pizza: 6, burger: 5, fries: 3, milkshake: 3, soda: 1 }
  }

  let(:messenger) { double :messenger, sms_confirmation: "sms confirmation sent" }
  let(:messenger_class) { double :messenger_class, new: messenger }

  let(:order) { [{ quantity: 2, item: "pizza", cost: 12 },
    { quantity: 1, item: "burger", cost: 5 }]
  }
  let(:test_receipt) { "\nRECEIPT:\n1 x Burger - £5\nTOTAL - £5\n" }
  let(:orders) { double :orders, make_order: true, history: test_receipt, current_order: order, submit_order: true }
  let(:orders_class) { double :orders_class, new: orders }

  subject(:takeaway) { described_class.new(menu: menu, orders_class: orders_class, messenger_class: messenger_class) }

  describe '#initialize' do
    it { expect(takeaway.menu).to eq menu }
  end

  describe "#view_menu" do
    it { expect(takeaway.view_menu).to eq test_menu_list }
  end

  describe '#add_items' do
    it 'items saved as hash of array in orders object' do
      takeaway.add_items("pizza 2, burger 1")
      expect(takeaway.current_order).to eq order
    end
  end

  describe '#complete_order' do
    it 'confirmation that a message was sent to the customer will be returned' do
      expect(takeaway.complete_order(10)).to eq("sms confirmation sent")
    end
  end

  describe '#view_last_receipt' do
    it 'prints the receipt of the last order' do
      expect { takeaway.view_last_receipt }.to output(test_receipt[-1]).to_stdout
    end
  end

  describe '#view_all_receipts' do
    it 'prints receipts from all orders' do
      expect { takeaway.view_all_receipts }.to output(test_receipt.reverse).to_stdout
    end
  end
end
