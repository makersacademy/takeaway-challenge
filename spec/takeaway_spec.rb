require 'takeaway'

describe Takeaway do 
	subject(:takeaway) {described_class.new}

	expect(:takeaway).to be_a_Class
	
end