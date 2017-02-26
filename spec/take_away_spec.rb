require 'take_away'

describe TakeAway do
	# => question => effect of creating fake object after the use ?

subject(:takeaway){described_class.new(menu,order,text)}	# => injecting fake object
let(:text){ instance_double('Text', deliver_text: nil) }
# => ---------group1---------- <=
let(:menu) { instance_double('Menu', display_menu: dummy_dish) } # => stubing class menu
let(:dummy_dish){ 'chicken_tikka: 2.99' }	# => stubing

# => ---------group2----------- <=
let(:order) { instance_double('Order', order_total: 15.60 )}		# => stubing class order
let(:dishes) { {chicken: 2, pizza: 1, burger: 2} }

	before { allow(order).to receive(:place_order)}

	 context 'display_menu & select several items' do

		 it 'shows the dishes with prices' do
		 	expect(takeaway.display_menu).to eq(dummy_dish)
		 end
		 it 'allow to slect sveral dishes with differnt quantities' do
	   	expect(order).to receive(:place_order).exactly(3).times
		 	takeaway.receive_order(dishes)
		 end
  end		# display_menu & select_items

	context 'order_total' do
		it 'should know the total of the order' do
			expect(takeaway.display_total).to eq(15.60)
		end
	end

	# context 'text acknowldgement' do
	# 	it "validates the delivery text been sent" do
	# 		expect(text).to receive(:deliver_text)
	# 		takeaway.receive_order(dishes)
	# 	end
	# end


end		# class TakeAway describe
