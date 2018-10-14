require 'takeaway_order'

describe Order do

  let(:menu) { double :menu, dishes: { 'dish-1' => 1, 'dish-2' => 2 } }
  let(:subject) { described_class.new(menu) }

  before do
    subject.add_item('dish-1', 1)
    subject.add_item('dish-2', 2)
  end

  describe '#add_item' do
    it 'adds item to customer order list' do
      expect(subject.order.to_a.flatten.join ', ').to eq 'dish-1, 1, dish-2, 2'
    end
  end

  describe '#return_total' do
    it 'retruns the total value' do
      expect { subject.update_price }.to change { subject.price }.by(5)
    end
  end

end
