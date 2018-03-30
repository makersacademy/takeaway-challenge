require 'dishes'

describe Dishes do

  subject { Dishes.new }
  
  before(:each) do
    @dish1 = instance_double("Dish")
    @dish2 = instance_double("Dish")
    allow(@dish1).to receive(:describe) { "Dish#1: Meatballs (£8.90)" }
    allow(@dish2).to receive(:describe) { "Dish#2: Rye bread (£4.60)" }
    subject.instance_variable_set(:@dishes, [@dish1, @dish2])
  end

  describe '#describe' do
    it 'returns correctly formatted string' do
      expect(subject.describe).to eq "Menu:\n#{@dish1.describe}\n#{@dish2.describe}"
    end
  end

  describe '#read_from_csv' do
    it 'creates and stores a number of dishes from csv descriptions' do
      expect(Dishes.new('./data/dishes.csv').instance_variable_get(:@dishes).size).to eq %x(wc -l ./data/dishes.csv).to_i
    end
  end
end 
