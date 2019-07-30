# gleasonCalc
This packages compute the v value (i.e. systemic value) from a (sub)system in a systemic functional network

## Overview

`gleasonCalc` is a package to evaluate systemic functional valeur from a system network (see Figuredo & Figueredo, 2019). It gets agnation, delicacy and valeur magnitudes in data frames in order to visualize, correlate and sort systemic options in a gleason scale. 

## Installation

`gleasonCalc` is still under development. You can install development version of `gleasonCalc` from GitHub:

```
# Install development version from GitHub:
install.packages("devtools")
devtools::install_github("bmmedinac/gleasonCalc")
```

## Usage

As a systemic-functional-linguistics-oriented package, `gleasonCalc` requires the transformation of a systemic network into a special format in a spreedsheet. Take for example the next English MOOD system network:

![alt text](http://www.jwise004.grads.digitalodu.com/blog/wp-content/uploads/2015/09/Systemnetwork19.gif)

In a spreedsheet, in a column named 'features', each oposition and delicacy level must be expressed. Opositions are expressed by '/' (e.g. indicative/imperative). Delicacy levels are expressed by ':' (e.g. indicative:interrogative:wh-). So, further delicacy levels must be expressed with its all lesser delicacy levels:

```
#   features
1   imperative/indicative
2   indicative:declarative/indicative:interrogative
3   indicative:interrogative:yesno/indicative:interrogative:wh
```

At the moment, `gleasonCalc` just can evaluate valeur from system networks without co-selections. Any try to evaluate this kind of network will return error. Meanwhile, a co-selective system network in spreedsheet would look like this with '&' marking co-selection:

```
#   features
1   imperative/indicative & positive/negative
2   indicative:declarative/indicative:interrogative & positive/negative
3   indicative:interrogative:yesno/indicative:interrogative:wh & positive/negative
```

`gleasonCalc` have two built-in systems: `mood_spanish` (see Quiroz, 2013) and `mental_german` (see Figueredo & Figueredo, 2019). First one is a system **without** co-selection. Second one is a system **with** co-selection.

Actually, `gleasonCalc` has three main functions: `getFeatures`, `agnation` and `valeurCalc2`. It's necessary to export it from `library(gleasonCalc)` previously to use it:
1. `getFeatures` returns all the features from the input system network. At the moment, can't return co-selective features. Example of `getFeatures` is below:
```
library(gleasonCalc)
getFeatures(mood_spanish)
        features
1          menor
2          major
4     indicative
6     imperative
9    informative
12 interrogative
15        jusive
18     hortative
21      optative
25         polar
29     elemental
33   declarative
37   exclamative
```
2. `agnation` returns agnation magnitude of every option in a system network. At the moment, can't return agnation of co-selective features. Example of `agnation` is below:
```
#library(gleasonCalc)
agnation(mood_spanish)
# A tibble: 13 x 2
   features            agnation
   <fct>                <dbl>
 1 menor                    2
 2 major                    2
 3 indicative               2
 4 imperative               2
 5 informative              2
 6 interrogative            2
 7 jusive                   9
 8 hortative                9
 9 optative                 9
10 polar                    2
11 elemental                2
12 declarative              2
13 exclamative              2
```
3. `valeurCalc2` returns a data frame with agnation, delicacy and valeur of every option in a system network. Example of `valeurCalc2` is below:

```
#library(gleasonCalc)
valeurCalc2(mood_spanish)
# A tibble: 13 x 4
   features      agnation delicacy valeur
   <fct>            <dbl>    <dbl>  <dbl>
 1 menor                2        1      2
 2 major                2        1      2
 3 indicative           2        4      8
 4 imperative           2        4      8
 5 informative          2        9     18
 6 interrogative        2        9     18
 7 jusive               9        9     81
 8 hortative            9        9     81
 9 optative             9        9     81
10 polar                2       16     32
11 elemental            2       16     32
12 declarative          2       16     32
13 exclamative          2       16     32
```

`valeurCalc2` can also sort valeur with `sorted = TRUE` argument:

```
valeurCalc2(mood_spanish, sorted = TRUE)
# A tibble: 13 x 4
   features      agnation delicacy valeur
   <fct>            <dbl>    <dbl>  <dbl>
 1 menor                2        1      2
 2 major                2        1      2
 3 indicative           2        4      8
 4 imperative           2        4      8
 5 informative          2        9     18
 6 interrogative        2        9     18
 7 polar                2       16     32
 8 elemental            2       16     32
 9 declarative          2       16     32
10 exclamative          2       16     32
11 jusive               9        9     81
12 hortative            9        9     81
13 optative             9        9     81
```

`GleasonCalc2`package also include functions to plot interactive 3D graph. One of this functions is `langspace`. This function plots a language space (see Figueredo & Figuredo, 2019) from three systems. As example, `GleasonCalc2` have a built-in data frame called `language_space`. In order to plot a language space, dataframe must have at least three systems (in this case, TRANSITIVITY `trans`, MOOD `mood`, THEME `theme`. 
```
head(language_space)
# A tibble: 6 x 7
  ID    genre        clause_ID clause                                          trans  mood theme
  <chr> <chr>            <dbl> <chr>                                           <dbl> <dbl> <dbl>
1 DVM 1 Procedimien…         1 Use a Balloon                                     232    25     9
2 DVM 1 Procedimien…         2 to Amplify Sound                                  232     9     0
3 DVM 1 Procedimien…         3 Small sounds can still make a big noise           232   297    65
4 DVM 1 Procedimien…         4 when you use a good sound conductor.              232    17    67
5 DVM 1 Procedimien…         5 Experiment with a balloon, compressed air and …   232    25     9
6 DVM 1 Procedimien…         6 to find out                                       232     9     0
```

From this dataframe, we can plot with `langspace()`function. `langspace()` can take seven arguments, but just four are mandatory:

```
langspace(df, x, y, z, grouping, instance = FALSE)

Arguments
df	        The dataframe with a data.
x	        First variable of the plot (e.g. TYPE OF PROCESS)
y	        Second variable of the plot (e.g. MOOD)
z	        Third variable of the plot (e.g. THEME)
grouping	Empty by default. Create color groups from levels of a factor (e.g. genres, fields, tenors, etc)
instance	FALSE by default. If provided, hover shows the textual instances of x, y and z	
```

See the next use of `langspace`:

````
langspace(language_space,                               #example dataframe
          x = language_space$trans,                     #first mandatory system
          y = language_space$mood,                      #second mandatory system
          z = language_space$theme,                     #third mandatory system
          grouping = language_space$genre,              #grouping by genre
          instance = language_space$clause,             #show instance saved in clause column
          framing = language_space$clause_ID)           #unfolding of text saved in clause_ID colum
````

![alt text](https://github.com/bmmedinac/gleasonCalc/blob/master/Captura%20de%20Pantalla%202019-07-30%20a%20la(s)%2016.27.49.png)


## Contributing


## Further readings
