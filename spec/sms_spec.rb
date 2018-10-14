require "./lib/sms.rb"

class Dummyclass
  include Sms
end

describe Sms do
  let(:dummyclass){Dummyclass.new}

  it "formats the time" do
    expect(dummyclass.time).to eq{ Time.now + 60 * 60.strftime('%H:%M') }
  end

end
