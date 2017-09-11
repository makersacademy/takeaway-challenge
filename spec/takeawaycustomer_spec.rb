require 'takeawaycustomer'
require 'menu'

describe TakeawayCustomer do
  let(:cust) { described_class.new(name, number) }
  let(:name) { double :name }
  let(:number) { double :number }
  let(:selection) { double :selection }

  describe '#initialize' do
    it 'checks that takeaway_customers name is entered' do
      expect(cust.name).to eq(name)
    end
    it 'checks that takeaway_customers number is entered' do
      expect(cust.number).to eq(number)
    end
  end

  describe '#list' do
    it 'lets users list avaiable dishes' do
      expect(cust.list).to eq('Fish&Chips' => 3, 'Burger&Chips' => 5)
    end
  end

  describe '#order' do
    it 'lets user select a dish and store it' do
      cust.order('Fish&Chips')
      expect(cust.selections).to eq('Fish&Chips' => 1)
    end
    it 'lets user select more than one dish and store them' do
      cust.order('Fish&Chips')
      cust.order('Fish&Chips')
      expect(cust.selections).to eq('Fish&Chips' => 2)
    end
  end

  describe '#confirm_order' do
    it 'returns contents of selections and totals the cost of all dishes' do
      cust.order('Fish&Chips')
      cust.order('Fish&Chips')
      cust.order('Burger&Chips')
      expect(cust.total).to eq("Your order total is £11")
    end
  end
end
