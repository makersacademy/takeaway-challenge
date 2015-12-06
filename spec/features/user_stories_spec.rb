describe 'User Stories' do
  let(:restaurant) { Restaurant.new }
  let(:menu) { Menu.new }

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  it 'there is a list of dishes with prices' do
    expect(restaurant.menu.list).to eq [
      {"Chips" => 3},
      {"Salad" => 4},
      {"Chicken" => 7},
      {"Fish" => 9},
      {"Daily special" => 15}
    ]
  end

  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes
  it 'stores the customers choices when they order' do
    restaurant.order
    expect(restaurant.customer_order).not_to be_empty
  end

  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given matches the sum of the various dishes in my order
  xit 'checks if the customer total is the same as the order total' do

  end

  #As a customer
  #So that I am reassured that my order will be delivered on time
  #I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
end
