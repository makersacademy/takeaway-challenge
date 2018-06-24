require 'dish'

describe Dish do

  let(:dish) { { :name => "dish_name", :price => 1 } }

  describe '#initialize' do

    subject { described_class.new({ :name => "dish_name", :price => 1 }) }

    it 'should create a dish' do
      expect(subject.dish).to eq(dish)
    end

    it 'should know its dish name' do
      expect(subject.name).to eq("dish_name")
    end

    it 'should know its dish price' do
      expect(subject.price).to eq(1)
    end

  end

end
