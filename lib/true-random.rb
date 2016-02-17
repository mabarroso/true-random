require 'net/http'

module TrueRandom
  class Random
	  def initialize
  	  @proxy_url = false
	  end

    def integer n=1, min=1, max=100, base = 10
      return integers "integers/?num=#{n}&min=#{min}&max=#{max}&col=1&base=#{base}"
    end

		def sequence min=1, max=100
			return integers "sequences/?min=#{min}&max=#{max}&col=1"
		end

		def string n = 1, len = 20, digits = true, upperalpha = true, loweralpha = true, unique = true
			return strings "strings/?num=#{n}&len=#{len}&digits=#{on_off digits}&upperalpha=#{on_off upperalpha}&loweralpha=#{on_off loweralpha}&unique=#{on_off unique}"
		end

    def quota ip = false
    	if ip
    		return integers "quota/?"
    	else
    		return integers "quota/?ip=#{ip}"
    	end
  	end

  	def proxy url = false, port = 8080
  	  @proxy_url = url
  	  @proxy_port = port
    end

    private
    def on_off value = false
    	return value == true ? 'on' : 'off'
  	end

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
      url = URI.parse('https://www.random.org/' + uri + '&format=plain&rnd=new')
      if @proxy_url
        http_response = Net::HTTP::Proxy(@proxy_url, @proxy_port).get_response(url)
      else
        http_response = Net::HTTP.get_response(url)
      end
      return false unless http_response.code.to_i == 200
      results = []
      http_response.body.split("\n").each do |item|
        results << item
      end
      results
    end

	end
end
