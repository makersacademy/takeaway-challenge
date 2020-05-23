require 'dishes'

describe Dishes do
  subject { described_class.new }

  context "#view(dishes)" do
    it "should return a hash of dishes and prices" do
      expect(subject.view).to eq({
        "pavlova" => 4,
        "financier" => 3.50,
        "croissant" => 2,
        "tart" => 3,
        "gateau" => 15,
        "canele" => 1.50
      })
      # ("pavlova : £4\nfinancier : £3.50\ncroissant : £2\ntart : £3\ngateau : £15\ncanele : £1.50")
    end
  end 
end
