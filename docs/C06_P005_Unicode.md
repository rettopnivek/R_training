## Unicode in R

You can easily display special unicode characters in R if you know the associated four-digit alphanumeric code:

```R
# General format given XXXX is 4-digit alphanumeric code
# \UXXXX

# Common examples

# Unicode for less than or equal sign
print( "\U2264" )

# Unicode for greater than or equal sign
print( "\U2265" )

# Unicode for not-equal sign
print( "\U2260" )

# Unicode for plus-minus sign
print( "\U00B1" )

# Unicode for square-root sign
print( "\U221A" )

# Unicode for tilde operator
print( "\U223C" )
```

<a name="END"></a>
Return to:
[FAQ](C06_P000_FAQ.md);
[Sections](C00_P002_Chapters.md);
[Home page](https://rettopnivek.github.io/R_training/)


