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

    it 'takes more than one order' do
      menu = Menu.new
      takeaway = Takeaway.new(menu)
      takeaway.order("margherita", 2)
      takeaway.order("garlic bread", 4)
      basket = ({"margherita x2" => 9.00, "garlic bread x4"=>12.00})
      expect(takeaway.basket).to eq basket
    end
  end

  context 'can check total cost' do
    it 'checks if total cost is equal to sum of basket' do
      menu = Menu.new
      takeaway = Takeaway.new(menu)
      takeaway.order("margherita", 2)
      takeaway.order("garlic bread", 4)
      expect(takeaway.total).to eq takeaway.basket_sum
    end
  end

end