require 'sms'
require 'timecop'

describe SMS do


  before(:each) do
      Timecop.freeze(Time.local(2021, 10, 1, 12, 0, 0))
  end

  
  
  describe '#delivery_time' do

    it 'gives the current time plus 1 hour' do
      expect(subject.delivery_time).to eq("13:00")
    end
  end
end