require 'takeaway'

describe Takeaway do
  subject(:takeaway){ Takeaway.new(menu_array, order_klass) }

  let(:name){ 'Burger' }
  let(:price){ 4.99 }
  let(:dish){ double('dish', name: name, price: price) }

  let(:order){ double(:order, add: nil) }
  let(:order_klass){ double(:order_klass, new: order) }

  let(:menu_array){ [dish] }
  let(:menu_string){ '1'.ljust(10) + name.ljust(10) + price.to_s.rjust(6) + "\n" }

  let(:wrong_total_error){ Takeaway::WRONG_TOTAL_ERROR }
  let(:order_sucess_msg){ Takeaway::ORDER_SUCCESS_MSG}


  context '#list_dishes' do
    it 'lists the available dishes' do
      expect(takeaway.list_dishes).to eq menu_string
    end
  end

  context '#place_order' do
    before :each do
      quantity = 2
      takeaway.add_to_order(0,quantity)
      allow(order).to receive(:total) {quantity * price}
    end
    it 'raises error if user provided total does not equal order total' do
      expect{ takeaway.place_order(price) }.to raise_error wrong_total_error
    end
    it 'returns "Order placed" if provided total matches order total' do
      expect(takeaway.place_order(price * 2)).to eq order_sucess_msg
    end
  end

end
