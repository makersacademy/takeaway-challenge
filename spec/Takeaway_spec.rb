require 'Takeaway'

describe Takeaway do
  it 'creates an items array' do
    expect(subject.instance_variable_get(:@items)).to eq nil
  end

  it 'displays menu' do
    output = Menu.displayMenu
    expect { subject.displayMenu }.to output(output).to_stdout
  end
end
