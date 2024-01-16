defmodule App.App.ContextNameTest do
  use App.DataCase

  alias App.App.ContextName

  describe "services" do
    alias App.App.ContextName.Service

    import App.App.ContextNameFixtures

    @invalid_attrs %{name: nil, description: nil, price: nil}

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert ContextName.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert ContextName.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      valid_attrs = %{name: "some name", description: "some description", price: "120.5"}

      assert {:ok, %Service{} = service} = ContextName.create_service(valid_attrs)
      assert service.name == "some name"
      assert service.description == "some description"
      assert service.price == Decimal.new("120.5")
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ContextName.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", price: "456.7"}

      assert {:ok, %Service{} = service} = ContextName.update_service(service, update_attrs)
      assert service.name == "some updated name"
      assert service.description == "some updated description"
      assert service.price == Decimal.new("456.7")
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = ContextName.update_service(service, @invalid_attrs)
      assert service == ContextName.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = ContextName.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> ContextName.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = ContextName.change_service(service)
    end
  end
end
