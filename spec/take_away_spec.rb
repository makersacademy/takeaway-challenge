require 'take_away'

describe TakeAway do

  describe 'initialization' do
    it 'can create a new instantiated TakeAway' do
      expect(subject).to be_an_instance_of TakeAway
    end
  end

  it { expect(subject).to respond_to :read_menu }
  it { expect(subject).to respond_to :order }
  it { expect(subject).to respond_to :basket_summary }

  it 'shows the customers a list of dishes with prices' do
    printed_menu = { "spring roll" => 0.99, "char sui bun" => 3.99, "pork dumpling" => 2.99, "peking duck" => 7.99 }
    expect(subject.read_menu).to match_array(printed_menu)
  end

  describe '#order' do
    it 'prints out the order' do
      expect(subject.order("spring roll")).to eq "1x spring roll(s) added to your basket."
    end
    
    it 'raises an error when the order is not in the menu' do
      expect { subject.order("what") }.to raise_error "Not in menu"
    end
  end

end
