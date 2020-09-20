#!/usr/bin/env lua

-- deps: get-world-population

handle = io.popen("get-world-population")
result = handle:read("*a")
handle:close()

--require 'pl.pretty'.dump(result)

json = require("json")
data = json.decode(result)

conky_text = [[
${alignc}${color7}Current World Population${color}

${alignc}${font terminus:size=18}${color4}%s${color}${font}

${color9}${goto 50}today${goto 105}this year${color}
${color9}births${color2}${goto 50}%s${goto 105}%s
${color9}deaths${color1}${goto 50}%s${goto 105}%s
${color9}growth${color7}${goto 50}%s${goto 105}%s
]]

if data then
    io.write((conky_text):format(data["current_population"],
                                 data["births_today"],
                                 data["births_year"],
                                 data["deaths_today"],
                                 data["deaths_year"],
                                 data["absolute_growth"],
                                 data["absolute_growth_year"])
    )
else
    io.write("[E] data is empty!")
end
