require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu }
  let(:messenger) { double :messenger }

  context '#show_menu' do

    it "should respond to show_menu method" do
      expect(subject).to respond_to(:show_menu)
    end

  end

  context '#order' do
    before(:each) do
      subject.make_an_order(2)
      subject.make_an_order(5)
    end

    it "should create a list of dishes" do
      expect(subject.order.count).to eq 2
    end

    it "should respond to show_total method" do
      expect(subject).to respond_to(:show_total)
    end

    it "should calculate the total amount" do
      expect(subject.calculate_total).to eq subject.total
    end

  end

  context '#confirm_order' do

    it "should send a confirmation" do
      allow(messenger).to receive(:send_confirmation).and_return("Confirmation's been sent")
      subject.make_an_order
      subject.calculate_total
      expect(subject.confirm_order(messenger)).to eq "Confirmation's been sent"
    end

    it "should raise an error if the total is 0" do
      expect{subject.confirm_order(messenger)}.to raise_error "Please make an order!"
    end

  end

end
