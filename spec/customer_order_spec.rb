describe CustomerOrder do

  let(:order) { CustomerOrder.new(dishes) }
  let(:dish) { 'Hawaiian' }
  let(:quantity) { 2 }
  let(:menu) { [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},]}
  let(:dishes) { double :dishes, menu: menu}

  describe '#select_dishes' do

    before{ allow(dishes).to receive(:in_menu?).with(dish).and_return(true) }

    it 'saves selection' do
      order.select_dish(dish, quantity)
      expect(order.selection).to eq [[dish, quantity]]
    end

    it 'saves multiple selections' do
      order.select_dish(dish, quantity)
      order.select_dish(dish, quantity)
      expect(order.selection).to eq [[dish, quantity], [dish, quantity]]
    end

    it 'returns error if dish is not in menu' do
      invalid_dish = 'Tortellini'
      message = "Error: Dish is not in menu!"
      allow(dishes).to receive(:in_menu?).with(invalid_dish).and_return(false)
      expect { order.select_dish(invalid_dish, quantity) }.to raise_error message
    end

  end

end
