require 'takeaway'

describe Takeaway do
  it 'displays a welcome message to customers' do
    expect { subject }.to output("\nWelcome to Shirt and Thai!\n\nPlease take a look at our menu:").to_stdout
  end
  it 'displays a menu to the user' do
    expect { subject.menu }.to output(pretty_format(MENU)).to_stdout
  end
  it '#user_selection' do
    allow(subject).to receive(:user_selection).and_return(subject.interpreter(anything))
    expect(subject.user_selection).to eq subject.interpreter(anything)
  end
end
