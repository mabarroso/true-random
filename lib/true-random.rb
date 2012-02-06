require 'net/http'

module TrueRandom
  class Random
    def integer n=1, min=1, max=100, base = 10
      response = request "integers/?num=#{n}&min=#{min}&max=#{max}&col=1&base=#{base}"

      return false unless response
      return response[0].to_i if response.count == 1
      return response.collect {|x| x.to_i }
    end

    private
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
