require 'order'

describe Order do

  subject { described_class.new(menu) }
  let(:menu) { double [{ item: :item, price: 5 }] }

  describe '#initialize' do
    it 'has an initial total cost of 0' do
      expect(subject.total_cost).to eq 0
    end
  end

  describe '#add_to_order' do
    it 'adds items on menu to order' do
      expect(menu).to receive(:dishes) { [:item] }
      subject.add_item(1)
      expect(subject.items).to include(:item)
    end
  end

  describe '#check_order' do
    it 'calculates total price for each item' do
      expect(menu).to receive(:dishes) { [{ item: :item, price: 5 }] }
      subject.add_item(1)
      subject.calculate_total
      expect(subject.total_cost).to eq 5
    end
  end
end
