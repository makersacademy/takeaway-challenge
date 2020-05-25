require 'takeaway'

describe Takeaway do

  it 'prints a list of dishes' do
    expect { subject.show_menu }.to output.to_stdout
  end

end
