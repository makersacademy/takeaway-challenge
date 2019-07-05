# order unit test

require 'order'

describe Order do

  # example menu showing dish => price
  let(:menu) {double :menu, items: {
    "starter" => 1,
    "main" => 2,
    "dessert" => 3
  } }
  let(:subject) {described_class.new(menu)}

  # change the test order as you wish, rspec should still run
  # remember the value here is the QUANTITY of the order not the PRICE
  test_order = {
    "starter" => 3,
    "main" => 5,
    "dessert" => 7
  }


  context "when items have been added to the order" do
    before do
      test_order.each { |key, value|
        subject.add(key, value)}
    end

    it "returns a nice string telling you your order" do
      test_order.each { |key, value|
        expect(subject.complete).to match key
        expect(subject.complete).to match value.to_s }
    end

    it "also tells you the time your order will be delivered" do
      time = (Time.now + Order::PROCESSING_TIME).strftime("%H:%M")
      expect(subject.complete).to match(time)
    end

    it "also calculates the total of your order" do
      total = test_order.map { |key, value| value * menu.items[key] }.inject(:+)
      expect(subject.complete).to match(total.to_s)
    end

  end
end
