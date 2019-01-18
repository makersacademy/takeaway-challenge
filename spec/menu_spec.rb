require 'menu'

describe Menu do

  let(:pizza) { double(:dish, price: 10, name: "Pizza") }
  let(:chips) { double(:dish, price: 2, name: "Chips") }
  let(:print) { double(:print, print_menu: true) }
  let(:print_class) { double(:print_class, new: print) }

  describe '#list' do
    it { is_expected.to respond_to(:list) }

    it 'should initialize with an empty list of dishes' do
      expect(subject.list).to be_empty
    end
  end

  describe '#add_dish' do
    it { is_expected.to respond_to(:add_dish) }

    it 'should display the list of dishes in the menu' do
      subject.add_dish(pizza)
      expect(subject.list).to include(pizza)
    end
  end

  describe '#print_menu' do
    let(:menu) { Menu.new(print_class) }

    it 'print class responds to print_menu' do
      expect(print).to receive(:print_menu)
      menu.print_menu
    end

  end
end
