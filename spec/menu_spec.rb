require 'menu.rb'

describe Menu do

  subject(:menu) {described_class.new}
  let(:menu_contents) {{:lemon drizzle=>2, :brownie=>1}}

  it 'should show the menu' do
    expect{menu.menu_display}.to output.to_stdout
  end

end
