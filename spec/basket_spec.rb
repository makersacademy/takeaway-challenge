require 'basket'

describe Basket do
  let(:item) { { 'Test' => 1.5 } }
  context '#add an item' do
    before { 2.times { subject.add(item) } }

    it 'puts an item in the current_order' do
      expect(subject.current_order).to eq [{ 'Test' => 1.5 }, { 'Test' => 1.5 }]
    end

    it 'calculates the total' do
      expect(subject.total_cost).to eq 3
    end
  end

end
