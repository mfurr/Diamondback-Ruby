
class A
  def A.f() @@x = 3 end
  def A.g() class_variable_get("@@x") end
end

A.f
x = A.g
x + 3
