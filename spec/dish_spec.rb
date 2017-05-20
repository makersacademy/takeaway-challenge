require 'dish'

describe Dish do
  subject(:dish) { described_class.new("Test", 5) }

  it 'should be initialized with a name' do
    expect(dish.name).not_to be_nil
  end

  it 'should be initialized with a price' do
    expect(dish.price).not_to be_nil
  end

  describe '#printed' do

    it 'should return a string with the relevant info' do
      expect(dish.printed).to eq "Test, Price: $5"
    end

  end
end
