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

  describe '#checkout' do
    it 'raises error if price does not match total' do
      takeaway.add(2, 'Hedgeree')
      message = 'Please enter the correct payment amount'
      expect{takeaway.checkout(5)}.to raise_error message
    end

    it 'does not raise error if price matches total' do
      takeaway.add(2, 'Hedgeree')
      expect{takeaway.checkout(15.3)}.to_not raise_error
    end

    it 'raises error if no order' do
      message = 'Nothing in basket'
      expect{takeaway.checkout(1)}.to raise_error message
    end

  end

end
