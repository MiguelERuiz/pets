defmodule Pets.Pet do

  defmacro __using__(_params) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro pet(pet_name, do: block) do
    {:__block__, _metadata, do_block} = block
    [{:species, _, [species]}, {:hobbies, _, [hobbies]}] = do_block
    normalized_module = pet_name |> String.to_atom
    contents =
      quote do
        def greet do
          "Hello there, my name is #{unquote(pet_name)} and I am a #{unquote(species)}"
        end

        def hobbies, do: unquote(format_hobbies(pet_name, hobbies))
      end
    quote do
      defmodule unquote(Module.concat(__CALLER__.module, normalized_module)) do
        unquote(contents)
      end
    end
  end

  def format_hobbies(pet_name, []), do: "#{pet_name} has no hobbies"
  def format_hobbies(pet_name, [hobby]), do: "#{pet_name}\'s hobby is #{hobby}"
  def format_hobbies(pet_name, hobbies), do: "#{pet_name}\'s hobbies are #{Enum.intersperse(hobbies, ", ")}"
end