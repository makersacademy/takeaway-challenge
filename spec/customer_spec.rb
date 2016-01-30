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
  let(:tel_no) {"1-800-EXAMPLE"}
  let(:check_bill_output) {"Expected bill of $11, was charged $11"}
  subject(:customer) {described_class.new(name, tel_no)}

  it{is_expected.to respond_to(:tel_no)}
  it{is_expected.to respond_to(:name)}
  it{is_expected.to respond_to(:check_bill)}

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
      expect(subject.check_bill(restaurant)).to eq check_bill_output
    end

  end

end
