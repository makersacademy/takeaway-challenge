require 'menu'

describe Menu do

  it 'initialize with a menu' do
    is_expected.to respond_to(:view_menu)
  end

end
