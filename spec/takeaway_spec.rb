require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:item) { 'kimchi' }
  let(:quantity) { 2 }


  describe '#initialize' do
    it 'has a list of dishes with prices' do
      expect(takeaway.dishes).to eq described_class::DISHES
    end
  end

  describe '#open_menu' do
    it 'opens a list of dishes with prices' do
      expect(takeaway.open_menu).not_to be_empty
    end
  end
end