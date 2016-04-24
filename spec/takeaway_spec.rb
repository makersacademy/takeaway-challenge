require 'takeaway'

describe TakeAway  do
	subject(:takeaway) {described_class.new(menu)}
	let(:menu) {double(:menu, present?: true, print_dish: {"pizza"=>1, "Berger"=>2}) }
	let(:dishes) { {"pizza"=>1, "Berger"=>2} }

	describe '#print_menu' do
	  it 'returns menu' do
	  	expect(takeaway.print_menu).to eq  menu.print_dish
	  end
  end

  describe '#place_order' do
  	it "adds name and quantity of dish in basket" do
  		takeaway.place_order("pizza",4)
  		expect(takeaway.basket).to include {:pizza}
  	end
  	
  	it "throws error when item not available" do
	  	allow(menu).to receive(:present?).and_return false
	  	expect{takeaway.place_order("Hamburger", 25)}.to raise_error "item not on the menu"
	  end
  end

  describe '#basket_summary' do
  	it "returns an empty basket when empty" do
  		expect{takeaway.basket_summary}.to raise_error 'Basket is empty'
  	end 

  	it 'returns content of the basket' do
  		takeaway.place_order("pizza",4)
  		expect(takeaway.basket_summary).to include 'pizza x4'
  	end
  end

end  