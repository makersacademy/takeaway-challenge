require './lib/order.rb'
require './spec/vcr_setup.rb'

describe Order do

  it "has an array that holds the order" do
    expect(subject.list).to eq([])
  end

  describe "#add" do

    it "takes dish and quantity and enters into hash" do
      dish = double(:dish)
      quantity = 3
      subject.add(dish, quantity)
      expect(subject.list).to eq([dish, dish, dish])
    end

  end

  describe "#total" do

    it "adds up Order.list test1" do
      subject.add("Tofu salad", 2)
      subject.list
      (subject.menu).stub(:price => 2.5)
      expect(subject.total).to eq(5.0)
    end

    it "adds up Order.list test2" do
      subject.add("Ming's wings", 4)
      subject.list
      (subject.menu).stub(:price => 3.9)
      expect(subject.total).to eq(15.6)
    end

  end

  describe "#finalise" do

    it "creates a message with the confirmation" do
      subject.add("Ming's wings", 4)
      subject.list
      (subject.menu).stub(:price => 3.9)
      time = Time.new + (60*60)
      time1 = time.strftime("%H:%M")
      expect(subject.finalise).to eq("Thank you! Your order was placed and will be delivered before #{time1}.")
    end

  end


  describe "#send_text(text)" do
    it "sends the text" do
      subject.add("Ming's wings", 4)
      subject.list
      (subject.menu).stub(:price => 3.9)
      subject.finalise
      VCR.use_cassette('twilio') do
        subject.send_text(@message)
      end
    end
  end

end
