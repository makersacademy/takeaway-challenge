describe Menu do
  let(:empty_menu) { described_class.new }
  let(:pasta) { instance_double Dish, name: 'Pasta', price: 5 }
  let(:bolognese) { instance_double Dish, name: 'Bolognese', price: 5 }
  let(:salad) { instance_double Dish, name: 'Salad', price: 2 }
  let(:full_menu) { described_class.new([pasta, bolognese, salad]) }

  describe '#initialize' do
    it 'default initializes with no dishes' do
      expect(empty_menu.dishes).to be_empty
    end

    it 'can be initialized with dishes' do
      expect(full_menu.dishes).to eq [pasta, bolognese, salad]
    end
  end

  describe '#list' do
    it 'should puts message if the menu is empty' do
      expect { empty_menu.list }.to raise_error 'The menu is empty'
    end

    it 'should puts menu if the menu is not empty' do
      menu_list = "Pasta, 5\nBolognese, 5\nSalad, 2\n"
      expect { full_menu.list }.to output(menu_list).to_stdout
    end
  end
end
