# ruk

Working repository for UK data & geospatial scripts in R. 

[ONS UK Geography Guide](https://github.com/NearAndDistant/ruk/blob/main/a-beginners-guide-to-uk-geography-2020-v1.0.pdf)

## UK Geography Guide

### Census

The UK Census is undertaken every 10 years, with the most recent being on 27 March 2011. Its purpose is to collect population and other statistics essential to those who have to plan and allocate resources. The Census occurs simultaneously in all parts of the UK. In England and Wales, the Office for National Statistics (ONS) is the responsible body. In Scotland, it is National Records of Scotland (NRS), and in Northern Ireland, the Northern Ireland Statistics and Research Agency (NISRA).

The main geographies directly associated with the Census are Output Areas (OA) and Super Output Areas (SOA).

#### OA

OAs are the base unit for Census data releases. Census output areas (OA) are the smallest unit for which census data are published - they contain at minimum 40 households of on average 100 persons, the target size being 125 households. They are built up from postcode blocks with the intention of standardising population sizes, geographical shape and social homogeneity (in terms of dwelling types and housing tenure).

#### SOA

Super Output Areas (SOAs) are a set of geographical with the aim to produce a set of areas of consistent size, whose boundaries would not change (unlike electoral wards). They are an aggregation of adjacent OAs with similar social characteristics. Lower Layer Super Output Areas (LSOAs) typically contain 4 to 6 OAs with a population of around 1500. Middle Layer Super Output Areas (MSOAs) on average have a population of 7,200.

### Administrative

#### Electoral Wards

Electoral wards are the key UK administrative geography blocks. They are the geographies used to elect local government councillors in metropolitan and non-metropolitan districts, unitary authorities and the London boroughs in England; unitary authorities in Wales; council areas in Scotland; and district council areas in Northern Ireland. As at the end of 2014 there were 9,456 electoral wards/divisions in the UK.

#### Local Authority Districts

English local authority districts (LAD) (both metropolitan and non-metropolitan), London boroughs and unitary authorities average around 23 electoral wards/divisions each, Northern Irish district council areas around 22, Scottish council areas around 11 and Welsh unitary authorities about 40. Population counts can vary substantially, even within a single LAD, but the national average is about 5,500. LA’s are split by Lower Tier Local Authorities (LTLA’s) and Upper Tier Local Authorities (UTLA’s). The difference between the two being LTLA’s use district councils and UTLA’s use county councils. The ONS refers to LTLA’s as LAD’s, and UTLA’s as Counties and Unitary Authorities.

### Nomenclature of Territorial Units for Statistics (NUTS)

#### NUTS 1	
12 regions - the nine English regions e.g. North East as well as Scotland, Wales and Northern Ireland; collectively referred to as regions
Population: 3m - 7m

North East, North West, Yorkshire and Humber, East Midlands, West Midlands, East of England, London, South East, South West, Wales, Scotland, Northern Ireland.

The regions, formerly known as the _government office regions_, are the highest tier of sub-national division in the UK established in 1994. While the UK was a member of the European Union, they defined areas (constituencies) for the purposes of elections to the European Parliament. Eurostat also used them to demarcate first level Nomenclature of Territorial Units for Statistics (NUTS) regions ("NUTS 1 regions") within the European Union. The regions generally follow the boundaries of the former standard regions, established in the 1940s for statistical purposes.

#### NUTS 2
41 sub-regions - mainly groups of counties and unitary authorities e.g. Northumberland and Tyne and Wear
Population: 800k - 3m

#### NUTS 3
179 local areas - individual counties & authorities e.g. Tyneside
Population: 150k - 800k

#### LAU1
400 local authority or local council areas

## ONS Regional Gross Disposable Household Income (GDHI) 1997 to 2018

GDHI is the amount of money that all individuals in an average regional household have available after they have paid direct and indirect taxes and received any direct benefits.\nGDHI is a concept that is seen to reflect the “material welfare” of the household. Regional estimates are produced in current prices (which include the effects of inflation). [Code](https://github.com/NearAndDistant/ruk/tree/main/projects/ons_region_gdhi_1997_2018)

![ons_region_gdhi_1997_2018](https://user-images.githubusercontent.com/79040885/133470064-bc47664a-cbc9-4fc9-a72d-12cc2320fff7.png)
