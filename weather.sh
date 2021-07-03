#!/usr/bin/sh

key=$(cat $HOME/.config/openweathermap.key)
city_name="Mölndal" # CHANGE ME

# API request string
apireq="api.openweathermap.org/data/2.5/weather?q=$city_name,$state_code,$country_code&units=metric&appid=$key"

# Make the request
weather_data=$(curl -s $apireq)


# General weather data
temp_min=$(echo $weather_data | jq .main.temp_min)
temp_max=$(echo $weather_data | jq .main.temp_max)
temp_cur=$(echo $weather_data | jq .main.temp)
pressure=$(echo $weather_data | jq .main.pressure)
humidity=$(echo $weather_data | jq .main.humidity)

# Wind data
wind_speed=$(echo $weather_data | jq .wind.speed )
wind_deg=$(echo $weather_data | jq .wind.deg)

# Weather data
weather_main=$(echo $weather_data | jq -r .weather[0].main)
weather_desc=$(echo $weather_data | jq -r .weather[0].description)

# Cloud data
clouds_all=$(echo $weather_data | jq .clouds.all)


# colors
bold="\e[1m"
reset="\e[0m"
underline="\e[4m"

print_data() {
	echo -e "$underline${bold}Enviroment Data$reset"
	echo $(date)
	echo
	echo -e "\t$underline${bold}Temperature$reset" 
	echo -e "\tCurrent: $temp_cur C" 
	echo -e "\tMin: $temp_min C"
	echo -e "\tMax: $temp_max C"
	echo
	echo -e "\t$underline${bold}Weather$reset"
	echo -e "\tDescription: $weather_main ($weather_desc)"
	echo -e "\tPressure: $pressure mbar"
	echo -e "\tHumidity: ${humidity}%"
	echo -e "\tClouds: $clouds_all"
	echo 
	echo -e "\t$underline${bold}Wind$reset"
	echo -e "\tSpeed: $wind_speed m/s"
	echo -e "\tAngle: $wind_deg"
}


print_data
