require 'takeaway'

describe Takeaway do

  context '#show_menu' do
    it "should respond to show_menu method" do
      expect(subject).to respond_to(:show_menu)
    end
  end


end
