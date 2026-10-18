What is it?
A function is a named block of code you define once and call as many times as you like, instead of repeating the same lines.

Defining and calling

bash
greet() {
  echo "Hello!"
}

greet

Arguments inside a function

bash
greet() {
  echo "Hello, $1"
}

greet "Dot"

Inside a function, $1, $2, $@, $# refer to the arguments the function was called with, not the script’s own arguments.

Getting a value out — echo + $(...)

bash
make_greeting() {
  echo "Hello, $1"
}

result=$(make_greeting "Dot")
echo "$result"

Use this when you want the function to produce a value: text, a number, a sentence.

Signaling success/failure — return

bash
is_even() {
  if (( $1 % 2 == 0 )); then
    return 0   # 0 = success
  else
    return 1   # non-zero = failure
  fi
}

if is_even 4; then
  echo "4 is even"
fi

return only holds a whole number from 0–255, and by convention 0 means pass/true, anything else means fail/false. $? holds the status of the last command run. Because if checks a command’s status directly, a function using return can be used straight inside if function_name; then, with no $(...) needed.

echo vs return — the rule

Want to hand back a value (text, a count, a result)? → echo it, capture with $(...).
Want to signal pass/fail so if/&&/|| can react directly? → return a status code.

local variables

bash
x=100

change_x() {
  local x
  x=1
  echo "Inside: $x"
}

change_x
echo "Outside: $x"   # still 100

local keeps a variable scoped to the function, so it can’t accidentally overwrite a variable of the same name outside it. Good habit: local any variable you only need inside the function.

Common mistakes

Using return to try to hand back text or a large number — it only works for whole numbers 0–255 and wraps around above that.
Forgetting local, which lets a function quietly overwrite an outer variable with the same name.
Mixing the two patterns — e.g. trying to capture a return-based function with $(...), which captures its printed output, not its status.
