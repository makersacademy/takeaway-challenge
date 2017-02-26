require 'take_away'

describe TakeAway do
	# => question => effect of creating fake object after the use ?

subject(:takeaway){described_class.new(menu,order)}	# => injecting fake object
# => ---------group1---------- <=
let(:menu) { double(display_menu: dummy_dish) } # => creating a fake object
let(:dummy_dish){ 'chicken_tikka: 2.99' }	# => stubing
# => ---------group2----------- <=
let(:order) { double(:receive_order)}
let(:dishes) { {chicken: 2, pizza: 5, burger: 1} }


	 context 'display_menu & select several items' do

		 it 'shows the dishes with prices' do
		 	expect(takeaway.display_menu).to eq(dummy_dish)
		 end
		 it 'allow to slect sveral dishes with differnt quantities' do
	   	expect(order).to receive(:place_order).twice.at_least(3).times
		 	takeaway.receive_order(dishes)
		 end
  end		# display_menu & select_items


end		# class TakeAway describe
