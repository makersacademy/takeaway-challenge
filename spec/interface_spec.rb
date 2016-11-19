require 'interface'

describe Interface do
  let(:menu) { Class.new { :show_dishes } }
  let(:name) { double(:name) }
  subject(:interface) {described_class.new(name, menu)}
  it "Welcomes the user" do
    message = "Welcome to #{name}, if you are hungry you came to the right place!"
    expect {interface.welcome}.to output(message).to_stdout
  end

end
