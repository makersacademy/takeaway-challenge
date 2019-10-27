require 'takeaway'

describe Takeaway do

  it 'stores chosen dishes' do
    subject.choose("Fish")
    expect(subject.meal).to eq(["Fish"])
  end

  it 'tells the customer the total of their order' do
    subject.choose("Fish")
    expect(subject.running_total).to eq "Your bill so far comes to £3. Thank you!"
  end

  describe '#display_menu' do

    it 'returns a list of items with prices when requested' do
      expect(subject.display_menu).to eq "Fish - £3\nJelly - £1\nLiver - £2\nEgg - £1"
    end

  end

  describe '#checkout' do
    it 'confirms the time the order has been placed and gives delivery estimate.' do
      expect(subject.checkout).to eq "Your order was placed at #{Time.now}. Your food should be with you by #{Time.now+3600}."
    end
  end
end