defmodule Exmeal.Meals.UpdateTest do
  use Exmeal.DataCase

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02],
        description: "Banana"
      }
      {_ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.update_meal(%{"id" => meal.id, "calories" => 25})

      assert {:ok,
              %Exmeal.Meal{
                calories: 25,
                date: ~D[2001-05-02],
                description: "Banana",
                id: _id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.update_meal(%{"id" => id})

      assert {:error, %Exmeal.Error{result: "Meal not found", status: :not_found}} = response
    end

    test "when a valid id is given, but wrong params, returns an error" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02],
        description: "Banana"
      }
      {_ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.update_meal(%{"id" => meal.id, "date" => 0})

      assert {:error, %Exmeal.Error{status: :bad_request}} = response
    end
  end
end
