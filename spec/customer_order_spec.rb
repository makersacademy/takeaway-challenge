describe CustomerOrder do

  let(:order) { CustomerOrder.new }
  let(:dish) { 'Hawaiian' }
  let(:quantity) { 2 }

  describe '#select_dishes' do

    it 'saves dish' do
      order.select_dish(dish, quantity)
      expect(order.dish).to eq 'Hawaiian'
    end

    it 'saves quantity' do
      order.select_dish(dish, quantity)
      expect(order.quantity).to eq quantity
    end

  end

end
