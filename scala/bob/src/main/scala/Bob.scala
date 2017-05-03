class Bob {
  def hey(statement: String): String = {
    if (statement.toUpperCase == statement)
      "Whoa, chill out!"
    else if (statement.last == '?')
      "Sure."
    else
      "Whatever."
  }
}
