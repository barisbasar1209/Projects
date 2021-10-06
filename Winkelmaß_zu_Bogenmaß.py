from math import *

def w_zu_b_rechner():

    eingabe = (input('Was möchtest umrechnen ? \n|Bogenmaß zu Winkelmaß = B| oder |Winkelmaß zu Bogenmaß = W| ?: '))

    while True:
        b = True
        c = True
        d = True
        if eingabe:

            if eingabe in ('W', 'w'):
                winkelmass = input('Winkelmaß: ')

                while c:
                    if winkelmass:
                        c = False

                        while d:
                            if winkelmass.isdecimal():
                                d = False
                                print(float(winkelmass) * (pi / 180), 'rad')
                                schleife = input('Willst du noch eine Umrechnung durchführen ? (J/N): ')

                                while b:

                                    if schleife:

                                        if schleife in ('J', 'j'):
                                            eingabe = input('Welche ? |W zu B = W| oder |B zu W = B| : ')
                                            b = False

                                        elif schleife in ('N', 'n'):
                                            quit()
                                        else:
                                            schleife = input('Du musst schon sagen ob ja oder nein (J/N): ')
                                    else:
                                        schleife = input('Tätige doch bitte eine Eingabe(J/N): ')
                            else:
                                winkelmass = input('Gib bitte eine einfach Zahl im Winkelmaß an!: ')
                    else:
                        winkelmass = input('Du musst schon auch ein Winkelmaß eingeben kolleg: ')

            elif eingabe in ('B', 'b'):
                bogenmass = input('Bogenmaß: ')

                while c:
                    if bogenmass:
                        c = False

                        while d:
                            if bogenmass.isdecimal():
                                d = False
                                print(float(bogenmass) * (180 / pi), '°')
                                schleife = input('Willst du noch eine Umrechnung durchführen ? (J/N): ')

                                while b:

                                    if schleife:

                                        if schleife in ('J', 'j'):
                                            eingabe = input('Welche ? |W zu B = W| oder |B zu W = B| : ')
                                            b = False

                                        elif schleife in ('N', 'n'):
                                            quit()
                                        else:
                                            schleife = input('Du musst schon sagen ob ja oder nein (J/N): ')
                                    else:
                                        schleife = input('Tätige doch bitte eine Eingabe(J/N): ')
                            else:
                                bogenmass = input('Gib bitte eine einfach Zahl im Bogenmaß an!: ')
                    else:
                        bogenmass = input('Du musst schon auch ein Bogenmaß eingeben kolleg: ')

            else:
                eingabe = input('Gib bitte etwas sinnvolles an. "W" für Winkelmaß zu Bogenmaß oder "B" Bogenmaß zu Winkelmaß!: ')
        else:
            eingabe = input('Gib bitte etwas ein Kollege (W/B): ')
