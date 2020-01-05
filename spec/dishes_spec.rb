require 'dishes'

describe Dishes do
  describe '#initialize' do
    it "sees a list of dishes" do
		  expect(subject.dishes).to eq subject.dishes
		end
  end
end
