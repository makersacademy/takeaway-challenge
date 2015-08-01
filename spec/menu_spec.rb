require "menu"

describe Menu do

  let(:subject) { described_class.new( { dishes: { rice: 10.99, pizza: 5.99 } } ) }

  it "has a list of dishes" do
    expect(subject).to respond_to(:dishes)
  end

  describe "#dishes" do

    it "is populated on intialize" do
      expect(subject.dishes).to eq( { rice: 10.99, pizza: 5.99 } )
    end
  end

  describe "#view_dishes" do
    it "displays list of dishes and prices" do
      expect(subject.view_dishes).to eq({ rice: 10.99, pizza: 5.99 })
    end
  end

end