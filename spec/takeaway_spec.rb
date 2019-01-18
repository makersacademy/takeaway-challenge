require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, print_menu: true, list: ["pizza", "chips"]) }
  let(:menu_class) { double(:menu_class, new: menu) }
  let(:basket) { double(:basket, add: true)}
  let(:basket_class) { double(:basket_class, new: basket) }
  let(:takeaway) { Takeaway.new(menu_class, basket_class) }

  describe '#initialize' do

    it 'should initialize with a menu' do
      expect(takeaway.menu).to eq menu
    end

    it 'should initialize with a basket' do
      expect(takeaway.basket).to eq basket
    end
  end

  describe '#see_menu' do

    it 'should tell menu to call print_menu' do
      expect(menu).to receive(:print_menu)
      takeaway.print_menu
    end
  end

  describe '#basket' do

    it 'add dishes to the basket' do
      expect(basket).to receive(:add)
      takeaway.add_to_basket(1)
    end

  end

end
