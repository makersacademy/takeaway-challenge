require 'receipt'
require_relative  '/Users/student/Projects/admin/takeaway_details/details.rb'

describe Receipt do
  describe '#confirmation' do
    it 'sends a message to Twilio confirming an order' do
      expect(subject.confirmation("Burger")).to include("Burger")
    end
  end
end
