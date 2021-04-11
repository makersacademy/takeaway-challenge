require 'order'
require 'errors'
require 'sms'

describe Order do

  let(:dish_class) do class_double(
    Dish, :dish_class,
    new: dish
  ) 
  end

  let(:dish) do instance_double(
    Dish, :dish,
    name: 'katsu_curry',
    price: 10,
    available: true
  )
  end
  
  let(:calc_class) do class_double(
    Calculator, :calc_class, 
    new: calc
    ) 
  end
  let(:calc) { double(:calc, total: 30) }

  let(:menu) { double(:menu, check: dish) }

  let(:sms_class) do class_double(
    Messenger, :sms_class, 
    new: sms
    ) 
  end

  let(:sms) do instance_double(
    Messenger, :sms,
    send_text: 'text sent'
  )
  end

  subject do described_class.new(
    menu: menu,
    dish: dish,
    calc: calc,
    sms: sms
  )
  end

  describe '#see_menu' do
    it 'displays the menu' do
      expect(menu).to receive(:display_menu)
      subject.see_menu
    end
  end

  describe '#order' do
    context 'before adding dishes' do
      it 'displays an empty list' do
        expect(subject.order_list).to be_empty
      end
    end
    context 'selecting an available dish' do
      it 'adds dish to order list' do
        subject.order(dish.name)
        expect { subject.view_basket }.to output(/Katsu curry/).to_stdout
      end
    end
    context 'selecting an unavailable dish' do
      it 'raises an error' do
        allow(menu).to receive(:check).with('ramen').and_return(nil)
        expect { subject.order('ramen') }.to raise_error AvailabilityError
      end
    end
  end

  describe '#view_basket' do
    context 'after adding dishes' do
      before do 
        allow(menu).to receive(:check).with(dish.name).and_return(dish)
        3.times {
          subject.order(dish.name)
        }
      end
      it 'displays the total price' do
        expect { subject.view_basket }.to output(/30/).to_stdout
      end
    end
  end

end
