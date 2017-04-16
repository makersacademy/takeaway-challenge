require 'chinese'

describe Chinese do
  context 'Chinese restaurant menu' do
    it 'has a specific chinese menu' do
      hong_kong_house = Chinese.new
      expect(hong_kong_house.menu_list).to eq 'Crispy-Duck: £12, 
                                               Chicken-Satay: £4, 
                                               Egg-Fried-Rice £3, 
                                               Spring-Rolls £5, 
                                               Chicken-Chow-Mein £6'
    end
  end
end