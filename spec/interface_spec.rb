require 'interface'

describe Interface do

  let ( :interface ) { Interface.new }

  it "actually is a real interface" do
    interface
  end

  it "shows you a welcome screen" do
    expect { interface.welcome }.to output("Welcome to Samurai Pizza.\n").to_stdout
  end

end
