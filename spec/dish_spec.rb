require 'dish'

chicken_chow_mein = Dish.new('Chicken Chow Mein', 5.95)

describe Dish do

  describe '#show_details' do

    it { expect(chicken_chow_mein).to respond_to :show_details }

    it 'should show name and price' do
      expect(chicken_chow_mein.show_details).to eql 'Chicken Chow Mein: £5.95'
    end
  end
end
