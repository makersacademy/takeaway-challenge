require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:menu) {double :menu, :list => {'tofu' => 3, 'broccoli' => 1, 'radish' => 2, 'seitan' => 5}}

  it 'should take user input' do
    allow(order).to receive(:gets).and_return("tofu\n", "4\n", "seitan\n", "2\n", "")
    order.input
    expect(order.items).to eq ({'tofu' => 4, 'seitan' => 2})
  end

  describe '#total' do

    before do
      allow(order).to receive(:gets).and_return("tofu\n", "4\n", "seitan\n", "2\n", "")
      order.input
      allow(order).to receive(:gets).and_return("22\n", "a number")
      order.total(menu)
    end

  it 'should report the correct total' do
    expect(order.payment).to eq 22
  end

  it 'should return the correct number' do
    expect(order.mobile_number).to eq 'a number'
  end

end

end
