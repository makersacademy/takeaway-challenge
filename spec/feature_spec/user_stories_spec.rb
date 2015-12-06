require 'takeaway'
require 'menu'
require 'order'
require 'phone'

describe :UserStories do
  let(:menu) { Menu.new }
  let(:order_klass) { Order }
  let(:phone) { Phone.new }
  let(:takeaway) { Takeaway.new menu, order_klass, phone }

  before do
    allow(phone).to receive(:send_text)
  end
  
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

  it 'raises error if select unavailable item' do
  expect{takeaway.place_order('9 Carrot', 9.00)}
    .to raise_error "Cannot place order: Carrot not available!"
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
  it 'customer receives text to confirm order' do
    expect(phone).to receive(:send_text)
      .with('Thank you! Your order was placed and will be delivered before'\
            " #{(Time.now + 3600).strftime("%H:%M")}.")
    takeaway.place_order('2 Spring Rolls, 1 Crispy Duck', 12.97)
  end
end
