
require 'customer_view'

describe CustomerView do

	describe '#list_menus' do
		xit 'should raise ' do
			expect { Dish.new(:vindaloo, 3) }.to raise_error(ArgumentError, 'Expecting string')
		end	
		xit 'should raise ' do
			expect { Dish.new("vindaloo", "three") }.to raise_error(ArgumentError, 'Expecting integer')
		end	
	end

	describe '#choose_menu' do
		subject(:customer) { CustomerView.new }
		xit 'should ' do
			expect(dish.to_hash).to eq({name: 'vindaloo', price: 5})
		end
	end

	describe '#order_dish' do
		subject(:customer) { CustomerView.new }
		xit 'should ' do
			expect(dish.to_hash).to eq({name: 'vindaloo', price: 5})
		end
	end

	describe '#sms_confirmation' do
		subject(:customer) { CustomerView.new }
		xit 'should send sms' do
			
		end
	end

end
