require 'interface'

describe Interface do
  xit 'should give you some options' do
    expect { subject.start }.to output(/order/).to_stdout
  end
end