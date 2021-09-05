require 'menu'

describe Menu do 
  
  it { is_expected.to respond_to (:display_menu) }

  it "displays the list of dishes and their prices" do
    menu = Menu.new
    expect{ subject.display_menu }.to output(@list).to_stdout

  end 
end