require 'menu'
require 'takeaway'
describe Takeaway do

  context "when Takeaway class is initialised" do
    it "it  creates a new instance of menu" do
     expect(subject.menu).to be_an_instance_of(Menu)
    end
  end
end
