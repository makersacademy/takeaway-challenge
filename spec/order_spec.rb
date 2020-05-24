require 'order'

describe Order do

  context '#view_order' do
    it { is_expected.to respond_to(:view_order) }
  end
end
