require 'takeaway'

describe Takeaway do
  context 'starting up with printable menu' do
    it "should initialize with a hash menu" do
      expect(subject.menu.dishes).to be_a Hash
    end

    it "should print dishes on show_menu" do
      expect{subject.show_menu}.to output.to_stdout
    end
  end

  context 'ordering food' do
    it 'should receive an order and output confirmation' do
      message = "3x Plantastic burger(s) added to your basket."
      expect{subject.confirm 'Plantastic burger', 3}.to output(message).to_stdout
    end
  end
end
