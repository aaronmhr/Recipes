#  Recipies

As the API  http://www.recipepuppy.com doen't currently work, a mocking system has been simulated for the pagination that works as close as posible as the original API used to.

Because of time concerns not all the app has been tested nor an error handling mechanism. In the current scenario, my focus has been on architecture so that the project could use the real API with minor modifications.

This project has been separated on four diferent targets:

Core: Contains basically the domain models, and repository interface. Interactors can be moved here with no aditional effort.
Database: Contains a helper that makes easy to interact with the database, database models, database repository implementations.
Networking: Contains decodable models, and a file accessing tool that mimics the behaviour of the API, here a real networking implementation can be added as long as it confoms to their respective analogous protocols.
Recipes: Composition root where the app is assembled, and UI elements are defined.
