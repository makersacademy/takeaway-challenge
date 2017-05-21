
require_relative '../lib/restaurant'

describe Restaurant do
  subject(:restaurant) { Restaurant.new('The Dream Café') }
  let(:menu) { double(:menu, add_dishes: nil) }

  it 'has a name, which can be defined on instantiation' do
    expect(restaurant.name).to eq 'The Dream Café'
  end

end