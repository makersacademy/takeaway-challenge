describe Bill do

  let(:menu) { [{dish: 'Hawaiian' , price: '8.99'},
    {dish: 'BBQ Original', price: '6.99'},]}
  let(:dishes) { double :dishes, menu: menu}
  let(:customer_order) {[['Hawaiian', 4],['BBQ Original', 5]]}

  subject(:bill) { Bill.new(dishes, customer_order) }

  describe '#initialize' do

    fit 'sets order total to zero' do
      expect(bill.total).to eq 0
    end

    fit 'sets customer order' do
      expect(bill.order).to eq customer_order
    end

  end

end
