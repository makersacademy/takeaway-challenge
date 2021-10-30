require 'menu'

describe Menu do
  let(:dish) { {name: 'Burger', price: 8} }
  describe '#initialize' do
    it 'has a list of dishes upon initialization' do
     expect(subject.dishes).to_not eq nil
    end
  end

  describe '#view menu' do
    it 'displays menu as a list of dishes and prices' do
      expect(subject.view_menu).to include(dish)
    end
  end
end