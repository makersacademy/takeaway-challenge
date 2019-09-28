require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#see' do
    it 'displays a list of dishes with prices' do
      expect(menu.see).to eq "Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5
    end
  end

  describe '#choose' do
    it 'selects some number of several available dishes' do
      menu.choose("Chicken", 2)
      menu.choose("Fish", 3)
      expect(menu.order).to eq [{dish_selection: "Chicken", quantity: 2}, {dish_selection: "Fish", quantity: 3}]
    end
  end

  describe '#total' do
    it 'calculates the total price for the order' do
      menu.choose("Chicken", 2)
      menu.choose("Fish", 3)
      expect(menu.total).to eq 31
    end
  end

end
