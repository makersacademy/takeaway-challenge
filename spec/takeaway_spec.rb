require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu_display) { 'burger: $5.0, hot dog: $3.75, fries: $2.5, soda: $1.5' }
  let(:menu) { double(:menu, print_menu: menu_display) }

  describe '#show_menu' do
    it "shows menu when prompted" do
      expect(takeaway.show_menu).to eq menu_display
    end
  end
end
