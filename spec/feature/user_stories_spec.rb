require 'restaurant'

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'Prints list of dishes with prices' do
    cafe = Restaurant.new('cafe')
    cafe.add_menu_item('Slice of Cake', 6)
    cafe.add_menu_item('Ham Toastie', 8)
    expect(cafe.view_menu).to eq "Slice of Cake - £6\nHam Toastie - £8"
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'Adds dishes with quantities to order' do
    cafe = Restaurant.new('cafe')
    cafe.add_menu_item('Slice of Cake', 6)
    cafe.add_menu_item('Ham Toastie', 8)
    cafe.create_new_order
    cafe.add_to_order('Ham Toastie', 2)
    cafe.add_to_order('Slice of Cake', 3)
    expect(cafe.view_order).to eq "2 - Ham Toastie(s)\n3 - Slice of Cake(s)"
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'Adds up the dishes in your order and verifys total' do
    cafe = Restaurant.new('cafe')
    cafe.add_menu_item('Slice of Cake', 6)
    cafe.add_menu_item('Ham Toastie', 8)
    cafe.create_new_order
    cafe.add_to_order('Ham Toastie', 2)
    cafe.add_to_order('Slice of Cake', 3)
    expect(cafe.verify_total).to eq('Your total is £34')
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it 'Sends a text message when order gets placed' do
    messenger = double('Messenger')
    cafe = Restaurant.new('cafe',messenger = messenger)
    cafe.add_menu_item('Slice of Cake', 6)
    cafe.add_menu_item('Ham Toastie', 8)
    cafe.create_new_order
    cafe.add_to_order('Ham Toastie', 2)
    cafe.add_to_order('Slice of Cake', 3)
    expect(messenger).to receive(:send_confirmation).and_return "Thank you! Your order was placed and will be delivered at 15:30!"
    cafe.send_order
  end


end
