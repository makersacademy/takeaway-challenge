require './lib/text.rb'

describe Text do

  it "initializes with the customer's phone number" do
    text = Text.new("phone_number")
    expect(text).to respond_to(:phone_number)
  end

  # it "responds to 'current time'" do
  #   expect(subject).to respond_to(:current_time)
  # end
  #
  # it "records the current_time" do
  #   hour = Time.now.hour
  #   minute = Time.now.min
  #   expect(subject.current_time).to eq("#{hour}:#{minute}")
  # end
  #
  # it "responds to 'delivery_time'" do
  #   expect(subject).to respond_to(:delivery_time)
  # end
  #
  # it "provides the delivery_time" do
  #   hour = Time.now.hour
  #   minute = Time.now.min
  #   expect(subject.delivery_time).to eq("#{hour + 1}:#{minute}")
  # end


  # it "records the current time" do
  #   time = double(:time)
  #   allow(time).to receive_message_chain(:now, :hour).and_return(16)
  #   allow(time).to receive_message_chain(:now, :min).and_return(03)
  #   expect(subject.current_time).to eq("16:03")
  # end

end
