require 'order_processor'

describe OrderProcessor do 

	subject { OrderProcessor.new notifier, calculable }
	let( :notifier ) { double 'notifier', :call => nil }

	describe "#process" do
		
		context "when is accepted" do
			it "pass call to notifier" do
				expect( notifier ).to receive :call
				notifier.call
			end
		end

		context "when is denied" do
			it "raises an error" do
				#code
			end
		end

	end

end