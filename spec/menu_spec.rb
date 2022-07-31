require 'menu'
describe Menu do
    it 'menu items and their prices are set' do
      subject.create_menu
      expect(subject.dishes).to eq([['Cheese', 1.50], ['Pizza', 4.00], ['Prawns', 3.50], ['Potatoes', 3.00], ['Tomatoes', 2.50]])
    end

    it 'can add menu item' do
      subject.create_menu
      subject.add_dish('Lettuce', 1.00)
      expect(subject.dishes.pop).to eq(['Lettuce', 1.00])
    end
end
