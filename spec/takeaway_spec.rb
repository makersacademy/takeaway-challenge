require 'takeaway'

describe Takeaway do

	subject(:takeaway) { described_class.new }
	
	it { is_expected.to respond_to(:new_order) }

	it { is_expected.to respond_to(:view_menu) }


end