require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  it { is_expected.to respond_to(:show_menu) }

  it 'has an empty basket upon instantiation' do
    expect(restaurant.basket).to eq({})
  end
end
