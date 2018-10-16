require 'menu'

describe Menu do

  let(:pizza) { double :pizza, name: 'Pizza', price: 7.85 }
  let(:pasta) { double :pasta, name: 'Pasta', price: 5.85 }
  let(:salad) { double :salad, name: 'Salad', price: 5.85 }
  subject { described_class.new(dishes: [pizza, pasta, salad]) }

  it 'should initialize with dishes and return list of dishes' do
    expect(subject.dishes).to eq [pizza, pasta, salad]
  end

  describe '#print_out' do
    it 'should print out dishes with their index and price' do
      print_out = "1: Pizza - £7.85\n2: Pasta - £5.85\n3: Salad - £5.85"
      expect(subject.print_out).to eq print_out
    end
  end

  describe '#select_with_id' do
    it 'should return selected dish' do
      expect(subject.select_with_id(0)).to be pizza
    end
    it 'should return raise error' do
      expect { subject.select_with_id(4) }.to raise_error("That is not an item on the menu")
    end
  end

end
