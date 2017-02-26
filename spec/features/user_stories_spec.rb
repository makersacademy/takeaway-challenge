describe 'User Stories' do

  let(:filename){double :filename}

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'the restaurant can show users a menu with dishes and prices' do
    restaurant = Restaurant.new('El Sombrero')
    expect { restaurant.display_menu }.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'lets a user select dishes' do
    order = Order.new
    expect { order.add_item(:item_no) }.not_to raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'presents the order summary to the user' do
    order = Order.new
    expect { order.display_order_summary }.not_to raise_error
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it 'sends a order confirmation text' do
    restaurant = Restaurant.new('El Sombrero')
    expect { restaurant.confirm }.not_to raise_error
  end

end
