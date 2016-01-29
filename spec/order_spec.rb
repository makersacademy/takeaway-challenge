require 'order'

describe Order do

  let(:menu) {{:orange => 1, :noodles => 10, :pie => 6}}
  let(:customer) {double :customer}
  let(:order_details) {[:orange, :noodles]}
  let(:invalid_details) {[:dog, :pie]}
  let(:price) {11}
  let(:error) {"Sorry, we don't serve dog. Order aborted."}
  subject(:order) {described_class.new customer, menu, order_details}

  it{is_expected.to respond_to(:customer)}
  it{is_expected.to respond_to(:menu)}
  it{is_expected.to respond_to(:order_details)}
  it{is_expected.to respond_to(:calculate_bill)}

  describe '#initialize' do

    it 'throws an error when order doesn\'t match menu' do
      expect{described_class.new(customer, menu, invalid_details)}.to raise_error error
    end

  end

  context 'it stores relevant data' do

    it 'stores customer' do
      expect(subject.customer).to eq customer
    end

    it 'stores order' do
      expect(subject.order_details).to eq order_details
    end
  end

  describe '#calculate_bill' do

    it 'sums and returns the total cost of the order' do
      expect(subject.calculate_bill).to eq price
    end

  end

end
