require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish }


  describe '#add_dish' do
    it 'adds a dish' do
      expect(menu.add_dish(dish)).to eq dish
    end

    it 'contains dishes' do
      expect(menu.dishes).to eq []
    end
  end

end
