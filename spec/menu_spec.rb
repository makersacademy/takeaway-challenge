require 'menu'

describe Menu do
  dishes = [
  {name: "Pasta", price: 3.50},
  {name: "Pizza", price: 2.40}
  ]
  subject {described_class.new(dishes)}



  it {is_expected.to respond_to :view}

  it {is_expected.to respond_to :select_dish}

  describe "#view" do
    it "outputs dishes in a format" do
      view_output = dishes.each_with_index {|dish, i| "#{i+1}: #{dish[:name]} costs #{dish[:price]}"}
      expect(subject.view).to eq view_output
    end
  end

  describe "#select" do
    before(:each) do
      subject.select_dish("Pasta")
    end
    it "selects a dish and stores in selections" do
      expect(subject.selections).to include dishes[0]
    end

    it "should select several separate dishes" do
      subject.select_dish("pizza")
      expect(subject.selections).to include dishes[0], dishes[1]
    end

    it "should order several of the same dish" do
      subject.select_dish("Pasta")
      subject.select_dish("Pasta")
      expect(subject.selections).to include dishes[0], dishes[0], dishes[0]
    end
  end

  describe "#order" do
    it "should create an order class" do

    end
  end



end
