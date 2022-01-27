# Opdracht 3
Neem het template uit de vorige opdracht over, we func2 niet meer nodig.
Maak een nieuw eventgrid topic aan.

Maak een system assigned managed identity voor de functie. Geef de 'EventGrid Data Sender role' aan je de system assigned managed identity zodat die naar het eventgrid topic kan zenden.

![schematic](../img/Opdracht3.png)

als je klaar bent kan je het worksheet deployen naar je resourcegroup via het volgende commando:
```azurecli
az deployment deployment group create --resource-group {{Jouw resourcegroup}} --name opdracht1 --template-file worksheet.bicep   
```
