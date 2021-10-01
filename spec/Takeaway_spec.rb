require 'Takeaway'

describe Takeaway do
  it 'creates an items array' do
    expect(subject.instance_variable_get(:@items)).to eq []
  end

  it 'displays menu' do
    output = Menu.displayMenu
    expect { subject.displayMenu }.to output(output).to_stdout
  end
  
  it 'does not add item when invalid' do
    expect {subject.pickItem("Invalid") }.to raise_error "That item is not valid"
  end

  it 'adds item when valid' do
    subject.pickItem("spring roll")
    expect(subject.instance_variable_get(:@items)).to eq(["spring roll"])
  end

  it 'displays correct reciept' do
    items = ["spring roll", "pork dumpling", "char sui bun"]
    output = Menu.getItemAndCost(items) + Menu.getCost(items).to_s + "\n"
    expect { subject.getReciept(items) }.to output(output).to_stdout
  end

  it "displays 'oredered' when oredered" do
    output = "Thank you! Your order was placed and will be delivered before 18:52"
    expect { subject.order }.to output(output).to_stdout
  end

  it "clears array when ordered" do
    subject.pickItem("spring roll")
    subject.order
    expect(subject.instance_variable_get(:@items)).to eq []
  end

end
