require 'takeaway'
require 'menu'
require 'order'

describe :UserStories do
  let(:menu) { Menu.new }
  let(:order_klass) { Order }
  let(:takeaway) { Takeaway.new menu, order_klass }

  #As a customer
  #So that I can check if I want to order something
  #I would like to see a list of dishes with prices
  it 'customer can access menu' do
    expect(takeaway.menu)
      .to eq({ 'Spring Rolls' => 2.99, 'Crispy Duck' => 6.99})
  end

  #As a customer
  #So that I can order the meal I want
  #I would like to be able to select some number of several available dishes
  it 'customer can place an order' do
    expect(takeaway).to respond_to(:place_order).with(2).arguments
  end

  #As a customer
  #So that I can verify that my order is correct
  #I would like to check that the total I have been given matches the sum of the
  #various dishes in my order
  it 'checks order total matches the cost ordered dishes' do
    expect{takeaway.place_order('2 Spring Rolls, 1 Crispy Duck', 12.97)}
      .to_not raise_error
  end

  #As a customer
  #So that I am reassured that my order will be delivered on time
  #I would like to receive a text such as "Thank you! Your order was placed and 
  #will be delivered before 18:52" after I have ordered
  xit 'customer receives text to confirm order' do
  end
end
