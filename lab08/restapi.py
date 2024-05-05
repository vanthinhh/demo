import requests
import unittest

class TestAPI(unittest.TestCase):
    base_url = "https://dummy.restapiexample.com"

    def test_get_employees(self):
        response = requests.get(f"{self.base_url}/api/v1/employees")
        self.assertEqual(response.status_code, 200)

    def test_post_create_employee(self):
        response = requests.post(f"{self.base_url}/create")
        self.assertEqual(response.status_code, 200)

    def test_get_single_employee(self):
        response = requests.get(f"{self.base_url}/api/v1/employee/1")
        self.assertEqual(response.status_code, 200)

    def test_put_update_employee(self):
        response = requests.put(f"{self.base_url}/api/v1/update/21")
        self.assertEqual(response.status_code, 200)

    def test_delete_employee(self):
        response = requests.delete(f"{self.base_url}/api/v1/delete/2")
        self.assertEqual(response.status_code, 200)

    def test_get_single_employee_not_exist(self):
        response = requests.get(f"{self.base_url}/api/v1/employee/9999")
        self.assertEqual(response.status_code, 404)

    def test_put_update_employee_invalid_data(self):
        response = requests.put(f"{self.base_url}/api/v1/update/21", json={"invalid_field": "invalid_value"})
        self.assertEqual(response.status_code, 400)

    def test_delete_employee_valid(self):
        response = requests.delete(f"{self.base_url}/api/v1/delete/1")
        self.assertEqual(response.status_code, 200)

    def test_delete_employee_not_exist(self):
        response = requests.delete(f"{self.base_url}/api/v1/delete/9999")
        self.assertEqual(response.status_code, 404)

    def test_delete_employee_invalid_data(self):
        response = requests.delete(f"{self.base_url}/api/v1/delete/21", json={"invalid_field": "invalid_value"})
        self.assertEqual(response.status_code, 400)

if __name__ == "__main__":
    unittest.main()
