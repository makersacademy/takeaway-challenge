require 'basket'

describe Basket do

  context 'describe review_order' do
    before do
      subject.basket["Satay Chicken"] = 6
    end
    it 'returns the item in the basket and the total cost' do
      expect(subject.review_order).to eq "Satay Chicken, £6\nTotal: £6"
    end
  end

end
