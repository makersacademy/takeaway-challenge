require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe '#add' do
    it 'chooses a number of meals' do
      meals = {'burrito' => 3, 'pie' => 2, 'quiche' => 1}
      order.add('burrito', 3)
      order.add('pie', 2 )
      order.add('quiche', 1)
      expect(order.meals).to eq(meals)
    end
  end

end
