require "dish"

describe Dish do

  subject { described_class.new(name: "Fries", price: "2.0") }

  describe "initialization" do
    it 'must be created with a name' do
      expect(subject.name).to eq "Fries"
    end
    it 'must be created with a price' do
      expect(subject.price).to eq "2.0"
    end
  end
end
