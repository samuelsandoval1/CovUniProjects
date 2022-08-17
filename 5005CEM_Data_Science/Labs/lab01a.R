# Fizzbuzz
for (i in 1:20)
{
  if (i%%15==0)
    cat("FIZZBUZZ ")
  else if (i%%3==0)
    cat("fizz ")
  else if (i%%5==0)
    cat("buzz ")
  else
    cat(i," ")
}
