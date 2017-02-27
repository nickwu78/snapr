require "zlib"

class SnaprMessage
	MAX_SIZE = 66560
	attr_accessor :message

	def initialize(message)
		@message = message
	end

	def encode_to_ascii
		data_compressed = Zlib::Deflate.deflate(@message)
			if data_compressed.size > MAX_SIZE
				puts "File size exceeds maximum"
				exit
			else
				puts "Compressed size: #{data_compressed.size}"
				return data_compressed
			end
	end

	def self.decode_from_ascii(encoded_string)
		SnaprMessage.new Zlib::Inflate.inflate(encoded_string)
	end

end
