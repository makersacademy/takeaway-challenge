require_relative '../lib/order.rb'

describe Order do
  let(:name1) { double(:item) }
  let(:name2) { double(:item) }

  before do
    allow(name1).to receive(:name) { "name1" }
    allow(name2).to receive(:name) { "name2" }
    allow(name1).to receive(:price) { 1 }
    allow(name2).to receive(:price) { 1.5 }
  end

  describe '#add(item, number = 1)' do
    it 'should add the item to the order list' do
      subject.add(name1)
      expect(subject.order).to eq([{ name: "name1", number: 1 }])
    end
    it "should record the quatity of each item" do
      subject.add(name1, 3)
      subject.add(name2, 2)
      expect(subject.order).
        to eq([{ name: "name1", number: 3 }, { name: "name2", number: 2 }])
    end
  end

  describe '#show' do
    it "should output the order with total" do
      subject.add(name1, 2)
      subject.add(name2, 3)
      order = "name1: 2\nname2: 3\nTotal Price: £6.50\n"
      expect { subject.show }.to output(order).to_stdout
    end
  end

  describe '#comfirm, string output' do # to be moved when Twilio is setup
    time_string = Time.now.strftime("%H:%M")
    message = "Order confirmed, it will arrive at #{time_string}\n"
    it "gives out the confirmation message and approx arrival time" do
      expect { subject.confirm }.to output(message).to_stdout
    end
  end
end
