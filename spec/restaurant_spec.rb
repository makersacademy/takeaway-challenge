require 'restaurant'

describe Restaurant do
  
  subject(:restaurant) { described_class.new }
  
  it { is_expected.to respond_to(:own_menu)}
  
  it 'returns its specific menu' do
    
    expect(restaurant.own_menu).to be_an Hash
  end
  
end
