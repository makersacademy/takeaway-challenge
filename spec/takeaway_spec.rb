require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double :menu }
  let(:order) { double :order }

  it { expect(takeaway).to respond_to :display_menu }
  it { expect(takeaway).to respond_to :create_order }
  it { expect(takeaway).to respond_to :complete_order }
  it { expect(takeaway).to respond_to :send_text }



end
