require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }

  describe '#show_menu' do
    # SHOULD THIS BE A FEATURE SPEC TEST INSTEAD OF UNIT TEST? IF SO, WHAT WOULD THE TEST LOOK LIKE USING DOUBLES?
    specify { expect { takeaway.show_menu }.to output { menu.show_dishes }.to_stdout }
end
end