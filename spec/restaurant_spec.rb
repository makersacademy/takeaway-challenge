require 'restaurant'

describe Restaurant do
  
  subject(:restaurant) { described_class.new }
  
  it { is_expected.to respond_to(:own_menu)}
  
  it 'stores a specific menu' do
    expect(restaurant.menu).to be_an Hash
  end
  
  describe '#own_menu' do
  
  it 'returns its specific menu' do
    
    expect(restaurant.own_menu).to eq "Please order from the menu above:"
   end
 end
  
end
