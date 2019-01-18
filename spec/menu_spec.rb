require 'menu'

describe Menu do

  let(:pizza) { double(:dish, price: 10, name: "Pizza") }
  let(:chips) { double(:dish, price: 2, name: "Chips") }

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

    it 'should print out a list of the items including prices' do
      subject.add_dish(pizza)
      subject.add_dish(chips)
      expect(subject.print_menu). to eq "1. Pizza £10\n2. Chips £2"
    end

  end
end
