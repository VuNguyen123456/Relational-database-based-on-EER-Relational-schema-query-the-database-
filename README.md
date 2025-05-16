# Relational-database-based-on-EER-Relational-schema-query-the-database-
The objective of this project is to design and implement a conceptual schema for a library management system using the Enhanced Entity-Relationship (EER) model, and to translate that schema into relational form suitable for implementation in a relational database.

Part 1 requires the creation of an EER diagram that captures the structure of a library system. Key components of the model include books identified by ISBN, with details such as title, edition, category, price, and one or more associated authors. Each book may have multiple copies, uniquely identified by a combination of ISBN and copy number, and each copy includes a status to track availability.

Patrons are uniquely identified and classified into standard or premium membership types, with different borrowing limits and loan durations. Additional patron details include names, email addresses, multiple phone numbers, and a structured mailing address.

The system tracks transactions such as checkouts and returns, linking patrons with book copies and recording timestamps, due dates, return dates, and overdue status. Authors are also modeled with attributes like name, birth date, nationality, and associations with publishers.

The EER diagram must use correct notations to represent generalizations/specializations, relationships, constraints, and keys. Any assumptions made must be clearly noted in the submission.

Part 2, convert their EER diagram into a set of relational schemas. Each relation should include a name, list of attributes, domain of each attribute, primary key, and foreign keys. The submission must include the updated EER diagram if modifications were made.
