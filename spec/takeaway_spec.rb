require 'takeaway'

describe Takeaway do
  let(:test) { Takeaway.new }
  
  it '#display_menu shows list of items and their cost' do
    expect { test.display_menu }.to output("1. item1 - £1.0\n2. item2 - £2.0\n3. item3 - £3.0\n").to_stdout
  end
end
