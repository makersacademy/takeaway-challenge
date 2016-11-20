require 'take_away'

describe TakeAway do
let(:order) {Class.new}
subject(:take_away) { described_class.new }

  it "lets user place order" do
    VCR.use_cassette('twilio') do
      take_away.place(order)
      expect(take_away.order).to be(order)
    end
  end

  it "records when order was placed" do
    VCR.use_cassette('twilio') do
      take_away.place(order)
      expect(take_away.time).to be_kind_of(Time)
    end
  end

end
