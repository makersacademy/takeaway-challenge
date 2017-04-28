require_relative '../lib/dish.rb'
# require 'dish'
require 'rspec'

describe Dish do
    subject(:dish) { described_class.new('name',10) }

    describe "#initialize" do
      it "creates new Dish instance with name and price" do
        expect(subject.name).to eq('name')
        it expect(:dish.price).to eq(10)
      end
    end

end


