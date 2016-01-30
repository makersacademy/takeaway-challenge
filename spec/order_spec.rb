require 'order'

describe Order do

  describe '#show_menu' do
    it {is_expected.to respond_to(:show_menu)}
  end
end