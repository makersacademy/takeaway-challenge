require 'menu'

describe Menu do
  it "should initialize with a menu" do
    list = { chicken: 4, lamb: 7, vegetables: 3, latte: 2 }
    expect(subject.content).to eq list
  end

  describe "#see_list" do
    it "should return an array of all the dishes" do
      list = { chicken: 4, lamb: 7, vegetables: 3, latte: 2 }
      expect(subject.see_content).to eq list.keys
    end
  end
end