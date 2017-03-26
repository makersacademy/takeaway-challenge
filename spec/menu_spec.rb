require 'menu'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  it 'loads menu options when initiated' do
  end
  it 'has a list of restaurant' do
    expect(restaurant.list).not_to be_empty
  end
end
