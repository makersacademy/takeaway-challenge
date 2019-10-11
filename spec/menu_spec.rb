require 'menu'
describe Menu do 
    it 'When initialized menu items and their prices are set' do       
      expect(subject.dishes).to include({ "Pizza" => 3, "Burger" => 4, "Fries" => 2, "Vodka" => 3.50, "Wine" => 34 })   
    end
end