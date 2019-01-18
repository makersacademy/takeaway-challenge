require 'menu'

describe Menu do
  let(:item_fish) { double(:item) }
  let(:item_class) { double(:item_class, new: item_fish) }
  let(:formatter) { double(:formatter, format_items: "Fish --- 8") }
  let(:formatter_class) { double(:formatter_class, new: formatter) }
  let(:order) { double(:order, place_order: nil, order_total: 1) }
  let(:order_class) { double(:order_class, new: order) }
  let(:subject) { Menu.new(["fish"], item_class, formatter_class, order_class) }

  describe '#initialize' do
    it 'should initialize with a list of item names' do
      expect(subject.names).to eq ["fish"]
    end

    it 'should create items on initialization' do
      expect(subject.items).to eq [item_fish]
    end
  end

  describe '#print_menu' do
    it 'should run formatter' do
      expect(formatter).to receive(:format_items)
      subject.print_menu
    end

    it 'should return a formatted menu' do
      expect(subject.print_menu).to eq "Fish --- 8"
    end
  end

  describe '#user_input' do

    it 'should test user input' do
    end

    it 'should loop until order_complete = true' do
    end

    it 'should run order object' do
      expect(order).to receive(:place_order)
      subject.place_order(item_fish)
    end
  end

  describe '#view_order' do
    it 'should run order object' do
      expect(order).to receive(:order_total)
      subject.return_order_total
    end

    it 'should return the order' do
      expect(subject.return_order_total).to eq 1
    end
  end

  # describe 'retrieve order' do
  # end
end
