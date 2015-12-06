require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double(:menu, contents: dishes) }
  let(:dishes) { {'Dish 1' => 5.00,'Dish 2' => 6.00,'Dish 3' => 7.00} }
  describe '#read_menu' do
    it 'lists the items on the menu' do
      expect(takeaway.read_menu).to include dishes
    end
  end
end
