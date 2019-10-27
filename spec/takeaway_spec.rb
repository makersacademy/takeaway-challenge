require 'takeaway'

describe TakeAway do
  let(:menu) { double :menu }
  subject(:subject) { described_class.new(menu: menu) }
  let(:item1) { "pizza" }
  let(:quantity1) { 3 }
  let(:price1) { 7.50 }

  before do
    allow(menu).to receive(:view_list).and_return({ "rice" => 1.50, "fries" => 2.50, "noodles" => 3.50, "pasta" => 6.50, "pizza" => 7.50 })
  end

  describe "#view_menu" do
    it 'shows the menu' do
      expect(subject.view_menu).to eq({ "rice" => 1.50, "fries" => 2.50, "noodles" => 3.50, "pasta" => 6.50, "pizza" => 7.50 })
    end
  end

  describe "#order" do
    it "records and returns the user's input" do
      allow(subject).to receive(:gets).and_return("pizza\n", "3\n")
      expect(subject.order).to eq({ item1 => quantity1 })
    end
  end

  describe "#view_summary" do
    it "has an empty basket before the order" do
      expect(subject.view_summary).to be_empty
    end

    it "returns the basket with the subtotal" do
      allow(subject).to receive(:gets).and_return("pizza\n", "3\n")
      subject.order
      expect(subject.view_summary).to eq "#{quantity1} x #{item1} = £#{quantity1 * price1}"
    end

    describe "#total" do
      it "calculated and shows the total" do
        allow(subject).to receive(:gets).and_return("rice\n", "2\n")
        subject.order
        allow(subject).to receive(:gets).and_return("fries\n", "2\n")
        subject.order
        expect(subject.total).to eq "Total = £#{(2 * 1.50) + (2 * 2.50)}."
      end
    end

    describe "#submit_order" do
      it 'raises an error when the total is not correct' do
        allow(subject).to receive(:gets).and_return("no")
        expect { subject.submit_order }.to raise_error "The total is not correct. Please re-submit the order."
      end

      it 'sends an SMS if the user confirms that the total is correct' do
        allow(subject).to receive(:gets).and_return("yes")
        expect(subject.submit_order).to eq "Confirmation SMS sent"
      end
    end
  end
end
