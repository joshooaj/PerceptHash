---
external help file: PerceptHashLib.dll-Help.xml
Module Name: PerceptHash
online version:
schema: 2.0.0
---

# Get-PerceptHash

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### Path (Default)
```
Get-PerceptHash [-Path] <String[]> [-Algorithm <PerceptHashAlgorithm>] [<CommonParameters>]
```

### LiteralPath
```
Get-PerceptHash [-LiteralPath] <String[]> [-Algorithm <PerceptHashAlgorithm>] [<CommonParameters>]
```

### InputStream
```
Get-PerceptHash [-InputStream] <Stream> [-Algorithm <PerceptHashAlgorithm>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -Algorithm
{{ Fill Algorithm Description }}

```yaml
Type: PerceptHashAlgorithm
Parameter Sets: (All)
Aliases:
Accepted values: dhash

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputStream
{{ Fill InputStream Description }}

```yaml
Type: Stream
Parameter Sets: InputStream
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LiteralPath
{{ Fill LiteralPath Description }}

```yaml
Type: String[]
Parameter Sets: LiteralPath
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
{{ Fill Path Description }}

```yaml
Type: String[]
Parameter Sets: Path
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.String[]

## OUTPUTS

### System.String

## NOTES

## RELATED LINKS
