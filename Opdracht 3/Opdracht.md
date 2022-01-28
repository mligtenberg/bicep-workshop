# Opdracht 3
Voordat we deze opdracht beginnen, deploy een instance van Eventgrid viewer vanuit [deze pagina](https://docs.microsoft.com/en-us/samples/azure-samples/azure-event-grid-viewer/azure-event-grid-viewer/)

Neem het template uit de vorige opdracht over, we func2 niet meer nodig.
Maak een nieuw eventgrid topic aan.

Maak een system assigned managed identity voor de functie. Geef de 'EventGrid Data Sender role' aan je de system assigned managed identity zodat die naar het eventgrid topic kan zenden.

voeg een setting aan de azure function toe genaamd ``EventGridEndpoint`` met daarin de het publishing endpoint van het eventgrid topic

Maak een event subscription naar de event grid viewer op het volgende endpoint ``https://{baseurl}/api/updates``

![schematic](../img/Opdracht3.png)

als je klaar bent kan je het worksheet deployen naar je resourcegroup via het volgende commando:
```azurecli
az deployment group create --resource-group {{Jouw resourcegroup}} --name opdracht3 --template-file worksheet.bicep   
```

Hierna kan je de functie in de 'Function Sources' folder deployen via een IDE naar keuze. Gebruik hiervoor ``{resourceGroupName}func``

De FunctionApp bevat 1 functie. Haal de url op via het Azure Portal. Als je deze aanroept word een event verstuurt die je via EventGrid Viewer kan uitlezen