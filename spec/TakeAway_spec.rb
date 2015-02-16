require './lib/TakeAway'
require './lib/twilio'
describe Takeaway do

	let(:takeaway){Takeaway.new}
# let(:pizza){double pizza: 5 }
	
		it 'should be able to show a proper zombie menu' do
			expect(takeaway.menu).to include("brain pizza", "lungs burger", "eye chips")
		end

		it 'should be able to put food in the trolley' do
			p takeaway.menu
		end

end