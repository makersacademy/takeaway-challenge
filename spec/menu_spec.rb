require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:name) { double :name }
  let(:price) { double :price }

  # it { is_expected.to respond_to(:dishes) }
  it { is_expected.to respond_to(:add_dish).with(2).arguments }
  it { is_expected.to respond_to(:display) }

  describe '#display' do
    it 'display dishes in menu' do
      expect(subject.display).to eq([])
    end
  end 
  
  describe '#add_dish' do
    it 'adds new dish to menu' do
      subject.add_dish(name, price)
      expect(subject.display).to eq([{ Name: name, Price: price }])
    end
  end

end
