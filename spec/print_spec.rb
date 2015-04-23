require 'print'

describe Print do
  let(:menu) { double(:menu) }
  xit 'display menu' do
    allow(menu).to receive(:menu_content) { { "1" => { "dish" => "Roasted pork", "price" => "8" } } }
    expect(subject.display_menu menu).to eq("1. Roasted pork - £8")
  end
end
