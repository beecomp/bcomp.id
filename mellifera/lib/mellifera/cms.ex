defmodule Mellifera.CMS do
  @endpoint Application.fetch_env!(:mellifera, Mellifera.CMS)[:endpoint]

  def req(query, vars \\ []) do
    result =
      Finch.build(
        :post,
        @endpoint,
        [{"content-type", "application/json"}],
        Jason.encode!(%{query: query, variables: Map.new(vars)})
      )
      |> Finch.request(Mellifera.Finch)

    case result do
      {:ok, response} ->
        case Jason.decode(response.body, keys: :atoms) do
          {:ok, %{data: data}} ->
            {:ok, data}

          {:ok, _} ->
            {:error, :data_error}

          {:error, _} ->
            {:error, :decode_error}
        end

      {:error, _} ->
        {:error, :request_error}
    end
  end
end
