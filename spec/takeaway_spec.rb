require_relative '../lib/takeaway'

describe Takeaway do 

let(:takeaway) {Takeaway.new}

it 'should have a menu on initialization' do
expect(takeaway)

end	

it 'should provide a welcome message' do
expect{takeaway.welcome_message}.to output("Welcome to Italian Takeaway! Please view your order options below: ").to_stdout
takeaway.welcome_message
end


	
end