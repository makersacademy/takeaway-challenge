require 'takeaway'

describe Takeaway do
  let(:takeaway) { described_class.new }
  #let(:menu) { double :menu_class }
  # let(:menu_object) { double :menu_object }
  # let(:menu) { double(:menu, print_menu: "printed", items: { "thing1" => 4.50} ) }
  # let(:menu) { double( { "doughnut" => 1.99 } ) }

  describe 'view menu' do
    it 'can display the menu' do
      expect(takeaway.view_menu).to include("doughnut" => 1.99)
    end
  end

end
