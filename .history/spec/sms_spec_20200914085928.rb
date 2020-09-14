require "sms"

describe Sms do 
let(:sms) { Sms.new }
let(:clinet) { double :client }
let(:messages) { double(:messages) }
let(:from) { double :from }
let(:to) { double :to }
it "responds to send" do 
	expect(sms).to respond_to(:send)
end 
end 