class RomeConverter
	def roman_map
	{
		1000 => "M",
		900 => "CM",
		500 => "D",
		400 => "CD",
		100 => "C",
		90 => "XC",
		50 => "L",
		40 => "XL",
		10 => "X",
		9 => "IX",
		5 => "V",
		4 => "IV",
		1 => "I"
	}
	end
	
	def roman? str
		if (str.to_s =~ /[-1234567890]/) != nil
			return 0
		end
		str.each_char do |c|
			if (c =~ /[MDCLXVI]/) == nil
				return 0
			end
		end
		return 1
	end

	def to_rome *int_arg
		if int_arg.empty? or int_arg[0].to_i <= 0 or int_arg[0].to_f.floor != int_arg[0].to_f or int_arg.length > 1
			return nil
		else
			num = int_arg[0].to_i.floor
			res = ""
			roman_map.keys.each do |div|
				q, m = num.divmod(div)
				res << roman_map[div] * q
				num = m
			end
		end
		res
	end
	def to_dec *string_arg
		if string_arg.empty? or roman?(string_arg[0]) == 0 or string_arg[0].empty? or string_arg.length > 1
			return nil
		else
			str = string_arg[0]
			sum = 0
			roman_map.values.each do |roman|
				while str.start_with?(roman)
					sum += roman_map.invert[roman]
					str.slice!(roman.length, str.length)
				end
			end
		end
		sum
	end
end
