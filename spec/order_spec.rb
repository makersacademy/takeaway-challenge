require 'order'

describe Order do

  let(:pizza) { double :pizza, name: 'Pizza', price: 7.85 }
  let(:pasta) { double :pasta, name: 'Pasta', price: 5.85 }
  let(:salad) { double :salad, name: 'Salad', price: 5.85 }

  before(:each) do
    allow(pizza).to receive(:price).and_return(7.85)
    allow(pasta).to receive(:pasta).and_return(5.85)
    allow(salad).to receive(:salad).and_return(5.85)
  end

  subject { described_class.new(dishes: { pizza => 4, pasta => 3, salad => 6 })}

  it 'should initialize with the dishes and quantities' do
    expect(subject.dishes).to eq ({ pizza => 4, pasta => 3, salad => 6 })
  end

  describe '#print_out' do
    it 'should print a formatted list of dishes with quantities' do
      print_out = "4 x Pizza\n3 x Pasta\n6 x Salad"
      expect(subject.print_out).to eq print_out
    end
  end

  describe '#bill' do
    it 'should return 84.05' do
      expect(subject.bill).to eq 84.05
    end
  end

  describe '#confirm?' do
    it 'should return false as default' do
      expect(subject).not_to be_confirmed
    end
  end

  describe '#confirm' do
    it 'should make confirmed' do
      subject.confirm
      expect(subject).to be_confirmed
    end
  end
  
end
