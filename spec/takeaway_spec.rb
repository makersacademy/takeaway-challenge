require 'takeaway'

describe Menu do 
  it ' should respond to see' do 
  expect(subject).to respond_to(:see)
end

  it " should display the menu " do 
    expect(subject.menu).to receive(:each)
    subject.see
  end

  it 'allows a user to select an item on the menu' do 
    expect(subject.select_pizza 1).to eq ["1.Margherita"]
  end

  it 'returns the sum of the orders' do
    subject.select_pizza 1
    subject.select_pizza 2
    subject.select_pizza 3
    subject.select_pizza 4
    expect(subject.total).to eq 31.50
  end

  xit 'sends a text command to Send_Text' do
    send = double :send 
    expect(send).to receive(:text)
  end

end


