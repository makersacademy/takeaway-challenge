require 'menu'

describe Menu do
  subject(:menu){described_class.new}

  it 'output menu list to stdout' do
    expect{menu.list_menu}.to output.to_stdout
  end

end
