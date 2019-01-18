require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, print_menu: true) }
  let(:menu_class) { double(:menu_class, new: menu) }
  let(:takeaway) { Takeaway.new(menu_class) }

  describe '#initialize' do

    it 'should initialize with a menu' do
      expect(takeaway.menu).to eq menu
    end
  end

  describe '#see_menu' do

    it 'should tell menu to call print_menu' do
      expect(menu).to receive(:print_menu)
      takeaway.print_menu
    end
  end

end
