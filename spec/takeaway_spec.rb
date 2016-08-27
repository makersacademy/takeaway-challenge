require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(Menu.new)}
  let(:Menu) { double :Menu, new: menu }
  let(:menu) { double :menu }

  describe '#read_menu' do
    it 'prints out the list of dishes from the menu' do
      expect(takeaway.read_menu).to include(
        "Banana Chowder" =>  5.45,
        "Hedgeree" => 7.65,
        "Thai Green Jelly" => 4.95,
        "Mackerel Muffins" => 3.75,
        "Smoked Goat Tart" => 6.75,
        "Prawn Sundae" => 6.75
      )
    end
  end

end
