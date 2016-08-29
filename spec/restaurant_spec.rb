require 'restaurant'

describe Restaurant do

  subject(:restaurant) {described_class.new}
  let(:menu) {double(:menu)}

  describe '#display_menu' do
  it 'prints menu' do
    menu = Menu.new
    expect(menu.display_menu).to include("Thai Green Curry")
  end
  end

  describe '#order_food' do

  it 'allows customer to order food on menu' do
    expect(restaurant.order_food("Rice")).to eq("Thank you for your order: 1 => Rice.")
  end

  it 'returns error if item not on menu' do
    expect{restaurant.order_food("sausages")}.to raise_error("That is not on the menu")
  end

  it 'adds item to order' do
    restaurant.order_food("Rice")
    expect(restaurant.order).to(have_key("Rice"))
  end


  it '#total_price' do
    restaurant.order_food("Rice", 7)
    expect(restaurant.confirm_total_price).to eq("Your order comes to 14")

  end


 end

  end
