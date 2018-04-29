describe CustomerOrder do

  let(:order) { CustomerOrder.new(dishes, bill, text) }
  let(:dish) { 'Hawaiian' }
  let(:quantity) { 2 }
  let(:menu) { [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},]}
  let(:dishes) { double :dishes, menu: menu}
  let(:bill) { double :bill }
  let(:text) { double :text }
  let(:customer_amount) { double :customer_amount }

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

  describe '#process_order' do

    context 'order is processed correctly' do
      it 'sends text to customer' do
        message = 'Thank you! Your order was placed and will be delivered before 18:52'
        allow(dishes).to receive(:in_menu?).with(dish).and_return(true)
        customer_amount = 17.98
        allow(bill).to receive(:calculate_bill)
        allow(bill).to receive(:total).and_return(17.98)
        allow(bill).to receive(:is_valid?).with(customer_amount)
        allow(text).to receive(:send).and_return(message)
        order.select_dish(dish, quantity)
        order.select_dish(dish, quantity)
        order.process(customer_amount)
        expect(text.send).to eq message
      end
    end

    context 'order is not processed correctly' do
      it 'raise error to customer' do
        message = 'Thank you! Your order was placed and will be delivered before 18:52'
        allow(dishes).to receive(:in_menu?).with(dish).and_return(true)
        customer_amount = 15.00
        allow(bill).to receive(:calculate_bill)
        allow(bill).to receive(:total).and_return(17.98)
        allow(bill).to receive(:is_valid?).with(customer_amount)
        order.select_dish(dish, quantity)
        order.select_dish(dish, quantity)
        expect{ order.process(customer_amount) }.to raise_error "Error: Incorrect payment!"
      end
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
