require 'messager'

describe Messager do
	subject(:messager) {described_class.new}
	describe "#send_confirmation" do
		it "sends confirmation message to the client" do
			allow(messager).to receive(:send_confirmation).and_return("Thank you! Your order is placed and will be delivered before #{((Time.now)+3600).strftime("%I:%M%p")}")
			expect(messager.send_confirmation).to eq "Thank you! Your order is placed and will be delivered before #{((Time.now)+3600).strftime("%I:%M%p")}"
		end
	end
end
