defmodule Pets do
  defmacro __using__(_params) do
    import Pets.Pet, only: :macros
  end
end
