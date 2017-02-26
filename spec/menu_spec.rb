require 'menu'

describe Menu do

  subject(:menu) { described_class.new([]) }

  # describe 'dishes' do
  #   it 'initializes with an empty array of dishes' do
  #     expect(menu.dishes).to be_empty
  #   end
  # end

  describe '#add_dish' do
    it 'accepts 2 arguments' do
      expect(menu).to respond_to(:add_dish).with(2).arguments
    end

    it 'adds dish to dishes' do
      expect{ menu.add_dish("Chickenburger", 5) }.to change { menu.dishes.count }.from(0).to(1)
    end
  end
end
