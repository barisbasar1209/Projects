from time import *


def celsius_zu_kelvin():
    celsius = float(input('Grad Celsius: '))
    if celsius < (-273.15):
        print('\n'
              'Deine Eingabe ist ungültig! Der absolute NP lieg bei -273.15°C.\n'
              '')
        sleep(0.75)
    else:
        kelvin = round(celsius+273.15, 2)
        print(celsius, '°C =', kelvin, 'K')

def celsius_zu_fahrenheit():
    celsius = float(input('Grad Celsius: '))
    if celsius < (-273.15):
        print('\n'
              'Deine Eingabe ist ungültig! Der absolute NP lieg bei -273.15°C.\n'
              '')
        sleep(0.75)
    else:
        fahrenheit = round(celsius*(9/5)+32, 2)
        print(celsius, '°C =', fahrenheit, '°F')

def fahrenheit_zu_celsius():
    fahrenheit = float(input('Grad Fahrenheit: '))
    if fahrenheit < (-459.67):
        print('\n'
              'Deine Eingabe ist ungültig! Der absolute NP lieg bei -459.67°F.\n'
              '')
        sleep(0.75)
    else:
        celsius = round(fahrenheit * (5 / 9) - 32, 2)
        print(fahrenheit, '°F =', celsius, '°C')

def fahrenheit_zu_kelvin():
    fahrenheit = float(input('Grad Fahrenheit: '))
    if fahrenheit < (-459.67):
        print('\n'
              'Deine Eingabe ist ungültig! Der absolute NP lieg bei -459.67°F.\n'
              '')
        sleep(0.75)
    else:
        kelvin = round((fahrenheit - 32)*(5/9)+273.15, 2)
        print(fahrenheit, '°F =', kelvin, 'K')

def kelvin_zu_celsius():
    kelvin = float(input('Grad Kelvin: '))
    if kelvin < 0:
        print('\n'
              'Deine Eingabe ist ungültig! Der absolute NP lieg bei 0K.\n'
              '')
        sleep(0.75)
    else:
        celsius = round(kelvin-273.15, 2)
        print(kelvin, 'K =', celsius, '°C')

def kelvin_zu_fahrenheit():
    kelvin = float(input('Grad Kelvin: '))
    if kelvin < 0:
        print('\n'
              'Deine Eingabe ist ungültig! Der absolute NP lieg bei 0K.\n'
              '')
        sleep(0.75)
    else:
        fahrenheit = round((kelvin-273.15)*(9/5)+32, 2)
        print(kelvin, 'K =', fahrenheit, '°F')


def anzeige():
    print('')
    print('(0) Programm beenden\n'
          '(1) Celsius zu Fahrenheit\n'
          '(2) Celsius zu Kelvin\n'
          '(3) Fahrenheit zu Celsius\n'
          '(4) Fahrenheit zu Kelvin\n'
          '(5) Kelvin zu Celsius\n'
          '(6) Kelvin zu Fahrenheit')
    print('')


def temp_umrechner():
    anzeige()
    while True:

        try:
            eingabe = float(input('Welche Umrechnung möchtest du durchführen? \n'
                                  '(1-6), (0) zum beenden oder (7) für die Auswahlanzeige: '))
            print('')
            if eingabe in range(1, 7):
                if eingabe == 1:
                    celsius_zu_kelvin()
                elif eingabe == 2:
                    celsius_zu_fahrenheit()
                elif eingabe == 3:
                    fahrenheit_zu_celsius()
                elif eingabe == 4:
                    fahrenheit_zu_kelvin()
                elif eingabe == 5:
                    kelvin_zu_celsius()
                elif eingabe == 6:
                    kelvin_zu_fahrenheit()
            elif eingabe == 0:
                quit()
            elif eingabe == 7:
                anzeige()
        except ValueError:
            temp_umrechner()

