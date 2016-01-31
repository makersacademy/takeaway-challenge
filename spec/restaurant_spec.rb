require 'restaurant'

describe Restaurant do

  before do
    allow(order_klass).to receive(:new) {order}
    allow(order).to receive(:order_details) {details}
    allow(menu_klass).to receive(:new) {menu}
    allow(menu2).to receive(:list_items) {items2}
    allow(menu).to receive(:list_items) {items}
    allow(customer).to receive(:bill_correct?) {true}
    allow(customer).to receive(:restaurant_bill) {11}
    allow(customer).to receive(:name) {"Rufus"}
    allow(customer).to receive(:tel_no) {"+441548312031"}
    allow(subject).to receive(:send_confirmation_sms) {nil}
  end

  let(:error) {"Bill incorrect. Please check order"}
  let(:customer) {double :customer}
  let(:order_klass) {double :order_klass}
  let(:order) {double :order}
  let(:details) {double :details}
  let(:menu_klass) {double :menu_klass}
  let(:menu) {double :menu}
  let(:menu2) {double :menu}
  let(:items) {double :items}
  let(:items2) {double :items}
  subject(:restaurant) {described_class.new menu_klass, order_klass}

  it{is_expected.to respond_to(:menu)}
  it{is_expected.to respond_to(:new_order)}
  it{is_expected.to respond_to(:change_menu)}
  it{is_expected.to respond_to(:place_order)}

  context 'menu management' do

    it 'returns "empty message" when no menu setup' do
      expect(subject.menu).to be items
    end

    it 'allows menu change' do
      subject.change_menu menu2
      expect(subject.menu).to be items
    end

  end

  context 'order management' do

    # test disabled to prevent failure on GitHub (since auth tokens not pushed)

    it 'allows the creation of a new order' do
      subject.place_order customer, details
      expect(subject.orders).to include order
    end


    it 'throws an error when the bill is wrong' do
      allow(customer).to receive(:bill_correct?) {false}
      expect{subject.place_order(customer, details)}.to raise_error error
    end

  end

end
