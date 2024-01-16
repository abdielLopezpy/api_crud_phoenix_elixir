defmodule AppWeb.ServiceJSON do
  alias App.App.ContextName.Service

  @doc """
  Renders a list of services.
  """
  def index(%{services: services}) do
    %{data: for(service <- services, do: data(service))}
  end

  @doc """
  Renders a single service.
  """
  def show(%{service: service}) do
    %{data: data(service)}
  end

  defp data(%Service{} = service) do
    %{
      id: service.id,
      name: service.name,
      description: service.description,
      price: service.price
    }
  end
end
