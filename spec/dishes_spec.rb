require 'dishes'
describe Dishes do
  let(:dishes) { Dishes.new }
  describe '#list' do
    it 'shows a list of dishes and prices' do
      expect(dishes).to respond_to(:list)
    end   
  end
end
