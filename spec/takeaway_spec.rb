require 'takeaway'

describe Order do

	it 'basic instance creation' do
		expect(subject).to be_instance_of(Order)
	end

  it 'responds to menu inst var' do
  	expect(subject).to respond_to(:menu)
  end

  it 'responds to start method' do
  	expect(subject).to respond_to(:start)
  end

  it 'responds to finish method' do
  	expect(subject).to respond_to(:finish)
  end




end