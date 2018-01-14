require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) }
  let(:meals) { {'burrito' => 3, 'pie' => 2, 'quiche' => 1} }

  describe '#add' do
    it 'chooses a number of meals' do
      order.add('burrito', 3)
      order.add('pie', 2 )
      order.add('quiche', 1)
      expect(order.meals).to eq(meals)
    end
  end

  describe '#total_cost' do
    it 'calculates the total cost of the order' do
      allow(menu).to receive(:price).with('burrito').and_return(5)
      allow(menu).to receive(:price).with('pie').and_return(4)
      allow(menu).to receive(:price).with('quiche').and_return(3)
      order.add('burrito', 3)
      order.add('pie', 2 )
      order.add('quiche', 1)
      expect(order.total_cost).to eq(26)
   end
 end

end
