require 'takeawaycustomer'
require 'dishes'

describe TakeawayCustomer do
  let(:cust) { described_class.new(name, number) }
  let(:name) { double :name }
  let(:number) { double :number }
  #let(:dishes) { double :dishes }

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

  # describe '#build_order' do
  #   it 'lets user select a number of dishes and store them' do
  #
  #
  #
  # end
end
