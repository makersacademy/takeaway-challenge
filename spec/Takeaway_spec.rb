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
end
