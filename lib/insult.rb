# Written by Niket Desai
# This program is used to generate insults based on two arrays of string inputs.

class Insult
  @@insultStart = ["Nice hat", "Good haircut", "Nice monicle", "Cool shirt", "Fantastic pants", "Way to show off your talents", "You're not very smart", "Amazing work...kiding"]
  @@insultEnd = ["jerk-off weirdo", "asshole", "slime-crunch", "bitch-ass", "head-fart", "recalcitrant", "php lover", "ant eating bastard", "sugar coating cream puff", "rainbow seeking troll animal" ]

  # This will return a string insult generated from two random elements 
  # selected from the class variables @@insultStart and @@insultEnd
  def makeInsult    
    insult =  "Try this one: " + @@insultStart.choice + ", you " + @@insultEnd.choice
    return insult
  end
end
