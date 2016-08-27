require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu)}
  let(:menu) { double :menu, print_menu: menu_options }
  let(:menu_options) { "chicken £3.50" }

  describe '#show_menu' do
    it "prints menu" do
      expect(takeaway.show_menu).to eq menu_options
    end
  end


end
