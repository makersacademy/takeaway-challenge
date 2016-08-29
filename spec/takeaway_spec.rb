require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu)}
  let(:menu) { double :menu, show_dishes: {'Banana Chowder' =>  5.45} }
  let(:conf) { double :confirmation, send_message: "Order placed"}

  before(:each) do
    allow(menu).to receive(:contains?) {true}
  end

  describe '#show_menu' do
    it 'prints out the list of dishes from the menu' do
      expect(takeaway.show_menu).to include('Banana Chowder' =>  5.45)
    end
  end

  describe '#add' do
    it 'prints success message if item added' do
      message = 'Hedgeree has been added to your basket'
      expect(STDOUT).to receive(:puts).with message
      takeaway.add('Hedgeree')
    end

    it 'raises error if item not on menu' do
      allow(menu).to receive(:contains?) {false}
      message = 'Sorry, that\'s not on the menu'
      expect{takeaway.add('cake')}.to raise_error message
    end
  end

  describe '#summary' do
    it 'summarises basket_summary contents' do

    end
  end

  describe '#checkout' do

    it 'raises error if price does not match total' do
      takeaway.add('Hedgeree')
      message = 'Please enter the correct payment amount'
      expect{takeaway.checkout(5, conf)}.to raise_error message
    end

    it 'does not raise error if price matches total' do
      takeaway.add('Hedgeree', 2)
      expect{takeaway.checkout(15.3, conf)}.to_not raise_error
    end

    it 'raises error if no order' do
      message = 'Nothing in basket'
      expect{takeaway.checkout(1, conf)}.to raise_error message
    end
  end

end
