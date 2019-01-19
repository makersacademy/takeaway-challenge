require 'order'

describe Order do

  subject(:an_order) { described_class.new }
  let(:message) { double :message }

  describe '#order' do
    it 'should start out empty' do
      expect(an_order.order).to be_empty
    end
  end

  describe '#add' do
    it 'should add an item to an order' do
      allow(an_order).to receive_message_chain(:menu, :items, :[]) { 1 }
      an_order.add('item', 1)
      expect(an_order.order.last).to eq({ item: 'item', num: 1 })
    end

    it 'should add multiple items to an order' do
      allow(an_order).to receive_message_chain(:menu, :items, :[]) { 1 }
      an_order.add('item', 1)
      an_order.add('item', 2)
      expect(an_order.order).to eq([{ item: 'item', num: 1 }, { item: 'item', num: 2 }])
    end
  end

  describe '#checkout' do
    it 'should call message.send' do
      expect(message).to receive(:send)
      an_order.checkout(0, message)
    end
    
    it 'should return the message sid once a message is sent' do
      allow(message).to receive(:send) { 'sent' }
      expect(an_order.checkout(0, message)).to eq('sent')
    end
  end

  describe '#show' do
    it "should show an itemised list of the customer's order" do
      expect(an_order).to receive_message_chain(:print_out, :receipt_header)
      expect(an_order).to receive(:receipt_middle)
      expect(an_order).to receive(:receipt_footer)
      an_order.show
    end
  end

  describe '#receipt_middle' do
    it 'should print the middle portion of the list' do
      allow(an_order).to receive_message_chain(:menu, :items, :[]) { 1 }
      an_order.order << { item: "foo", num: 1 }
      expect { an_order.receipt_middle }.to output(
        "1 x foo                        £1.00\n"
      ).to_stdout
    end
  end

  describe '#receipt_footer' do
    it 'should print the bottom portion of the list' do
      expect { an_order.receipt_footer }.to output(
        "------------------------------------
Total:                         £0.00\n\n"
      ).to_stdout
    end
  end
end
