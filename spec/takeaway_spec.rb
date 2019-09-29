require 'takeaway'

describe Takeaway do

  let(:test_menu_list) { "MENU:\nItem 1 -- Price\nItem 2 -- Price" }
  let(:menu) { double :menu, view_items: test_menu_list,
    items: { pizza: 6, burger: 5, fries: 3, milkshake: 3, soda: 1 }
  }

  let(:test_receipt) { "1 x Burger - £5\nTOTAL - £5" }
  let(:digital_till) { double :digital_till, verify_total: true, itemised_receipt: test_receipt }
  let(:digital_till_class) { double :digital_till_class, new: digital_till }

  let(:messenger) { double :messenger, sms_confirmation: "sms confirmation sent"}
  let(:messenger_class) { double :messenger_class, new: messenger}

  subject(:takeaway) { described_class.new(menu: menu, dgt_class: digital_till_class, messenger_class: messenger_class) }

  describe '#initialize' do
    it { expect(takeaway.menu).to eq menu }
  end

  describe "#view_menu" do
    it { expect(takeaway.view_menu).to eq test_menu_list }
  end

  describe '#make_order' do
    let(:order1) { [{ quantity: 2, item: "pizza", cost: 12 },
      { quantity: 1, item: "burger", cost: 5 }]
    }
    let(:order2) { [{ quantity: 4, item: "milkshake", cost: 12 },
      { quantity: 4, item: "fries", cost: 12 }]
    }

    it 'saves items, quantities and totals per item as a hash in order array' do
      takeaway.make_order("pizza 2, burger 1", 17)
      expect(takeaway.order).to eq order1
    end

    it 'saves items, quantities and totals per item as a hash in order array' do
      takeaway.make_order("milkshake 4, fries 4", 24)
      expect(takeaway.order).to eq order2
    end

    it 'raises an error if the totals do not match' do
      allow(digital_till).to receive(:verify_total).and_return(false)
      expect { takeaway.make_order("pizza 2, burger 1", 10) }.to raise_error("Total does not match items")
    end
  end

  describe '#print_receipt' do
    it 'prints the receipt of the last order' do
      expect { takeaway.print_receipt }.to output(test_receipt).to_stdout
    end
  end
end
