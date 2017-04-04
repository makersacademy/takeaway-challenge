require 'customer'

describe Customer do

  context 'customer wants SMS notification' do
    name = "Joe Blogs"
    let(:sms_method) {double :sms_method}
    identification = ENV['CUST_NUM']
    subject(:customer) {described_class.new(name: name, method: sms_method, identification: identification )}

    before do
      allow(customer).to receive(:notify_method).and_return(sms_method)
    end

    it 'has a #name' do
      expect(customer.name).to eq name
    end

    it 'has a #notify_method' do
      expect(customer.notify_method).to eq sms_method
    end

    it 'has a #identification' do
      expect(customer.identification).to eq identification
    end

  end

  context 'customer wants Email notification' do
    name = "Janet Smith"
    let(:email_method) {double :email_method}
    identification = ENV['dummy_email']
    subject(:customer) {described_class.new(name: name, method: email_method, identification: identification )}

    before do
      allow(customer).to receive(:notify_method).and_return(email_method)
    end

    it 'has a #name' do
      expect(customer.name).to eq name
    end

    it 'has a Email #notify_method' do
      expect(customer.notify_method).to eq email_method
    end

    it 'has a #identification' do
      expect(customer.identification).to eq identification
    end

  end
end
