require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(Menu.new)}

  describe '#read_menu' do
    it 'prints out the list of dishes from the menu' do
      expect(takeaway.show_menu).to include(
        'Banana Chowder' =>  5.45,
        'Hedgeree' => 7.65,
        'Thai Green Jelly' => 4.95,
        'Mackerel Muffins' => 3.75,
        'Smoked Goat Tart' => 6.75,
        'Prawn Sundae' => 6.75
      )
    end
  end

  describe '#add' do
    it 'prints an error message if dish not on menu' do
      message = 'Sorry, that\'s not on the menu'
      expect{takeaway.add('cake')}.to raise_error message
    end

    it 'prints success message if item added' do
      expect(STDOUT).to receive(:puts).with('Hedgeree has been added to your basket')
      takeaway.add('Hedgeree')
    end
  end

end
