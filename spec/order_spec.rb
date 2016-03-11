require 'order'

describe Order do

  subject(:order) { described_class.new }
  # So that I can check if I want to order something
#  I would like to see a list of dishes with prices

  it { is_expected.to respond_to(:see_dishes) }
  describe '#see_dishes' do
    it 'will let me see a list of dishes with prices' do
      expect(order.see_dishes.class).to eq Hash
    end
    
  end
    

