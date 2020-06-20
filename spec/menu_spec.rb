require 'menu'

describe 'Menu' do

  let(:menu) { Menu.new }
  dishes = [
    { "1. Vegetable Ramen" => 5 },
    { "2. Crispy Tofu" => 3 },
    { "3. Egg-fried Rice" => 3 },
    { "4. Chilli Prawns" => 6 }
  ]

  describe 'initialize' do
    it 'initializes with a list of dishes' do
      expect(menu.dishes).to eq(dishes)
    end
  end

  describe '#display' do
    it 'will display all of the dishes correctly' do
      menu.display
    end

    #This test is not working properly - I need to try and get it to expect the right format of the display
  end
  

end