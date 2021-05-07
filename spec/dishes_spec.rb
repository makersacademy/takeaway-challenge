require 'Menu'

describe Menu do
  
  subject(:menu) { described_class.new }  
    
    describe '#list_dishes' do
      it 'checks if dishes can respond to the method of list' do
        expect(menu).to respond_to :list_dishes
      end
      # ** As a customer
      # ** So that I can check if I want to order something
      # ** I would like to see a list of dishes with prices
      it 'checks if a list of dishes is returned rather then nil' do
        expect(menu.list_dishes).to include({ Pizza: 4, Curry: 5, Roast_Dinner: 9 }) 
      end
    end
end

