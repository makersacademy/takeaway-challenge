require './lib/Menu'

describe Menu do
    
  describe 'foods' do

    it 'Entering food array class should display the menu' do 
      menu = Menu.new

      expect(menu.foods).to contain_exactly(:chicken => 7, :lamb => 10, :beef => 12)
    end 

  end

end