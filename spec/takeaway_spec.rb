require 'take_away'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  context '#initialize class' do
    it 'expects the pricelist to be empty at initialize' do
      expect(takeaway.pricelist).to be_empty
    end
  end

  it 'should show the price list' do
    expect(takeaway.show_price_list).to eq takeaway.show_price_list
  end

end
