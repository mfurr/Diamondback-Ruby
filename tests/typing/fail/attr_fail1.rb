
class A
  attr :ro
  attr(:rw,true)
end


a = A.new
a.ro = 3
