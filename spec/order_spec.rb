require 'order'

describe Order do 
  it 'checks that a class exists' do
    expect(subject).to be_a Order
  end

  it 'checks that it responds to a method' do
    expect(subject).to respond_to :basket
  end

  describe '#initialize' do
    it 'has no orders to begin with' do
      expect(subject.basket).to eq({})
    end
  end

  describe '#add_item' do
    it 'checks that it responds to a method' do
      expect(subject).to respond_to :add_item
    end

    it 'checks that is responds to two arguments' do
      expect(subject).to respond_to(:add_item).with(2).arguments
    end

    it 'adds an item to the basket' do
      expect { subject.add_item("margarita") }.to change { subject.basket.count }.by(1)
    end
  end
end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
