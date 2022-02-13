from random import randint
randint(1, 10)
dice=randint(1, 6)

from time import sleep


sleep(0.5)
print('Dies ist ein Würfel')
sleep(1)
start = (input ('Gib "1" ein zum würfeln oder "0" zum schließen: '))
while True:
        if start:
                if start == '1':
                        dice = randint(1, 6)
                        sleep(1)
                        print('')
                        print('Du hast die ', dice, ' gewürfelt')
                        sleep(1)
                        print('')

                        start = input('Willst du erneut wüfeln ? | 1 = Ja | 0 = Nein | : ')

                elif start == '0':
                        print('')
                        print('Ok, dann bis zum nächsten Mal!')
                        quit()
                else:
                        start = (input('Gib bitte etwas sinnvolles ein (1/0)!: '))

        else:
                start = (input('Tätige bitte eine Eingabe! (1/0): '))
