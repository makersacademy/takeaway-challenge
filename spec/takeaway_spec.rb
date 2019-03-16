require 'takeaway'

describe TakeAway do

  let(:menu_class) { double(:menu_class) }
  let(:menu) { double(:menu) }
  let(:basket) { double(:basket) }
  let(:dish) { double(:dish) }
  let(:subject) { described_class.new(menu_class, menu, basket) }

  describe '#read_menu' do

    it 'reads the menu object' do
      expect(menu).to receive(:read)
      subject.read_menu
    end

  end

  describe '#add_to_basket' do

    it 'adds an item to the basket' do
      expect(basket).to receive(:add).with(dish)
      subject.add_to_basket(dish)
    end

  end

  describe '#view_basket' do

    it 'displays the basket' do
      expect(basket).to receive(:view)
      subject.view_basket
    end

  end

end
