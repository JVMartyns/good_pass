defmodule GoodPassTest do
  use ExUnit.Case
  doctest GoodPass

  alphabet = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
  @lowercase String.split(alphabet, ",")
  @uppercase String.split(String.upcase(alphabet), ",")
  @numbers String.split("0,1,2,3,4,5,6,7,8,9", ",")
  @symbols String.split("!,@,#,$,%,&,?", ",")

  describe "generate/1" do
    test "lenght of password" do
      assert String.length(GoodPass.generate()) == 12
      assert String.length(GoodPass.generate(4)) == 4
      assert String.length(GoodPass.generate(128)) == 128
    end

    test "contains lowercase, uppercase, numbers and symbols" do
      password = GoodPass.generate() |> String.split("", trim: true)

      has_lowercase =
        Enum.reduce_while(password, false, fn character, acc ->
          if character in @lowercase, do: {:halt, true}, else: {:cont, acc}
        end)

      has_uppercase =
        Enum.reduce_while(password, false, fn character, acc ->
          if character in @uppercase, do: {:halt, true}, else: {:cont, acc}
        end)

      has_numbers =
        Enum.reduce_while(password, false, fn character, acc ->
          if character in @numbers, do: {:halt, true}, else: {:cont, acc}
        end)

      has_symbols =
        Enum.reduce_while(password, false, fn character, acc ->
          if character in @symbols, do: {:halt, true}, else: {:cont, acc}
        end)

      assert has_lowercase and has_uppercase and has_numbers and has_symbols
    end
  end
end
