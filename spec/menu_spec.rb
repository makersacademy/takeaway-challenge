require 'menu'

describe Menu do

  context 'Describe view:' do
    it 'prints the full list of the menu with prices' do
      menu = Menu.new
      expect(menu.view).to eq "Sweet and Sour Pork, £8\nSatay Chicken, £6\nBoiled Rice, £2"
    end
  end

end
