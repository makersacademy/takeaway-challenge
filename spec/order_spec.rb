require "order"
require "bill"
require "stringio"
require "pry"

describe Order do
  subject { Order.new(confirm) }
  let(:confirm) { double("confirm", send_text: nil) }
  describe "#bill" do
    it "returns a bill" do
      expect(subject.bill).to be_an_instance_of(Bill)
    end
  end

  describe "#create" do
    let(:menu) do
      "Pizza Takeaway\n" +
        "===============================\n" +
        "1. Margherita - £10.00\n" +
        "2. Diavola - £11.00\n" +
        "3. Boscaiola - £14.00\n" +
        "4. Quattro Stagioni - £13.00\n" +
        "5. Capricciosa - £12.00\n" +
        "6. Marinara - £9.00\n" +
        "===============================\n"
    end

    it "shows the menu" do
      subject.stub(:gets) { "" }
      expect { subject.create }.to output(menu).to_stdout
    end

    it "asks for selection again if the item is not in the menu" do
      allow(subject).to receive(:gets).and_return("20", "")
      expect { subject.create }.to output(menu * 2).to_stdout
    end

    it "adds an item to the order" do
      allow(subject).to receive(:gets).and_return("3", "")

      subject.create
      last_item = subject.items.last

      expect(last_item.name).to eq("Boscaiola")
      expect(last_item.price).to eq(14)
    end
  end

  describe "#check_bill" do
    it "fails if the bill is wrong" do
      subject.bill.add(1000)
      expect { subject.check_bill }.to raise_error("Bill is wrong")
    end

    it "does not fail if the bill is right" do
      expect { subject.check_bill }.not_to raise_error
    end
  end
end
