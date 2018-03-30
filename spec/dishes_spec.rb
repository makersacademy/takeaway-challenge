require 'dishes'

describe Dishes do

  subject { Dishes.new }
  
  before(:each) do
    @dish1 = instance_double("Dish")
    @dish2 = instance_double("Dish")
    subject.instance_variable_set(:@dishes, [@dish1, @dish2])
    allow(@dish1).to receive(:describe) { "Dish#1: Apple tart (£5.80)" }
    allow(@dish2).to receive(:describe) { "Dish#2: Rye bread (£4.60)" }
    allow(@dish1).to receive(:id) { 1 }
    allow(@dish2).to receive(:id) { 2 }
  end

  describe '#describe' do
    it 'returns correctly formatted string' do
      expect(subject.describe).to eq "Menu:\n#{@dish1.describe}\n#{@dish2.describe}"
    end
  
    it 'raises an error if no dishes available' do
      expect { Dishes.new.describe }.to raise_error Dishes::ERRORS[:no_dishes]
    end
  end

  describe '#read_from_csv' do
    it 'creates and stores a number of dishes from csv descriptions' do
      expect(Dishes.new('./data/dishes.csv').instance_variable_get(:@dishes).size).to eq %x(wc -l ./data/dishes.csv).to_i
    end
  end

  describe '#get_dish' do
    it 'returns the dish with the given id if it exists' do
      expect(subject.get_dish(1)).to eq @dish1
    end
  
    it 'raises an error if dish not found' do
      expect { subject.get_dish 3 }.to raise_error Dishes::ERRORS[:no_dish]
    end
    
    it 'raises an error if dishes are empty' do
      expect { Dishes.new.get_dish 1 }.to raise_error Dishes::ERRORS[:no_dishes]
    end
  end
end 
