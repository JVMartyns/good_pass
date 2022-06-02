# GoodPass

## How to use

- GoodPass

`GoodPass.good_password?/1`\
Checks if the password contains uppercase and lowercase letters, numbers and symbols.
```
iex(1)> GoodPass.good_password?("G0odP4$sw0rd") >>> true

iex(2)> GoodPass.good_password?("BadPassword") >>> false
```

`GoodPass.encrypt/1`\
Takes a word as a parameter and replaces some letters with numbers and symbols.
```
iex(1)> GoodPass.good_password?("goodpassword") >>> "G0odP4$sw0rd"
```

- RandomPass

`GoodPass.RandomPass.generate/0` \
Create a random 12-character password.
```
iex(1)> GoodPass.RandomPass.generate >>> {:ok, "3$004!6bnJ!!"}
```

`GoodPass.RandomPass.generate/1` \
Takes an integer as an argument and returns a random password with the specified number of characters.
```
iex(1)> GoodPass.RandomPass.generate(32) >>> {:ok, "B5030@jcbI@3@79g*?8?!9C!!I80*a7T"}
```

- LegiblePass

`GoodPass.LegiblePass.generate/0`\
Generates a 12-character password using Portuguese language words as a base.
```
iex(1)> GoodPass.LegiblePass.generate >>> {:ok, "R&c&n$3@5t&$"}
```

`GoodPass.LegiblePass.generate/1`\
If it receives an integer, it generates a password with the number of characters informed using Portuguese words as a base.

If it receives a language, it generates a 12-character password using words from the given language as a base. Available languages: "pt", "en", "es", "de".

```
iex(1)> GoodPass.LegiblePass.generate(15) >>> {:ok, "R3f!N@nC!4R13!$"}

iex(2)> GoodPass.LegiblePass.generate("en") >>> {:ok, "pH0n4$Th&n!@"}
```

`GoodPass.LegiblePass.generate/2`\
Receive a language and the number of characters and generate a password with the number of characters informed using words of the informed language as a base.
To standardize languages, passwords can only be between 10 and 20 characters long.
Available languages: "pt", "en", "es", "de".
```
iex(1)> GoodPass.LegiblePass.generate("pt", 15) >>> {:ok, "3m6R@NQ*3C3R&M0"}

iex(2)> GoodPass.LegiblePass.generate("en", 15) >>> {:ok, "5*P&r!Nc*m63nc&"}

iex(3)> GoodPass.LegiblePass.generate("es", 15) >>> {:ok, "1Nm0Rt4l1z@53!$"}

iex(4)> GoodPass.LegiblePass.generate("de", 15) >>> {:ok, "DUrch5cH4*3Nd&$"} 
```
