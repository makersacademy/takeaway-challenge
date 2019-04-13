require 'takeaway'

RSpec.describe Takeaway do

  let(:menu) { Menu.new }
  let(:main) { 'Lamb Nihari' }
  let(:side) { 'Garlic naan' }
  let(:drink) { 'Water' }
  let("option1") { Menu::MAINS.select { |key| key[main] } }
  let("option2") { Menu::SIDES.select { |key| key[side] } }
  let("option3") { Menu::DRINKS.select { |key| key[drink] } }

  describe '#order' do
    it 'matches order to menu option' do
      expect(option1).to include(subject.order(main))
      expect(option2).to include(subject.order(side))
      expect(option3).to include(subject.order(drink))
    end
  end

  describe '#menu' do
    it 'prints out the menu of the takeaway' do
      expect(subject.menu).to eq menu.show
    end
  end

end
