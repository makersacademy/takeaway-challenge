require 'order'
require 'messenger'

describe Order do
  it 'starts with empty order list' do
    expect(subject.contents).to be_empty
  end

  context 'takes on new items to order' do
    it 'adds a new item' do
      subject.add("fish", 8, 3)
      expect(subject.contents).to include(:item => "fish", :item_price => 8, :quantity => 3)
    end

    it 'increases order quantity if adding the same item again' do
      subject.add("fish", 8, 3)
      subject.add("fish", 8, 2)
      expect(subject.contents[0][:quantity]).to eq(5)
    end
  end
  
  context 'it allows users to check their order' do
    it 'returns a summary of the order with each item' do
      expect { subject.show_summary }.to output(String).to_stdout
    end

    it 'contains the specific dishes' do
      subject.add("burger", 9, 5)
      subject.show_summary
      expect(subject.summary).to include("burger x5")
    end

    it 'gives the right total' do
      subject.add("burger", 9, 5)
      subject.add("fish", 8, 1)
      subject.show_summary
      expect(subject.summary).to include("Order total is £53")
    end
  end

  context 'placing an order' do
    it 'sends a message' do
      messenger = double("Messenger")
      expect(messenger).to receive(:send_message)
      subject.place_order(messenger)
    end
  end
end
