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
        { name: "Pasta" , price: "14.20" },
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
  expect(subject.order).to be_an_instance_of(Array)

#Need to insertt another method in here (also in lib) that will extract the hash and add it up

  expect(subject.volume).to eq [2]
# ordered_number = order.each_with_object(Hash.new(0)) { |name, hash| hash[name] += 1 }
# expect(ordered_number[:Pizza]).to eq 2


end
  # expect(order.count("Pizza")).to eq 2

end

# it "adds up how many of each item are ordered" do
#   item_frequency_hash = {}

#   expect(order.total).to eq 2
# end
