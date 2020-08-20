#!/usr/bin/env lua

-- deps: fonts-symbola

require "weather_vars"

-- load the http socket module
http = require("socket.http")
-- load the json module
json = require("json")

-- measure is °C if metric and °F if imperial
measure = '°' .. (units == 'metric' and 'C' or 'F')
wind_units = (units == 'metric' and 'kph' or 'mph')

-- unicode weather symbols to use
icons = {
    ["01"] = "☀",
    ["02"] = "🌤",
    ["03"] = "🌥",
    ["04"] = "☁",
    ["09"] = "🌧",
    ["10"] = "🌦",
    ["11"] = "🌩",
    ["13"] = "🌨",
    ["50"] = "🌫",
}

currenttime = os.time()

file_exists = function (name)
    f=io.open(name,"r")
    if f~=nil then
        f:close()
        return true
    else
        return false
    end
end

if file_exists(cachefile) then
    cache = io.open(cachefile, "r")
    data = json.decode(cache:read())
    cache:close()
    timepassed = os.difftime(currenttime, data.timestamp)
else
    timepassed = 6000
end

makecache = function (s)
    cache = io.open(cachefile, "w+")
    s.timestamp = currenttime
    save = json.encode(s)
    cache:write(save)
    cache:close()
end

if timepassed < 3600 then
    response = data
else
    weather = http.request(("%s?id=%s&units=%s&appid=%s"):format(url, cityid, units, appid))
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
icon = response.weather[1].icon:sub(1, 2)
humidity = response.main.humidity
wind = response.wind.speed
deg = degrees_to_direction(response.wind.deg)
sunrise = os.date("%H:%M %p", response.sys.sunrise)
sunset = os.date("%H:%M %p", response.sys.sunset)

conky_text = [[
${color4}${font Symbola:size=48}%s${font}  ${voffset -30}${font :size=20}${color}%s${font}${voffset -10}%s${color7}
${voffset 30}
${alignc} %s

${alignc}Humidity: ${color}%s%%${color7}
${alignc}Wind: ${color}%s%s %s${color9}

${alignc}${font Symbola:size=20}─⯊─${font}
${alignc}${color7}%s${color} | ${color8}%s
${voffset -25}
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
