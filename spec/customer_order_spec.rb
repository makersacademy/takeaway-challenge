describe CustomerOrder do

  let(:order) { CustomerOrder.new }
  let(:dish) { 'Hawaiian' }
  let(:quantity) { 2 }
  let(:menu) { [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},]}
  let(:dishes) { double :dishes, menu: menu}

  describe '#select_dishes' do

    it 'saves selection' do
      order.select_dish(dish, quantity)
      expect(order.selection).to eq [[dish, quantity]]
    end

    it 'saves multiple selections' do
      order.select_dish(dish, quantity)
      order.select_dish(dish, quantity)
      expect(order.selection).to eq [[dish, quantity], [dish, quantity]]
    end
    
  end

end
