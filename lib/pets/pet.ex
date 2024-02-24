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
    __CALLER__.module |>
    Module.concat(normalized_module) |>
    Module.create(contents, Macro.Env.location(__ENV__)) |>
    Macro.escape
  end
end