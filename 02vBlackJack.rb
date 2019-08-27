def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  array = (1..11).to_a
  array.sample
end

def display_card_total(card_total)
  puts "Cards add up to #{card_total}"
end

def display_dealer_card_total(card_total)
  puts "The dealer's cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  input = gets.chomp
  input
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
card_total = 0
card_total += deal_card
card_total += deal_card
display_card_total(card_total)
card_total
end

def invalid_command
  puts "That is an invalid comment. You have only the following options:"
end

def win
  puts "Congratulations. You have won the game."
end

def loss
  puts "You lost the Game"
end

def hit_order
  points = initial_round
    until points > 21
    prompt_user
    response = get_user_input
      if response == "h"
      points += deal_card
          if points <= 21
            display_card_total(points)
            points
          else
          end_game(points)
          break
          end
      elsif response == "s"
        puts "Your final hand adds up to #{points}."
        break
      else
      invalid_command
      end
    end
   points 
end

def dealer
  puts "Now it's the dealer's turn"
  points = initial_round
  while points < 17
    points += deal_card
  end
  display_dealer_card_total(points)
  points
end  

def runner
  player_points = hit_order.to_i
  dealer_points = dealer.to_i
  if player_points > 21
    loss
  elsif player_points < 21 && dealer_points > 21
    win
  elsif player_points == dealer_points
    puts "It's a draw."
  else
    if player_points > dealer_points
      win
    else
      loss
    end
  end
end
