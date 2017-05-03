class Bob {
  def hey(statement: String): String = {
    if (statement.trim.size == 0)
      "Fine. Be that way!"
    else if (statement.toUpperCase == statement && statement.toLowerCase != statement)
      "Whoa, chill out!"
    else if (statement.last == '?')
      "Sure."
    else
      "Whatever."
  }
}
