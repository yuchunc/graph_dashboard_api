defmodule GphPanelWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)

  @desc "unnamed data object"
  object :data do
    field(:id, :id)
    field(:tags, list_of(:string))
    field(:created_at, :datetime)
    field(:display_value, :integer)
  end

  query do
    field :datum, type: list_of(:data) do
      arg(:id, :id, description: "lookup by id")
      arg(:tags, list_of(:string), description: "lookup by tags")
      arg(:range_start, non_null(:datetime))
      arg(:range_end, non_null(:datetime))
      resolve(&get_datum/2)
    end
  end

  # NOTE this would be filtering / ordering information in real project,
  # here it is just generating dummy data based on the search criteria
  defp get_datum(args, _) do
    datum =
      1..15
      |> Enum.map(fn _ -> data_map(args) end)
      |> Enum.sort_by(& &1.created_at)

    {:ok, datum}
  end

  defp data_map(args) do
    %{range_start: start_dt, range_end: end_dt} = args

    random_dt =
      DateTime.to_unix(start_dt)..DateTime.to_unix(end_dt)
      |> Enum.random()
      |> DateTime.from_unix!()

    %{
      id: args[:id] || :os.system_time(:seconds),
      tags: args[:tags] || [],
      created_at: random_dt,
      display_value: Enum.random(1..100)
    }
  end
end
