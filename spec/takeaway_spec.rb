require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(restaurant_menu) }
  let(:restaurant_menu) { double :menu, dishes: nil, print_menu: nil }

  describe '#new' do
    it 'Should initialize with an argument menu' do
      expect(takeaway.menu).to eq restaurant_menu
    end
  end

  describe '#print_menu' do
    it 'Should respond to print_menu' do
      expect(takeaway.print_menu).to eq nil
    end
  end
end
