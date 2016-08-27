require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(Menu.new)}
  # let(:menu_class) { double :menu_class, new: menu }
  # let(:menu) { double :menu }
  let(:basket_class) { double :basket_class, new: basket }
  let(:basket) { double :basket, add_dish: nil}

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

  describe '#add' do
    it 'prints an error message if dish not on menu' do
      message = 'Sorry, that\'s not on the menu'
      expect{takeaway.add("cake")}.to raise_error message
    end

  end

end
