require 'takeaway'

describe Takeaway do

  let(:order)   { double(:order) }
  let(:num)     { '112233' }
  let(:name)    { 'oooh' }
  let(:subject) { Takeaway.new('112233', 'oooh', order) }
  let(:order_1) { ['dohnuts', 4] }

  describe '#initialize' do
    it 'has a name, with a default' do
      expect(subject.name).to eq num
    end

    it 'has a phone number, with a defailt' do
      expect(subject.number).to eq name
    end
  end


  describe 'ordering' do
    it 'places a new order' do
      allow(order).to receive(:add_order).and_return( order_1 )
      expect(subject.new_order('dohnuts', 4)).to eq order_1
    end
  end



end
