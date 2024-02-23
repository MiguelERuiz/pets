defmodule Pets.Pet do
  defmacro pet(pet_name) do
    normalized_module = pet_name |> String.to_atom
    contents =
      quote do
        def greet do
          IO.puts("Hello there, my name is #{unquote(pet_name)}")
        end

        def hobbies do
          ["spend good time"]
        end
      end
    __CALLER__.module |>
    Module.concat(normalized_module) |>
    Module.create(contents, Macro.Env.location(__ENV__)) |>
    Macro.escape
  end
end