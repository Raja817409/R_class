## if Statement

a <- 10

if (a < 6){print("selected")}

if (a < 6){print("not Selected")}

# if else statement

if (a < 6){
  print("not Selected")
  } else {print("selected")}

## another method

ifelse(a < 6, "Not selected", "selected")


### Nested if (multipal)

marks <- 65

if(marks >= 80) {print("Distinction")
} else if (marks >= 60) { print("First Division")
} else if (marks >= 50) {print("Second Division")
} else if (marks >= 40) {print("Third Division")
        } else { print("Failed")}
 
marks <- 32

if(marks >= 80) {print("Distinction")
} else if (marks >= 60) {print("First Division")
} else if (marks >= 50) {print("Second Division")
} else if (marks >= 40) {print("Third Division")
  } else { print("Failed")}


ifelse(a >= 80,"Distinction", 
       ifelse(a >= 60, "First Division", 
              ifelse(a>= 50, "Second Division", 
                     ifelse(a >= 40, "Third Division","Failed Division"))))


## Functions
# Area of traingle
# Lets build the function to calculate area of Triangel

b <- 25
h <- 10

area <- 0.5 * b * h
area

area_traingle <- function(base,height) {
  area <- 0.5 * base * height
  print(area)
  }

area_traingle(25,10)

area_traingle1 <- function(code = 1, base = 2,height = 2){
  area <- 0.5 * base * height 
print(area)
}

area_traingle1()

area_traingle1 <- function(code){
  if(code == 1){
    base <- 20
    height <- 2
  } else if (code == 2){
    base <- 15
    height <- 10
  } else if (code == 3){
    base <- as.numeric (readline(prompt = "Enter the base:"))
    height <- as.numeric (readline(prompt = "Enter the height:"))
  } else {
    print("you entered the wrong code")
  }
  area <- 0.5 * base * height
  print(area)
}
area_traingle1(3)
