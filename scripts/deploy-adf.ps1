param(
    [string]$ResourceGroupName,
    [string]$FactoryName,
    [string]$Location,
    [string]$TemplateFilePath = "../mcsh-data-factory/ARMTemplateForFactory.json",
    [string]$ParametersFilePath = "../config/default.parameters.json"
)

az deployment group create `
    --resource-group $ResourceGroupName `
    --template-file $TemplateFilePath `
    --parameters @$ParametersFilePath `
    --mode Incremental `
    --name "adf-deploy-$FactoryName"

## Usage:
## ./deploy-adf.ps1 -ResourceGroupName "RG-Data" -FactoryName "my-adf" -Location "East Asia"
