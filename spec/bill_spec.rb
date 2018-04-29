describe Bill do

  subject(:bill) { Bill.new }

  let(:menu) { [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},]}
  let(:customer_order) { [{dish: 'Hawaiian', quantity: 4},
    {dish: 'BBQ Original', quantity: 5}] }
  let(:order_value) { 70.91 }

  describe '#initialize' do

    it 'sets order total to zero' do
      expect(bill.total).to eq 0
    end

  end

  describe '#calculate_bill' do

    it 'calculates bill based on menu' do
      bill.calculate_bill(menu, customer_order)
      expect(bill.total).to eq order_value
    end

  end

end
