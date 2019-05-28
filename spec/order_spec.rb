require './lib/order.rb'

describe Order do
  let(:order) { Order.new(sms_double_class) }
  let(:dish_double_class) { double(:dish_double_class, :new => dish) }
  let(:dish) { double(:dish) }
  let(:sms_double_class) { double(:message, :new => sms) }
  let(:sms) { double(:sms, :send => "Success!") }

  it 'initializes a menu of dishes and their prices' do
    expect(order.menu).to eq(Order::MENU)
  end

  context '#view_menu' do
    it 'display the full menu to the customer' do
      expect(order.view_menu).to eq(order.menu)
    end
  end

  context '#add' do
    it 'tells dish to add the dish to basket in order' do
      expect(dish).to receive(:add)
      order.add("Jasmine Rice", 1, dish_double_class)
    end

    it 'adds dish to basket with quantity and price' do
      allow(dish).to receive(:add).and_return({ dish: "Jasmine Rice", price: 2.50, quantity: 1 })
      order.add("Jasmine Rice", 1, dish_double_class)
      expect(order.basket).to include({ dish: "Jasmine Rice", price: 2.50, quantity: 1 })
    end

    it 'updates the quantity of the dish if it already exsists in the basket' do
      order.basket.push({ dish: "Jasmine Rice", price: 2.50, quantity: 1 })
      order.add("Jasmine Rice", 1, dish_double_class)
      expect(order.basket).to eq([{ dish: "Jasmine Rice", price: 2.50, quantity: 2 }])
    end
  end

  context '#place' do
    it 'can sum the price of dishes in the basket' do
      allow(dish).to receive(:add).and_return({ dish: "Jasmine Rice", price: 2.50, quantity: 1 })
      order.add("Jasmine Rice", 1, dish_double_class)
      allow(dish).to receive(:add).and_return({ dish: "Chicken Red Thai Curry", price: 4.75, quantity: 1 })
      order.add("Chicken Red Thai Curry", 1, dish_double_class)
      expect(order.place(7.25)).to eq(7.25)
    end

    it 'raises an error if payment is lower than the sum total' do
      allow(dish).to receive(:add).and_return({ dish: "Jasmine Rice", price: 2.50, quantity: 1 })
      order.add("Jasmine Rice", 1, dish_double_class)
      allow(dish).to receive(:add).and_return({ dish: "Chicken Red Thai Curry", price: 4.75, quantity: 1 })
      order.add("Chicken Red Thai Curry", 1, dish_double_class)
      expect { order.place(5.00) }.to raise_error "#{Order::ERROR_MSG}"
    end

    it 'tells Message to create new message' do
      expect(sms).to receive(:send)
      order.place(2.50)
    end
  end
end
