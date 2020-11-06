class Food
  @@id = 1
  attr_reader :id

  def initialize
    @id = @@id
    @@id += 1
  end
end