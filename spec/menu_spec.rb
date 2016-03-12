require 'menu'

describe Menu do
  subject(:menu) { described_class.new}
  
  describe '#dishes' do
    
    it 'returns a hash of dishes' do
     expect(menu.see_dishes.class).to eq Hash
    end

  end

  #if add to order is empty expect new order to be created
  #if add to order is not empty
  #
end 
