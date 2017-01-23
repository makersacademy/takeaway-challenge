require './lib/dish'

describe Dish do

  describe '#initialize' do

    let(:dish) { described_class.new(:choripan, 5.95) }

    it "creates a new dish with a name" do
      expect(dish.name).to eq :choripan
    end

    it "creates a new dish with a price" do
      expect(dish.price).to eq 5.95
    end

  end

end
