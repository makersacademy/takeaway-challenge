require 'order'

describe Order do
  let(:subject) { described_class.new(dish_class) }

  let(:dish_class) { class_double(Dish, :dish_class, new: dish) }

  let(:dish) { instance_double(
    Dish, :dish,
    name: 'katsu_curry',
    price: 10,
    available: true)
  }

  describe '#add_dish' do
  
    it 'adds dish to order list' do
      subject.add_dish(dish)
      expect(subject.view_order).to include(dish)
    end
  end
end
