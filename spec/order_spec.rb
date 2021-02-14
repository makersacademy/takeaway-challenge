require 'order'

describe Order do
  let(:dish_double) { double(:dish, :name => "pizza", :price => 10) }
  let(:dish_class_double) { double(:dish_class, :new => dish_double) }
  let(:calc_double) { double(:calc, :total => 20) }
  let(:calc_class_double) { double(:calc_class, :new => calc_double) }

  let(:text_double) { double(:text, :send => :message_sent) }
  let(:text_class_double) { double(:text_class, :new => text_double) }
  let(:menu) { double(:menu, :check => dish_double) }
  subject { described_class.new(dish_class_double, calc_class_double, text_class_double) }

  describe '#view' do
    it 'starts with no dishes added' do
      expect(subject.view).to eq nil
    end
    it 'displays the total' do
      2.times { subject.add(menu, dish_double) }
      expect { subject.view }.to output(/20/).to_stdout
    end
  end

  describe '#add' do
    it 'user can add dishes to an order' do
      expect(subject).to respond_to(:add)
    end
    context 'when dish not on menu' do
      it 'user will see error' do
        menu_2 = double(:menu, :check => :not_on_menu)
        expect { subject.add(menu_2, "pizza") }.to output(/I'm sorry, that dish is not on our menu/).to_stdout
      end
    end
    context 'when dish unavailable' do
      it 'user will see error' do
        menu_3 = double(:menu_3, :check => :unavailable)
        expect { subject.add(menu_3, "pizza") }.to output(/I'm sorry, that dish is currently unavailable/).to_stdout
      end
    end

    describe '#place' do
      it 'user can place order' do
        expect { subject.place }.to output(/Your order has been successfully placed/).to_stdout
      end
    end
  end




end
