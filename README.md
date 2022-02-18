# bicep workshop
## Voor we starten
- Download dit repo lokaal
- [download VS Code](https://code.visualstudio.com/download)
- [Installeer dotnet 6](https://dotnet.microsoft.com/en-us/download)
- [installeer de bicep plugin](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep)
- [installeer Azure cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### login azure cli
login op de azure cli met het volgende commando
```
az login --use-device-code
```

Voor de zekerheid selecteer de de juiste via het volgende commando
```
az account set -s {subscriptionId}
``` 


### Troubleshooting
Mocht VS Code roepen dat dotnet niet gevonden kon worden, volg de stappen in dit artikel.
https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/installation-troubleshoot

## Handige links
- [Resource templates voor Azure](https://docs.microsoft.com/en-us/azure/templates/)

## De opdrachten
- [Opdracht 1](./Opdracht%201/Opdracht.md)
- [Opdracht 2](./Opdracht%202/Opdracht.md)
- [Opdracht 3](./Opdracht%203/Opdracht.md)