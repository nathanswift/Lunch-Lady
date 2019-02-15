require "pry"

class LunchLady
   @total = []

   def list(dish)
       puts "What do you want?"
       dish.each_with_index do |food, index|
           puts "#{index + 1}) #{food[:dish]} $#{food[:price]}"
       end
   end

   def initialize
       @total = []
      menu
   end

   def menu
       puts "Main Menu"
       puts "Please make a selection"
       puts "1) Entree"
       puts "2) Side"
       puts "3) Beverage"
       puts "4) Dessert"
       puts "5) Proceed to checkout"
       puts "6) Exit"
       user_selection
   end

   def user_selection
       choice = gets.to_i
       case choice
       when 1
           main_dish
       when 2
           side_dish
       when 3
           beverage
       when 4
           dessert
       when 5
           checkout
       when 6
           puts "Goodbye!"
           Exit
       else
           puts "Invalid Choice"
       end
   end

   def main_dish
       @mainOpt = [
           { dish: "Chicken", price: 10 },
           { dish: "Steak", price: 15 },
           { dish: "Salmon", price: 20 },
           { dish: "Tofu", price: 8 }
      ]
      list(@mainOpt)
      choice = gets.to_i
      case choice
      when 1
       @total << 10
       menu
      when 2
       @total << 15
       menu
      when 3
       @total << 20
       menu
      when 4
       @total << 8
       menu
      else
       puts "Invalid choice"
       main_dish
      end
   end

   def side_dish
       @sideOpt = [
           { dish: "Fries", price: 5 },
           { dish: "Salad", price: 8 },
           { dish: "Tots", price: 3 }
       ]
       list(@sideOpt)
       choice = gets.to_i
       case choice
       when 1
           @total << 5
           menu
       when 2
           @total << 8
           menu
       when 3
           @total << 3
           menu
       else
           puts "Invalid choice"
           side_dish
       end
   end

   def beverage
       @beverages = [
           { dish: "Water", price: 0},
           { dish: "soda", price: 2 },
           { dish: "tea", price: 3 }
       ]
       list(@beverages)
       choice = gets.to_i
       case choice
       when 1
           @total << 0
           menu
       when 2
           @total << 2
           menu
       when 3
           @total << 3
           menu
       else
           puts "Invalid choice"
           beverage
       end
   end

   def dessert
       @desserts = [
           { dish: "Cake", price: 10 },
           { dish: "Ice Cream", price: 5 },
           { dish: "Milkshake", price: 2 }
       ]
       list(@desserts)
       choice = gets.to_i
       case choice
       when 1
           @total << 10
           menu
       when 2
           @total << 5
           menu
       when 3
           @total << 2
           menu
       else
           puts "Invalid choice"
           dessert
       end
   end

   def checkout
       puts "Do you want to order more?"
       puts "(y/n)"
       print ">"
       answer = gets.strip.downcase
           if answer == "y"
               menu
           elsif answer == "n"
               ringout
           else
               checkout
           end
   end

   def ringout
       sum = 0
       order =
       @total.each { |a| sum+=a }

       puts "Total: $#{sum}"
   end

end

order = LunchLady.new

