require 'sms'

describe Sms do

  subject {described_class.new(15.00)}
  let (:time) {double(:time, hour: 18, min: 45)}

  describe '#expected_delivery_time' do
    it 'formats the time to 45 mins later than the current time' do
      expect(subject.expected_delivery_time(time)).to eq "19:30"
    end
  end

  # describe '#send' do
  #   it 'sends a confirmation text' do
  #     skip 'untill i figure how to not get a text everytime...'
  #     expect{subject.send}.to change{subject.sent}.from(false).to(true)
  #   end
  # end

end
