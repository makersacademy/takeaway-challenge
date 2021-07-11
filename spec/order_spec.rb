require 'order'

describe Order do
  let(:dish) { double :dish, name: 'name' }
  let(:menu) { double :menu, dishes: [dish] }
  subject { described_class.new(menu) }
  
  describe '#initialization' do
    context 'when initialized with incorrect number of arguements' do
      it { expect { Order.new }.to raise_error(ArgumentError) }
    end

    context 'when initialized with correct number of arguements' do
      it { expect(Order.new(menu)).to be_a(Order) }
    end
  end

  describe '#select_dish' do
    it { is_expected.to respond_to(:select_dish).with(1).argument }

    it "should add dish to selection" do
      expect { subject.select_dish('name') }.to change { subject.selection }.from([]).to([dish]) 
    end 
  end
end
