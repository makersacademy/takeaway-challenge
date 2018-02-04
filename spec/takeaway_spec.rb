require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new                     }
  let(:menu) { double('menu')                          }
  let(:order)

  it 'is initialized with a menu object' do
    takeaway.menu
  end

end
