# Written by Niket Desai
# This program is used to generate insults based on two arrays of string inputs.

class Insult
  @@insultStart = Array["Nice hat", 
                            "Good haircut", 
                            "Nice monicle", 
                            "Cool shirt", 
                            "Fantastic pants", 
                            "Way to show off your talents", 
                            "You're not very smart", 
                            "Amazing work...kidding"]
                            
  @@insultEnd = Array["jerk-off weirdo", 
                          "garden snake", 
                          "slime-crunch", 
                          "bitch-ass", 
                          "head-erection", 
                          "recalcitrant", 
                          "php lover", 
                          "ant eating bastard", 
                          "sugar coated cream puff", 
                          "rainbow seeking troll" ]

  # This will return a string insult generated from two random elements 
  # selected from the class variables @@insultStart and @@insultEnd
  def makeInsult    
    insult =  "Try this one: #{@@insultStart.sample}, you #{@@insultEnd.sample}"
    return insult
  end
end
