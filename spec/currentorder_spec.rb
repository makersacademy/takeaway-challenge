require 'currentorder'

describe CurrentOrder do
  subject(:currentorder){double :currentorder}

  it 'has menu with qualitys' do
    expect(currentorder.view_menu).to eq menu.menu_view

  end

end
