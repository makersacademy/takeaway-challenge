require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu)}
  let(:menu) { double :menu, show_dishes: {'Banana Chowder' =>  5.45} }

  before(:each) do
    allow(menu).to receive(:check_dish)
  end

  describe '#show_menu' do
    it 'prints out the list of dishes from the menu' do
      expect(takeaway.show_menu).to include('Banana Chowder' =>  5.45)
      end
  end

  describe '#add' do
    # it 'checks whether dish is on the menu' do
    #   takeaway.add('cake')
    #   expect(menu).to receive(:check_dish)
    # end

    it 'prints success message if item added' do
      expect(STDOUT).to receive(:puts).with('Hedgeree has been added to your basket')
      takeaway.add('Hedgeree')
    end
  end

end
