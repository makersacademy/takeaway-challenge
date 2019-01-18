require 'item'

describe Item do

  let(:subject) { Item.new("Fish") }

  describe '#intialize' do
    it 'should return the item name' do
      expect(subject.name).to eq 'Fish'
    end
  end

#move to calculator object = run from menu
  # describe '#calculate_price' do
  #   it 'should return price of item from hash' do
  #     expect(subject.calculate_price).to eq 8
  #   end
  # end

#formatter in own object = menu to call formatter on all items in array?

end
