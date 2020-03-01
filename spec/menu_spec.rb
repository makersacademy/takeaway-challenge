require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  it "prints out a menu" do
    expect { menu.see_menu }.to output(String).to_stdout
  end
end
