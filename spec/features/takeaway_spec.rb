require 'takeaway.rb'

describe Takeaway do
  context 'can see a menu' do
    it 'returns dishes and prices' do
      menu = Menu.new
      takeaway = Takeaway.new(menu)
      expect(takeaway.menu).to eq menu.dishes
    end
  end
end