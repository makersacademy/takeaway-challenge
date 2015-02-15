require './lib/TakeAway'

describe Takeaway do

	let(:takeaway){Takeaway.new}
# let(:pizza){double pizza: 5 }
	
		it 'should be able to show a proper zombie menu' do
			expect(takeaway.menu).to include("brain pizza", "lungs burger", "eye chips")
		end



		it 'should respond to a customers call' do
			Time.now (60*60)
			# expect(takeaway).to respond_to(:take_call)
		end

end