require 'restaurant'
require 'menu'

RSpec.describe Restaurant do

  subject(:restaurant) { described_class.new }
  let(:menu) { double(:menu, list_food: {"pizza"=>10, "lasagna"=>8, "rigatoni"=>15, "spaghetti"=>7, "salad"=>5, "burrata"=>6} ) }
  let(:menu_double) { double(:menu_double, correct?: false) }
  let(:restaurant_double) { double(:restaurant, check_order: false) }

  it { is_expected.to respond_to(:place_order) }

  it 'checks the menu' do
    expect(restaurant.check_menu).to eq(menu.list_food)
  end

  it 'places an order' do
    allow_any_instance_of(Restaurant).to receive(:place_order).and_return(["5 pizza"])
    expect(restaurant.place_order).to eq(["5 pizza"])
  end

  context '#when the order is correct' do
    it 'not raise error' do
      allow(menu).to receive(:sum).and_return(3)
      allow(menu).to receive(:total).and_return(3)
      expect{ restaurant_double.check_order }.to_not raise_error
    end
  end

  context '#when the order is not correct' do
    it 'raises an error' do
      allow(menu_double).to receive(:correct?).and_return(false)
      expect{ restaurant_double.check_order }.to raise_error("Your order is not correct")
    end
  end

end
