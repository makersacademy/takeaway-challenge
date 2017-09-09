require 'takeaway_customer'

  RSpec describe Takeaway_Customer do
    let(:cust){described_class.new(name)}
    let(:name){double :name}
    describe '#initialize' do
      it 'checks that takeaway_customers name is entered' do
      expect(cust.name).to eq (name)
      end
    end
  end
