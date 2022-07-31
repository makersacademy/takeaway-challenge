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

  it "allows user to add their number" do
    subject.addNumber("+441111111111")
    expect(subject.instance_variable_get(:@number)).to eq "+441111111111"
  end

  it "sends text message when ordered" do
    subject.addNumber
    subject.order #works if not errors thrown
  end
end
