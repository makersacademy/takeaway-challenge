require 'rspec'
require 'delivery'

RSpec.describe Delivery do
  describe '#delivery_time' do
    it 'states order delivery time' do
      time = (Time.now + 1 * 60 * 60).strftime("%H:%M")
      expect(subject.delivery_time).to eq time
    end
  end
end
