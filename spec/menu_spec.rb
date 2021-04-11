require 'menu'

describe Menu do 
  let(:dish_class) { class_double(Dish, :dish_class, new: dish) }

  let(:subject) { described_class.new(dish_class) }

  let(:dish) { instance_double(
    Dish, :dish,
    name: 'katsu_curry',
    price: 10,
    available: 'true')
  }

  context 'initializing menu' do
    it 'contains a list of all dishes' do
      expect(subject.menu_list).to_not be_empty
    end
  end

  describe '#display' do
    it 'displays a list of available dishes' do
      expect { subject.display_menu }.to output(/Katsu curry/).to_stdout
    end

    it 'hides unavailable dishes' do
      expect { subject.display_menu }.to_not output(/Ramen/).to_stdout
    end
  end

  describe '#check' do
    context 'after ordering a dish' do
      it 'returns the dish' do
        expect(subject.check('katsu_curry')).to eq(dish)
      end
    end
  end
end
