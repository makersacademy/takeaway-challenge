require 'takeaway'

describe Takeaway do

  describe '#display_menu' do
    it 'must be able to display a list of dishes with prices' do
      expect(subject.display_menu).to eq subject.menu
    end
  end

  describe '#order' do
    it { is_expected.to respond_to(:order).with(1).argument }
  end

  it 'must provide order confirmation' do
    subject.order("steak")
    subject.order("chips")
    subject.order("strawberry_milkshake")
    expect(subject.order_confirmation).to eq "steak, chips, strawberry_milkshake"
  end
end
