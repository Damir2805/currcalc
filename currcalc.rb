#Hi guys, this program is for calculating currant currency rate
#Datas are gotten from http://www.cbr.ru/scripts/XML_daily.asp

#Turning on dependencies

require "net/http"
require "uri"
require "rexml/document"

#where uri request is sent
uri = URI.parse("http://www.cbr.ru/scripts/XML_daily.asp")

#getting response
response = Net::HTTP.get_response(uri)

#parsing response
doc = REXML::Document.new(response.body)

currant_rate = doc.root.elements.to_a[8]

hkd = currant_rate.elements['Name']
rate = currant_rate.elements['Value']
nominal = currant_rate.elements['Nominal']

puts "Курс ЦБ России #{nominal} #{hkd} равен #{rate} рублей"
