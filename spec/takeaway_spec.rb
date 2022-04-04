require 'takeaway'

describe Takeaway do
  
  let(:dish) { double :dish, :name => "Cheesy Chips", :price => 4 }
  let(:order) { double :order }
  it 'can add a new dish' do
    subject.add(dish)
    expect(subject.menu).to include(dish)
  end

  it { is_expected.to respond_to(:order) }

  it 'can show a list of dishes with prices' do
    expect(subject.show_menu).to eq(subject.menu)
  end

  describe '#complete_order' do
    before do
      @time_now = Time.now
      allow(subject).to receive(:send_text)
      allow(Time).to receive(:now).and_return(@time_now)
    end

    it 'sends a payment confirmation text message' do
      expect(subject).to receive(:send_text).with("Thank you! Your order was placed and will be delivered before #{Time.now + 1 * 60 * 60}")
      subject.complete_order
    end
  end
end
