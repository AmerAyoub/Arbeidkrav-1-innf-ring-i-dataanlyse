# Arbeidkrav-1-innf-ring-i-dataanlyse
Databaseoppgave med PostgreSQL – tabeller, SQL-spørringer, JOIN, CSV-data og tabellrelasjoner.
# PostgreSQL databaseoppgave

## Beskrivelse av dataene

Dataene representerer sjåfører som jobber for en transportbedrift, og leveransene de har utført i tre regioner: East, West og North. Leveransene har foregått i løpet av de første ti dagene i september 2026.

Dataene viser også inntektene fra leveransene og inntektsmålet for hver region.

## Tabellene

### Drivers

Drivers-tabellen inneholder data om sjåførene. Dette omfatter:

- DriverID
- DriverName
- City
- Region

`DriverID` er primærnøkkel og identifiserer hver sjåfør unikt.

### Delivries

Delivries-tabellen inneholder data om leveransene som sjåførene har utført. Dette omfatter:

- DeliveryID
- DeliveryDate
- DriverID
- Packages
- Revenue

`DeliveryID` er primærnøkkel og identifiserer hver leveranse unikt.

`DriverID` er en fremmednøkkel som kobler leveransen til sjåføren som har utført den.

### RegionTargets

RegionTargets-tabellen inneholder inntektsmålet (`RevenueTarget`) for hver av regionene East, West og North.

## Sammenkobling mellom tabellene

Forholdet mellom `Drivers` og `Delivries` er én-til-mange.

Én sjåfør kan utføre flere leveranser, mens hver leveranse er knyttet til én sjåfør. Tabellene kobles sammen gjennom `DriverID`.

`RegionTargets` kan kobles til `Drivers` gjennom `Region`. På denne måten kan inntektene fra leveransene summeres per region og sammenlignes med inntektsmålet for regionen.

## Innhold i repositoryet

- **SQL/** – SQL-kode for opprettelse av tabeller, innsetting av data og SQL-spørringer.
- **data/** – datafiler i CSV-format.
- **diagrams/** – grafiske tegninger av sammenkoblingene mellom tabellene.

## SQL-spørringer

SQL-filen inneholder blant annet:

- SELECT og WHERE
- ORDER BY
- COUNT, SUM og AVG
- GROUP BY
- INNER JOIN
- LEFT OUTER JOIN
- Sammenkobling av tre tabeller
