require 'dish'

describe Dish do
subject {Dish.new(:chips, 2.50, 3)} 
  it 'has a name' do
    expect(subject).to respond_to(:name)
  end
  it 'has a price' do
    expect(subject).to respond_to(:price)
  end
  it 'has a quantity' do
    expect(subject).to respond_to(:quantity)
  end

  describe '#initialize' do
    it 'will initialize with name, price and quantity' do
      expect(subject.name).to eq :chips
      expect(subject.price).to eq 2.50
      expect(subject.quantity).to eq 3
    end
  end


end
