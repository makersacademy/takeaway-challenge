require 'takeaway'

describe Takeaway do
  let(:test) { Takeaway.new }
  
  it '#display_menu shows list of items and their cost' do
    expect { test.display_menu }.to output("* item1 - £1.0\n* item2 - £2.0\n* item3 - £3.0\n").to_stdout
  end
end