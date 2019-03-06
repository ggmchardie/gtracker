## Gtracker terminal app

##GEMS
#progressbar
require 'tty/progressbar'
bar = TTY::ProgressBar.new("downloading [:bar}", total: 30)
30.times do
  sleep(0.1)
  bar.advance(1)
end

#prompt
require 'tty/prompt'
prompt = TTY::Prompt.new

##Welcome message
prompt.say("Hi There! Welcome to Gtracker :)\n")

##Name prompt
prompt.ask("What is your name?")

##View or select prompt
#prompt.select("Would you like to view or set your goals?") do |menu|

##set
prompt.say("Please set your three goals", echo:true)

result = prompt.collect do
  key(:goal_one).ask("What's your first goal?", required: true)
  key(:goal_two).ask("What's your second goal?", required: true)
  key(:goal_three).ask("What's your third goal?", required: true)
  end

##view set goals
prompt.say("Here are your set goals:")
prompt.say(result[:goal_one]) 
prompt.say(result[:goal_two]) 
prompt.say(result[:goal_three])

##completed
completed = 
prompt.yes?("Have you completed any of your goals this week?")

##which were completed
if completed == true
    then
      prompt.select("Which of your goals did you complete?") do |menu|
      one = menu.choice(result[:goal_one])
      two = menu.choice(result[:goal_two])
      three = menu.choice(result[:goal_three])

      week = 
      prompt.ask("How many days this week did you complete this goal? 0-7") { |q| q.in('0-7')}

        prompt.say(week + "times!? Good job!")

  end

  else prompt.say("Keep trying, you'll get there")
        set = 
        prompt.yes?("Would you like to set some goals?")
  end

  if set == true
    then 
  else
    prompt.say ("I does not mater how slowly you go as long as you do not stop\n - Confucicius")
    end