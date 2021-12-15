import mysql.connector as mysql
from dataclasses import dataclass

mydb = mysql.connect(
  host="localhost",
  user="root",
  password="mysql",
  database="bd2_examenfinal"
)

@dataclass
class Questionnaire:
  id: int
  titre: str
  description: str
  pointageCalcule: int 

# Pour les besoins de l'examen et de la contrainte du temps
# on va prendre pour acquis qu'on travaille dans le questionnaire
# avec le id 1. On ne gèrera pas le choix du questionnaire.
idQuestionnaireActif = 1 

def SelectionneQuestionnaire(questionnaireId):
    cursor = mydb.cursor()
    query = "select id, titre, description, pointage_calcule from questionnaire where id = %(id)s;"
    cursor.execute(query, { 'id' : questionnaireId })

    result = cursor.fetchone()

    if result == None:
        questionnaire = Questionnaire(-1,'','','')
    else:
        questionnaire = Questionnaire(result[0], result[1], result[2], result[3])
    
    return questionnaire

def AfficherQuestion():
    # Question 1
    print("Afficher une question")

def AjouterReponse():
    # Question 2
    print("Ajouter une réponse")

def SupprimerQuestion():
    # Question 3
    print("Supprimer une question")

def OptionMenu():
    choix = 0
    questionnaire = SelectionneQuestionnaire(idQuestionnaireActif)
    texteMenu = """ 
        Gestion des questionnaires

        {0}
        {1}

            1- Afficher une question
            2- Ajouter une réponse
            3- Supprimer une question
            4- Quitter

        Veuillez choisir une option : 
        """.format(questionnaire.titre, questionnaire.description)

    try:
        choix = int(input((texteMenu)))
    except ValueError:
        print("Le choix est invalide")
    return choix


def AfficherMenuPrincipale():
    while True:
        choixMenu = OptionMenu()

        if choixMenu == 1:
            AfficherQuestion()

        if choixMenu == 2:
            AjouterReponse()

        if choixMenu == 3:
            SupprimerQuestion()

        if choixMenu == 4:
            print("Goodbye!!")
            break

if __name__ == "__main__":
    AfficherMenuPrincipale()