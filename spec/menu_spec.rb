require 'menu'

describe Menu do

  it 'puts out a list of dishes with prices' do
    expect(subject.read).to eq({"Fish and chips" => 7, "Steak and chips" => 10,
                                "Shepherd's Pie" => 5, "Bangers and mash" => 5})
  end

end
