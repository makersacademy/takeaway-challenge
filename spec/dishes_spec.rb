require 'dishes'
describe Dishes do
  let (:name) { double("name") }
  let (:price) { double("price") }
  let(:subject) { Dishes.new(name, price) }

  describe 'an instance of dishes' do
    it 'requires a name' do
      expect(subject).to respond_to(:name)
    end

    it 'requires a price' do
      expect(subject).to respond_to(:price)
    end
    
    it 'is available by default' do
      expect(subject.available).to be true
    end
  end

  describe '#available?' do
    it { expect(subject).to respond_to(:available?) }
    it { expect(subject.available?("yes")).to be true}
    it { expect(subject.available?("no")).to be false }
  end

  # describe '#price' do
  #   it 'has a price' do
  #     expect(subject.price).to eq(price)
  #   end
  # end
end