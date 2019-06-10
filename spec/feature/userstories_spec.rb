require 'takeaway'
require 'message'
require 'order'

RSpec.describe 'user stories' do

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  it 'shows the list of dishes' do
    takeaway = Takeaway.new
    expect { takeaway.menu }.not_to raise_error
    expect(takeaway.menu).to eq Takeaway::LIST
  end

  # # As a customer
  # # So that I can order the meal I want 
  # # I would like to be able to select some number of several available dishes
  context '2nd user story' do
    before(:each) { $stdin = StringIO.new }
    let(:takeaway) { Takeaway.new(Message, Order) }

    it 'return a list of selected dishes and their number' do
      order = takeaway.order.new
      allow(order).to receive(:start_order)
      allow($stdin).to receive(:gets).and_return("olives", "1", "close")
      expect(takeaway.select).to eq({ :olives => 1 })
    end
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it 'return the total for the customer to check if is corret' do
    takeaway = Takeaway.new(Message, Order.new)
    $stdin = StringIO.new
    allow(takeaway.order).to receive(:total) { 20 }
    allow($stdin).to receive(:gets).and_return("20")
    expect(takeaway.check_total).to eq("The total match the sum of 20£")
    end

#   # As a customer
#   # So that I am reassured that my order will be delivered on time
#   # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it 'send a text message if order is accepted' do
    mock_message = double(Message.new)
    mock_message_class = double(Message) 
    allow(mock_message_class).to receive(:new) { mock_message }
    allow(mock_message).to receive(:send) { "message" }
    takeaway = Takeaway.new(mock_message_class)
    expect(takeaway.place_order).to eq("message")
  end
end
