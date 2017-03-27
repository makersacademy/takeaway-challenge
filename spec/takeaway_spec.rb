require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:menu) {Menu.new}
  let(:dish) {:dish}
  let(:price) {:price}
  let(:amount) {:amount}
  it { is_expected.to respond_to(:place_order).with(2).arguments }
  let(:basket) { {dish_name: dish, price: price, amount: amount} }
  let(:checkout) {:checkout}
  let(:total) {total}

  before do
    allow(takeaway).to receive(:send_text)
  end

  describe '#view' do
		context 'when making an order' do
		  it 'displays a menu' do
		  	expect(takeaway.view_menu).to eq menu.dishes
		  end
		end
  end

  describe '#place_order' do
  	context 'when placing an order' do
      it 'selects some number of several available dishes' do
        allow(takeaway).to receive(:place_order).and_return [basket]
        takeaway.view_menu
        expect(takeaway.place_order(dish, amount)).to eq [basket]
      end
	  end
  end

  describe '#view_basket' do
  	context 'when checking basket' do
      it 'displays empty orders if no orders added' do
      	expect(takeaway.orders).to be_empty
      end

  	  it 'displays selected orders' do
  	  	takeaway.add_to_orders(dish, price, amount)
  	  	expect(takeaway.orders).to eq [basket]
  	  end
  	end	
  end
  
  # describe '#checkout' do
  # 	context 'when checking out' do
  #     it 'checks out the total' do
	 #  		takeaway.add_to_orders(dish, price, amount)
	 #      allow(takeaway).to receive(:checkout).and_return :total
	 #  		expect(takeaway.checkout).not_to be_empty
	 #    end
  #   end
  # end 

  describe '#complete_order' do
    context 'when confirming order' do
	  	it 'sends payment confirmation message' do
	  		expect(takeaway).to receive(:send_text).with("Thank you for your order: £#{takeaway.total}")
	  	  takeaway.complete_order
	  	end
  	end
  end


end