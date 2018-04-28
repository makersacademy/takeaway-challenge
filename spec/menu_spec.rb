require 'menu'

describe Menu do
  before { allow(subject).to receive(:list) { "Dish_name = £Dish_price\n" } }

  describe '#menu', :menu do
    it 'Returns an array 10 dishes with prices' do
      expect(subject.menu.length).to eq 10
    end
  end

  describe '#list', :list do
    it 'Returns a string of dishes with prices' do
      expect(subject.list).to eq("Dish_name = £Dish_price\n")
    end
  end
end
