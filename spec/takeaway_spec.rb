require 'takeaway'
require 'timecop'

describe Takeaway do
  before do
    Timecop.freeze(Time.local(2022, 3, 4, 15, 23, 0))
  end

  after do
    Timecop.return
  end

  let(:twilio) { spy(:twilio_spy) }
  let(:menu) { double(:menu_double, :list_available_dishes => '1. Pizza - 16\n') }
  let(:order) { double(:order_double, :list_order => 'Pizza', :price => 16) }
  subject(:takeaway) { Takeaway.new(twilio, menu, order) }

  describe '#send_confirmation_text' do
    it 'sends a confirmation text to TwilioManager' do
      takeaway.send_confirmation_text
      expect(twilio).to have_received(:send_sms).with('Thank you! Your order was placed and will be delivered before 16:23')
    end
  end

  describe '#interactive_menu' do
    it 'presents the user with a list of options' do
      allow(takeaway).to receive(:gets).and_return("1\n", "9\n")
      expect { takeaway.interactive_menu }.to output("Pizza - 16\n").to_stdout
    end
  end
end
