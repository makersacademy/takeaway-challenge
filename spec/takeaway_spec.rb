require 'takeaway'

describe Takeaway do

  it 'should have a list of dishes available' do
    expect(subject).to respond_to(:menu)
  end

  describe '#calculate_delivery_time' do

    it 'should add an hour to the current time' do
      expect(subject).to respond_to(:calculate_delivery_time)
    end
  end

  describe '#menu' do

    it 'should show a hash of items with prices as values' do
      expect(subject).to respond_to(:menu)
    end 

  end



end
