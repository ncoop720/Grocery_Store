class Product

	attr_accessor :name, :quantity, :product_id, :cost, :sell_price

	def initialize(name, quantity, product_id, cost, sell_price)
		@name = name
		@quantity = quantity
		@product_id = product_id
		@cost = cost
		@sell_price = sell_price
	end
end

def main_menu
	system "clear"
	puts "Grocery Store Main Menu"
	puts "-----------------------------------"

	@categories.each do |category, index|
		puts "#{category}"
	end

	puts ""
	print "Enter a category or enter 0 to exit: "
	input = gets.chomp.capitalize

	if @categories[input]
		category_menu(input)
	elsif input == "0"
		exit
	else
		main_menu
	end
end

def category_menu(category)
	system "clear"
	puts "#{category} Menu"
	puts "-----------------------------------"

	@categories[category].each do |product|
		puts "#{product.name}"
	end

	puts ""
	puts "Commands"
	puts "-----------------------------------"
	puts "Enter 1 to add a product to this category"
	puts "Enter 2 to return to Main Menu"
	puts ""
	print "Enter product name or command number: "
	input = gets.chomp.capitalize
	index = product_index(category, input)

	if input == "1"
		puts ""
		print "Enter product name: "
		new_name = gets.chomp.capitalize
		print "Enter the quantity: "
		new_quantity = gets.chomp.to_i
		print "Enter the cost: "
		new_cost = gets.chomp.to_f
		print "Enter the sell price: "
		new_sell_price = gets.chomp.to_f
		new_product_id = category[0].downcase + @categories[category].length.to_s
		@categories[category].push(Product.new(new_name, new_quantity, new_product_id, new_cost, new_sell_price))
		category_menu(category)
	elsif input == "2" 
		main_menu
	elsif index == false
		category_menu(category)	
	else
		product_menu(category, index, input)
	end
end

def product_index(category, name)
	index = false
	@categories[category].each do |product|
		if product.name == name
			index = @categories[category].index(product)
		end
	end

	return index
end

def product_menu(category, index, name)
	system "clear"
	puts "#{name} Menu"
	puts "-----------------------------------"
	puts "Quantity: #{@categories[category][index].quantity}"
	puts "Product ID: #{@categories[category][index].product_id}"
	puts "Cost: $#{@categories[category][index].cost}"
	puts "Sell Price: $#{@categories[category][index].sell_price}"
	puts ""
	puts "Commands"
	puts "-----------------------------------"
	puts "Enter 1 to change the quantity of this product"
	puts "Enter 2 to change the cost of this product"
	puts "Enter 3 to change the sell price of this product"
	puts "Enter 4 to return to #{category} Menu"
	puts "Enter 5 to return to Main Menu"
	puts ""
	print "Enter command number: "
	command = gets.chomp.to_i
	puts ""

	case command
	when 1
		print "What would you like to change the quantity to?: "
		@categories[category][index].quantity = gets.chomp.to_i
		product_menu(category, index, name)
	when 2
		print "What would you like to change the cost to?: "
		@categories[category][index].cost = gets.chomp.to_f
		product_menu(category, index, name)
	when 3
		print "What would you like to change the sell price to?: "
		@categories[category][index].sell_price = gets.chomp.to_f
		product_menu(category, index, name)
	when 4
		category_menu(category)
	when 5
		main_menu
	else
		product_menu(category, index, name)
	end
end

# ---------------------- Main Program ---------------------- #

apple = Product.new("Apple", 100, "f0", 0.25, 0.50)
banana = Product.new("Banana", 100, "f1", 0.25, 0.50)
orange = Product.new("Orange", 100, "f2", 0.50, 1.00)
pineapple = Product.new("Pineapple", 100, "f3", 1.00, 2.00)
mango = Product.new("Mango", 100, "f4", 0.75, 1.50)
celery = Product.new("Celery", 100, "v0", 0.25, 0.50)
spinach = Product.new("Spinach", 100, "v1", 0.25, 0.50)
broccoli = Product.new("Broccoli", 100, "v2", 0.50, 1.00)
kale = Product.new("Kale", 100, "v3", 1.00, 2.00)
carrot = Product.new("Carrot", 100, "v4", 0.75, 1.50)

@categories = {"Fruit" => [apple, banana, orange, pineapple, mango], "Vegetable" => [celery, spinach, broccoli, kale, carrot]}

main_menu













