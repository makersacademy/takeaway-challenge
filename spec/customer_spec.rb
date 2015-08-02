require 'customer'

describe Customer do 
	describe'#select dish' do 
		it 'can select a dish' do
			expect(subject).to respond_to(:select_dish).with(1).argument 
		end 

		it 'adds a dish to the selected dishes array when selected' do 
			subject.select_dish("Classic Burger")
			expect(subject.selected_dishes).to include "Classic Burger"
		end 

		it 'cannot select a dish not on the menu' do 
			expect{subject.select_dish("Pasta")}.to raise_error 'This dish is not on the menu'
		end 
	end 

	describe 'total_price' do
		it 'adds up the prices of the selected dishes' do 
			subject.select_dish("Classic Burger")
			subject.select_dish("Cheese Burger")
			expect(subject.total_price).to eq 14.7
		end 
	end 

end 