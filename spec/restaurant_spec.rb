require 'restaurant'

describe Restaurant do

  let(:subject) {Restaurant.new(order_class, menu, messenger)}
  let(:order_class) {double(:order_class, new: order)}
  let(:order) {double(:order)}
  let(:menu) {double(:menu)}
  let(:messenger) {double(:messenger)}
#
  let(:quantity) {double :quantity}
  let(:item) {double :item}
  let(:price) {double :price}

  describe '#show_menu' do
    it 'shows menu via the menu class' do
      expect(menu).to receive(:show_menu)
      subject.show_menu
    end
  end

  describe '#add_to_menu' do
    it 'adds item to menu' do
    expect(menu).to receive(:add)
    subject.add_to_menu(item,price)
    end
  end

  describe '#show_order' do
    it 'raises error if no order created' do
      expect(order_class).to receive(:show_order)
      subject.show_order
    end
  end

  describe '#checkout' do
    it 'raises error if balance not paid' do
      message = "Amount is not correct"
      allow(subject).to receive(:correct_total?).and_return(false)
      expect{subject.checkout(3)}.to raise_error message
    end

    it 'sends text when balance is paid' do
      allow(subject).to receive(:correct_total?).and_return(true)
      expect(messenger).to receive(:send_text)
      subject.checkout(2.5)
    end
  end

end
