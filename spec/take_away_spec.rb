require 'take_away'

describe TakeAway do

  describe 'initialization' do
    it 'can create a new instantiated TakeAway' do
      expect(subject).to be_an_instance_of TakeAway
    end
  end

  it { expect(subject).to respond_to :read_menu }
  it { expect(subject).to respond_to :order }

  it 'shows the customers a list of dishes with prices' do
    expect(subject.read_menu).to match_array({"spring roll" => 0.99, "char sui bun" => 3.99, "pork dumpling" => 2.99, "peking duck" => 7.99})
  end

  it 'prints out the order' do
    expect(subject.order("spring roll")).to eq "1x spring roll(s) added to your basket."
  end

end
