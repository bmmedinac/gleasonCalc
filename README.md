# gleasonCalc
This packages compute the v value (i.e. systemic value) from a (sub)system in a systemic functional network

## Overview

gleasonCalc is a package to evaluate systemic functional valeur from a system network (see Figuredo & Figueredo, 2019). It gets agnation, delicacy and valeur magnitudes in data frames in order to visualize, correlate and sort systemic options in a gleason scale. 

## Installation

gleasonCalc is still under development. You can install development version of gleasonCalc from GitHub:

```
# Install development version from GitHub:
install.packages("devtools")
devtools::install_github("bmmedinac/gleasonCalc")
```

## Usage

As a systemic-functional-linguistics-oriented package, gleasonCalc requires the transformation of a systemic network into a special format in a spreedsheet. Take for example the next English MOOD system network:

![alt text](http://www.jwise004.grads.digitalodu.com/blog/wp-content/uploads/2015/09/Systemnetwork19.gif)

In a spreedsheet, in a column named 'features', each oposition and delicacy level must be expressed. Opositions are expressed by '/' (e.g. indicative/imperative). Delicacy levels are expressed by ':' (e.g. indicative:interrogative:wh-). So, further delicacy levels must be expressed with its all lesser delicacy levels:

```
#   features
1   imperative/indicative
2   indicative:declarative/indicative:interrogative
3   indicative:interrogative:yesno/indicative:interrogative:wh
```

At the moment, gleasonCalc just can evaluate valeur from system networks without co-selections. Any try to evaluate this kind of network will return error. Meanwhile, a co-selective system network in spreedsheet would look like this with '&' marking co-selection:

```
#   features
1   imperative/indicative & positive/negative
2   indicative:declarative/indicative:interrogative & positive/negative
3   indicative:interrogative:yesno/indicative:interrogative:wh & positive/negative
```

gleasonCalc have two built-in systems: `mood_spanish` (see Quiroz, 2013) and `mental_german` (see Figueredo & Figueredo, 2019). First one is a system **without** co-selection. Second one is a system **with** co-selection.

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
## Contributing


## Further readings
