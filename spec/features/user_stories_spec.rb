require 'takeaway'

describe 'User Stories' do
  let(:takeaway) { Takeaway.new(phone, menu, order) }
  let(:phone) { Dotenv.load['TWILIO_PHONE'] }
  let(:menu) { Menu.new }
  let(:order) { Order.new }

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'displays a list of dishes with prices' do
    expect(takeaway.read_menu).to eq menu.display_menu
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'can select some number of several available dishes' do
    dishes = {chicken_tikka_masala: 1, naan: 2}
    expect{ takeaway.select_dishes(dishes) }.not_to raise_error
  end

  it 'cannot select unavailable dish' do
    expect(takeaway.select_dishes(bouillabaisse: 5)).to be_empty
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'gives a total of the dishes ordered' do
    dishes = {chicken_tikka_masala: 1, naan: 2}
    takeaway.select_dishes(dishes)
    expect(takeaway.checkout).to eq 'You\'ve ordered 3 items.'
  end

  it 'checks that the total matches the sum of dishes ordered' do
    dishes = {chicken_tikka_masala: 1, naan: 2}
    takeaway.select_dishes(dishes)
    expect{ takeaway.confirm_order(4) }.to raise_error 'Total number of dishes does not match. Please check again.'
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it 'sends a text to confirm order and delivery time' do
    dishes = {chicken_tikka_masala: 1, naan: 2}
    takeaway.select_dishes(dishes)
    expect(takeaway).to receive(:send_text)
    takeaway.confirm_order(3)
  end
end