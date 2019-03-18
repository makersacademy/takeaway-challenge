require 'order'

describe Order do

  let(:menu) { double :menu }
  let(:message_class) { double :message_class }
  let(:message) { double :message }
  let(:customer_number) { double :customer_number }

  subject { described_class.new(menu) }

  before(:each) do
    allow(menu).to receive(:items).and_return({ "Nan" => 2.2, "Rice" => 2.70, "Aloo Gobi" => 4.10, "Sag Paneer" => 4.30, "Daal Makhani" => 6.10 })
    allow(message_class).to receive(:new).with(any_args).and_return message
  end

  describe '#print_menu' do

    it 'returns the menu' do
      allow(menu).to receive(:print).and_return "List of items"
      expect(subject.print_menu).to eq "List of items"
    end

  end

  describe '#add' do

    it 'allows user to place order' do
      allow(menu).to receive(:includes_item?).with("Nan").and_return true
      subject.add("Nan", 1)
      expect(subject.order).to include("Nan" => 1)
    end

    it 'raises an error if a dish is not available' do
      allow(menu).to receive(:includes_item?).with("Chicken Korma").and_return false
      expect { subject.add("Chicken Korma") }.to raise_error "Item not available"
    end

  end

  describe '#total_price' do

    before(:each) do
      allow(menu).to receive(:includes_item?).with("Nan").and_return true
      allow(menu).to receive(:includes_item?).with("Aloo Gobi").and_return true
    end
    
    it 'shows user the price of their order for one item' do
      subject.add("Nan", 1)
      expect(subject.total).to eq 2.2
    end

    it 'shows user the price of their order for two items' do
      subject.add("Nan", 2)
      subject.add("Aloo Gobi", 1)
      expect(subject.total).to eq 8.5
    end

  end

  describe '#place' do

    it 'raises an error if no items added to order' do
      expect { subject.place } .to raise_error "No items in order"
    end

# The below test is failing - been unable to solve this weekend

    it 'sends a text to the customer' do
      subject.add("Nan", 2)
      allow(message).to receive(:send).with(customer_number).and_return { "Text is sent" }
      expect(subject.place).to eq "Text is sent"
    end

  end

end
