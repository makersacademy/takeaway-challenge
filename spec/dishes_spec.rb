require 'dishes'

describe Dishes do
  describe '#initialize' do
    it "sees a list of dishes" do
      expect(subject.list_of_dishes).to eq subject.list_of_dishes
    end
  end

  describe '#select_dishes' do
    it 'responds to select_dishes' do
      expect(subject).to respond_to :select_dishes
    end
  end
end
