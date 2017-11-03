require 'menu'

describe Menu do

  # Menus
  let(:menu) { described_class.new(dish_class: dish_class) }

  # Other mocks
  let(:some_dish) { double(:some_dish) }
  let(:dish_class) { double(:dish_class, new: some_dish) }

  describe '#initialize' do
    subject { menu }
    it 'has a preloaded list of dishes' do
      expect(subject.dish_list).to eq([some_dish] * 5)
    end
  end
end
