<# This is the Cat class and it inherets from Animal class#>


import-module ./Animal.ps1


class Cat : Animal {
    [string]$color
    [string]$breed

    Cat([string]$name, [string]$habitat, [string]$sound, [int]$population, [string]$color, [string]$breed) : base($name, $habitat, $sound, $population){
        $this.color = $color
        $this.breed = $breed
    }

    [void]setColor([string]$color){
        $this.color = $color
    }
    
    [string]getColor(){
        return $this.color
    }
    
    [void]setBreed([string]$breed){
        $this.breed = $breed
    }
    
    [string]getBreed(){
        return $this.breed
    }
}