require 'menu'

describe Menu do

  it "Is able to store a list of dishes with name and price." do
    subject.add_dish("Special", "8.50")
    expect(subject.items).to include(:name => "Special", :price => "8.50")
  end

  it "Is able to display the list of dishes with index." do
    $stdout = StringIO.new
    subject.add_dish("Special", "8.50")
    subject.list
    $stdout.rewind
    expect($stdout.gets.strip).to eq('1. Haggis Supper, £ 10.99')
    # test based on https://stackoverflow.com/a/34667028
  end

  it "Is able to display a menu header." do
    header = "       Jock'O'Byte - Take Away Menu       \n------------------------------------------\n"
    expect{subject.header}.to output(header).to_stdout
  end


  it "Is able to display the entire menu." do
    expect(subject).to receive(:header)
    expect(subject).to receive(:list)
    expect(subject).to receive(:footer)
    subject.menu
  end

end
