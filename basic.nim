#[
  This is basic Nim code.

  #[
     Note: these can be nested!!
  ]#
]#

#
# var, const, let
#
var x, y = 3
echo "x ", x  # => "x 3"
echo "y ", y  # => "y 3"
x = 42
echo "x ", x  # => "x 42"
echo "y ", y  # => "y 3"

echo "x + y = ", $(x + y)

const a = "abc"
# a = "xyz" # Illegal

let p = "abc"
# p = "xyz" # Illegal

# const input = readLine(stdin) # Error: constant expression expected
# let input = readLine(stdin)   # works

#
# Types
#

echo 0..10   # 0..10
echo 0..<10  # 0..9
echo 0..^10  #

type
  MySubrange = range[0..5]
  CharSet = set[char]
  IntArray = array[0..5, int]
  IntSeq = seq[int]
  Person = tuple[name: string, age: int]
var
  carset: CharSet
  array: IntArray
  seq: IntSeq
  person: Person

carset = {'a'..'z', '0'..'9'}
array = [1, 2, 3, 4, 5, 6]
seq = @[1, 2]
person = (name: "Peter", age: 30)
echo person.name
echo person.age


# Statements
#

# if
const num = 1
if num > 0:
  echo "foo"
elif 2 > num:
  echo "bar"
else:
  echo "piyo"

# when
# The when statement is almost identical to the if statement, but with these differences:
# * Each condition must be a constant expression since it is evaluated by the compiler.
# * The statements within a branch do not open a new scope.
# * The compiler checks the semantics and produces code only for the statements that belong to the first condition that evaluates to true.
# The when statement is useful for writing platform specific code, similar to the #ifdef construct in the C programming language.
when system.hostOS == "windows":
  echo "running on Windows!"
elif system.hostOS == "linux":
  echo "running on Linux!"
elif system.hostOS == "macosx":
  echo "running on Mac OS X!"
else:
  echo "unknown operating system"

# case
const name = "Dave"
case name
of "":
  echo "Poor soul, you lost your name?"
of "name":
  echo "Very funny, your name is name."
of "Dave", "Frank":
  echo "Cool name!"
else:
  echo "Hi, ", name, "!"

# for
for i in 1..10:
  stdout.write i, ","
echo ""

#
# Procedures
#
proc add(num1: int, num2 = 1): int =
  return num1 + num2

echo add(1)
echo add(1, 2)
echo add(num1 = 1, num2 = 2)
discard add(1, 2) # discard return value

proc add(str1: string, str2 = "!!"): string =
  return str1 & str2

echo add("foo")


# A procedure that returns a value has an implicit result variable declared that represents the return value.
# A return statement with no expression is a shorthand for return result.
# The result value is always returned automatically at the end of a procedure if there is no return statement at the exit.
proc sumTillNegative(x: varargs[int]): int =
  for i in x:
    if i < 0:
      return
    result = result + i

echo sumTillNegative() # echos 0
echo sumTillNegative(3, 4, 5) # echos 12
echo sumTillNegative(3, 4 , -1 , 6) # echos 7


proc divmod(a, b: int; res, remainder: var int) =
  res = a div b        # integer division
  remainder = a mod b  # integer modulo operation

var
  num1, num2: int
divmod(8, 5, num1, num2) # modifies x and y
echo num1
echo num2
