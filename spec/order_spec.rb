require 'order'
require 'errors'

describe Order do
  let(:subject) { described_class.new(dish_class) }
  let(:dish_class) { class_double(Dish, :dish_class, new: dish) }
  let(:dish) { instance_double(
    Dish, :dish,
    name: 'katsu_curry',
    price: 10,
    available: true)
  }

  let(:menu) { double(:menu, check: dish) }

  describe '#add_dish' do
    context 'selecting an available dish' do
      it 'adds dish to order list' do
        allow(menu).to receive(:check).with(dish.name).and_return('true')
        subject.add_dish(menu, dish.name)
        expect(subject.view_order).to include(dish.name)
      end
    end
    context 'selecting an unavailable dish' do
      it 'raises an error' do
        allow(menu).to receive(:check).with('ramen').and_return('false')
        expect{ subject.add_dish(menu, 'ramen') }.to raise_error AvailabilityError
      end
    end
  end
end
