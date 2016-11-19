require 'order'

describe Order do

# subject(:order) { described_class.new}

  it {is_expected.to respond_to :list_of_dishes}

  it 'should respond with a hash' do
    expect(subject.list_of_dishes).to include("margherita" => 9)
  end

  context '#order' do

    it { is_expected.to respond_to(:order).with(3).argument }

    it 'should return the pizza and the amount ordered when 1 pizza is ordered' do
      expect(subject.order("margherita", 1, 9)).to eq "You have ordered 1 margherita(s)."
    end

    it "should give error if total is not correct" do
      expect{subject.order("margherita", 1, 4)}.to raise_error "Cannot add item(s): total is incorrect."
    end

  end

  context "tests storing of order" do

    it { is_expected.to respond_to :current_order_price }

    it "should return 9 when 1 margherita is ordered" do
      subject.order("margherita", 1, 9)
      expect(subject.current_order_price).to eq 9
    end

    it "should return 19 when 1 pizza and 1 pepperoni are ordered" do
      subject.order("margherita", 1, 9)
      subject.order("pepperoni", 1, 10)
      expect(subject.current_order_price).to eq 19
    end

    it "should work when more than 1 item is ordered" do
      subject.order("margherita", 1, 9)
      subject.order("pepperoni", 2, 20)
      expect(subject.current_order_price).to eq 29
    end

    it "should return error when less than 1 item is ordered" do
      expect{subject.order("margherita", 0, 2)}.to raise_error "Cannot add item(s): quantity is less than one."
    end

  end

  context "#expected_total" do

    it { is_expected.to respond_to :expected_total }

    it "Should return message when order is finished" do
      subject.order("margherita", 1, 9)
      expect(subject.expected_total(9)).to eq "Thank you! Your order was placed and is being delivered by our best directionally challenged learner driver. It will be delivered before #{Time.now.strftime("%H").to_i+1}:#{Time.now.strftime("%M")}"
    end

    it "should show other message if total is incorrect" do
      subject.order("margherita", 1, 9)
      expect(subject.expected_total(10)).to eq "Your total is wrong, perhaps you need to do some remedial Maths classes."
    end

  end

  # context "time for time" do
  #
  #   it { is_expected.to respond_to :time }
  #
  # #   # it "should show the time" do
  # #   #   e
  # #
  # end


end
