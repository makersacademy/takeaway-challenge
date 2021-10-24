class Read
  attr_reader :stdin
  def initialize(stdin)
    @stdin = stdin
  end

  def read_chomp
    stdin.gets.chomp
  end
end
