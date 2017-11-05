require 'dish'

describe Dish do
  describe 'attributes' do
    it 'allows reading and writing for name' do
      subject.name = 'Pad Thai'
      expect(subject.name).to eq('Pad Thai')
    end

    it 'allows reading and writing for price' do
      subject.price = "10"
      expect(subject.price).to eq("10")
    end
  end
end
