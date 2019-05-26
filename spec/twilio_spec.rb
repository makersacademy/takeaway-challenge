require 'twilio'
require 'timecop'

describe Sender do 
  let(:sender) { Sender.new }

  before do
		Timecop.freeze(Time.local(2019,5,26,16,26))
	end
	
	after do
		Timecop.return
	end

  it 'calculates one hour\'s time' do

    expect(sender.delivery_time).to eq("17:26") 
  end 

end