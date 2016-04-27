require 'order'

describe Order do

  let(:menu) {double(:menu, is_included?: true)}
  let(:messenger) {double(:messenger)}
  subject(:order) {described_class.new(menu)}

  context 'new order initialized' do
    it 'starts with empty order' do
      allow(subject).to receive(:empty?).and_return false
      expect(subject.show_order).to eq({})
    end

    it 'starts with an empty total' do
      expect(subject.check_total).to be_nil
    end
  end

  describe '#add_to_order' do
    it 'adds quantity and item to order' do
      allow(menu).to receive(:menu_select)
      subject.add(5,"venison sushi")
      expect(subject.show_order).to eq({5=>{"venison sushi"=>2.5}})
    end
  end

  describe '#check_total' do
    it 'calculates total cost of basket' do
      quantity = 2
      item = "venison sushi"
      price_per_unit = 2.50
      subject.add(quantity,item)
      expect(subject.check_total).to eq(quantity * price_per_unit)
    end
  end
end
