require 'takeaway'

describe Takeaway do

	let(:takeaway) { Takeaway.new }

	it "can list dishes and their prices" do
		allow(Takeaway.new).to receive(:show_menu).and_return("Test Menu")
	end
end