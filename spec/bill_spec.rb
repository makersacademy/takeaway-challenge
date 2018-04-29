describe Bill do

  let(:menu) { [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},]}
  let(:customer_order) { [{dish: 'Hawaiian', quantity: 4},
    {dish: 'BBQ Original', quantity: 5}] }

  subject(:bill) { Bill.new }

  describe '#initialize' do

    it 'sets order total to zero' do
      expect(bill.total).to eq 0
    end

  end

  describe '#calculate_bill' do

    it 'calculates bill based on menu' do
      bill.calculate_bill(menu, customer_order)
      expect(bill.total).to eq 70.91
    end

  end


end
