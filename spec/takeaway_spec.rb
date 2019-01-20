require 'takeaway'

describe Takeaway do
  # let (:menu_list) { double :menu_list }

  it 'shows a list of dishes with prices' do
    expect(subject.menu).to_not be_empty
  end

  describe '#menu' do
    it 'to select dishes and number of dishes from menu' do
      expect(subject).to respond_to(:order).with(2).arguments
  end

  it 'to check the sum amount matches the exact total of various dishes' do
    subject.order("cola", 1)
    subject.order("salad", 1)
      expect(subject.exact_total).to eq(subject.customer_total(7))
  end
end
end
