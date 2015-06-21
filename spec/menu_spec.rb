require 'menu'

describe Menu do

  it 'has a menu when initialised' do
    expect(subject.menu).not_to be_empty
  end

  it { is_expected.to respond_to :display_menu }

end
