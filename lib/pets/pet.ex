defmodule Pets.Pet do

  defmacro __using__(_params) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro pet(pet_name) do
    normalized_module = pet_name |> String.to_atom
    contents =
      quote do
        def greet do
          IO.puts("Hello there, my name is #{unquote(pet_name)}")
        end
      end
    Macro.escape(Module.create(Module.concat(__CALLER__.module, normalized_module), contents, Macro.Env.location(__ENV__)))
  end
end