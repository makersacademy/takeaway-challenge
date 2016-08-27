require 'menu'

describe Menu do
  # xit 'reads a list of menu from a .csv file' do
  #
  # end

  it 'prints out a list of available items' do
    expect(subject.print_list).to include("miso soup" => 3.50)
  end




end
