require 'takeaway'

describe Order do

  describe '#initialize' do
    it 'takes an empty basket array of key-value pairs' do
      expect(subject.basket.size).to eq 0
    end

  end
  describe '#add_items' do
    it 'adds food requests to basket array' do
      subject.add_items 1, 1
      expect(subject.basket.size).to_not eq 0
    end
  end
end

# # write mock to call pretend number via Twilio
