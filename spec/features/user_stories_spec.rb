describe 'User Stories' do
  let(:restaurant) { Restaurant.new }
  let(:menu) { Menu.new }
  let(:msg) { Msg.new }

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  it 'the restaurant shows the list of dishes and prices' do
    expect(restaurant.menu.view).to eq menu.list
  end

  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes
  it 'the restaurant allows the customer to order' do
    expect(restaurant).to respond_to(:order)
  end

  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given matches
  #the sum of the various dishes in my order

  #As a customer
  #So that I am reassured that my order will be delivered on time
  #I would like to receive a text such as "Thank you! Your order was
  #placed and will be delivered before 18:52" after I have ordered
  it 'sends a text if the order is successful' do
    expect(msg).to receive(:send_confirmation).and_return("Your order was successful and should arrive by #{(Time.new + 3600).hour.to_s + ":" + (Time.new + 3600).min.to_s}.")
    msg.send_confirmation
  end
end
