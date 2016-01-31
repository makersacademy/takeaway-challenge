require 'takeaway'

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

  it 'allows the user to order a dish from the menu' do
    expect(takeaway).to respond_to(:order).with(1).argument
  end

  it 'should raise an error if ordered dish is not on the menu' do
    expect{ takeaway.order("Pizza") }.to raise_error 'Dish not available: not part of the menu'
  end

  it 'allows the customer to check the basket and total price' do
    expect(takeaway).to respond_to(:show_basket)
  end
end
