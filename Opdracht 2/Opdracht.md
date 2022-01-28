# Opdracht 2
Nu we hebben geleerd dat we templates kunnen refereren word het tijd om dit in de praktijk te brengen. kopieer het worksheet uit opdracht 1 naar de opdracht folder. Abstaheer het, en maak een template waarmee je 2 functies aanmaakt.

Functie 1 heeft de volgende specificaties
De function heeft de volgende specificaties:
- OS: windows
- plan: Consumption
- Https Only
- FTPS only
- default function app settings
- de app moet in de zelfde regio als de function draaien
- de functie is een v4 dotnet-isolated functie
- de function naam is '${resourcegroupname}func'

Functie 2 heeft de volgende specificaties
De function heeft de volgende specificaties:
- OS: windows
- plan: Consumption
- Https Only
- FTPS only
- default function app settings
- de app moet in de zelfde regio als de function draaien
- de functie is een v4 dotnet-isolated functie
- de function naam is '${resourcegroupname}func2'


als je klaar bent kan je het worksheet deployen naar je resourcegroup via het volgende commando:
```azurecli
az deployment group create --resource-group {{Jouw resourcegroup}} --name opdracht2 --template-file worksheet.bicep   
```
