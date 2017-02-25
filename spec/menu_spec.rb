require 'menu'

describe Menu do

  context "#show_menu" do
    it "should respond to method show_menu" do
      expect(subject).to respond_to(:show_menu)
    end
  end

  context "#select" do
    it "should respond to select_dishes method" do
      expect(subject).to respond_to(:select_dishes)
    end
  end

  context "#select" do
    it "should respond to select_dishes method" do
      expect(subject).to respond_to(:order_total)
    end
  end

end
