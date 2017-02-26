require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu }
  let(:messenger) { double :messenger }

  context '#show_menu' do

    it "should respond to show_menu method" do
      expect(subject).to respond_to(:show_menu)
    end

    it "should print given list of dishes" do
      list = [{ :dish => "Soup of the day", :price => 4.5 }]
      expect(STDOUT).to receive(:puts).with('1. Soup of the day, £4.5')
      subject.print_dishes(list)
    end

  end

  context '#order' do
    before(:each) do
      subject.make_a_new_order
      subject.select_dish(2)
      subject.select_dish(5)
    end

    it "should respond to show_total method" do
      expect(subject).to respond_to(:show_total)
    end

  end

  context '#confirm_order' do

    it "should send a confirmation" do
      allow(messenger).to receive(:send_confirmation).and_return("Confirmation's been sent")
      subject.make_a_new_order
      subject.select_dish(2)
      expect(subject.confirm_order(messenger)).to eq "Confirmation's been sent"
    end

    it "should raise an error if the total is 0" do
      expect{subject.confirm_order(messenger)}.to raise_error "Please make an order!"
    end

  end

end
