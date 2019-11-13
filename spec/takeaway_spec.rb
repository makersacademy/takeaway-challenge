require './lib/takeaway'

describe Takeaway do
  subject {Takeaway.new}

  it { is_expected.to be_instance_of(Takeaway) }

  it { should respond_to :dishes }

  it { should respond_to :order }


  it "displays dishes and their prices" do
    # subject {:dishes}
    expect(subject.dishes). to eq [
        { name: "Pizza" , price: "£15.50" },
        { name: "Burger" , price: "£16.30" },
        { name: "Pasta" , price: "£14.20" },
        { name: "Sushi" , price: "£14.60" },
        { name: "Noodles" , price: "£15.20" }
      ]
      # expect(@dishes).to be_an_instance_of(Array)
end



it "makes a record of the dishes ordered" do
  subject.select("Pizza")
  order = []
  expect(subject.order).to be_an_instance_of(Array)
  expect(order << "Pizza")

end

it "counts the quantity of each item in the order" do
subject.select("Pizza")
subject.select("Pizza")
  order = []
  ordered_number = {}
  expect(subject.order).to be_an_instance_of(Array)
  # expect(ordered_number).to have_key(:Pizza)
  expect(subject.volume).to include("Pizza" => 2)

end

it "multiplies the volume of an item by its price" do
subject.select("Pizza")
subject.select("Pizza")
  expect(subject.total ).to eq [31]

#The last method is bringing uip the following error,  NoMethodError:
# undefined method `key?' for nil:NilClass
end
end
