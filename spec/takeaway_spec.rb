require 'takeaway'

describe Takeaway do

    it 'has a list of dishes' do
      expect(subject.menu).to eq([])
    end

    it 'makes sure each meal in menu has a price' do
      expect(subject.meal_price(1)).to eq 1
    end

end
