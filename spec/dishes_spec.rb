require 'dishes'
describe Dishes do

  describe '#available?' do
    it { expect(subject).to respond_to(:available?) }
    it { expect(subject.available?).to be true}
  end

  describe '#available_dishes' do
    it 'is empty by default' do 
      expect(subject.available_dishes).to match_array([])
    end
  end
end