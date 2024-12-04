# Cours Swift


## Exercice 1

```swift
struct ContentView: View {
    var loot = ["Epée", "Bouclier", "Armure"]

    var body: some View {
        List(loot, id: \.self) { item in
            Text(item)
        }
    }
}

```
Il manque id: \.self. Sans ça, on ne peut pas identifier les élements dans la liste


## Exercice 2

1.

On a ajouté la fonction addItem() pour pouvoir mettre "Magie de feu" à la liste
Ajout d'un bouton pour appeler addItem()
Utilisation de forEach pour parcourir le tableau et afficher les elements

2. 

On utilise ForEach pour parcourir une collection. Dans le cas précis, on parcourt le tableau et on crée élement Text pour chaque item

Le role du ForEach est de créer une vue dynamique qui permet d'actualiser la liste quand on ajoute un item

On sépare le bouton du ForEach, deja parce qu'ils n'ont pas la meme utilié, le bouton permet d'ajouter un élement à la liste et le ForEach est utilisé uniquement pour afficher la liste

Il ne faut pas le mettre dans le ForEach pour éviter de l'utiliser dans la répétition.

Et puis bonne pratique de séparer les composants responsable des actions de ceux responsable de l'affichage.

##  Exercice 3


1.

Le tableau loot est déclaré avec var. Pour pouvoir faire des changements il faut le déclarer avec @State.

Le bouton ne peut pas marcher car sans @State la propriété n'est pas observée.

3.

@State permet d'initialisé une variable susceptible de changer. @State crée une propriété observable qui est automatiquement mise 
à jour dans l'interface chaque fois que sa valeur change.
Grâce à @State, SwiftUI sait que la liste des items (loot) a changé et il reconstruit la vue en fonction du nouvel état du 
tableau.


## Exercice 4


1. 
Lorsqu'on clique sur le bouton "Ajouter" pour ajouter "Magie de feu" l’item est bien ajouté dans le tableau mais l'interface 
utilisateur ne se met pas à jour. 

Ca ne fonctionne pas car SwiftUI ne sait pas que loot a changé. 
Inventory n'est pas observable par SwiftUI donc les modifications apportées à loot ne déclenchent pas de mise à jour de la vue.


2.
@Published rend loot réactif aux changements. Lorsqu'on ajoute un item @Published informe SwiftUI qu'il y a eu une 
modification et SwiftUI met à jour l'interface.

@StateObject est utilisé pour initialiser un objet observable et gérer son cycle de vie dans une vue. 
Ici nous créons une instance d'Inventory pour la première fois dans ContentView donc @StateObject est approprié. 
@ObservedObject est utilisé pour observer un objet qui a été créé ailleurs et @State est réservé aux valeurs de types simples et
non pas aux objets observables.



## Exercice 5 

SwiftUI veut que chaque élément d'une liste ait un identifiant unique afin de gérer les vues
