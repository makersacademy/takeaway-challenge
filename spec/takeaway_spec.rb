require './lib/takeaway'

describe Takeaway do
  subject {Takeaway.new}

  it { is_expected.to be_instance_of(Takeaway) }

  it { should respond_to :dishes }

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
  expect(order << "Pizza")
end
end
