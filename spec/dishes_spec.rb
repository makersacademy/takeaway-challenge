require 'dishes'
require 'pry'

describe Dishes do
  before { @dish = Dishes.new('pasta', true, 5) }
  subject { @dish }

  it 'takes three parameters when creating a new instance' do
    expect(Dishes.new('name', true, 5)).to be_truthy
  end

  it 'returns dish name' do
    expect(subject).to respond_to(:dish_name)
    expect(subject.dish_name).to eq('pasta') 
  end

  describe '#available' do
    it 'returns true if dish is available' do
      expect(subject.available).to be_truthy
    end 

    it 'return false if a dish is not available' do
      not_available_dish = Dishes.new('name', false, 4) 

      expect(not_available_dish.available).to be_falsey
    end 
  end
  
  it 'shows prices of dishes' do
    expect(subject).to respond_to(:price) 
    expect(subject.price).to eq(5) 
  end

  describe '.list' do 
    it 'returns an array' do 
      expect(Dishes.list).to be_an_instance_of(Array)
    end

    it 'returns six results' do 
      expect(Dishes.list.count).to eq(6)
    end
    
    it 'each item is an instance of Dishes' do 
      Dishes.list.each do |x|
        expect(x).to be_an_instance_of(Dishes)    
      end
    end 

    
  end 
end
