describe CustomerOrder do

  let(:order) { CustomerOrder.new(menu, bill, text) }
  let(:list) { [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},]}
  let(:menu) { double :menu, list: list}

  let(:dish) { 'Hawaiian' }
  let(:quantity) { 2 }
  let(:invalid_dish) { 'Tortellini' }
  let(:invalid_quantity) { 2.5 }
  let(:order_value) { 17.98 }
  let(:customer_amount) { 17.98 }
  let(:incorrect_customer_amount) { 15.00 }

  let(:bill) { double :bill, is_valid?: true }
  let(:message) { 'Thank you! Your order was placed and will be delivered before 18:52' }
  let(:text) { double :text, send: message }

  describe '#select_dishes' do

    before do
      allow(menu).to receive(:available?).with(dish).and_return(true)
      order.select_dish(dish, quantity)
    end

    it 'saves selection' do
      expect(order.selection).to eq [{dish: dish, quantity: quantity}]
    end

    it 'saves multiple selections' do
      order.select_dish(dish, quantity)
      expect(order.selection).to eq [{dish: dish, quantity: quantity}, {dish: dish, quantity: quantity}]
    end

    it 'returns error if dish is not in menu' do
      message = "Error: Dish is not in menu!"
      allow(menu).to receive(:available?).with(invalid_dish).and_return(false)
      expect { order.select_dish(invalid_dish, quantity) }.to raise_error message
    end

    it 'returns error if quantity is not valid' do
      message = "Error: Invalid quantity!"
      expect { order.select_dish(dish, invalid_quantity) }.to raise_error message
    end

  end

  describe '#current_order' do

    before do
      allow(menu).to receive(:available?).with(dish).and_return(true)
      allow(bill).to receive(:calculate_bill)
      allow(bill).to receive(:total).and_return(order_value)
      order.select_dish(dish, quantity)
    end

    it 'prints the current order value' do
      expect{ order.total }.to output("Current order amounts to: £17.98\n").to_stdout
    end

  end

  describe '#process_order' do

    before do
      allow(menu).to receive(:available?).with(dish).and_return(true)
      allow(bill).to receive(:calculate_bill)
      allow(bill).to receive(:total).and_return(order_value)
    end

    context 'order is processed correctly' do
      it 'sends text to customer' do
        order.select_dish(dish, quantity)
        order.process(customer_amount)
        expect(text.send).to eq message
      end
    end

    context 'order is not processed correctly' do
      it 'raise error to customer' do
        allow(bill).to receive(:is_valid?).with(incorrect_customer_amount)
        order.select_dish(dish, quantity)
        expect{ order.process(incorrect_customer_amount) }.to raise_error "Error: Incorrect payment!"
      end
    end

  end

end
