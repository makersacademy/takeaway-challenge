require 'menu'

describe Menu do
  context 'On initialize' do
    it '@dishes is empty' do
      expect(subject.dishes.length).to eq 0
    end
  end
  context '#add_dish' do
    it 'can add a dish' do
      expect(subject.add_dish('dish_1', 4.5)).to eq 'dish_1 added'
    end
  end
end
