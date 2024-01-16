defmodule App.App.ContextNameFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.App.ContextName` context.
  """

  @doc """
  Generate a service.
  """
  def service_fixture(attrs \\ %{}) do
    {:ok, service} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        price: "120.5"
      })
      |> App.App.ContextName.create_service()

    service
  end
end
