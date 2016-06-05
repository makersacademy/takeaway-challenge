describe Display do

  it ':output prints the input string out to the console and opens a new line' do
    test_string = 'Karma Kaameleon'
    expect{described_class.output(test_string)}.to output(test_string + "\n").to_stdout
  end 

end 
