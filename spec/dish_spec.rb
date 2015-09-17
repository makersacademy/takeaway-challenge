require 'dish'

describe Dish do

  let(:subject)  {Dish.new('Chicken Chow Mein', 5.95)}

  describe '#show_details' do

    it { expect(subject).to respond_to :show_details }

    it 'should show name and price' do
      expect(subject.show_details).to eql 'Chicken Chow Mein: £5.95'
    end
  end
end
