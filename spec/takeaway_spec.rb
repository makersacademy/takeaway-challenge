require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double :menu , {'Vegan McChicken': 5.55 } }


end
