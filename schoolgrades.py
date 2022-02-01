
# prüft eine Eingabeliste ob eine Liste nur Zahlen in einer bestimmten Spanne enthält, welche mit Kommata getrennt
# eingeben wurden
def check_list(l: list, x, y):
    j = None
    for i in l:
        if i.isnumeric() and int(i) in range(x, y):
            j = True
        else:
            j = False
            break
    return j

def getData(): # Funktion ist soweit ich das jetzt geprüft habe vollständig debugged :)

    D_ID = {}
    another_student = 'x'
    while True:
        if another_student.lower() == 'n':
            break
        student_ID = input('Schüler-ID <xx>: ')

        # input der Schüler ID wird darauf geprüft ob er eine 2 stellige Zahl ist
        if len(student_ID) == 2 and student_ID.isnumeric():
            # im weiteren nun Prüfung ob ID schon vorliegt
            if student_ID in D_ID:
                print("Diese ID existiert bereits, Schüler wurde schon angelegt!")
            else:

                print('''
                (1)  Deutsch            (9)  Physik
                (2)  Mathematik         (10) Chemie
                (3)  Englisch           (11) Biologie
                (4)  Spanish            (12) Geschichte
                (5)  Französisch        (13) Ethik
                (6)  Sport              (14) Religion
                (7)  Kunst              (15) Sozialkunde
                (8)  Musik              (16) Informatik
                ''')

                D_sub = {}
                another_subject = 'x' # python will, dass ich für die if Abfrage am Anfang der kommenden While Schleife
                                      # bereits die Variable initialisiert habe
                while True:
                    # hier könnte man evtl überhaupt dieses if in die while schleife einabuen und dann einfach
                    # unten die rückgabewerte zu another_subject == "n" ändern

                    if another_subject.lower() == "n":
                        break
                    subject = input('Wählen Sie das Fach aus (1-16): ')
                    # wenn der Input also eine max. 2 stellige Zahl ist, soll diese um 1 verringert werden
                    # damit man passen ab 0 auf die Indizes der Liste mit den Fächern zugreifen kann
                    if subject.isnumeric() and (len(subject) < 3) and int(subject) > 0:
                        subject = int(subject)-1
                    else:
                        print("\nBitte geben Sie nur zahlen zwischen 1 und 16 ein !")
                        continue

                    L_sub = ["Deutsch", "Physik", "Mathematik", "Chemie", "Englisch", "Biologie", "Spanish",
                    "Geschichte", "Französisch", "Ethik", "Sport", "Religion", "Kunst", "Sozialkunde",
                    "Musik", "Informatik"]

                    student_Marks = input('Geben Sie die Noten durch Kommas "," getrennt ein: ')
                    a = True
                    while a:
                        student_Marks_list = student_Marks.replace(" ", "").split(",")
                        if check_list(student_Marks_list, 1, 7):
                            break
                        else:
                            student_Marks = input(
                                'Bitte geben Sie nur Zahlen zwischen 1 und 6 ein und trennen diese jeweil mit einem Komma!: ')
                            continue

                    D_sub[L_sub[subject]] = student_Marks.split(",")
                    D_ID[student_ID] = D_sub

                    another_subject = input('Wollen sie noch die Noten für diesen Schüler noch weitere Noten '
                                            'für andere Fächer anlegen ? (J/N): ')

                    if another_subject.lower() == "n":
                        break
                        # nach diesem break wird in neuen Schülereintrag übergegangen
                    elif another_subject.lower() == "j":
                        continue
                        # nach diesem continue kann ein weiteres Fach für den Schüler angelegt werden
                    else:
                        while another_subject.lower() not in ("n", "j"):
                            another_subject = (input('Geben Sie bitte j/n ein!: '))
                            if another_subject.lower() == "n":
                                break
                                #hiernach soll komplett rausgesprungen werden in Z.102
                            elif another_subject.lower() == "j":
                                break

            # Prüfung ob noch ein weiterer Schülereintrag angelget werden soll
            another_student = input('Wollen Sie noch einen weiteren Schüler anlegen? (J/N): ')
            if another_student.lower() == "n":
                return D_ID
            elif another_student.lower() == "j":
                continue
            else:
                while another_student.lower() not in ("n", "j"):
                    another_student = str(input('Geben Sie bitte j/n ein!: '))
                    if another_student.lower() == "n":
                        return D_ID
                    elif another_student.lower() == ("j"):
                        break

        # hier Falls bei der ID Schwachsinn eingegeben wird, Aufforderung zur sinnvollen Eingabe
        else:
            print('Geben Sie bitte eine zweistellige Zahl ein! (z.B. 01 oder 12 etc.)')
            continue

def calc_avg_mark(D):
    avgm_D = D
    for student_ID in D:
        for subject in D[student_ID]:
            notenliste = D[student_ID][subject]
            gesamtwert_noten = 0
            for marks in notenliste:
                gesamtwert_noten += int(marks)
            avgm_D[student_ID][subject] = gesamtwert_noten/len(notenliste)

    return avgm_D

def dict_rounder(D: dict, rundung):
    for i, j in D.items():
        if isinstance(j, dict):
            dict_rounder(j, rundung)
        elif isinstance(j, float) or isinstance(j, int):
            D[i] = round(j, rundung)

    return D

# !! Diese funktion ist noch nicht fertig !!
def dict_print(D: dict):
    for i, j in D.items():
        if isinstance(j, dict):
            dict_print(D)
        elif isinstance(j, float) or isinstance(j, int):
            print(i, D[i])



def show_results(avgm_D):
    rundung = int(input('Geben Sie bitte an, auf wie viele Nachkommastellen der Notendurchschnitt, des Schülers im entsprechenden'
              'Fach, gerundet werden soll (0-4): '))
    try:
        dict_rounder(avgm_D, rundung)
    except ValueError:
        print('Fehlermeldung: Sie haben versuchte etwas anderes als eine ganze Zahl zwischen 0 und 4 einzugeben.'
              'Halten Sie sich bitte an diese Vorgabe!')

    for i in avgm_D:
        print('\nDer Schüler', i, 'hat die Folgenden Notendurschnitte: ')
        print(i, ':', avgm_D[i])

# if __name__ == 'main' :

student_Data = getData()
avgm_D = calc_avg_mark(student_Data)
show_results(avgm_D)




# Jetzt: textdokument schreiben für schüler, in dem dann die noten drinnen stehen   


#fragen wie gerundet die noten ausgegeben werden sollen
#soll nur noten von 1-6 entgegen nehmen

#noten auch je fach ausgeben und gesamt durchschnitt angebeben
#Noten von verschiedenen Fächer entgegen nehmen und speichern


#rückgabe ob der schüler durchfällt oder durchfall gefährdet ist
#gesamtes zeugnis erstellen
#leistungsänderung des schülers angeben

#dynamische anweisung : Geben sie die <fach> Note von <Name des Schülers> ein

#die einzelnen klassen kann ich als jeweils ein dicitonairy in einem großen dicitionairy je stufe speichern
#und dann jedes dicitionary je jahrgang kann ich in einem schul dicitonairy speichern
