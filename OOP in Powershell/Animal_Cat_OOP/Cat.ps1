<# This is the Cat class and it inherets from Animal class#>



 class Cat : Animal {

    # Properties
    [string]$Color
    [string]$Pattern

    # Constructor
    Cat([string]$name, [string]$habitat, [string]$sound, [int]$population, [string]$Color, [string]$Pattern) : base($name, $habitat, $sound, $population) {
        $this.Pattern = $Pattern
        $this.Color = $Color
    }

  
}
     s