require 'takeaway.rb'

describe Takeaway do
  context 'can see a menu' do
    it 'returns dishes and prices' do
      menu = Menu.new
      takeaway = Takeaway.new(menu)
      expect(takeaway.menu).to eq menu.dishes
    end
  end

  context "can order a meal" do
    it 'takes an order' do
      menu = Menu.new
      takeaway = Takeaway.new(menu)
      takeaway.order("margherita", 2)
      expect(takeaway.basket).to eq ({"margherita x2" => 9.00})
    end
  end

end