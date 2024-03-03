defmodule Pets do
  defmacro __using__(_params) do
    quote do
      import Pets.Pet, only: :macros
    end
  end
end
