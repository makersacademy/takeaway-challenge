require 'dish'

describe Dish do

  subject { described_class.new }

  describe "#on_the_menu?" do
    it "has items on the menu" do
      dish = "lamb"
      expect(subject.on_the_menu?(dish)).to be true
    end
  end

end
