---
external help file: PerceptHashLib.dll-Help.xml
Module Name: PerceptHash
online version: https://joshooaj.com/PerceptHash/commands/en-US/Compare-PerceptHash/
schema: 2.0.0
---

# Compare-PerceptHash

## SYNOPSIS
Compares the provided perceptual hashes and returns the difference as an integer.

## SYNTAX

```
Compare-PerceptHash [[-ReferenceHash] <Object>] [[-DifferenceHash] <Object>] [<CommonParameters>]
```

## DESCRIPTION
The `Compare-PerceptHash` cmdlet compares the provided perceptual hashes and returns the difference
as an integer.

## EXAMPLES

### Example 1
```powershell
$hash1 = Get-PerceptHash ./image1.jpg
$hash2 = Get-PerceptHash ./image2.jpg

ComparePerceptHash -ReferenceHash $hash1 -DifferenceHash $hash2
```

Compares image1.jpg and image2.jpg returning the difference using the dHash algorithm.

### Example 2
```powershell
Get-PerceptHash ./image1.jpg | ComparePerceptHash -DifferenceHash '6964565642464933'
```

Compares image1.jpg with the plain dHash value `6964565642464933`.

## PARAMETERS

### -DifferenceHash
Specifies a perceptual hash to compare with the value of `ReferenceHash`.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReferenceHash
Specifies a perceptual hash to be compared with.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### System.Object

## OUTPUTS

### System.Int32

## NOTES

## RELATED LINKS
