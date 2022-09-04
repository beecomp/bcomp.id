defmodule Gql.Formatter do
  @behaviour Mix.Tasks.Format

  def features(_opts) do
    [sigils: [:G], extensions: []]
  end

  def format(contents, _opts \\ []) do
    Absinthe.Formatter.format(contents)
  end
end

defmodule Gql.Sigil do
  @moduledoc """
  Adds the ~G sigil
  """
  def sigil_G(string, []), do: string
end
