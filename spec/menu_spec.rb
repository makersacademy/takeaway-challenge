require 'menu'
describe Menu do
  subject(:menu) {described_class.new(list_of_dishes)}
  
  let(:list_of_dishes) do {:chicken => 3, :meatballs => 5.5} end

  describe 'At initialization' do
    it 'Is formed by a list of dishes with prices' do
      expect(menu.list_of_dishes).to eq list_of_dishes
    end
  end

  describe '# list-menu' do
    it 'Provides a ordered list of dishes with prices' do
      expect(menu.list_menu).to eq "chicken: $3, meatballs: $5.5"
    end
  end

  describe '# has_dish' do
    it 'Checks if a dish is on the menu' do
      expect(menu).to be_has_dish
    end
  end
end
