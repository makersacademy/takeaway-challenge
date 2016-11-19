require 'interface'

describe Interface do
  let(:dishes_menu) { Class.new { :show_dishes } }
  let(:name) { double(:name) }
  subject(:interface) {described_class.new(name, dishes_menu)}

  it "Welcomes the user" do
    message = "Welcome to #{name}, if you are hungry you came to the right place!"
    expect {interface.welcome}.to output(message).to_stdout
  end

  it "Has a menu of possible actions" do
    expect(interface.actions_menu).to be_a(String)
  end

end
