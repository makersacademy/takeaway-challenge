require 'takeout'

describe TakeOut do
  it 'has a list of dishes with prices' do
    expect(subject.show_menu).to eq @menu
  end

end
