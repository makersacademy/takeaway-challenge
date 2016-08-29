require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  it 'should display list' do
    expect{menu.show_list}.to output.to_stdout
  end
end
