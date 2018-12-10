#!/usr/bin/env lua

-- load the http socket module
http = require("socket.http")
-- load the json module
json = require("json")

api_url = "http://api.openweathermap.org/data/2.5/weather?"

-- http://openweathermap.org/find
cityid = "2023469"

-- metric or imperial
cf = "metric"

-- get an open weather map api key: http://openweathermap.org/appid
apikey = "542ffd081e67f4512b705f89d2a611b2"

-- measure is °C if metric and °F if imperial
measure = '°' .. (cf == 'metric' and 'C' or 'F')
wind_units = (cf == 'metric' and 'kph' or 'mph')

-- Unicode weather symbols to use
icons = {
  ["01"] = "☀️",
  ["02"] = "🌤",
  ["03"] = "🌥",
  ["04"] = "☁",
  ["09"] = "🌧",
  ["10"] = "🌦",
  ["11"] = "🌩",
  ["13"] = "🌨",
  ["50"] = "🌫",
}

currenttime = os.date("!%Y%m%d%H%M%S")

file_exists = function (name)
    f=io.open(name,"r")
    if f~=nil then
        f:close()
        return true
    else
        return false
    end
end

if file_exists("weather.json") then
    cache = io.open("weather.json","r")
    data = json.decode(cache:read())
    cache:close()
    timepassed = os.difftime(currenttime, data.timestamp)
else
    timepassed = 6000
end

makecache = function (s)
    cache = io.open("weather.json", "w+")
    s.timestamp = currenttime
    save = json.encode(s)
    cache:write(save)
    cache:close()
end

if timepassed < 3600 then
    response = data
else
    weather = http.request(("%sid=%s&units=%s&APPID=%s"):format(api_url, cityid, cf, apikey))
    if weather then
        response = json.decode(weather)
        makecache(response)
    else
        response = data
    end
end

--require 'pl.pretty'.dump(response)

math.round = function (n)
    return math.floor(n + 0.5)
end

degrees_to_direction = function (d)
    val = math.round(d / 22.5)
    directions={"N", "NNE", "NE", "ENE",
                "E", "ESE", "SE", "SSE",
                "S", "SSW", "SW", "WSW",
                "W", "WNW", "NW", "NNW"}
    return directions[val % 16]
end

temp = response.main.temp
conditions = response.weather[1].description
icon2 = response.weather[1].id
icon = response.weather[1].icon:sub(1, 2)
humidity = response.main.humidity
wind = response.wind.speed
deg = degrees_to_direction(response.wind.deg)
sunrise = os.date("%H:%M %p", response.sys.sunrise)
sunset = os.date("%H:%M %p", response.sys.sunset)

conky_text = [[
${color2}${font Symbola:size=48}%s ${voffset -10}${font :size=20}${color1}%s${font}${voffset -5}%s${color2}
${alignc}${voffset 28} %s

${alignc}Humidity: ${color1}%s%%${color2}
${alignc}Wind: ${color1}%s%s %s${color2}

${alignc}${font Symbola:size=20}─⏲─${font}
${alignc}${color1}%s${color2} | ${color1}%s${color2}
]]
io.write((conky_text):format(icons[icon],
                             math.round(temp),
                             measure,
                             conditions,
                             humidity,
                             math.round(wind),
                             wind_units,
                             deg,
                             sunrise,
                             sunset)
)
