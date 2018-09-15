require "menu"

describe Menu do
  context "#see"do
    it "prints out menu" do
      expect(subject.see).to_return("1. Butterbeer 1 Sickle")
    end
  end
end
