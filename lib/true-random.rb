require 'net/http'

module TrueRandom
  class Random
    def integer n=1, min=1, max=100, base = 10
      return integers "integers/?num=#{n}&min=#{min}&max=#{max}&col=1&base=#{base}"
    end

		def sequence min=1, max=100
			return integers "sequences/?min=#{min}&max=#{max}&col=1"
		end

    def quota ip = false
    	if ip
    		return integers "quota/?"
    	else
    		return integers "quota/?ip=#{ip}"
    	end

  	end

    private
    def integers uri
      response = request uri

      return false unless response
      return response[0].to_i if response.count == 1
      return response.collect {|x| x.to_i }
    end

    def strings uri
      response = request uri

      return false unless response
      return response[0] if response.count == 1
      return response
    end

    def request uri
      http_response = Net::HTTP.get_response(URI.parse('http://www.random.org/' + uri + '&format=plain&rnd=new'))
      return false unless http_response.code.to_i == 200
      results = []
      http_response.body.split("\n").each do |item|
        results << item
      end
      results
    end

	end
end
