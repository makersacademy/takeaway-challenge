require 'pry'

describe "let example" do
  let(:number_a) { rand 1000 }

  def number_b
    @number_b ||= rand 1000
  end

  it 'works' do
  end

end
