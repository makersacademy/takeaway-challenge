require 'order'

describe Order do

  it "shows menu options from Menu class" do
    expect(subject.see_options).to eq([])
  end

  it 'allows the user to select meals' do
    expect(subject.select_meal("meal")).to change{subject.new_order}
  end

end
