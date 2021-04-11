require 'order'
require 'errors'
require 'sms'

describe Order do

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

  let(:subject) { described_class.new(dish_class, calc_class) }

  describe '#order' do
    context 'before adding dishes' do
      it 'displays an empty list' do
        expect(subject.order_list).to be_empty
      end
    end
    context 'selecting an available dish' do
      it 'adds dish to order list' do
        allow(menu).to receive(:check).with(dish.name).and_return(dish)
        subject.order(menu, dish.name)
        expect { subject.basket_summary }.to output(/Katsu curry/).to_stdout
      end
    end
    context 'selecting an unavailable dish' do
      it 'raises an error' do
        allow(menu).to receive(:check).with('ramen').and_return(nil)
        expect { subject.order(menu, 'ramen') }.to raise_error AvailabilityError
      end
    end
  end

  describe '#basket_summary' do
    context 'after adding dishes' do
      before do 
        allow(menu).to receive(:check).with(dish.name).and_return(dish)
        3.times {
          subject.order(menu, dish.name)
        }
      end
      it 'displays the total price' do
        expect { subject.basket_summary }.to output(/30/).to_stdout
      end
    end
  end
end
