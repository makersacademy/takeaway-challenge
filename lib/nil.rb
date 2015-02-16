class NilClass
 def to_hash
   to_h
 end
end
data = {test: :t}.merge!(nil)
