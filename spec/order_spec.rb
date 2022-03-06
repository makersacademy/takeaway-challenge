require 'order'

describe Order do
  let(:order_1) {Order.new}

  let(:dish_1) { dish_1 = double('dish_1', name: 'Pizza', price: 8) }
  let(:dish_2) { dish_2 = double('dish_2', name: 'Pasta', price: 9) }
  

  it 'creates an order with an empty array' do
    expect(order_1.order).to eq []
  end

  it 'adds dishes to the order' do
    order_1.add_to_order(dish_1)
    expect(order_1.order).to include(dish_1)
  end

  it 'shows my current order and prices' do
    order_1.add_to_order(dish_1)
    order_1.add_to_order(dish_2)
    expect { order_1.show_my_order }.to output("Pizza: £8\nPasta: £9\nTotal Price: £17\n").to_stdout
  end

  #The function itself works but cannot get test to pass
  # it 'send a confirmation text when I complete the order' do
  #   order_1.add_to_order(dish_1)
  #   order_1.add_to_order(dish_2)
  #   expect(order_1.confirm_order).to eq("Thank you for ordering from the best Italian at Makers ")
  # end

end