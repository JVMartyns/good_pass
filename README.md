# GoodPass


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `good_pass` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:good_pass, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/good_pass>.

## How to use

- GoodPass

`GoodPass.good_password?/1`\
Checks if the password contains uppercase and lowercase letters, numbers and symbols.

`GoodPass.encrypt/1`\
Takes a word as a parameter and replaces some letters with numbers and symbols.

- RandomPass

`GoodPass.RandomPass.generate/0` \
Create a random 12-character password.

`GoodPass.RandomPass.generate/1` \
Takes an integer as an argument and returns a random password with the specified number of characters.

- LegiblePass

`GoodPass.LegiblePass.generate/0`\
Generates a 12-character password using Portuguese language words as a base.

`GoodPass.LegiblePass.generate/1`\
If it receives an integer, it generates a password with the number of characters informed using Portuguese words as a base.

If it receives a language, it generates a 12-character password using words from the given language as a base. Available languages: "pt", "en", "es", "de".

`GoodPass.LegiblePass.generate/2`\
Receive a language and the number of characters and generate a password with the number of characters informed using words of the informed language as a base.
To standardize languages, passwords can only be between 10 and 20 characters long.
Available languages: "pt", "en", "es", "de".
