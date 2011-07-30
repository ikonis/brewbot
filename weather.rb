#!/usr/local/bin/ruby
require 'net/http'
require 'net/http'
require 'hpricot'
require 'uri'
require 'cinch'

class Weather
  include Cinch::Plugin

  match /weather (.+)/

  def execute(m,location)
    location=location.gsub(' ','+')
    xml=Net::HTTP.get(URI.parse("http://www.google.com/ig/api?weather=#{location}"))
    doc = Hpricot::XML(xml)
    info=doc.search("/xml_api_reply/weather/forecast_information")
    current=doc.search("/xml_api_reply/weather/current_conditions")
    cityName=info[0].innerHTML
    currentTemp=current[1].innerHTML
    currentHumidity=current[3].innerHTML
    m.reply "#{cityName}   Current Temp: #{currentTemp}   #{currentHumidity}

    =begin
    (doc/:forcast_information).each do |status|
      first=true
      (status/"*".each do |el|
        if first
          first=false
        else
          m.reply el.to_s
        end
      end
    end
    (doc/:current_conditions).each do |status|
      first=true
      (status/"*").each do |el|
        if first
          first=false
        else
          m.reply el.to_s
          #m.reply "#{el}: #{status.at(el).innerHTML}"
        end
      end
     end
   end
   =end

end
