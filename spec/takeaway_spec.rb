require 'takeaway'
require 'message'

describe TakeAway  do
	subject(:takeaway) {described_class.new(menu,Message.new)}
	let(:menu) {double(:menu, present?: true, print_dish: {"pizza"=>1, "burger"=>2,"fries"=>1.5}, dishes: dishes) }
	
	#let(:menu) {double(:menu, present?: true, print_dish: dishes) }
	let(:dishes) { {"pizza"=>1, "burger"=>2,"fries"=>1.5} }

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
  		takeaway.place_order("burger",3)
  		print = "pizza x4: £4.00\nburger x3: £6.00\nTotal price: £10.0"
  		expect(takeaway.basket_summary).to include print
  	end
  end

  describe '#reset_order' do
    it 'empties the basket' do
      takeaway.place_order("pizza",4)
  		takeaway.place_order("burger",3)
      takeaway.reset_order
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#checkout' do
  	it 'returns empty basket when it is empty' do
  		expect{takeaway.basket_summary}.to raise_error 'Basket is empty'
  	end

  	it 'returns wrong total' do
  		takeaway.place_order("pizza",4)
  		expect{takeaway.checkout 2}.to raise_error 'Wrong total'
  	end
  end

end  