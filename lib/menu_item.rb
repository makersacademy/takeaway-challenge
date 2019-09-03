MenuItem = Struct.new(:name, :price) do
  def to_string(conjoiner = '-')
    "#{name} #{conjoiner} #{price}"
  end
end