defmodule Pets.Pet do
  defmacro pet(pet_name, do: do_block) do
    module_name = "Elixir.#{pet_name}" |> String.to_atom
    {:__block__, _, block} = do_block
    [{:species, _, [species]}, {:hobbies, _, [hobbies]}] = block
    quote do
      defmodule unquote(module_name) do
        def greet, do: "Hi, my name is #{unquote(pet_name)} and I'm a #{unquote(Atom.to_string(species))}"
        def hobbies, do: unquote(format_hobbies(pet_name, hobbies))
      end
    end
  end
  def format_hobbies(pet_name, []), do: "#{pet_name} has no hobbies"
  def format_hobbies(pet_name, [hobby]), do: "#{pet_name}\'s hobby is #{hobby}"
  def format_hobbies(pet_name, hobbies), do: "#{pet_name}\'s hobbies are #{Enum.intersperse(hobbies, ", ")}"
end