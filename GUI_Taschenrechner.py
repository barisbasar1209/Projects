from tkinter import * #erst soll alles von tkinter importiert werden

#hier stehen nun die Funktionen, welche die Knöpfe beim anklicken ausführen sollen

def button_clear():
    eingabe.delete(0, END)
#muss lediglich das was im Eingabefeld steht löschen

def button_click(nummer):
    aktuell = eingabe.get() #diese Variable ist nicht zwingend nötig, hilft aber bei der Übersicht
    eingabe.delete(0, END) #hier ist wichtig den zwischenspeicher zu löschen, da sich die Zahlen sonst "auftürmen"
    eingabe.insert(0, str(aktuell) + str(nummer)) 
    #hier ist wichtig, dass die beiden Variablen als Strings verknüpft und nicht Zahlen verrechnet werden
    #Durch das einbauen dieses inserts in das Entrywidget werden die Zahlen dann im Eingabefeld auch angezeigt


def button_add():
    global nummer_1
    global math
    #die beiden Variabeln werden hier global definiert um auch in anderen Funktionen und 
    #den Widget auf sie zugreifen zu können 
    math = "addition"
    nummer_1 = eingabe.get()
    #die erste Eingabe soll jetzt in der Variable nummer_1 gespeichert werden um sie später
    #übersichtlicher verrechnen zu können
    eingabe.delete(0, END) 

def button_sub():
    global nummer_1
    global math
    math = "subtraktion"
    nummer_1 = eingabe.get()
    eingabe.delete(0, END)

def button_mult():
    global nummer_1
    global math
    math = "multiplikation"
    nummer_1 = eingabe.get()
    eingabe.delete(0, END)

def button_div():
    global nummer_1
    global math
    math = "division"
    nummer_1 = eingabe.get()
    eingabe.delete(0, END)


def button_equal():     
    nummer_2 = eingabe.get()    #beim anklicken des Istgleich-Zeichens soll nun die Speicherung einer weiteren
                                #Variablen starten hier ist die Variable auch wieder v.A. für die Übersicht hilfreich

    eingabe.delete(0, END)      #auch hier wieder soll verhindert werden, dass sich die Ziffern "aufstapeln"
                                # Gerne auch mal ohne das .delete hier versuchen, dann wirds schnell klar 
    
    
    #If statements um dem Istgleich-Knopf mehrere Fähigkeiten zu verleihen 
    #die Zahlen müssen als floats deklariert werden wegen der Division die sonst automatisch floats ausspuckt 
    #wodurch man dann keine Anschlussrechnungen von int und float mehr machen könnte
    
    if (math=="addition"):
        eingabe.insert(0, float(nummer_1) + float(nummer_2))
    elif (math=="subtraktion"):
        eingabe.insert(0, float(nummer_1)-float(nummer_2))
    elif (math=="multiplikation"):
        eingabe.insert(0, float(nummer_1)*float(nummer_2))
    elif (math=="division"):
        eingabe.insert(0, float(nummer_1)/float(nummer_2))
    
        
base = Tk() #mainloop wird geöffnet

base.title("Trivialer Additionsrechner") #titel des Fensters

eingabe = Entry(base, width="34", text=button_click) #Eingabefeld zur Eingabe der Zahlen per Knöpfe
eingabe.grid(row=0, column=0, columnspan=3)


#Hier sind einfach alle Knöpfe mit ihren Eigenschaften (Breite, Höhe, Textinhalt und Funktion) gelistet
# das lambda: im command dient dazu um der Funktion auch Parameter übergeben zu können 

b_0 = Button(base, padx="40", pady="20", text="0", command=lambda: button_click(0))

b_1 = Button(base, padx="40", pady="20", text="1", command=lambda: button_click(1))
b_2 = Button(base, padx="40", pady="20", text="2", command=lambda: button_click(2))
b_3 = Button(base, padx="40", pady="20", text="3", command=lambda: button_click(3))

b_4 = Button(base, padx="40", pady="20", text="4", command=lambda: button_click(4))
b_5 = Button(base, padx="40", pady="20", text="5", command=lambda: button_click(5))
b_6 = Button(base, padx="40", pady="20", text="6", command=lambda: button_click(6))

b_7 = Button(base, padx="40", pady="20", text="7", command=lambda: button_click(7))
b_8 = Button(base, padx="40", pady="20", text="8", command=lambda: button_click(8))
b_9 = Button(base, padx="40", pady="20", text="9", command=lambda: button_click(9))

b_equal = Button(base, padx="88", pady="20", text="=",      command=button_equal)
b_c     = Button(base, padx="78", pady="20", text="Clear",  command=button_clear)
b_add   = Button(base, padx="39", pady="20", text="+",      command=button_add)
b_sub   = Button(base, padx="39", pady="20", text="−",      command=button_sub)
b_mult  = Button(base, padx="40", pady="20", text="x",      command=button_mult)
b_div   = Button(base, padx="41", pady="20", text="/",      command=button_div)


#und hier stehen zu allen Knöpgen noch die .grids, durch welche diese auch abgebildet werden können 
#und gleichzeitig ihre Positionen in Zeile und Spalte bestimmt werden können

b_0.grid(row=4, column=0)

b_1.grid(row=3, column=0)
b_2.grid(row=3, column=1)
b_3.grid(row=3, column=2)

b_4.grid(row=2, column=0)
b_5.grid(row=2, column=1)
b_6.grid(row=2, column=2)

b_7.grid(row=1, column=0)
b_8.grid(row=1, column=1)
b_9.grid(row=1, column=2)


b_c.grid    (row=4, column=1, columnspan="2")
b_equal.grid(row=5, column=1, columnspan="2")

b_add.grid  (row=5, column=0)
b_sub.grid  (row=6, column=0)
b_mult.grid (row=6, column=1)
b_div.grid  (row=6, column=2)


base.mainloop() #loop muss geschlossen werden
