require 'take_away'

describe TakeAway do
let(:order) {Class.new}
let(:number) {7443191545}
subject(:take_away) { described_class.new }

  it "lets user place order" do
    VCR.use_cassette('twilio') do
      take_away.place(order, number)
      expect(take_away.order).not_to be(nil)
    end
  end

  it "sends a confirmation by text message" do
    VCR.use_cassette('twilio') do
      expect((take_away.place(order, number)).to_s).to include("Twilio")
    end
  end

end
