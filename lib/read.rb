class Read
  attr_reader :stdin
  def initialize(_stdin)
    @stdin = _stdin
  end

  def read_chomp
    stdin.gets.chomp
  end
end
