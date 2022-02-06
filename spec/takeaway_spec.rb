require './lib/takeaway'

describe Restaurant do
  describe '#list' do
    it 'lists dishes with prices' do
      restaurant = Restaurant.new
      expect(subject).to respond_to(:list)
    end
  end     
  describe '#select' do  
    it 'selects a dish from the menu' do
      restaurant = Restaurant.new
      subject.list
      expect(subject).to respond_to(:select)
    end
    let(:dishes) { "Green Tea" }
    let(:key) { "Green Tea " }
    let(:value) { 2 }
    it 'tracks the sum of the order' do
      expect { subject.select(dishes { key }) }.to change { subject.sum }.by value
    end 
  end
  
  describe '#total' do
    it 'gives the total amount for the order' do
      expect(subject).to respond_to(:total)
    end
  end

  describe '#ordered' do
    it 'creates an order' do
      expect(subject).to respond_to(:ordered) 
    end   
    let(:order) { { :key => :value } }
    it 'stores an order' do     
      expect(subject.ordered).to include { order }
    end
  end

  describe '#text' do 
    it 'sends a text message' do
      expect(subject.text).to include ""
    end
  end
  
end
