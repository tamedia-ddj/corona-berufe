# Corona Berufe

### Untertitel

<!---
optional folgendermassen Bild einfügen:
![Trump Hate](dt.png)
Source: [Gage Skidmore](https://www.flickr.com/photos/gageskidmore/32758233090)>)
--->

Kurzbeschreibung

#### 
**Datenquelle(n)**: xxx

**Artikel**: [Titel des Artikels (inkl. Link)](https://github.com/tamedia-ddj/brennpunkt_bauernhof_public/blob/master/1_Kuerzungen.ipynb)

## bei grösseren Projekten: Inhaltsverzeichnis

1. Datenvorbereitung
2. Beschreibung der Datenanlyse: [Link zu Notebook](https://github.com/tamedia-ddj/brennpunkt_bauernhof_public/blob/master/1_Kuerzungen.ipynb)



## Einführung / Verortung
Text



## Beschreibung der Datenanlyse

Einige Beispielelemente:

**Text:**

In der Tabelle `cutbacks` werden auf Ebene der Gemeinde die Anzahl der Betriebe ermittelt, bei denen in 3 oder mehr Jahren (von insgesamt 4 Jahren) Kürzungen veranlasst wurden. Während des Exportprozesses wird der Spalte `multiple_cutbacks` die Anzahl Betriebe hinterlegt, die diese Bedingungen erfüllen.

**Liste**

* item 1
* item 2
* item 3
* ...


**Abschnitt mit code:**

```
for filename in os.listdir(directory):
    if (("srt" in filename)):
        with open(directory+filename, "rb") as file:
            ### decode and parse data
            data = file.read().decode("iso-8859-1")
            subtitle_generator = srt.parse(data)
            subtitle = list(subtitle_generator)
            identified_subtitles = identify_subtitles(subtitle)
            
            ### handle 1. counter for host, 2. comments and 3. counter for rest
            for line in identified_subtitles:
                if line[0] == "Moderator":
                    words_moderator += len(tokenizer.tokenize(line[1]))
                elif line[0] == "<---> Kommentar <--->":
                    comments.append([filename, line[1]])
                else:
                    words_rest += len(tokenizer.tokenize(line[1]))
``` 

**Tabelle:**

Variable | Beschreibunng
--- | --- 
`KUERZUNGEN` | Anzahl Kürzungen auf Gemeindeebene
`BETRIEBE_TOTAL` | Anzahl Betriebe auf Gemeindeebene
`KUERZUNGEN_ANTEIL` | Prozentualer Anteil der Betriebe die Kürzungen erhalten haben
`KUERZUNGEN_BETRAG_AVG` | Durchschnittliche Höhe der Kürzungen pro Gemeinde





## Output Files

### output/Datei1.csv

Beschreibung der Datei die aus dem Dataframe `df1` erstellt wurde.

Variable | Beschreibunng
--- | --- 
`id ` | eindeutiger Identifikator
`Variable1 ` | Beschreibung der ersten Variable
`etc ` | und so weiter...


### output/Datei2.csv

Beschreibung der Datei die aus dem Dataframe `df2` erstellt wurde.

Variable | Beschreibunng
--- | --- 
`id ` | eindeutiger Identifikator
`Variable1 ` | Beschreibung der ersten Variable
`etc ` | und so weiter...


## Lizenz

*Corona Berufe* is free and open source software released under the permissive MIT License.

