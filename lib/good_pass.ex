defmodule GoodPass do
  alphabet = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"
  @lowercase String.split(alphabet, ",")
  @uppercase String.split(String.upcase(alphabet), ",")
  @numbers String.split("0,1,2,3,4,5,6,7,8,9", ",")
  @special_characters String.split("!,@,#,$,%,&,?", ",")

  def generate(len \\ 12) do
    if good_password?(password = gen_password(len)) do
      List.to_string(password)
    else
      generate(len)
    end
  end

  defp gen_password(len) do
    for _ <- Enum.to_list(1..len) do
      Enum.random([@lowercase, @uppercase, @numbers, @special_characters])
      |> Enum.random()
    end
  end

  defp good_password?(password) do
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

    has_special_characters =
      Enum.reduce_while(password, false, fn character, acc ->
        if character in @special_characters, do: {:halt, true}, else: {:cont, acc}
      end)

    has_lowercase and has_uppercase and has_numbers and has_special_characters
  end
end
