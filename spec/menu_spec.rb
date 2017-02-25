require 'menu'

describe Menu do

  context "#show_menu" do
    it "should respond to method show_menu" do
      expect(subject).to respond_to(:print_menu)
    end
  end

end
