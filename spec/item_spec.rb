require 'item'

describe Item do
  subject(:item_class) { described_class }

  describe '#new' do

    it 'takes two parameters' do
      expect(subject).to respond_to(:new).with(2).arguments
    end

    it 'first parameter is saved to attribute price' do
      item = subject.new(:price,:name,:tag)
      expect(item.price).to eq(:price)
    end

    it 'second parameter is saved to attribute name' do
      item = subject.new(:price,:name,:tag)
      expect(item.name).to eq(:name)
    end

    it 'third parameter is saved to attribute tag' do
      item = subject.new(:price,:name,:tag)
      expect(item.tag).to eq(:tag)
    end

  end

end
