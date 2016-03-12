require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:menu_class) { double new: menu }
  let(:menu) { double :menu }

  # So that I can check if I want to order something
#  I would like to see a list of dishes with prices
 
  describe '#see_dishes' do
    
  it { is_expected.to respond_to(:see_dishes) }

    it 'will let me see a list of dishes with prices' do
      allow(takeaway.menu).to receive(:dishes) 
      expect(takeaway.menu).to receive(:dishes)
      takeaway.see_dishes
    end
    
  end
    
end
    

