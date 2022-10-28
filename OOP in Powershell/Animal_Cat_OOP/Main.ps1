
Import-Module ./Animal.ps1
Import-Module ./Cat.ps1

$tiger = [Cat]::new("Bageera", "Jungle", "Roar", 1, "Black", "Loepard")
$tiger.toString()

#Output
#Name: Bageera | Habitat: Jungle | Sound: Roar | Population: 1