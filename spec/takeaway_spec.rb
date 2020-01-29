require 'takeaway'

describe Takeaway do
  it 'shows a menu' do
    expect { subject.show_menu }.to output.to_stdout
  end
end
