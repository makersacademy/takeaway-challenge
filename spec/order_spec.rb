require 'order'

describe Order do
  it "responds to #show_menu" do
    expect(subject).to respond_to :show_menu
  end

  # Need to think about the description here.
  # Is this test a bit silly, should it be updated?
  it "#show_menu prints the menu" do
    expect(subject.show_menu).to be_instance_of Array
  end

  it "responds to #add_pizza with a menu number" do
    expect(subject).to respond_to(:select_pizza).with(2).arguments
  end

  it "responds to #selection" do
    expect(subject).to respond_to :selection
  end

  #bit of a pointless test?
  it '#selection is an array containing the order' do
    expect(subject.selection).to be_instance_of Array
  end

  it '#selection contains the order' do
    subject.select_pizza(1, 2)
    expect(subject.selection).to eq [{"1": "Garlic Bread with cheese", price: 6}, {"1": "Garlic Bread with cheese", price: 6}]
  end

  it "responds to #calculate_total" do
    expect(subject).to respond_to :calculate_total
  end

  it "gives the total price of the order" do
    subject.select_pizza(1, 2)
    subject.select_pizza(2, 1)
    expect(subject.calculate_total).to eq 24
  end



  it "responds to #complete_order" do
    expect(subject).to respond_to :complete_order
  end

  it "responds to #send text" do
    expect(subject).to respond_to :send_sms
  end

  it "sends a text" do
    allow(subject).to receive(:send_sms).and_return("You have succesfully ordered your pizza! Total: £#{@total}")
    expect(subject.complete_order).to eq "You have succesfully ordered your pizza! Total: £#{@total}"
  end


end

=begin
  describe Takeaway
  subject(:takeaway) { described_class.new }

  before do
    allow(takeaway).to receive(:send_text)
  end

  it 'sends a payment confirmation text message' do
    expect(takeaway).to receive(:send_text).with("Thank you for your order: £20.93")
    takeaway.complete_order(20.93)
  end
end
=end
