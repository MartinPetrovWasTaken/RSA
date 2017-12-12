require 'prime'

class RSA
	@n = nil
	@e = nil 
	@d = nil

   def initialize n, e, d
	@n = n
	@e = e
	@d = d
	
   end
   
   def prime_gen
	rand_number = rand(1..100)
	
	arr = Prime.first rand_number
	arr[-1]
   end

   def n
	@n
   end
   
   def e
   	@e
   end
   
   def d
	@d
   end
   
   def new_key
	arr = Array.new
	p = prime_gen
	q = prime_gen
	n1 = p*q
	arr << n1
	lcm = (p - 1)*(q - 1)
	e1 = rand(1...lcm)
	
	loop do 
		for i in 1..lcm
			if e1 % i == 0 and lcm % i == 0	
				e1 = rand(1...lcm)
				break		
			end
		end
		break
	end
	arr << e1 

	for d1 in 1..lcm
		if ((e1 * d1) - 1) % lcm == 0
			break
		end
	end
	arr << d1
   end
   
   def encrypt message
	encrypted_string = String.new
	message.each_char do |ch|
		c = (ch.ord**e)%n
		encrypted_string << c.to_s
		encrypted_string << ' '
	end
	encrypted_string
   end
   
   def decrypt message 
	str = String.new	
	message.split(' ').each do |ch|
		m = (ch.to_i**d)%n
		str << m
	end
	str	
   end 
end
