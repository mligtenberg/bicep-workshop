## Opdracht 1

We hebben net een geleerd dat bicep een simpelere vorm is om resource templates voor azure te maken.


Maak een template voor een Azure function in het bestand worksheet.bicep

De function heeft de volgende specificaties:
- OS: windows
- plan: Consumption (Y1)
- default function app settings
- de app moet in de zelfde regio als de function draaien
- de functie is een v4 dotnet-isolated functie
- de function naam is '${resourcegroupname}func'

Het Storage account staat al voor je klaar in het worksheet. De settings nodig voor de site zijn te vinden onder Hint 1. Hier staan niet de waardes bij, alleen de omschrijvingen.

Als je niet weet waar te beginnen, klik hem eerst eens in het Azure Portal bij elkaar, en druk export

als je klaar bent kan je het worksheet deployen naar je resourcegroup via het volgende commando:
```azurecli
az deployment group create --resource-group {{Jouw resourcegroup}} --name opdracht1 --template-file worksheet.bicep   
```

<details><summary>Hint 1: app settings</summary>
<p>
Voor een Azure function zijn de volgende app settings nodig

|setting|omschrijving|
|------------------------------------------|------------------------------------------------------------------------|
| AzureWebJobsStorage                      | connection string naar azure storage account                           |
| WEBSITE_CONTENTAZUREFILECONNECTIONSTRING | weer de zelfde connectionstring naar hetzelfde account                 |
| WEBSITE_CONTENTSHARE                     | Content share waar de bestanden van de azure function worden gedeployt |
| FUNCTIONS_EXTENSION_VERSION              | Versie van de azure function runtime                                   |
| FUNCTIONS_WORKER_RUNTIME                 | Function app type                                                      |
</p>
</details>

<details><summary>Hint 2: Benodigde resources</summary>

Voor het app service plan: [Microsoft.Web/serverfarms](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Web/serverfarms?tabs=bicep)  
Voor het app service (function): [Microsoft.Web/sites](https://docs.microsoft.com/en-us/azure/templates/Microsoft.Web/sites?tabs=bicep)

</details>

<details><summary>Hint 3: een storage connection string</summary>

```text
DefaultEndpointsProtocol=https;AccountName=stor;EndpointSuffix=core.windows.net;AccountKey=thisisnotarealkey
```
</details>

<details><summary>Hint 4: app settings uitgewerkt</summary>

```bicep
  {
    name: 'AzureWebJobsStorage'
    value: 'DefaultEndpointsProtocol=https;AccountName=${functionStorageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${listKeys(functionStorageAccount.id, functionStorageAccount.apiVersion).keys[0].value}'
  }
  {
    name: 'WEBSITE_CONTENTAZUREFILECONNECTIONSTRING'
    value: 'DefaultEndpointsProtocol=https;AccountName=${functionStorageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${listKeys(functionStorageAccount.id, functionStorageAccount.apiVersion).keys[0].value}'
  }
  {
    name: 'WEBSITE_CONTENTSHARE'
    value: 'files'
  }
  {
    name: 'FUNCTIONS_EXTENSION_VERSION'
    value: '~4'
  }
  {
    name: 'FUNCTIONS_WORKER_RUNTIME'
    value: 'dotnet-isolated'
  }
```
</details>