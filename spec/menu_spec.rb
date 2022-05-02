require 'menu'
describe Menu do

	describe '#see_menu' do
		it 'shows a menu list with the available dishes and their prices' do
			expect{ subject.see_menu }.not_to raise_error
		end
	end

end
