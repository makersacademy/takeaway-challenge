require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu }

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


    it "should show the list of dishes and calculate the total amount" do
      expect(subject.show_total).to eq subject.total
    end

  end

end
