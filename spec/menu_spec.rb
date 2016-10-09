require 'menu'

describe Menu do
  dishes = [
  {name: "Pasta", price: 3.50},
  {name: "Pizza", price: 2.40}
  ]
  order=Order.new
  subject {described_class.new(dishes,order)}

  it {is_expected.to respond_to :view }

  it {is_expected.to respond_to :add_dish_to_order }

  describe "#view" do
    it "outputs dishes in a format" do
      view_output = dishes.each_with_index {|dish, i| "#{i+1}: #{dish[:name]} costs #{dish[:price]}"}
      expect(subject.view).to eq view_output
    end
  end

  describe "#select" do
    before(:each) do
      subject.add_dish_to_order("Pasta")
    end

    it "should select several separate dishes" do
      expect(subject.add_dish_to_order("pizza")).to include dishes[0], dishes[1]
    end

    it "should order several of the same dish" do
      subject.add_dish_to_order("Pasta")
      expect(subject.add_dish_to_order("Pasta")).to include dishes[0], dishes[0], dishes[0]
    end
  end





end
