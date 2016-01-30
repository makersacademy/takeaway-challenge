require 'customer'

describe Customer do

  before do
    allow(restaurant).to receive(:orders) {[order]}
    allow(order).to receive(:customer) {customer}
    allow(order).to receive(:total) {price}
    allow(order).to receive(:order_details) {order_details}
    allow(order).to receive(:menu) {menu}
    allow(menu).to receive(:list_items) {items}
  end

  let(:order) {double :order}
  let(:order_details) {[:orange, :noodles]}
  let(:price) {11}
  let(:menu) {double :menu}
  let(:items) {{orange: 1, noodles: 10, pie: 6}}
  let(:restaurant) {double :restaurant}
  let(:name) {"Rufus"}
  let(:tel_no) {"+441548312031"}
  let(:check_bill_output) {"Thank you for your custom. Your total is $11. Your order will be delivered at #{Time.now + 3600}"}
  subject(:customer) {described_class.new(name, tel_no)}

  it{is_expected.to respond_to(:tel_no)}
  it{is_expected.to respond_to(:name)}
  it{is_expected.to respond_to(:bill_correct?)}

  describe '#name' do
    it 'returns customer name' do
      expect(subject.name).to eql name
    end
  end

  describe '#tel_no' do
    it 'returns customer tel_no' do
      expect(subject.tel_no).to eql tel_no
    end
  end

  describe 'checking the bill' do

    it 'is able to check the total given by the restaurant' do
      expect(subject.bill_correct?(restaurant)).to be true
    end

  end

end
