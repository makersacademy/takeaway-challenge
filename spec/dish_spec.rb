require 'dish'

describe Dish do
  describe '#show_details' do

    it { is_expected.to respond_to :show_details }

    it 'should show name and price' do
      expect(subject.show_details).to be 'Chicken Chow Mein: £5.95'
    end
  end
end
