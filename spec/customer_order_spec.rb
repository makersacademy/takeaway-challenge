describe CustomerOrder do

  let(:order) { CustomerOrder.new(dishes, bill) }
  let(:dish) { 'Hawaiian' }
  let(:quantity) { 2 }
  let(:menu) { [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},]}
  let(:dishes) { double :dishes, menu: menu}
  let(:bill) { double :bill }

  describe '#select_dishes' do

    before{ allow(dishes).to receive(:in_menu?).with(dish).and_return(true) }

    it 'saves selection' do
      order.select_dish(dish, quantity)
      expect(order.selection).to eq [{dish: dish, quantity: quantity}]
    end

    it 'saves multiple selections' do
      order.select_dish(dish, quantity)
      order.select_dish(dish, quantity)
      expect(order.selection).to eq [{dish: dish, quantity: quantity}, {dish: dish, quantity: quantity}]
    end

    it 'returns error if dish is not in menu' do
      invalid_dish = 'Tortellini'
      message = "Error: Dish is not in menu!"
      allow(dishes).to receive(:in_menu?).with(invalid_dish).and_return(false)
      expect { order.select_dish(invalid_dish, quantity) }.to raise_error message
    end

    it 'returns error if quantity is not valid' do
      invalid_quantity = 2.5
      message = "Error: Invalid quantity!"
      allow(dishes).to receive(:in_menu?).with(dish).and_return(true)
      expect { order.select_dish(dish, invalid_quantity) }.to raise_error message
    end

  end

  describe '#bill_valid?' do

    it 'calculates bill and compares with customer value' do
      allow(dishes).to receive(:in_menu?).with(dish).and_return(true)
      order.select_dish(dish, quantity)
      allow(bill).to receive(:calculate_bill)
      allow(bill).to receive(:total).and_return(17.98)
      expect(order.bill_valid?(17.98)).to be true
    end
  end

end
