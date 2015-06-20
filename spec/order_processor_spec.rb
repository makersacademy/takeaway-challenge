require 'order_processor'

describe OrderProcessor do 

	subject { OrderProcessor.new notifiable, calculable }
	let( :notifiable ) { double 'notifiable', :send => nil }
	let( :calculable ) { double 'calculable' }


	describe "#process" do
		it "deals with the order" do

		end

		context "when the order is accepted" do
			it "confirms the order" do
				expect( notifiable ).to receive :send
				subject.notify_order
			end	
		end

		context "when the order is no accepted" do
			it "raises an error" do
				
			end
		end
	end

	describe "#confirm_order" do
	end

	describe "#it raises an error" do
	end
	
end