class Read
  attr_reader :stdin
  def initialize(stdin_att)
    @stdin = stdin_att
  end

  def read_chomp
    stdin.gets.chomp
  end
end
