require 'order'
require 'pricecalculation'
require 'send_sms'

describe 'user stories' do
  let(:subject) { Order.new }
# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  it 'show menu list including prices' do
    expect(subject.read_menu).to eq [
      { 'Beef Burger' => 6.99 }, { 'Veggie Burger' => 4.99 }, { 'Chicken Burger' => 5.99 },
      { 'Thin Cut Fries' => 2.50 }, { 'Thick Cut Fries' => 2.50 }, { 'Onion Rings' => 1.99 },
              ]
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'lets you select some number of several dishes available' do
    menu = 'Beef Burger'
    quantity = 2
    expect { subject.select(menu, quantity) }.to_not raise_error
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'returns current order in string format shwoing cost of each selection' do
    subject.select('Beef Burger', 3)
    subject.select('Onion Rings', 5)
    expect(subject.order_summary).to eq "Beef Burger X 3 = £20.97, Onion Rings X 5 = £9.95"
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it 'sends text with order info including delevery time and price' do
    subject.select('Beef Burger', 3)
    subject.select('Chicken Burger', 3)
    subject.select('Onion Rings', 3)
    subject.order_summary
    expect(subject.order_string).to eq "Thank you! Your order of #{subject.summary} was placed.
    It will be delivered before #{subject.time_calc}.
    Your order total comes to: £#{subject.total_price}."
  end

end
