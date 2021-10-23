require 'ui'
require 'menu'
PRINTED_LIST = "1 Spaghetti:12\n2 Maccaroni:9\n".freeze
describe Ui do
  it "should display menu" do
    $argument = ""
    menu_mock = double("menu", :display_dishes => PRINTED_LIST)
    subject = Ui.new(menu_mock)
    allow(subject).to receive(:puts) { |arg| $argument = arg }
    subject.display
    expect($argument).to eq(PRINTED_LIST)
  end
end
