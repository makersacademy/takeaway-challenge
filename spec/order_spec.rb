require_relative '../lib/order.rb'

describe Order do
  subject(:order) { described_class.new(:dish, 5) }
  let(:dish) { double(:dish) }


context "Add items into the order" do

  it 'should add a dish to the current order' do
    expect { subject.add_to_order(:dish, 5) }.to change { order.current_order.length }.by 1
  end

end



  context "Order Checking" do

    it 'should show the current order' do
      expect(subject.current_order).to eq [:dish => 5]
    end

    it 'should calculate the total for the current order' do
      order.add_to_order(:dish, 5)
      order.add_to_order(:dish, 5)
      expect(order.order_total).to eq 15
    end

    it "should allow user to check what has been ordered and total cost" do
      subject.add_to_order(:dish, 5)
      p subject
      expect {subject.print_current_order}.to output("\"dish - 5\"\n\"dish - 5\"\n").to_stdout
    end
  end

end
