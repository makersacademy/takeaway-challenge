require 'takeawaycustomer'

describe TakeawayCustomer do
  let(:cust) { described_class.new(name, number) }
  let(:name) { double :name }
  let(:name) { double :name }
  let(:number) { double :number }

  describe '#initialize' do
    it 'checks that takeaway_customers name is entered' do
      expect(cust.name).to eq(name)
    end
    it 'checks that takeaway_customers number is entered' do
      expect(cust.number).to eq(number)
    end
  end

  describe '#list' do
    it 'allows cust to list available dishes and prices (hash)' do
      expect(cust.list).to eq (dishes)
    end
  end
end
