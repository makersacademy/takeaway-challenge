require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it { is_expected.to respond_to :view_menu }

  # it 'shows a menu of dishes with prices' do
  #   expect(takeaway.view_menu).to eq({})
  # end

end
