require "httparty"
require "colorize"

# Argument Parsing
args = Hash[ ARGV.join(' ').scan(/--?([^=\s]+)(?:=(\S+))?/) ]

symbol = args["s"]
currency = args["c"]

# Request
host = "https://api.coinbase.com/v2/prices/#{symbol}-#{currency}/spot"
response = HTTParty.get(host)
parsed_response = response.dig('data', 'amount')

# Print it
puts("""     
──▄▄█▀▀▀▀▀█▄▄──
▄█▀░░▄░▄░░░░▀█▄     
█░░░▀█▀▀▀▀▄░░░█     
█░░░░█▄▄▄▄▀░░░█     Price(#{symbol.upcase} to #{currency.upcase}): #{parsed_response}
█░░░░█░░░░█░░░█
▀█▄░▀▀█▀█▀░░▄█▀
──▀▀█▄▄▄▄▄█▀▀──
    """.yellow)
