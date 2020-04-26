require 'menu'

describe Menu do

  it "Is able to store a list of dishes with name and price." do
    subject.add_dish("Special", "8.50")
    expect(subject.items).to contain_exactly(:name => "Special", :price => "8.50")
  end

  it "Is able to display the list of dishes with index." do
    $stdout = StringIO.new
    subject.add_dish("Special", "8.50")
    subject.list
    $stdout.rewind
    expect($stdout.gets.strip).to eq('1. Special, £ 8.50')
    # test based on https://stackoverflow.com/a/34667028
  end
end
