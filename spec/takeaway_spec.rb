require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:total) {6}

  before do
    allow(takeaway).to receive(:send_text)
  end

  describe '#view_menu' do
		  it 'displays a menu' do
		  	menu = Menu.new
		  	dishes = { "Dim sum"=>2, "Fried rice"=>3, "Crispy chicken"=>4, "Pepper squid"=>5 }
		  	expect(takeaway.view_menu).to eq menu.dishes
		  end
  end
  
  describe '#place_order' do
    it 'selects some number of several available dishes' do
  		basket = {dish_name: "Dim sum", price: 2, amount: 3}
      expect(takeaway.place_order("Dim sum", 3)).to eq [basket]
    end
  end

  describe '#view_basket' do
  	context 'when checking basket' do
      it 'displays empty orders if no orders added' do
      	expect(takeaway.orders).to be_empty
      end

  	  it 'displays selected orders' do
  	  	basket = {dish_name: "Dim sum", price: 2, amount: 3}
  	  	takeaway.add_to_orders("Dim sum", 2, 3)
  	  	expect(takeaway.orders).to eq [basket]
  	  end
  	end	
  end
  
  describe '#checkout' do
    it 'checks out the total' do
  		takeaway.add_to_orders("Dim sum", 2, 3)
  		takeaway.checkout
  		expect(takeaway.total).to eq 6
    end
  end 

  describe '#complete_order' do
  	it 'sends payment confirmation message' do
  		expect(takeaway).to receive(:send_text).with("Thank you for your order: £#{takeaway.total}")
  	  takeaway.complete_order
  	end
  end

end