require 'menu'

describe Menu do
  let(:price) { 3.00 }
  let(:name) { 'Fries' }
  let(:dish) { instance_double(Dish, name: name) }

  context 'with no dishes' do
    it { is_expected.to respond_to(:list_of_dishes) }

    it 'starts off with no dishes in list of dishes' do
      expect(subject.list_of_dishes).to eq []
    end
  end

  context '#add_dish' do
    it { is_expected.to respond_to(:add_dish).with(2).argument }

    it 'can add a dish that can be read in list of dishes' do
      subject.add_dish(dish, price)
      expect(subject.list_of_dishes).to eq [{ name: dish, price: price }]
    end

    it 'can have more than one dish in the list of dishes' do
      dishes = []
      10.times { subject.add_dish(dish, price); dishes << { name: dish, price: price } }

      expect(subject.list_of_dishes).to eq dishes
    end

    context 'with one dish added' do
      before do
        subject.add_dish(dish, price)
      end

      context '#print_menu' do
        it { is_expected.to respond_to(:print) }
    
        it 'prints the menu in a nice format' do
          expect { subject.print }.to output("MENU\n#{name}, £#{'%.2f' % price}\n").to_stdout
        end
      end

      context '#find_price' do
        it { is_expected.to respond_to(:find_price).with(1).argument }

        it 'can return the price given the name' do
          expect(subject.find_price(name)).to eq price
        end
      end

      context '#available?' do
        it { is_expected.to respond_to(:available?).with(1).argument }

        it 'returns false if dish is unavailable' do
          expect(subject.available?('Hotdog')).to be false
        end

        it 'returns true if dish is available' do
          expect(subject.available?(name)).to be true
        end
      end
    end
  end

end
