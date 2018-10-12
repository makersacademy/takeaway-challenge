require 'menu'

describe Menu do
  context "food and drinks!" do
    it "lists the available food" do
      expect(subject.list_food).to include "Burger"
    end
    it "lists the available drinks" do
      expect(subject.list_drinks).to include "Coke"
    end
  end
end
