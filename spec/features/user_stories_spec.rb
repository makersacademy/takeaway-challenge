require 'takeaway'
require 'text_confirmation'

describe 'User Stories' do
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'so a customer knows what to order, they can read the takeaway menu' do
    takeaway = Takeaway.new
    expect{takeaway.read_menu}.not_to raise_error
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'so a customer can get the meal they want, they can order a number of dishes' do
    takeaway = Takeaway.new
    takeaway.make_selection('Spring rolls')
    expect(takeaway.order_summary).to include 'Spring rolls'
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  it 'so a customer can verify their order, they can check the total' do
    takeaway = Takeaway.new
    takeaway.make_selection('Spring rolls')
    expect(takeaway.check_total).to eq "The bill is currently £2.50."
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  it 'so a customer can be assured their meal will be delivered on time, they receive a text' do
    text_confirmation = TextConfirmation.new
    expect(text_confirmation).to receive(:send_message)
    text_confirmation.order_finished
  end
end
