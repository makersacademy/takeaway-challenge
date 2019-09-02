require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  
  it 'formats and outputs the menu' do
    expect { subject.show_menu }.to output.to_stdout
  end 
end
