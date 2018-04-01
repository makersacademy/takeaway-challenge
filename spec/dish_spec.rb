require 'dish'

describe Dish do

  describe 'creation' do
    subject { described_class.new("Pasta", 12.99) }

    it 'creates a dish with a name' do
      expect(subject.name).to eq 'Pasta'
    end

    it 'creates a dish with a price' do
      expect(subject.price).to eq 12.99
    end
  end

end
