require 'menu'

describe Menu do

  it { is_expected.to be_an_instance_of(Menu) }
  it { is_expected.to respond_to(:menu_list) }

end