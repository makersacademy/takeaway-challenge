require "menu"

describe Menu do

  it "initilizes with DEFAULT_DISHES" do
    expect(subject.dishes).to eq({
      'Burger'=>5.75,
      'Coke'=>1.50,
      'Fries'=>2.25
    })
  end

  it "lists dishes in the menu and numbers them" do
    expect { subject.print }.to output { 
      "1. Burger. Price: £5.75\n2. Coke. Price: £1.5\n3. Fries. Price: £2.25\n"
    }.to_stdout
  end

end


