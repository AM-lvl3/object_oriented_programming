#Standard product
class Product

	def initialize(quantity, item, price)
		@quantity = quantity
		@item = item
		@price = price
	end

	def tax_rate
		0.10
	end

	def subtotal
		@quantity * @price
	end

	def sales_tax
		subtotal * tax_rate
	end

	def total
		sales_tax + subtotal
	end

	def to_s
		"#{@quantity} #{@item}: $#{@price}"
	end
end

#Exempt products -> reference methods in standard product
class Exempt < Product

	def tax_rate
		0
	end

end

#Import products -> reference methods in standard product
class Import < Product

	def tax_rate
		super + 0.5
	end
end

#loops to pump out all the products that we add to each list
class Purchase

	def initialize
		@my_list = []
	end

	def add(product)
	@my_list << product
	end

	def calculate
		@total = 0
		@sales_tax = 0

		@my_list.each do |a|
			@sales_tax += a.sales_tax
			@total += a.total
		end
	end

	def round_tax
		round=0.05
		multiplier=(@sales_tax/round).ceil
		(multiplier*round).round(2)
	end

	def round_total
		round=0.05
		multiplier=(@total/round).ceil
		(multiplier*round).round(2)
	end

	def receipt
		calculate

		results = ""
		@my_list.each {|p| results << "#{p.to_s}\n"}
		
		results << "\n" "Sales tax: $" + round_tax.to_s + "\n"
		results << "Total: $" + round_total.to_s
	end
end

#exempt books, food, medical products
#import additional 5%

puts "\n" + "Sales Receipt\n".center(40)

list = Purchase.new

list.add Exempt.new(1, "Book", 12.49)
list.add Product.new(1, "Music CD", 14.99)
list.add Exempt.new(1, "Chocolate Bar", 0.85)

puts list.receipt

puts "\n --------------------------------- \n \n"

list = Purchase.new

list.add Import.new(1, "Imported Box of Chocolates", 10.50)
list.add Import.new(1, "Imported Bottle of Perfume", 54.65)

puts list.receipt

puts "\n --------------------------------- \n \n"

list = Purchase.new

list.add Import.new(1, "Imported Bottle of Perfume", 32.19)
list.add Product.new(1, "Bottle of Perfume", 54.65)
list.add Exempt.new(1, "Packet of Headache Pills", 9.75)
list.add Import.new(1, "Imported Box of Chocolates", 11.85)

puts list.receipt

puts "\n" 

