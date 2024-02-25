defmodule Pets do
  @moduledoc """
  Documentation for `Pets`.
  """

  defmacro __using__(_params) do
    quote do
      import unquote(__MODULE__)
      use Pets.Pet
    end
  end
end
