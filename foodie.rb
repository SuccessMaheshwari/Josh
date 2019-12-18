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
ch="Y"
while ch=="Y"||ch=="y"
	puts "----Order Management System----"
	puts "\t1.Take Order"
	puts "\t2.Change Status"
	puts "\t3.Display Order"
	puts "Which Operation: "
	op = gets.to_i
	case op
		when 1
			O1.newOrder
		
		when 2
			print "Enter O_id: "
			id = gets.to_i
			O1.changeStatus(id)
		
		when 3
			print "Enter O_id: "
			id = gets.to_i-1
			O1.displayOrder(id)
	
		else
			puts "Invalid Operation"
	end
	puts "Do you want to Continue?..."
	ch = gets.chomp
end


