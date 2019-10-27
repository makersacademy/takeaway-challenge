require 'takeaway'

describe Takeaway do

  it 'stores chosen dishes' do
    subject.choose("Fish")
    expect(subject.meal).to eq(["Fish"])
  end

  it 'tells the customer the total of their order' do
    subject.choose("Fish")
    expect(subject.total).to eq "Your bill comes to £3. Thank you!"
  end

  describe '#display_menu' do

    it 'returns a list of items with prices when requested' do
      expect(subject.display_menu).to eq "Fish - £3\nJelly - £1\nLiver - £2\nEgg - £1"
    end

  end
end