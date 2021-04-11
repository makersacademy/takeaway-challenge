require 'takeaway'

describe Takeaway do
  let(:name) { double("name") }
  let(:price) { double("price") }
  let(:dish) { Dishes.new(name, price) }
  
  describe 'an instance of Takeaway' do
    it { expect(subject).to be_an_instance_of(Takeaway) }

    it 'responds to #available_dishes' do
      expect(subject).to respond_to(:available_dishes)
    end

    it 'responds to #menu' do
      expect(subject).to respond_to(:menu)
    end
  end
  
  describe '#available_dishes' do
    it 'is empty by default' do 
      p expect(subject.available_dishes).to eq({})
    end
  end

  describe '#menu' do
    it 'stores a list of available dishes and their prices' do
      p expect(subject.menu).to include(name => price) if dish.available?("yes")
    end

  end
end