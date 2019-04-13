require 'menu'

describe Menu do

  describe "#menu" do
    it "should return an array of menu item hashes" do
      expect(subject.menu).to be_an_instance_of(Array)
    end
  end




end
