def caesar_cipher plain_text, key
	cipher = ""

	plain_text.each_byte do |c|
		if (c >= "a".ord && c <= "z".ord) # between a-z
			cipher << ((((c - "a".ord) + key) % 26) + "a".ord).chr
		elsif (c >= "A".ord && c <= "Z".ord) # between A-Z
			cipher << ((((c - "A".ord) + key) % 26) + "A".ord).chr
		else
			cipher << c.chr
		end
	end

	cipher
end
