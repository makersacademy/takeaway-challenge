require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  let(:menu) {double :menu , :list => {'tofu' => 3, 'broccoli' => 1, 'radish' => 2, 'seitan' => 5}}
  let(:order) {double :order, :payment => 12}
  let(:pricecheck) {double :pricecheck, :total => 11}

  describe '#initialize' do
    it 'has a menu object' do
      expect(takeaway.menu).to be_a(Menu)
    end
    it 'has an order object' do
      expect(takeaway.order).to be_a(Order)
    end
    it 'has a pricecheck object' do
      expect(takeaway.pricecheck).to be_a(PriceCheck)
    end
  end

describe '#place_order' do

before do
  allow(takeaway.order).to receive(:gets).and_return("tofu\n", "4\n", "", "12\n", "a number")
end
  it 'calls the correct methods' do
    expect(takeaway.menu).to receive(:display)
    takeaway.place_order
  end
  it 'calls the correct methods' do
    expect(takeaway.order).to receive(:input)
    takeaway.place_order
  end
  it 'calls the correct methods' do
    expect(takeaway.order).to receive(:total)
    takeaway.place_order
  end
  it 'calls the correct methods' do
    expect(takeaway.pricecheck).to receive(:sum)
    takeaway.place_order
  end
end

describe '#submit_confirmation' do
  it 'fails when the total and payment dont match' do
    expect{takeaway.submit_confirmation}.to raise_error 'incorrect payment amount'
  end
end


end
