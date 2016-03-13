require 'menu'

describe Menu do
  subject(:menu) { described_class.new}
  subject(:dish) { double :dish }
  describe '#dishes' do
    
    it 'returns a hash of dishes' do
     expect(menu.see_dishes.class).to eq Hash
    end

  end

  describe '#dish_price' do

    it 'calls on return_dish_price' do
      expect(menu).to receive(:return_dish_price)
      menu.dish_price(dish)
    end
 
  end

  describe '#check_dish' do
    
    it 'will return true if item is in menu' do
      allow(menu).to receive(:dishes) { [dish] }
      expect(menu.check_dish(dish)) .to eq true
    end

  end


      
  #if add to order is empty expect new order to be created
  #if add to order is not empty
  #
end 
