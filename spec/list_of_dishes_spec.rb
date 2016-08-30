require 'list_of_dishes'

describe ListOfDishes do

  it 'displays list of dishes to user' do
    expect(subject.display_list).to eq(["burger - 9\n", "fries - 3\n", "sandwich - 6\n"])
  end

end
