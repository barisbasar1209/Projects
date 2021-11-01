L = [2, 43, -2, 45, 6, 97, -21, 2234, -321, 63, 4]

#das Minimum muss erst irgendwo festgesetzt werden um dann iterativ die einzelnen Elemente in der Liste
#miteinander zu vergleichen. Wenn das aktuelle Element der Liste an der i-ten Stelle kleiner ist
#(größer bei Maximumsprüfung), dann wird dieses i-te Element in die Variable minimum überschrieben

minimum = L[0]
for i in L:
    if minimum > i:
        minimum = i
    else:
        pass

#Maximum : Selbiges wie bei Minimum, nur mit umgedrehtem Ungleichheitszeichen

maximum = L[0]
for i in L:
    if maximum < i:
        maximum = i
    else:
        pass

def len():  #Zählt die Anzahl an Elementen/Zellen der Liste
    len = 0
    for i in L:
        len += 1
    return len

len = len()-1   #dynamische Variable für die Länge der Liste wird über die entsprechende Funktion minus 1
                #definiert, da man bei Listen bei der 0-ten Zelle zu zählen beginnt

#absteigend sortierte Liste
for i in L:                         #1. for-loop geht jede i-te Stelle bzw. jede Zelle der Liste der Reihe nach durch
    for j in range(0, len, 1):      #2. for-loop vergleicht dann den Wert jeder Zelle mit den nachfolgenden und tausch
                                    #ggf dann diese entsprechend miteinander aus.
        if L[j] > L[j+1]:
            platzhalter = L[j]      #dafür eignet sich eine Hilfsvariable um den einen Wert zwischenzulagern
            L[j] = L[j+1]
            L[j+1] = platzhalter
        else:
            continue                #wenn die if-Bedingung nicht erfüllt ist, soll die 2.for-schleife einfach wieder
                                    #neu gestartet bzw. inkrementell weitergeführt werden

#absteigend sortierte Liste
for i in L:
    for j in range(0, len, 1):
        if L[j] < L[j+1]:
            platzhalter = L[j]
            L[j] = L[j+1]
            L[j+1] = platzhalter
        else:
            continue


print('Die unsortierte Liste:', L)
print('Absteigend sortierte Liste:', L)
print('Aufsteigend sortierte Liste:', L)
print('Das Minimum ist:', minimum)
print('Das Maximum ist:', maximum)
