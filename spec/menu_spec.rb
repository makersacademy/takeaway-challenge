require 'menu'
describe Menu do
  it "contains a list of foods" do
    expect(subject.food_items).to be_an_instance_of(Array)
  end

  it { is_expected.to respond_to(:print) }

  describe "#print" do

    it "should print the all foods in an array of hashes" do
      expect(subject.print).to match_array([
        { food: "vinegar yogurt", price: 3 },
        { food: "pickled crumpets", price: 6 },
        { food: "tomato ice-cream", price: 2 },
        { food: "crispy mango", price: 9 },
        { food: "duck ragu", price: 4 },
        { food: "chilli con potato", price: 12 },
        { food: "roadkill jumbalaya", price: 7 },
        { food: "fermented orange", price: 8 },
        { food: "stawberry lasagne", price: 20 },
        { food: "tuna", price: 15 }
      ])
    end
  end
end
