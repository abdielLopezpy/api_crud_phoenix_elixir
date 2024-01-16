defmodule AppWeb.ServiceController do
  use AppWeb, :controller

  alias App.App.ContextName
  alias App.App.ContextName.Service

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    services = ContextName.list_services()
    render(conn, :index, services: services)
  end

  def create(conn, %{"service" => service_params}) do
    with {:ok, %Service{} = service} <- ContextName.create_service(service_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/services/#{service}")
      |> render(:show, service: service)
    end
  end

  def show(conn, %{"id" => id}) do
    service = ContextName.get_service!(id)
    render(conn, :show, service: service)
  end

  def update(conn, %{"id" => id, "service" => service_params}) do
    service = ContextName.get_service!(id)

    with {:ok, %Service{} = service} <- ContextName.update_service(service, service_params) do
      render(conn, :show, service: service)
    end
  end

  def delete(conn, %{"id" => id}) do
    service = ContextName.get_service!(id)

    with {:ok, %Service{}} <- ContextName.delete_service(service) do
      send_resp(conn, :no_content, "")
    end
  end
end
