require 'takeaway'

describe Takeaway do
  let(:menu) {double :menu}
  let(:restaurant) {double :restaurant}
  subject(:takeaway) {described_class.new( :restaurant, :menu)}

  it { is_expected.to respond_to(:add).with(1).argument }
  it { is_expected.to respond_to(:remove).with(1).argument }
  it { is_expected.to respond_to(:menu) }
  it { is_expected.to respond_to(:summary) }
  it { is_expected.to respond_to(:total) }

  context 'Add item to basket' do
    it 'add first item' do
      allow(menu).to receive(:contains?).with('Neptune').and_return(true)
      expect{ takeaway.add('Neptune') }.to change { takeaway.basket.length }.by 1
    end

    it 'add second item' do
      allow(menu).to receive(:contains?).with('Four Seasons').and_return(true)
      expect { takeaway.add('Four Seasons') }.to change { takeaway.basket.length }.by 1
    end

    it 'fails to add unknown item to basket' do
    allow(menu).to receive(:contains?).with('Tandoori').and_return(true)
    expect{ takeaway.add('Tandoori') }.to raise_error("Tandoori not available")
    end
  end

  context 'Remove item from basket' do

    it 'removes item' do
      allow(menu).to receive(:contains?).with('Neptune').and_return(true)
      takeaway.add('Neptune')
      expect{ takeaway.remove('Neptune') }.to change { takeaway.basket.length }.by -1
    end

    it 'fails to remove item not already in basket' do
      expect{ takeaway.remove('Tandoori') }.to raise_error('Tandoori not in basket')
    end
  end
end

