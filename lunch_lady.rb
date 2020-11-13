# the user chooses from a list of main dishes
# the user chooses 2 side dish items
# computer repeats users order
# computer totals lunch items and displays total
# BONUS
# the user can choose as many "add-on" items as they want before getting total
# the user can clear their choices and start over
# the user has a wallet total they start with and their choices cannot exceed what they can pay for
# the program is in a loop to keep asking the user to make new orders until they type 'quit' at any time
# main dishes and side items have descriptions with them and the user has an option to view the description /nutritional facts before they order (hint: think hashes)
# descriptions of food can have multiple options like nutritional facts, calories, fat content ect...(hint: think nested hashes)
# display to the user not only their total but the total fat content/calories / carbs / etc...
@mains = [
  {name: "Full Rack of Ribs", price: "14.00"}, 
  {name: "Pulled Pork", price: "12.00"}, 
  {name: "Pineapple Grilled Chicken", price: "10.00"}, 
  {name: "Tri-Tip", price: "17.00"}, 
  {name: "Double Cheeseburger", price: "9.00"} 
]

@sides = [
  {name: "Mash potatoes", price: "2.50"}, 
  {name: "Waffle Fries", price: "2.75"}, 
  {name: "Side Salad", price: "1.50"}, 
  {name: "Collared Greens", price: "3.00"}, 
  {name: "Fruit Salad", price: "1.00"}, 
  {name: "Rolls with Cinammon Butter", price: "2.00"} 
]

@alt_sides = @sides.clone
@alt_mains = @mains.clone

@order = []


def get_name
  puts " "
  puts "**** Welcome to BBQ Ruby ****"
  puts " "
  puts "Can I get a name for the order?"
  puts " "
end

def start
  puts " "
  self.get_name
  name = gets.strip
  puts "Thank you! What meat can I get for you?"
  puts " "
  self.main_dish
end

def main_dish
  @alt_mains.each_with_index do |main, index|
    puts "#{index + 1}, #{main[:name]} #{main[:price]}"
    end
    puts " "
  
  side_dish1
end

def side_dish1
  choice = gets.strip.to_i
  @order << @alt_mains[choice - 1]
  puts " "
  puts "Thank you! You get 2 sides. Whats your first choice?"
    @alt_sides.each_with_index do |side1, index|
    puts "#{index + 1}, #{side1[:name]} #{side1[:price]}"
    end
    puts " "

    self.side_dish2
  end

  
  def side_dish2
    choice = gets.strip.to_i
  @order << @alt_sides[choice - 1]
  @alt_sides.delete_at (choice - 1)
  puts "And your second choice?"
    @alt_sides.each_with_index do |side2, index|
    puts "#{index + 1}, #{side2[:name]} #{side2[:price]}"
    end
    puts " "
    self.total
  end

def total
  choice2 = gets.strip.to_i
  @order << @alt_sides[choice2 - 1]
puts "This is your order total. Does it look correct?"
  @order.each_with_index do |order, index|
  puts "#{index + 1}, #{order[:name]} #{order[:price]}"
  end
 
  sum = @order.map {|key| key.values[1]}
      total= sum.map(&:to_f)
      puts "Your Total is $ #{total.inject(:+)}"
      puts " "

end
start