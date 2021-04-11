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
  
  let(:calc_class) { class_double(
    Calculator, :calc_class, 
    new: calc) 
  }
  let(:calc) { double(:calc, total: 30) }

  let(:menu) { double(:menu, check: dish) }

  describe '#add_dish' do
    context 'before adding dishes' do
      it 'displays an empty list' do
        expect(subject.order_list).to be_empty
      end
    end
    context 'selecting an available dish' do
      it 'adds dish to order list' do
        allow(menu).to receive(:check).with(dish.name).and_return(dish)
        subject.add_dish(menu, dish.name)
        expect { subject.view_order }.to output(/Katsu curry/).to_stdout
      end
    end
    context 'selecting an unavailable dish' do
      it 'raises an error' do
        allow(menu).to receive(:check).with('ramen').and_return(nil)
        expect { subject.add_dish(menu, 'ramen') }.to raise_error AvailabilityError
      end
    end
  end

  describe '#view_order' do
    context 'after adding dishes' do
      before do 
        allow(menu).to receive(:check).with(dish.name).and_return(dish)
        3.times {
          subject.add_dish(menu, dish.name)
        }
      end
      it 'displays the total price' do
        expect { subject.view_order }.to output(/30/).to_stdout
      end
    end
  end
end
