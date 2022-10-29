<# Author: Murtadha Marzouq#>
<# Goal: To test the implementation of OOP of Powershell compared to Java/C# .#>


<###
Java Class: 

public class Animal{

    String name;
    String habitat;
    String sound;
    int population;

    public Animal(String name, String habitat, String sound, int population){
        this.name = name;
        this.habitat = habitat;
        this.sound = sound;
        this.population = population;
    }

    //Setters and Getters
    public void setName(String name){
        this.name = name;
    }
    
    public String getName(){
        return this.name;
    }

}

#>

add-type -TypeDefinition @'
    public class Animal
    {
        public string Name { get; set; }
        public string Habitat { get; set; }
        public string Sound { get; set; }
        public int Population { get; set; }
        public Animal(string name, string habitat, string sound, int population)
        {
            this.Name = name;
            this.Habitat = habitat;
            this.Sound = sound;
            this.Population = population;
        }
        public override string ToString()
        {
            return "Name: " + this.Name + " | Habitat: " + this.Habitat + " | Sound: " + this.Sound + " | Population: " + this.Population;
        }   
    }

'@

class Animal {
    [string]$name
    [string]$habitat
    [string]$sound
    [int]$population

    

    Animal([string]$name, [string]$habitat, [string]$sound, [int]$population) {
        $this.name = $name
        $this.habitat = $habitat
        $this.sound = $sound
        $this.population = $population
    }

    #Setters and Getters
    [void]setName([string]$name) {
        $this.name = $name
    }
    
    [string]getName() {
        return $this.name
    }
     
    [void]setHabitat([string]$habitat) {
        $this.habitat = $habitat
    }
    
    [string]getHabitat() {
        return $this.habitat
    }
    [void]setSound([string]$sound) {
        $this.sound = $sound
    }
    [string]getSound() {
        return $this.sound
    }
    
    [void]setPopulation([int]$population) {
        $this.population = $population
    }
    
    [int]getPopulation() {
        return $this.population
    }


    <# Method to print to String #>
    [string]toString() {
        return "Name: $($this.name) | Habitat: $($this.habitat) | Sound: $($this.sound) | Population: $($this.population)"
    }

} 

