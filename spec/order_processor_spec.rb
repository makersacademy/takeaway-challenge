require 'order_processor'

describe OrderProcessor do

  let(:order_processsor) { described_class }
  let(:dish_1) { double :dish, name: 'Fruit Basket', price: 10.99 }
  let(:dish_2) { double :dish, name: 'Eggs Bennedict', price: 11.99 }

  it 'returns full order breakdown to be used by the messaging service' do
    message = "Dish: #{dish_1.name} Price: £#{dish_1.price}, Quantity: 1\nDish: #{dish_2.name} Price: £#{dish_2.price}, Quantity: 1\n"
    total = dish_1.price + dish_2.price
    full_message = message + "2 Dishes. Total: £#{sprintf('%.2f', total)}"
    contents = [dish_1, dish_2]
    to_return = [message, full_message, total]
    expect(order_processsor.process(contents)).to eq to_return
  end
  
end
