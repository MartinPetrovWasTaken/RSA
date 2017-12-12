require_relative '../lib/RSA.rb'

describe RSA do 
	rsa_test = RSA.new(0,0,0)
	array = rsa_test.new_key
	rsa_test = RSA.new(array[0], array[1], array[2])
	str = "VSICHKO E RUBY"

	context "Text Message" do 
		it "Encrypting" do 
			expect(rsa_test.encrypt(str)).not_to eq str
		end

		it "Decrypting" do 
			encrypted_str = rsa_test.encrypt(str)
			expect(rsa_test.decrypt(encrypted_str)).to eq str
		end
	end
end
