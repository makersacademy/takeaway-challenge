require 'order'

describe Order do

  let(:customer) {double :customer}
  let(:order_details) {double :order_details}
  subject(:order) {described_class.new customer, order_details}
  it{is_expected.to respond_to(:customer)}
  it{is_expected.to respond_to(:order_details)}

  context 'it stores relevant data' do
    it 'stores customer' do
      expect(subject.customer).to eq customer
    end

    it 'stores order' do
      expect(subject.order_details).to eq order_details
    end
  end

end
