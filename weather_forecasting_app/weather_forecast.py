#%%

#DSC 510
#Week 10 Final Project
#DSC 510 Final Project
#Author Jed Brough
#8/8/2020

import requests

# Code for zip code search
def zip_search():
    zcode = input("Enter your zip code\n")
    try:
        url = 'https://api.openweathermap.org/data/2.5/weather?zip='+zcode+'&APPID=e748aeddf2b2b7fe35d474bf0faed9b6&units=imperial'
        response = requests.get(url)
        view = response.json()
        # Display weather information
        print('Current Weather Conditions in',view['name'],'\nCurrent Temp:',view['main']['temp'],
              '\nToday\'s high:',view['main']['temp_max'],'\nToday\'s low:',view['main']['temp_min'],
              '\nHumidity:',view['main']['humidity'],'%\nToday\'s weather is',view['weather'][0]['main'],'\n')
    # Notifies user of error
    except:
        print('Invalid zip code.')

# Code for city search
def city_search():
    city = input("Enter your city name\n")
    try:
        url = 'http://api.openweathermap.org/data/2.5/weather?q='+city+',us&APPID=e748aeddf2b2b7fe35d474bf0faed9b6&units=imperial'
        response = requests.get(url)
        view = response.json()
        # Display weather information
        print('Current Weather Conditions in',view['name'],'\nCurrent Temp:',view['main']['temp'],
              '\nToday\'s high:',view['main']['temp_max'],'\nToday\'s low:',view['main']['temp_min'],
              '\nHumidity:',view['main']['humidity'],'%\nToday\'s weather is',view['weather'][0]['main'],'\n')
    # Notifies user of error
    except:
        print('Invalid location.')

def main():
    # Welcome statement
    print("Welcome to the weather app.")
    while True:
        # Allow user to search by zip code or city
        form = input("Enter 1 to search by zip code or 2 to search by city\n")

        if form == '1':
            zip_search()
        else:
            city_search()

        # Allow user to search another location
        loop=input('Do you want to search again? Type Y or N\n')
        if loop.upper() == 'N':
            break
    # Sign off message
    print('Have a nice day!')

if __name__ == '__main__':
    main()