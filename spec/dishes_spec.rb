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

    it 'responds to #list_available_dishes' do
      expect(subject).to respond_to(:list_available_dishes)
    end
  end

  describe '#available?' do
    it { expect(subject).to respond_to(:available?) }
    it { expect(subject.available?("yes")).to be true}
    it { expect(subject.available?("no")).to be false }
  end

  describe '#list_available_dishes' do
    it 'stores a list of available dishes' do
      expect(subject.list_available_dishes).to include(:name => price) if subject.available?("yes")
    end
  end
end