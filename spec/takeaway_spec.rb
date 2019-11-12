require './lib/takeaway'

describe Takeaway do
  subject {Takeaway.new}

  it { is_expected.to be_instance_of(Takeaway) }

  it { should respond_to :dishes }

  describe "initialize" do
    subject {:dishes}
    let :dishes do
      [
        { name: "Pizza" , price: "£15.50" },
        { name: "Burger" , price: "£16.30" },
        { name: "Pasta" , price: "14.20" },
        { name: "Sushi" , price: "£14.60" },
        { name: "Noodles" , price: "£15.20" }
      ]
      # expect(@dishes).to be_an_instance_of(Array)

    end


  end



end
