defmodule K8s.PathTest do
  use ExUnit.Case, async: true
  doctest K8s.Path

  defp resource_definition() do
    %{
      "kind" => "Pod",
      "name" => "pods",
      "namespaced" => true,
      "verbs" => [
        "create",
        "delete",
        "deletecollection",
        "get",
        "list",
        "patch",
        "update",
        "watch"
      ]
    }
  end

  describe "/binary/4" do
    test "when a required param is missing, returns an error tuple" do
      K8s.Path.build("v1", resource_definition(), :update, namespace: "default")
      {:error, :missing_required_param, [:name]}
    end
  end
end
