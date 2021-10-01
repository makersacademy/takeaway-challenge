require 'order'

describe Order do

  let(:menu) { Menu.new }

  describe '#initialise' do
    it 'should create an empty hash to store ordered dishes in' do
      expect(subject.dishes_ordered.is_a? Hash).to eq true
    end
  end

  describe '#add_dish_to_order' do
    it 'should add a dish to the ordered dishes hash' do
      menu.add_item('Steak', 18.50)
      allow(subject.menu).to receive(:dish_available?).with('Steak').and_return(true)
      expect{ subject.add_dish_to_order('Steak', 1) }.to change { subject.dishes_ordered.length }.by(1)
    end

    it 'should raise an error if the item is not on the menu' do
      menu.add_item('Steak', 18.50)
      expect{subject.add_dish_to_order('Stake', 1)}.to raise_error 'Unable to place order, the dish is not available'
    end
  end

  describe '#calculate_total' do
    it 'should calculate the total given a number of orders' do
      menu.add_item('Steak', 18.50)
      allow(subject.menu).to receive(:dish_available?).with('Steak').and_return(true)
      subject.add_dish_to_order('Steak', 2)
      expect(subject.calculate_total(menu)).to eq(37)
    end
  end
end
