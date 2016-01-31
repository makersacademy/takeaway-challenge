require 'takeaway'
require 'order'
require 'output'

describe Takeaway do

  let(:menu) { double :menu, dishes: { "Spam" => 1 } }
  subject(:takeaway) { described_class.new(menu) }

  it 'is an instance of Takeaway class' do
    expect(takeaway).to be_a(Takeaway)
  end

  it 'can be asked to show a menu' do
    expect(takeaway).to respond_to(:show_menu)
  end

  it 'can show the dishes and prices from a menu' do
    expect(takeaway.show_menu).to include("Spam")
  end

  it 'allows the customer to order a dish from the menu' do
    expect(takeaway).to respond_to(:add).with(1).argument
  end

  it 'should raise an error if the ordered dish is not from the menu' do
    expect{ takeaway.add("Pizza") }.to raise_error 'Dish not available: not part of the menu'
  end

  it 'allows the customer to check the basket and total price' do
    expect(takeaway).to respond_to(:show_basket)
  end

  it 'allows the customer to submit a total to the checkout' do
    expect(takeaway).to respond_to(:checkout).with(1).argument
  end

  it 'raises an error if the incorrect payment is submitted' do
    takeaway.add("Spam", 5)
    expect { takeaway.checkout(6) }.to raise_error 'Payment error: incorrect payment submitted'
  end
end
