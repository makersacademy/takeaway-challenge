require 'takeaway'

describe Takeaway do

  context '#show_menu' do
    it "should respond to show_menu method" do
      expect(subject).to respond_to(:show_menu)
    end
  end

  context '#make_an_order' do
    it "should create a new order based on menu" do
      expect(subject.make_an_order).to_not eq nil
    end
  end

end
