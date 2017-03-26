require 'menu'

describe Menu do

  it 'prints a list to the console' do
    expect {subject.display}.to output.to_stdout
  end

end
