describe Display do

  it ':output prints the input string out to the console + opens a new line' do
    string = 'Karma Kaameleon'
    expect{described_class.output(string)}.to output(string + "\n").to_stdout
  end 

end 
