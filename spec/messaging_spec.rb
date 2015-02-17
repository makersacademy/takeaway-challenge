require 'messaging'

class Messaging_holder; include Messaging end

describe Messaging do

  it "can generate the time and add on one hour" do
    messaging_holder = Messaging_holder.new
    time = Time.new
    expect(messaging_holder.get_time).to eq ((time.hour + 1).to_s + ":" + time.min.to_s)
  end

end