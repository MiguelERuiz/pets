defmodule Pets.Pet do
  defmacro pet(pet_name, do: block) do
    {:__block__, _metadata, do_block} = block
    [{:species, _, [species]}, {:hobbies, _, [hobbies]}] = do_block
    normalized_module = pet_name |> String.to_atom
    contents =
      quote do
        def greet do
          """
            Hello there, my name is #{unquote(pet_name)} and
            I am a #{unquote(species)}
          """
        end

        def hobbies, do: format_hobbies(unquote(hobbies))

        defp format_hobbies([]), do: "I have no hobbies"
        defp format_hobbies([hobby]), do: "my hobby is #{hobby}"
        defp format_hobbies(hobbies), do: "my hobbies are #{Enum.intersperse(hobbies, ", ")}"
      end
    quote do
      defmodule unquote(Module.concat(__CALLER__.module, normalized_module)) do
        unquote(contents)
      end
    end
  end
end