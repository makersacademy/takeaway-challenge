require 'menu'

describe Menu do

  subject(:Menu) { described_class.new }
  
  it 'displays the menu' do
    expect{ subject.print_menu }.to output.to_stdout
  end 
end


