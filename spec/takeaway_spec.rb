require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }
  #let(:menu) { double :menu_class }
  # let(:menu_object) { double :menu_object }
  # let(:menu) { double(:menu, print_menu: "printed", items: { "thing1" => 4.50} ) }
  # let(:dish) { double( { "food" => 1.99 } ) }
  # let(:pretty_dishes) { "Doughnut £2.00, Cake £2.00, Pancakes £3.00, Ice-cream £2.00"}

  describe 'view menu' do
    it 'can display the menu' do
      expect(takeaway.view_menu).to include("Doughnut £2.00")
    end
  end

end
