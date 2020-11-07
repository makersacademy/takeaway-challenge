require 'menu'

describe Menu do

  it "Is instance of the Menu class" do
    expect(subject).to be_instance_of(Menu)
  end

  it "Has 15 items in menu after loading" do # this is a magic number
    expect(subject.menu.length).to eq(15)
  end

  it "Prints to stdout when .print_menu is called" do
    expect { subject.print_menu }.to output.to_stdout
  end



end
