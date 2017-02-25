require 'takeaway'

describe Takeaway do

  context '#show_menu' do
    it "should respond to show_menu method" do
      expect(subject).to respond_to(:show_menu)
    end
  end

  # context '#make_an_order' do
  #   it "should create a new order based on menu" do
  #     subject.make_an_order
  #     expect(subject.order).to_not eq nil
  #   end
  # end

  context "#select" do
    it "should respond to select_dishes method" do
      expect(subject).to respond_to(:show_total)
    end
  end

end
