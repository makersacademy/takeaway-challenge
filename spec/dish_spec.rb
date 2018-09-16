require 'dish'

describe Dish do
  subject { described_class.new("Tomato Soup", 7) }

  describe 'instantiation' do
    it 'sets @name to first argument' do
      expect(subject.name).to eq("Tomato Soup")
    end

    it 'sets @price to second argument' do
      expect(subject.price).to eq(7)
    end
  end
end
