require 'menu'

describe Menu do
  it "should load menu from csv file" do
    subject.load_menu
    expect(subject.menu).to_not eq nil
  end
end
