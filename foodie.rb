class Order
	attr_accessor :items, :oid, :cust_nm, :status 
	@@ocnt=1
	def initialize
		@oid=@@ocnt
		@cust_nm
		@status
		@items=Hash.new
	end
end

class OrderManager
	@@menu={"PavBhaji"=>70,"MDosa"=>40,"ChholeBhature"=>80,"Pulav"=>60}
	def initialize
		puts "System Started..."
		@orders = Array.new
	end

	public
	def newOrder
		order=Order.new
		print "Customer Name: "
		order.cust_nm = gets.chomp
		flag = "Y"
		while flag=="Y"||flag=="y"
			print "Dish name: "
			dnm = gets.chomp
			if @@menu.has_key?(dnm)
				price = @@menu[dnm]
				order.items.store(dnm,price)
				print "Do you want to add more item: "
				flag = gets.chomp
			else
				print "Do you want to try another dish: "
				flag = gets.chomp
			end
		end
		order.status="Confirmed"
		@orders << order
	end

	public
	def changeStatus(id)
		if @orders[id]
			print "Enter new status: "
			@orders[id].status = gets.chomp
		end
	end

	public
	def displayOrder(id)
		if @orders[id]
			total=0
			puts "O_id: #{@orders[id].oid}"
			puts "Customer: #{@orders[id].cust_nm}"
			puts "----Ordered Item(s)----"
			@orders[id].items.each do |key,val|
				puts "  #{key}    Rs.#{val}"
				total+=val
			end
			puts "Total Amount: #{total}"
			puts "Status: #{@orders[id].status}"
		end
	end
end

O1=OrderManager.new
choice="Y"
while choice=="Y"||choice=="y"
	puts "\n----Order Management System----"
	puts " 1.Take Order"
	puts " 2.Change Status"
	puts " 3.Display Order"
	puts " 4.Exit"
	print "Which Operation: "
	op_no = gets.to_i
	case op_no
		when 1
			O1.newOrder
		
		when 2
			print "Enter O_id: "
			id = gets.to_i-1
			O1.changeStatus(id)
		
		when 3
			print "Enter O_id: "
			id = gets.to_i-1
			O1.displayOrder(id)

		when 4
			choice="N"

		else
			puts "Invalid Operation"
	end
end


