require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu) }
  let(:menu) { double(:menu, print_dishes: dishes) }
  let(:dishes) { "Margherita 10.99, Fish and Chips 11.00" }

  describe '#show_menu' do
    it 'shows a list of dishes with prices' do
      expect(takeaway.show_menu).to eq dishes
    end
  end


end
