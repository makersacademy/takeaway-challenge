require 'dish'

describe Dish do

  let(:subject) { described_class.new("Pizza", 5.00) }

  describe '#new' do
    it 'Initializes with variables assigned as arguments' do
      expect(subject.name).to eq "Pizza"
      expect(subject.price).to eq 5.00
    end
  end
end
