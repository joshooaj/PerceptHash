---
external help file: PerceptHashLib.dll-Help.xml
Module Name: PerceptHash
online version: https://joshooaj.com/PerceptHash/commands/en-US/Get-PerceptHash/
schema: 2.0.0
---

# Get-PerceptHash

## SYNOPSIS
Gets a perceptual hash of the provided image(s).

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
The `Get-PerceptHash` cmdlet gets a perceptual hash of the provided image(s). In the current
version only the dHash algorithm is available. Future versions may include additional algorithms.

## EXAMPLES

### Example 1
```powershell
Get-PerceptHash -Path ./image.jpg
```

Gets the perceptual hash for `image.jpg` in the current directory using the dHash algorithm.

### Example 2
```powershell
Get-PerceptHash -LiteralPath 'image[2].jpg'
```

Gets the perceptual hash for `image[2].jpg` in the current directory using the dHash algorithm.
The square brackets in the file name require the use of the `LiteralPath` parameter instead of the
default `Path` parameter.

### Example 3
```powershell
$memoryStream = [io.memorystream]::new()
$bytes = [io.file]::ReadAllBytes('image.jpg')
$memoryStream.Write($bytes, 0, $bytes.Length)
$memoryStream.Position = 0

Get-PerceptHash -InputStream $memoryStream
```

In many cases there may not be a file on disk and the image is in a stream object. In that case you
can use the `InputStream` parameter to generate a perceptual hash. The use of `IO.MemoryStream`
here is only for demonstration purposes.

## PARAMETERS

### -Algorithm
Specifies the perceptual hash algorithm to use. At present, only dHash is supported.

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
Specifies a memory, file, or other stream object representing an image from disk or some other source.

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
Specifies the exact file path for the image, or images to be hashed.

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
Specifies the path to one or more images to be hashed.

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
