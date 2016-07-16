require 'takeaway'

describe Takeaway do
  let(:takeaway) { Takeaway.new }

# not sure whether the below test is required as we have the same
# thing in menu spec.
  describe '#read_menu' do
    it 'prints a list of dishes with prices' do
      expect(takeaway.read_menu).to be_a(Hash)
    end
  end
  describe 'add' do
    it 'passed a dish and quantity to the menu class' do
      takeaway.add("sashimi", 2)
      expect(takeaway.basket_summary).to have_key("2x sashimi")
    end
  end

end
