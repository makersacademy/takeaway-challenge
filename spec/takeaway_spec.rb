require 'takeaway'

describe Takeaway do

	it 'basic instance creation' do
		expect(subject).to be_instance_of(Takeaway)
	end

  it 'responds to menu method' do
  	expect(subject).to respond_to(menu)
  end

end