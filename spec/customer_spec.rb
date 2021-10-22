require 'customer'

describe Customer do

  it 'shows the current menu list' do
    expect(subject.see_menu).to eq(subject.current_menu)
  end
end