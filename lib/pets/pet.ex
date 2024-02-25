defmodule Pets.Pet do
  require Logger

  defmacro pet(pet_name, do: block) do
    {:__block__, _metadata, do_block} = block
    [{:species, _, [species]}, {:hobbies, _, [hobbies]}] = do_block
    normalized_module = pet_name |> String.to_atom
    contents =
      quote do
        def greet do
          """
            Hello there, my name is #{unquote(pet_name)} and I am a #{unquote(species)}
            I love ...
          """
          |> IO.puts
        end

        def hobbies do
          unquote(hobbies)
        end
      end
    quote do
      defmodule unquote(Module.concat(__CALLER__.module, normalized_module)) do
        unquote(contents)
      end
    end
  end
end