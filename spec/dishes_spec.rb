require 'dishes'

describe Dishes do
  subject { described_class.new }

  context "#view(dishes)" do
    it "should return a hash of dishes and prices" do
      expect(subject.menu).to eq({
        "pavlova" => 4,
        "financier" => 3.50,
        "croissant" => 2,
        "tart" => 3,
        "gateau" => 15,
        "canele" => 1.50
      })
    end

    it "should print items and prices" do
      expect{subject.view}.to output.to_stdout
    end
  end 
end
