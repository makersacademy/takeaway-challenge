require 'restaurant'

describe Restaurant do
  let(:restaurant) { described_class.new }

  it 'has a menu upon initialization' do
    expect(restaurant.menu).to be_an_instance_of Menu
  end

end
